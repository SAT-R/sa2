.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0     @ r4 = p
	ldr r0, _08045768 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0          @ r8 = flag80
	ldr r2, _0804576C @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x27
	ldrb r3, [r0]
	adds r5, r4, #0
	adds r5, #0x27
	strb r3, [r5]
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	adds r6, r2, #0     @ r6 = r2 = gPlayer
	cmp r0, #0
	beq _08045754
	movs r0, #1
	eors r0, r3
	strb r0, [r5]
_08045754:
	ldr r0, [r4, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08045770
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x39
	b _08045776
	.align 2, 0
_08045768: .4byte gStageFlags
_0804576C: .4byte gPlayer
_08045770:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x35
_08045776:
	strb r0, [r1]
	adds r7, r1, #0
	ldr r0, [r4]
	asrs r0, r0, #8
	ldr r3, _08045810 @ =gCamera
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r5, _08045814 @ =0xFFFFFF00
	adds r1, r1, r5
	cmp r0, r1
	bge _08045790
	lsls r0, r1, #8
	str r0, [r4]
_08045790:
	ldr r0, [r4]
	asrs r0, r0, #8
	movs r2, #0
	ldrsh r1, [r3, r2]
	movs r2, #0xf8
	lsls r2, r2, #1
	adds r1, r1, r2
	cmp r0, r1
	ble _080457A6
	lsls r0, r1, #8
	str r0, [r4]
_080457A6:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	movs r2, #2
	ldrsh r1, [r3, r2]
	adds r1, r1, r5
	cmp r0, r1
	bge _080457B8
	lsls r0, r1, #8
	str r0, [r4, #4]
_080457B8:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	movs r2, #2
	ldrsh r1, [r3, r2]
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r1, r1, r2
	cmp r0, r1
	ble _080457CE
	lsls r0, r1, #8
	str r0, [r4, #4]
_080457CE:
	ldr r0, [r4]
	asrs r5, r0, #8
	adds r1, r5, #0
	subs r1, #0x20
	ldr r0, [r6]        @ r0 = *r6 = I(gPlayer.qWorldX)
	asrs r3, r0, #8
	cmp r1, r3
	blt _080457E0
	b _080458F8
_080457E0:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, r3
	bgt _080457EA
	b _080458F8
_080457EA:
	mov r0, r8
	cmp r0, #0
	bne _08045818
	ldr r0, [r4, #4]
	asrs r3, r0, #8
	adds r1, r3, #0
	subs r1, #0x20
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	adds r2, r0, #0
	subs r2, #0x30
	cmp r1, r2
	bge _080458F8
	adds r0, r3, #0
	adds r0, #0x20
	cmp r0, r2
	bgt _08045834
	b _080458F8
	.align 2, 0
_08045810: .4byte gCamera
_08045814: .4byte 0xFFFFFF00
_08045818:
	ldr r0, [r4, #4]
	asrs r3, r0, #8
	adds r1, r3, #0
	subs r1, #0x20
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	adds r2, r0, #0
	adds r2, #0x30
	cmp r1, r2
	bge _080458F8
	adds r0, r3, #0
	adds r0, #0x20
	cmp r0, r2
	ble _080458F8
_08045834:
	movs r0, #0
	adds r1, r4, #0
	bl sa2__sub_8022F58
	cmp r0, #0
	blt _080458F8
	ldr r0, [r4, #0x10]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0xe0
	ands r0, r1
	ldr r1, _080458D0 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x3d
	movs r6, #0         @ r6 = 0
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, [r4, #0x10]
	ldr r1, _080458D4 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r5, r4, #0
	adds r5, #0x59
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0804587C
	movs r0, #0x78
	bl m4aSongNumStop
_0804587C:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #3
	bne _0804588C
	ldr r0, [r4, #0x10]
	ldr r1, _080458D8 @ =0xF9FFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
_0804588C:
	strh r6, [r4, #0xc]
	strh r6, [r4, #8]
	strh r6, [r4, #0xa]
	movs r0, #0x38
	strb r0, [r7]
	ldr r0, [r4, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0xc
	ands r0, r1
	ldr r1, _080458DC @ =0xFFFFFDFF
	ands r0, r1
	ldr r1, _080458E0 @ =0xFFEFFFFF
	ands r0, r1
	ldr r1, _080458E4 @ =0xFF7FFFFF
	ands r0, r1
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _080458E8 @ =0xFFDFFFFF
	ands r0, r1
	ldr r1, _080458EC @ =0xFFBFFFFF
	ands r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	str r6, [r4, #0x28]
	ldr r0, _080458F0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080458F4 @ =Task_8045B38
	str r0, [r1, #8]
	b _0804596C
	.align 2, 0
_080458D0: .4byte 0xFFFFFBFF
_080458D4: .4byte 0xFFFF7FFF
_080458D8: .4byte 0xF9FFFFFF
_080458DC: .4byte 0xFFFFFDFF
_080458E0: .4byte 0xFFEFFFFF
_080458E4: .4byte 0xFF7FFFFF
_080458E8: .4byte 0xFFDFFFFF
_080458EC: .4byte 0xFFBFFFFF
_080458F0: .4byte gCurTask
_080458F4: .4byte Task_8045B38
_080458F8:
	ldr r5, [r4]
	asrs r3, r5, #8
	ldr r0, _0804591C @ =gPlayer
	ldr r1, [r0]
	asrs r2, r1, #8
	adds r1, r3, #1
	adds r6, r0, #0
	cmp r1, r2
	bge _08045920
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	str r0, [r4]
	ldr r0, [r4, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _08045932
	.align 2, 0
_0804591C: .4byte gPlayer
_08045920:
	subs r0, r3, #1
	cmp r2, r0
	bge _08045934
	ldr r2, _0804594C @ =0xFFFFFE00
	adds r0, r5, r2
	str r0, [r4]
	ldr r0, [r4, #0x10]
	movs r1, #1
	orrs r0, r1
_08045932:
	str r0, [r4, #0x10]
_08045934:
	ldr r0, [r4, #4]
	asrs r3, r0, #8
	adds r1, r0, #0
	mov r0, r8
	cmp r0, #0
	bne _08045950
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	adds r2, r0, #0
	subs r2, #0x30
	b _08045958
	.align 2, 0
_0804594C: .4byte 0xFFFFFE00
_08045950:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	adds r2, r0, #0
	adds r2, #0x30
_08045958:
	cmp r3, r2
	bge _08045962
	movs r2, #0x80
	lsls r2, r2, #1
	b _08045968
_08045962:
	cmp r2, r3
	bge _0804596C
	ldr r2, _08045978 @ =0xFFFFFF00
_08045968:
	adds r0, r1, r2
	str r0, [r4, #4]
_0804596C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

_08045978: .4byte 0xFFFFFF00
.syntax divided
