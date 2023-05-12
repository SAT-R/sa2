.include "../../../../asm/macros/function.inc"
.include "../../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_0203b610
sub_0203b610: @ 0x0203B610
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r2, [r5, #0x16]
	cmp r2, #0
	beq _0203B61E
	b _0203B73E
_0203B61E:
	ldr r1, _0203B694 @ =0x04000008
	ldr r3, _0203B698 @ =0x0000170B
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0203B69C @ =0x04000010
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	ldr r0, _0203B6A0 @ =gUnknown_0203EBC0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuSet
	ldr r0, _0203B6A4 @ =gUnknown_0203EDC0
	ldr r1, _0203B6A8 @ =0x06008000
	movs r2, #0x94
	lsls r2, r2, #2
	bl CpuSet
	movs r4, #0
_0203B64A:
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0203B6AC @ =gUnknown_0203F260
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, _0203B6B0 @ =0x0600B800
	adds r1, r1, r2
	movs r2, #0x1e
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _0203B64A
	ldr r0, _0203B6B4 @ =0x0400000A
	ldr r3, _0203B6B8 @ =0x00001F0E
	adds r1, r3, #0
	strh r1, [r0]
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _0203B6C8
	ldr r1, _0203B6BC @ =0x04000014
	ldr r2, _0203B6C0 @ =0x0000FFE8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0203B6C4 @ =0x04000016
	ldrb r1, [r5, #0x13]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, #0x30
	strh r0, [r2]
	b _0203B6D4
	.align 2, 0
_0203B694: .4byte 0x04000008
_0203B698: .4byte 0x0000170B
_0203B69C: .4byte 0x04000010
_0203B6A0: .4byte gUnknown_0203EBC0
_0203B6A4: .4byte gUnknown_0203EDC0
_0203B6A8: .4byte 0x06008000
_0203B6AC: .4byte gUnknown_0203F260
_0203B6B0: .4byte 0x0600B800
_0203B6B4: .4byte 0x0400000A
_0203B6B8: .4byte 0x00001F0E
_0203B6BC: .4byte 0x04000014
_0203B6C0: .4byte 0x0000FFE8
_0203B6C4: .4byte 0x04000016
_0203B6C8:
	ldr r0, _0203B748 @ =0x04000014
	ldr r3, _0203B74C @ =0x0000FFE8
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_0203B6D4:
	ldr r0, _0203B750 @ =gUnknown_0203C4A4
	ldr r1, _0203B754 @ =0x0600C000
	ldr r2, _0203B758 @ =0x000011D0
	bl CpuSet
	movs r4, #0
_0203B6E0:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r1, _0203B75C @ =gUnknown_0203E844
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, _0203B760 @ =0x0600F800
	adds r1, r1, r2
	movs r2, #0x18
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x11
	bls _0203B6E0
	ldr r1, _0203B764 @ =0x04000040
	ldr r3, _0203B768 @ =0x000018D8
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0203B76C @ =0x00003048
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	movs r0, #2
	strh r0, [r1]
	ldr r0, _0203B770 @ =0x0400004A
	movs r4, #1
	strh r4, [r0]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0203B774 @ =0x05000022
	ldr r2, _0203B778 @ =0x0100000F
	mov r0, sp
	bl CpuSet
	ldr r1, _0203B77C @ =0x04000042
	ldr r3, _0203B780 @ =0x00002828
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0203B784 @ =0x00005058
	adds r0, r2, #0
	strh r0, [r1]
	strb r4, [r5, #0x16]
_0203B73E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0203B748: .4byte 0x04000014
_0203B74C: .4byte 0x0000FFE8
_0203B750: .4byte gUnknown_0203C4A4
_0203B754: .4byte 0x0600C000
_0203B758: .4byte 0x000011D0
_0203B75C: .4byte gUnknown_0203E844
_0203B760: .4byte 0x0600F800
_0203B764: .4byte 0x04000040
_0203B768: .4byte 0x000018D8
_0203B76C: .4byte 0x00003048
_0203B770: .4byte 0x0400004A
_0203B774: .4byte 0x05000022
_0203B778: .4byte 0x0100000F
_0203B77C: .4byte 0x04000042
_0203B780: .4byte 0x00002828
_0203B784: .4byte 0x00005058
	thumb_func_start sub_0203b788
sub_0203b788: @ 0x0203B788
	ldr r0, _0203B794 @ =0x03007FF8
	ldrh r1, [r0]
	movs r2, #1
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0203B794: .4byte 0x03007FF8
_0203B798:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_0203b79c
sub_0203b79c: @ 0x0203B79C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0203B7CC @ =gMultiSioStatusFlags
	ldr r2, [r0]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0203B7C0
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _0203B7BE
	ldr r1, [r1, #0xc]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0203B7BE:
	movs r4, #3
_0203B7C0:
	bl MultiSioStart
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0203B7CC: .4byte gMultiSioStatusFlags

	thumb_func_start sub_0203b7d0
sub_0203b7d0: @ 0x0203B7D0
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r7, _0203B80C @ =gMultiSioStatusFlags
	ldr r0, [r7]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0203B7E6
	movs r6, #4
_0203B7E6:
	ldr r0, _0203B810 @ =gUnknown_030004A0
	ldr r4, _0203B814 @ =gUnknown_03000040
	ldrb r2, [r5, #0x15]
	adds r1, r4, #0
	bl MultiSioMain
	str r0, [r7]
	ldrh r0, [r4]
	strb r0, [r5, #0x13]
	ldrb r1, [r4, #2]
	ldrh r0, [r5, #0x10]
	cmp r0, r1
	beq _0203B802
	strh r1, [r5, #0x10]
_0203B802:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0203B80C: .4byte gMultiSioStatusFlags
_0203B810: .4byte gUnknown_030004A0
_0203B814: .4byte gUnknown_03000040

	thumb_func_start sub_0203b818
sub_0203b818: @ 0x0203B818
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0
	str r0, [sp]
	mov r0, sp
	bl Sio32MultiLoadMain
	cmp r0, #0
	beq _0203B832
	movs r5, #1
_0203B832:
	ldr r3, [sp]
	ldr r1, [r4, #4]
	adds r2, r3, #0
	cmp r2, r1
	bls _0203B848
	subs r1, r2, r1
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	str r2, [r4, #4]
	b _0203B85C
_0203B848:
	cmp r3, r1
	bhs _0203B85C
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r0, r2
	subs r0, r0, r1
	adds r0, r0, r3
	str r0, [r4]
	str r3, [r4, #4]
_0203B85C:
	adds r0, r4, #0
	bl sub_0203b86c
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0203b86c
sub_0203b86c: @ 0x0203B86C
	push {lr}
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	movs r1, #0x90
	lsls r1, r1, #9
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0203B894 @ =0x04000042
	adds r0, #0x28
	movs r3, #0xa0
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0203B894: .4byte 0x04000042

	thumb_func_start sub_0203b898
sub_0203b898: @ 0x0203B898
	push {lr}
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _0203B8B8
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xc6
	lsls r2, r2, #7
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x48
	movs r0, #2
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	b _0203B8BE
_0203B8B8:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0x80
_0203B8BE:
	strh r0, [r1]
	pop {r0}
	bx r0
