.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D88B0
gUnknown_080D88B0:
    .incbin "baserom.gba", 0x000D88B0, 0x40

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_804B43C
sub_804B43C: @ 0x0804B43C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r6, #3
	adds r0, #0x18
	adds r0, r0, r2
	movs r1, #0
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r0, r2
	str r1, [r0]
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804B498
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r6, #0
	beq _0804B484
	movs r0, #0
	movs r1, #0xb0
	lsls r1, r1, #2
	b _0804B488
_0804B484:
	movs r0, #0
	ldr r1, _0804B564 @ =0x000002BF
_0804B488:
	strh r1, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B498:
	lsls r5, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r0, r0, r5
	mov r8, r0
	ldrh r0, [r0]
	subs r0, #1
	movs r1, #0
	mov sb, r1
	mov r1, r8
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804B4CE
	adds r0, r7, #0
	adds r0, #0x3c
	adds r0, r0, r6
	movs r1, #1
	strb r1, [r0]
	movs r0, #0xb4
	mov r1, r8
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x40
	adds r0, r0, r6
	mov r1, sb
	strb r1, [r0]
_0804B4CE:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B584
	lsls r4, r6, #3
	adds r2, r7, #0
	adds r2, #0x18
	adds r2, r2, r4
	ldr r0, _0804B568 @ =gSineTable
	mov ip, r0
	adds r3, r7, #0
	adds r3, #0x28
	adds r3, r3, r5
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r7, #0
	adds r2, #0x1c
	adds r2, r2, r4
	ldrh r0, [r3]
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	lsls r2, r6, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804B56C @ =0x0000FE80
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3c
	adds r0, r0, r6
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	mov r1, r8
	strh r0, [r1]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r6, #0
	beq _0804B570
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B572
	.align 2, 0
_0804B564: .4byte 0x000002BF
_0804B568: .4byte gSineTable
_0804B56C: .4byte 0x0000FE80
_0804B570:
	ldr r0, _0804B590 @ =0x000002BF
_0804B572:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B584:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B590: .4byte 0x000002BF

	thumb_func_start sub_804B594
sub_804B594: @ 0x0804B594
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r3, r1, #3
	adds r1, r7, #0
	adds r1, #0x18
	adds r1, r1, r3
	movs r2, #0
	str r2, [r1]
	adds r0, #0x1c
	adds r0, r0, r3
	str r2, [r0]
	ldr r2, [r7]
	ldr r4, [r1]
	ldr r0, _0804B608 @ =gUnknown_080D8888
	mov r3, r8
	lsls r1, r3, #2
	adds r3, r1, r0
	adds r2, r2, r4
	ldrh r3, [r3]
	adds r5, r2, r3
	ldr r2, [r7, #4]
	adds r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r6, r2, r0
	ldr r1, _0804B60C @ =gPlayer
	ldr r0, [r1, #0xc]
	subs r0, r0, r6
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	subs r1, r1, r5
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x28
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r3, r1
	beq _0804B614
	cmp r3, r1
	bhs _0804B610
	subs r0, #1
	b _0804B612
	.align 2, 0
_0804B608: .4byte gUnknown_080D8888
_0804B60C: .4byte gPlayer
_0804B610:
	adds r0, #1
_0804B612:
	strh r0, [r2]
_0804B614:
	mov r1, r8
	lsls r2, r1, #1
	adds r3, r7, #0
	adds r3, #0x30
	adds r1, r3, r2
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	adds r6, r2, #0
	mov sb, r3
	cmp r0, #0
	bne _0804B66A
	mov r3, r8
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r3, #0
	beq _0804B644
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B646
_0804B644:
	ldr r0, _0804B704 @ =0x000002BF
_0804B646:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x3c
	add r0, r8
	movs r1, #2
	strb r1, [r0]
	mov r0, sb
	adds r1, r0, r6
	movs r0, #0x1e
	strh r0, [r1]
_0804B66A:
	adds r0, r7, #0
	mov r1, r8
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B724
	mov r1, r8
	lsls r4, r1, #3
	adds r2, r7, #0
	adds r2, #0x18
	adds r2, r2, r4
	ldr r5, _0804B708 @ =gSineTable
	adds r3, r7, #0
	adds r3, #0x28
	adds r3, r3, r6
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r7, #0
	adds r2, #0x1c
	adds r2, r2, r4
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r0, r8
	lsls r2, r0, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804B70C @ =0x0000FE80
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3c
	add r0, r8
	movs r1, #7
	strb r1, [r0]
	mov r3, sb
	adds r1, r3, r6
	movs r0, #0x3c
	strh r0, [r1]
	mov r1, r8
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r1, #0
	beq _0804B710
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B712
	.align 2, 0
_0804B704: .4byte 0x000002BF
_0804B708: .4byte gSineTable
_0804B70C: .4byte 0x0000FE80
_0804B710:
	ldr r0, _0804B730 @ =0x000002BF
_0804B712:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B724:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B730: .4byte 0x000002BF

	thumb_func_start sub_804B734
sub_804B734: @ 0x0804B734
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsls r2, r1, #3
	adds r0, #0x18
	adds r3, r0, r2
	movs r1, #0
	str r1, [r3]
	adds r0, #4
	adds r5, r0, r2
	str r1, [r5]
	ldr r0, [sp, #0x20]
	lsls r6, r0, #1
	movs r1, #0x30
	adds r1, r1, r7
	mov r8, r1
	adds r1, r1, r6
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804B772
	b _0804B8AC
_0804B772:
	ldr r4, [r7]
	ldr r3, [r3]
	ldr r0, _0804B840 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r2, r1, r0
	adds r4, r4, r3
	ldrh r2, [r2]
	adds r4, r4, r2
	ldr r2, [r7, #4]
	ldr r3, [r5]
	adds r0, #2
	adds r1, r1, r0
	adds r2, r2, r3
	ldrh r1, [r1]
	adds r2, r2, r1
	movs r1, #0
	str r6, [sp, #0x2c]
	mov r3, r8
	str r3, [sp, #0x38]
	adds r0, r7, #0
	adds r0, #0x28
	adds r6, r7, #0
	adds r6, #0xc
	str r6, [sp, #0x28]
	adds r3, r7, #0
	adds r3, #0x3c
	str r3, [sp, #0x3c]
	asrs r4, r4, #8
	str r4, [sp, #0x30]
	asrs r2, r2, #8
	str r2, [sp, #0x34]
	ldr r6, [sp, #0x2c]
	adds r2, r0, r6
	ldr r0, _0804B844 @ =0x000003FF
	mov sl, r0
	mov r5, sp
	mov sb, r1
_0804B7BE:
	movs r3, #0
	mov r8, r3
	subs r4, r1, #1
	adds r6, r1, #1
	str r6, [sp, #0x24]
	adds r3, r4, #0
	movs r0, #1
	subs r1, r0, r1
	str r1, [sp, #0x48]
_0804B7D0:
	ldrh r0, [r2]
	ldr r1, _0804B848 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r6, sl
	ands r0, r6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r6, _0804B84C @ =gSineTable
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r6, [sp, #0x30]
	subs r0, r6, r0
	str r0, [sp, #0x14]
	ldrh r0, [r2]
	ldr r1, _0804B848 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r6, sl
	ands r0, r6
	lsls r0, r0, #1
	ldr r1, _0804B84C @ =gSineTable
	adds r0, r0, r1
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x34]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	mov r6, sb
	strh r6, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r6, [r2]
	adds r0, r0, r6
	mov r1, sl
	ands r0, r1
	strh r0, [r5, #0xc]
	mov r6, r8
	lsls r0, r6, #7
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r0, r6
	ldr r0, [sp, #0x48]
	cmp r0, #0
	blt _0804B850
	lsls r0, r0, #1
	ldr r6, [sp, #0x48]
	adds r0, r0, r6
	b _0804B854
	.align 2, 0
_0804B840: .4byte gUnknown_080D8888
_0804B844: .4byte 0x000003FF
_0804B848: .4byte 0xFFFFFF00
_0804B84C: .4byte gSineTable
_0804B850:
	lsls r0, r4, #1
	adds r0, r0, r4
_0804B854:
	lsls r0, r0, #5
	subs r0, r1, r0
	strh r0, [r5, #0xe]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	ldr r0, _0804B950 @ =0x000002C3
	strh r0, [r5, #8]
	mov r0, sb
	strh r0, [r5, #0xa]
	mov r1, sb
	str r1, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x28]
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
	bl CreateBossParticleStatic
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	cmp r0, #2
	bls _0804B7D0
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _0804B7BE
	ldr r6, [sp, #0x3c]
	ldr r0, [sp, #0x20]
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x2c]
	adds r1, r2, r3
	movs r0, #0xa
	strh r0, [r1]
	adds r0, #0xfc
	bl m4aSongNumStart
_0804B8AC:
	adds r0, r7, #0
	ldr r1, [sp, #0x20]
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B970
	ldr r6, [sp, #0x20]
	lsls r4, r6, #3
	adds r2, r7, #0
	adds r2, #0x18
	adds r2, r2, r4
	ldr r5, _0804B954 @ =gSineTable
	lsls r6, r6, #1
	adds r3, r7, #0
	adds r3, #0x28
	adds r3, r3, r6
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r7, #0
	adds r2, #0x1c
	adds r2, r2, r4
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [sp, #0x20]
	lsls r2, r0, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804B958 @ =0x0000FE80
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3c
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #7
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x30
	adds r0, r0, r6
	movs r1, #0x3c
	strh r1, [r0]
	ldr r2, [sp, #0x20]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	ldr r3, [sp, #0x20]
	cmp r3, #0
	beq _0804B95C
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B95E
	.align 2, 0
_0804B950: .4byte 0x000002C3
_0804B954: .4byte gSineTable
_0804B958: .4byte 0x0000FE80
_0804B95C:
	ldr r0, _0804B980 @ =0x000002BF
_0804B95E:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B970:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B980: .4byte 0x000002BF

	thumb_func_start sub_804B984
sub_804B984: @ 0x0804B984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov sl, r5
	lsls r2, r5, #3
	adds r0, #0x18
	adds r0, r0, r2
	mov sb, r0
	lsls r3, r5, #1
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r3
	mov r8, r0
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r6, _0804BA90 @ =gSineTable
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	mov r6, sb
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	adds r0, r4, #0
	adds r0, #0x1c
	adds r6, r0, r2
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #1
	ldr r2, _0804BA90 @ =gSineTable
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	adds r0, r4, #0
	adds r0, #0x30
	adds r7, r0, r3
	ldrh r0, [r7]
	subs r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804BA08
	adds r0, r4, #0
	adds r0, #0x3c
	adds r0, r0, r5
	movs r1, #6
	strb r1, [r0]
	movs r0, #0x1e
	strh r0, [r7]
_0804BA08:
	adds r0, r4, #0
	mov r1, sl
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BAAC
	mov r2, r8
	ldrh r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _0804BA90 @ =gSineTable
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #1
	ldr r2, _0804BA90 @ =gSineTable
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r6, sl
	lsls r2, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804BA94 @ =0x0000FE80
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	add r0, sl
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	strh r0, [r7]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r4, r0
	cmp r6, #0
	beq _0804BA98
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804BA9A
	.align 2, 0
_0804BA90: .4byte gSineTable
_0804BA94: .4byte 0x0000FE80
_0804BA98:
	ldr r0, _0804BABC @ =0x000002BF
_0804BA9A:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804BAAC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BABC: .4byte 0x000002BF

	thumb_func_start sub_804BAC0
sub_804BAC0: @ 0x0804BAC0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r7, r5, #0
	lsls r0, r5, #1
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x30
	add r0, r8
	mov sb, r0
	ldrh r0, [r0]
	subs r0, #1
	mov r1, sb
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804BB84
	lsls r3, r5, #3
	adds r2, r6, #0
	adds r2, #0x18
	adds r2, r2, r3
	ldr r0, _0804BB5C @ =gSineTable
	mov ip, r0
	adds r0, r6, #0
	adds r0, #0x28
	mov r1, r8
	adds r4, r0, r1
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r6, #0
	adds r2, #0x1c
	adds r2, r2, r3
	ldrh r0, [r4]
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804BB60
	adds r0, r6, #0
	adds r0, #0x2c
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r5
	movs r1, #4
	strb r1, [r0]
	movs r0, #0x32
	b _0804BB6C
	.align 2, 0
_0804BB5C: .4byte gSineTable
_0804BB60:
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r5
	movs r1, #5
	strb r1, [r0]
	movs r0, #0xa0
_0804BB6C:
	mov r1, sb
	strh r0, [r1]
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r6, r0
	cmp r7, #0
	beq _0804BC20
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804BC22
_0804BB84:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BC34
	lsls r0, r7, #3
	mov ip, r0
	adds r2, r6, #0
	adds r2, #0x18
	add r2, ip
	ldr r5, _0804BC18 @ =gSineTable
	adds r3, r6, #0
	adds r3, #0x28
	add r3, r8
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r6, #0
	adds r2, #0x1c
	add r2, ip
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	lsls r2, r7, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804BC1C @ =0x0000FE80
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r7
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	mov r1, sb
	strh r0, [r1]
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r6, r0
	cmp r7, #0
	beq _0804BC20
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804BC22
	.align 2, 0
_0804BC18: .4byte gSineTable
_0804BC1C: .4byte 0x0000FE80
_0804BC20:
	ldr r0, _0804BC40 @ =0x000002BF
_0804BC22:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804BC34:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC40: .4byte 0x000002BF

	thumb_func_start sub_804BC44
sub_804BC44: @ 0x0804BC44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsls r2, r1, #3
	adds r0, #0x18
	adds r6, r0, r2
	ldr r0, _0804BDE0 @ =gSineTable
	mov ip, r0
	lsls r7, r1, #1
	mov r1, sb
	adds r1, #0x2c
	str r1, [sp, #0x24]
	adds r1, r1, r7
	mov sl, r1
	ldrh r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #5
	subs r1, r1, r0
	asrs r1, r1, #0xa
	ldr r0, [r6]
	subs r0, r0, r1
	str r0, [r6]
	mov r0, sb
	adds r0, #0x1c
	adds r5, r0, r2
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #1
	add r0, ip
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r1, r0, #5
	subs r1, r1, r0
	asrs r1, r1, #0xa
	ldr r0, [r5]
	subs r0, r0, r1
	str r0, [r5]
	mov r3, sb
	adds r3, #0x28
	str r3, [sp, #0x28]
	adds r3, r3, r7
	mov r4, sb
	adds r4, #0x30
	str r4, [sp, #0x2c]
	adds r2, r4, r7
	ldrh r0, [r2]
	lsls r0, r0, #2
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r4, _0804BDE4 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804BCD6
	b _0804BE56
_0804BCD6:
	mov r0, sb
	ldr r4, [r0]
	ldr r3, [r6]
	ldr r0, _0804BDE8 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r2, r1, r0
	adds r4, r4, r3
	ldrh r2, [r2]
	adds r4, r4, r2
	mov r2, sb
	ldr r3, [r2, #4]
	ldr r2, [r5]
	adds r0, #2
	adds r1, r1, r0
	adds r3, r3, r2
	ldrh r1, [r1]
	adds r3, r3, r1
	mov r5, sl
	ldrh r2, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	add r0, ip
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r4, r4, r0
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r3, r3, r0
	movs r1, #0
	mov r8, r1
	str r7, [sp, #0x38]
	ldr r2, [sp, #0x24]
	str r2, [sp, #0x4c]
	ldr r5, [sp, #0x28]
	str r5, [sp, #0x48]
	ldr r7, [sp, #0x2c]
	str r7, [sp, #0x50]
	mov r0, sb
	adds r0, #0xc
	str r0, [sp, #0x34]
	mov r1, sb
	adds r1, #0x3c
	str r1, [sp, #0x54]
	asrs r4, r4, #8
	str r4, [sp, #0x40]
	asrs r3, r3, #8
	str r3, [sp, #0x44]
	mov r2, sl
	mov r4, sp
	movs r3, #0
	mov sl, r3
_0804BD52:
	movs r6, #0
	mov r5, r8
	subs r5, #1
	str r5, [sp, #0x60]
	mov r7, r8
	lsls r7, r7, #1
	str r7, [sp, #0x3c]
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x30]
	adds r3, r5, #0
	movs r1, #1
	mov r7, r8
	subs r5, r1, r7
_0804BD6E:
	ldrh r0, [r2]
	ldr r1, _0804BDEC @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r7, _0804BDE4 @ =0x000003FF
	ands r0, r7
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r7, _0804BDE0 @ =gSineTable
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r7, [sp, #0x40]
	subs r0, r7, r0
	str r0, [sp, #0x14]
	ldrh r0, [r2]
	ldr r1, _0804BDEC @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r7, _0804BDE4 @ =0x000003FF
	ands r0, r7
	lsls r0, r0, #1
	ldr r1, _0804BDE0 @ =gSineTable
	adds r0, r0, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x44]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	mov r7, sl
	strh r7, [r4, #0x1c]
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r0, #0
	ldrh r7, [r2]
	adds r1, r1, r7
	ldr r0, [sp, #0x3c]
	add r0, r8
	adds r0, r0, r6
	lsls r0, r0, #5
	subs r1, r1, r0
	ldr r0, _0804BDE4 @ =0x000003FF
	ands r1, r0
	strh r1, [r4, #0xc]
	lsls r0, r6, #7
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r0, r7
	cmp r5, #0
	blt _0804BDF0
	lsls r0, r5, #1
	adds r0, r0, r5
	b _0804BDF6
	.align 2, 0
_0804BDE0: .4byte gSineTable
_0804BDE4: .4byte 0x000003FF
_0804BDE8: .4byte gUnknown_080D8888
_0804BDEC: .4byte 0xFFFFFF00
_0804BDF0:
	ldr r7, [sp, #0x60]
	lsls r0, r7, #1
	adds r0, r0, r7
_0804BDF6:
	lsls r0, r0, #5
	subs r0, r1, r0
	strh r0, [r4, #0xe]
	mov r1, sb
	ldr r0, [r1, #0x44]
	str r0, [sp]
	ldr r0, _0804BE68 @ =0x000002C3
	strh r0, [r4, #8]
	mov r7, sl
	strh r7, [r4, #0xa]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x34]
	str r2, [sp, #0x58]
	str r3, [sp, #0x5c]
	bl CreateBossParticleStatic
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	cmp r6, #2
	bls _0804BD6E
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0804BD52
	ldr r3, [sp, #0x48]
	ldr r4, [sp, #0x38]
	adds r2, r3, r4
	ldr r5, [sp, #0x4c]
	adds r0, r5, r4
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2]
	ldr r7, [sp, #0x54]
	ldr r2, [sp, #0x20]
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, [sp, #0x50]
	adds r1, r3, r4
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r1]
_0804BE56:
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE68: .4byte 0x000002C3

	thumb_func_start sub_804BE6C
sub_804BE6C: @ 0x0804BE6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsls r2, r1, #3
	adds r0, #0x18
	adds r3, r0, r2
	ldr r0, _0804BFCC @ =gSineTable
	mov sb, r0
	lsls r7, r1, #1
	mov r0, r8
	adds r0, #0x28
	adds r6, r0, r7
	ldrh r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #9
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	mov r0, r8
	adds r0, #0x1c
	adds r5, r0, r2
	ldrh r0, [r6]
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #9
	ldr r0, [r5]
	subs r0, r0, r1
	str r0, [r5]
	movs r2, #0x30
	add r2, r8
	mov sl, r2
	adds r4, r2, r7
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804BEE0
	b _0804C034
_0804BEE0:
	mov r0, r8
	ldr r4, [r0]
	ldr r3, [r3]
	ldr r0, _0804BFD0 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r2, r1, r0
	adds r4, r4, r3
	ldrh r2, [r2]
	adds r4, r4, r2
	mov r2, r8
	ldr r3, [r2, #4]
	ldr r2, [r5]
	adds r0, #2
	adds r1, r1, r0
	adds r3, r3, r2
	ldrh r1, [r1]
	adds r3, r3, r1
	ldrh r2, [r6]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r4, r4, r0
	lsls r2, r2, #1
	add r2, sb
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r3, r3, r0
	movs r0, #0
	str r7, [sp, #0x30]
	mov r1, sl
	str r1, [sp, #0x3c]
	mov r2, r8
	adds r2, #0xc
	str r2, [sp, #0x2c]
	mov r5, r8
	adds r5, #0x3c
	str r5, [sp, #0x40]
	asrs r4, r4, #8
	str r4, [sp, #0x34]
	asrs r3, r3, #8
	str r3, [sp, #0x38]
	adds r7, r6, #0
	ldr r1, _0804BFD4 @ =0x000003FF
	mov sl, r1
	mov r4, sp
_0804BF50:
	movs r6, #0
	subs r2, r0, #1
	mov sb, r2
	adds r5, r0, #1
	str r5, [sp, #0x28]
	movs r1, #1
	subs r3, r1, r0
	lsls r5, r3, #5
	str r5, [sp, #0x24]
_0804BF62:
	ldrh r0, [r7]
	ldr r1, _0804BFD8 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r5, _0804BFCC @ =gSineTable
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xb
	ldr r5, [sp, #0x34]
	subs r0, r5, r0
	str r0, [sp, #0x14]
	ldrh r0, [r7]
	ldr r1, _0804BFD8 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	lsls r0, r0, #1
	ldr r1, _0804BFCC @ =gSineTable
	adds r0, r0, r1
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r2, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x38]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	movs r0, #0x12
	strh r0, [r4, #0x1c]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ldrh r1, [r7]
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	strh r0, [r4, #0xc]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #5
	adds r1, r0, #0
	adds r1, #0x80
	cmp r3, #0
	blt _0804BFDC
	ldr r5, [sp, #0x24]
	subs r0, r1, r5
	b _0804BFE2
	.align 2, 0
_0804BFCC: .4byte gSineTable
_0804BFD0: .4byte gUnknown_080D8888
_0804BFD4: .4byte 0x000003FF
_0804BFD8: .4byte 0xFFFFFF00
_0804BFDC:
	mov r5, sb
	lsls r0, r5, #5
	subs r0, r1, r0
_0804BFE2:
	movs r5, #0
	strh r0, [r4, #0xe]
	mov r1, r8
	ldr r0, [r1, #0x44]
	str r0, [sp]
	ldr r0, _0804C030 @ =0x000002C3
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	str r5, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x2c]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	bl CreateBossParticleStatic
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x48]
	cmp r6, #2
	bls _0804BF62
	ldr r2, [sp, #0x28]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0804BF50
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	strb r5, [r0]
	ldr r5, [sp, #0x3c]
	ldr r0, [sp, #0x30]
	adds r1, r5, r0
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r1]
	b _0804C06C
	.align 2, 0
_0804C030: .4byte 0x000002C3
_0804C034:
	mov r0, r8
	ldr r1, [sp, #0x20]
	bl sub_804B2EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804C06C
	ldr r1, [sp, #0x20]
	lsls r2, r1, #2
	mov r0, r8
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804C07C @ =0x0000FE80
	strh r1, [r0]
	mov r0, r8
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	mov r0, r8
	adds r0, #0x3c
	ldr r2, [sp, #0x20]
	adds r0, r0, r2
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	strh r0, [r4]
_0804C06C:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C07C: .4byte 0x0000FE80

	thumb_func_start sub_804C080
sub_804C080: @ 0x0804C080
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	ldr r0, _0804C20C @ =gStageTime
	mov sb, r0
	ldr r7, [r0]
	movs r0, #7
	ands r7, r0
	cmp r7, #0
	bne _0804C116
	ldr r1, _0804C210 @ =gPseudoRandom
	mov r8, r1
	ldr r0, [r1]
	ldr r5, _0804C214 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0804C218 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r6, _0804C21C @ =gCamera
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x12
	strh r0, [r1, #0x1c]
	mov r3, sp
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	ldr r0, _0804C220 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r2, sp
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r4
	mov r3, r8
	str r0, [r3]
	ldr r1, _0804C224 @ =0x000001FF
	ands r0, r1
	adds r1, #1
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _0804C228 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _0804C22C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0xc
	bl CreateBossParticleStatic
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r0, _0804C230 @ =gMPlayInfo_SE3
	bl m4aMPlayImmInit
_0804C116:
	ldr r0, _0804C230 @ =gMPlayInfo_SE3
	ldr r1, _0804C234 @ =0x0000FFFF
	mov r3, sl
	ldrh r2, [r3, #0x14]
	bl m4aMPlayVolumeControl
	mov r0, sl
	ldr r2, [r0, #0x14]
	cmp r2, #0
	beq _0804C13C
	mov r1, sb
	ldr r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804C13C
	subs r0, r2, #1
	mov r3, sl
	str r0, [r3, #0x14]
_0804C13C:
	ldr r0, _0804C20C @ =gStageTime
	ldr r0, [r0]
	adds r7, r0, #3
	movs r0, #7
	ands r7, r0
	cmp r7, #0
	bne _0804C1FC
	ldr r0, _0804C210 @ =gPseudoRandom
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0804C214 @ =0x00196225
	mov r8, r1
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	ldr r6, _0804C218 @ =0x3C6EF35F
	adds r0, r0, r6
	mov r1, sb
	str r0, [r1]
	lsls r0, r0, #0x18
	movs r4, #0xf0
	lsls r4, r4, #0x14
	ands r4, r0
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r4, r4, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r3, sb
	ldr r0, [r3]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r6
	ldr r5, _0804C21C @ =gCamera
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, r8
	muls r0, r2, r0
	adds r2, r0, #0
	adds r2, r2, r6
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x20
	strh r0, [r1, #0x1c]
	mov r3, sp
	mov r0, r8
	muls r0, r2, r0
	adds r0, r0, r6
	mov r1, sb
	str r0, [r1]
	ldr r1, _0804C220 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	ldr r2, _0804C238 @ =gTileInfoBossScrews
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0804C23C @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r3, #8]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	strh r0, [r3, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0xc
	mov r0, sp
	bl CreateBossParticleStatic
_0804C1FC:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C20C: .4byte gStageTime
_0804C210: .4byte gPseudoRandom
_0804C214: .4byte 0x00196225
_0804C218: .4byte 0x3C6EF35F
_0804C21C: .4byte gCamera
_0804C220: .4byte 0x000003FF
_0804C224: .4byte 0x000001FF
_0804C228: .4byte 0x06012980
_0804C22C: .4byte 0x0000026B
_0804C230: .4byte gMPlayInfo_SE3
_0804C234: .4byte 0x0000FFFF
_0804C238: .4byte gTileInfoBossScrews
_0804C23C: .4byte 0x06010000

	thumb_func_start sub_804C240
sub_804C240: @ 0x0804C240
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	mov ip, r2
	adds r0, #0x42
	adds r3, r0, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _0804C260
	b _0804C37C
_0804C260:
	lsls r7, r2, #3
	adds r0, r4, #0
	adds r0, #0x1c
	adds r6, r0, r7
	ldr r1, [r4, #4]
	ldr r0, [r6]
	adds r1, r1, r0
	ldr r0, _0804C290 @ =gUnknown_080D8888
	mov sb, r0
	lsls r5, r2, #2
	adds r0, #2
	adds r0, r5, r0
	ldrh r0, [r0]
	mov r8, r0
	add r1, r8
	asrs r1, r1, #8
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	ble _0804C294
	movs r0, #1
	strb r0, [r3]
	b _0804C37C
	.align 2, 0
_0804C290: .4byte gUnknown_080D8888
_0804C294:
	mov r1, ip
	lsls r0, r1, #1
	adds r2, r4, #0
	adds r2, #0x28
	adds r2, r2, r0
	movs r3, #0xc8
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r1, [r2]
	adds r0, r0, r1
	adds r3, #0xdf
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	adds r3, r0, r5
	ldrh r0, [r3]
	adds r0, #0x20
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x18
	adds r2, r0, r7
	adds r0, #0x1c
	adds r0, r0, r5
	mov ip, r0
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [sp, #0x20]
	str r0, [r6]
	ldr r1, _0804C38C @ =gStageTime
	mov sl, r1
	ldr r6, [r1]
	movs r0, #3
	ands r6, r0
	cmp r6, #0
	bne _0804C37C
	ldr r1, [r4]
	ldr r0, [r2]
	mov r7, sb
	adds r2, r5, r7
	adds r1, r1, r0
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x20]
	adds r0, r0, r2
	add r0, r8
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	mov r0, sp
	strh r6, [r0, #0x1c]
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	rsbs r0, r0, #0
	mov r3, ip
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	rsbs r1, r1, #0
	bl sub_8004418
	mov r1, sp
	strh r0, [r1, #0xc]
	mov r3, sp
	ldr r2, _0804C390 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804C394 @ =0x00196225
	muls r0, r1, r0
	ldr r5, _0804C398 @ =0x3C6EF35F
	adds r0, r0, r5
	str r0, [r2]
	mov r2, sp
	movs r1, #0x1f
	ands r0, r1
	ldrh r2, [r2, #0xc]
	adds r0, r0, r2
	subs r0, #0x10
	ldr r1, _0804C39C @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	ldr r2, _0804C3A0 @ =gSineTable
	mov r7, sl
	ldr r0, [r7]
	lsls r0, r0, #4
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r1, #0xff
	adds r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0804C3A4 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _0804C3A8 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r6, [r0, #0xa]
	str r6, [sp, #4]
	adds r1, r4, #0
	adds r1, #0xc
	bl CreateBossParticleStatic
_0804C37C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C38C: .4byte gStageTime
_0804C390: .4byte gPseudoRandom
_0804C394: .4byte 0x00196225
_0804C398: .4byte 0x3C6EF35F
_0804C39C: .4byte 0x000003FF
_0804C3A0: .4byte gSineTable
_0804C3A4: .4byte 0x06012980
_0804C3A8: .4byte 0x0000026B

	thumb_func_start sub_804C3AC
sub_804C3AC: @ 0x0804C3AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	ldr r5, _0804C42C @ =gPseudoRandom
	ldr r0, [r5]
	ldr r4, _0804C430 @ =0x00196225
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r2, _0804C434 @ =0x3C6EF35F
	adds r1, r1, r2
	movs r3, #7
	adds r0, r1, #0
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	str r0, [sp]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r5]
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	str r0, [sp, #4]
	ldr r3, _0804C438 @ =gBgScrollRegs
	ldr r1, _0804C43C @ =gCamera
	ldr r4, [r1]
	mov r0, sl
	ldr r2, [r0]
	ldr r5, [sp]
	adds r0, r2, r5
	asrs r0, r0, #8
	subs r0, r4, r0
	strh r0, [r3]
	ldr r1, [r1, #4]
	mov r5, sl
	ldr r0, [r5, #4]
	ldr r5, [sp, #4]
	adds r0, r0, r5
	asrs r0, r0, #8
	subs r1, r1, r0
	strh r1, [r3, #2]
	movs r0, #0xbe
	lsls r0, r0, #8
	adds r2, r2, r0
	asrs r2, r2, #8
	subs r6, r2, r4
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0xa5
	lsls r0, r0, #1
	cmp r1, r0
	bls _0804C448
	ldr r2, _0804C440 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804C444 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _0804C456
	.align 2, 0
_0804C42C: .4byte gPseudoRandom
_0804C430: .4byte 0x00196225
_0804C434: .4byte 0x3C6EF35F
_0804C438: .4byte gBgScrollRegs
_0804C43C: .4byte gCamera
_0804C440: .4byte gDispCnt
_0804C444: .4byte 0x0000FEFF
_0804C448:
	ldr r0, _0804C5A0 @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_0804C456:
	mov r5, sl
	adds r5, #0x54
	movs r4, #0x84
	add r4, sl
	mov r8, r4
	mov r1, sl
	ldr r0, [r1]
	ldr r2, [sp]
	adds r0, r0, r2
	movs r3, #0xbe
	lsls r3, r3, #8
	adds r6, r0, r3
	ldr r0, [r1, #4]
	ldr r4, [sp, #4]
	adds r0, r0, r4
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r7, r0, r1
	asrs r0, r6, #8
	ldr r2, _0804C5A4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, _0804C5A8 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0804C5AC @ =0x00003060
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r2, sl
	ldrh r0, [r2, #0x10]
	mov r3, r8
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r3, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r3, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	mov r1, r8
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	movs r4, #0
	mov sb, r4
	subs r5, #0x3c
	str r5, [sp, #0xc]
	mov r0, sl
	adds r0, #0x1c
	str r0, [sp, #0x10]
	mov r1, sl
	adds r1, #0x28
	str r1, [sp, #8]
_0804C4DE:
	mov r2, sb
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, #0x90
	mov r3, sl
	adds r5, r3, r0
	movs r4, #0x30
	adds r4, r4, r5
	mov r8, r4
	ldr r1, [r3]
	ldr r0, [sp]
	adds r1, r1, r0
	lsls r2, r2, #3
	ldr r3, [sp, #0xc]
	adds r0, r3, r2
	ldr r0, [r0]
	mov ip, r0
	mov r4, sb
	lsls r3, r4, #2
	ldr r4, _0804C5B0 @ =gUnknown_080D8888
	adds r0, r3, r4
	add r1, ip
	ldrh r0, [r0]
	adds r6, r1, r0
	mov r1, sl
	ldr r0, [r1, #4]
	ldr r4, [sp, #4]
	adds r0, r0, r4
	ldr r1, [sp, #0x10]
	adds r2, r1, r2
	ldr r1, [r2]
	ldr r2, _0804C5B4 @ =gUnknown_080D8888+2
	adds r3, r3, r2
	adds r0, r0, r1
	ldrh r3, [r3]
	adds r7, r0, r3
	asrs r1, r6, #8
	ldr r2, _0804C5A4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, _0804C5A8 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r3, sb
	lsls r0, r3, #1
	ldr r4, [sp, #8]
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r5, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	mov r1, r8
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r1, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	mov r1, r8
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #1
	bls _0804C4DE
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C5A0: .4byte gDispCnt
_0804C5A4: .4byte gCamera
_0804C5A8: .4byte gUnknown_030054B8
_0804C5AC: .4byte 0x00003060
_0804C5B0: .4byte gUnknown_080D8888
_0804C5B4: .4byte gUnknown_080D8888+2

	thumb_func_start sub_804C5B8
sub_804C5B8: @ 0x0804C5B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _0804C640
	cmp r0, #0x1f
	bhi _0804C608
	ldr r5, _0804C5FC @ =gPseudoRandom
	ldr r0, [r5]
	ldr r4, _0804C600 @ =0x00196225
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r2, _0804C604 @ =0x3C6EF35F
	adds r1, r1, r2
	movs r3, #7
	adds r0, r1, #0
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	str r0, [sp, #8]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r5]
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	b _0804C644
	.align 2, 0
_0804C5FC: .4byte gPseudoRandom
_0804C600: .4byte 0x00196225
_0804C604: .4byte 0x3C6EF35F
_0804C608:
	ldr r5, _0804C634 @ =gPseudoRandom
	ldr r0, [r5]
	ldr r4, _0804C638 @ =0x00196225
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r2, _0804C63C @ =0x3C6EF35F
	adds r1, r1, r2
	movs r3, #0xf
	adds r0, r1, #0
	ands r0, r3
	subs r0, #7
	lsls r0, r0, #8
	str r0, [sp, #8]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r5]
	ands r0, r3
	subs r0, #7
	lsls r0, r0, #8
	b _0804C644
	.align 2, 0
_0804C634: .4byte gPseudoRandom
_0804C638: .4byte 0x00196225
_0804C63C: .4byte 0x3C6EF35F
_0804C640:
	movs r0, #0
	str r0, [sp, #8]
_0804C644:
	str r0, [sp, #0xc]
	ldr r5, _0804C694 @ =gBgScrollRegs
	ldr r3, _0804C698 @ =gCamera
	ldr r6, [r3]
	mov r1, r8
	ldr r2, [r1]
	ldr r7, [sp, #8]
	adds r0, r2, r7
	asrs r0, r0, #8
	subs r0, r6, r0
	strh r0, [r5]
	ldr r1, [r3, #4]
	mov r0, r8
	ldr r4, [r0, #4]
	ldr r7, [sp, #0xc]
	adds r0, r4, r7
	asrs r0, r0, #8
	subs r1, r1, r0
	strh r1, [r5, #2]
	movs r1, #0xbe
	lsls r1, r1, #8
	adds r0, r2, r1
	asrs r0, r0, #8
	subs r6, r0, r6
	str r6, [sp]
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0xa5
	lsls r0, r0, #1
	mov sb, r3
	adds r7, r2, #0
	cmp r1, r0
	bls _0804C6A4
	ldr r2, _0804C69C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804C6A0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _0804C6B2
	.align 2, 0
_0804C694: .4byte gBgScrollRegs
_0804C698: .4byte gCamera
_0804C69C: .4byte gDispCnt
_0804C6A0: .4byte 0x0000FEFF
_0804C6A4:
	ldr r0, _0804C6CC @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_0804C6B2:
	mov r5, r8
	adds r5, #0x54
	mov r6, r8
	adds r6, #0x84
	mov r1, r8
	ldrb r0, [r1, #0xb]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x1f
	bhi _0804C6D0
	lsrs r3, r1, #0x1b
	b _0804C6DE
	.align 2, 0
_0804C6CC: .4byte gDispCnt
_0804C6D0:
	mov r2, r8
	ldrb r1, [r2, #0xb]
	movs r0, #0x40
	subs r0, r0, r1
	asrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0804C6DE:
	ldr r1, [sp, #8]
	adds r0, r7, r1
	movs r2, #0xbe
	lsls r2, r2, #8
	adds r2, r0, r2
	str r2, [sp]
	ldr r7, [sp, #0xc]
	adds r0, r4, r7
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r1, r0, r1
	str r1, [sp, #4]
	asrs r0, r2, #8
	mov r7, sb
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [sp, #4]
	asrs r0, r1, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	ldr r2, _0804C81C @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0804C820 @ =0x00003060
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r2, r8
	ldrh r0, [r2, #0x10]
	strh r0, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	movs r7, #0
	movs r3, #0x42
	add r3, r8
	mov sl, r3
	ldr r0, _0804C824 @ =gUnknown_080D8888
	mov sb, r0
_0804C754:
	mov r1, sl
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C802
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x90
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x30
	ldr r1, [r2]
	ldr r3, [sp, #8]
	adds r1, r1, r3
	lsls r4, r7, #3
	mov r0, r8
	adds r0, #0x18
	adds r0, r0, r4
	ldr r0, [r0]
	mov ip, r0
	lsls r2, r7, #2
	mov r3, sb
	adds r0, r2, r3
	add r1, ip
	ldrh r0, [r0]
	adds r0, r1, r0
	str r0, [sp]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r3, [sp, #0xc]
	adds r1, r1, r3
	adds r0, #0x1c
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r3, _0804C828 @ =gUnknown_080D8888+2
	adds r2, r2, r3
	adds r1, r1, r0
	ldrh r2, [r2]
	adds r2, r1, r2
	str r2, [sp, #4]
	ldr r0, [sp]
	asrs r1, r0, #8
	ldr r2, _0804C82C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [sp, #4]
	asrs r0, r1, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, _0804C81C @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0x10]
	lsls r1, r7, #1
	mov r0, r8
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
_0804C802:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #1
	bls _0804C754
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C81C: .4byte gUnknown_030054B8
_0804C820: .4byte 0x00003060
_0804C824: .4byte gUnknown_080D8888
_0804C828: .4byte gUnknown_080D8888+2
_0804C82C: .4byte gCamera

	thumb_func_start sub_804C830
sub_804C830: @ 0x0804C830
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	bne _0804C8CC
	ldr r0, [r5]
	movs r1, #0xbe
	lsls r1, r1, #8
	adds r0, r0, r1
	asrs r7, r0, #8
	str r7, [sp, #4]
	ldr r0, [r5, #4]
	movs r2, #0xa0
	lsls r2, r2, #6
	adds r0, r0, r2
	asrs r4, r0, #8
	str r4, [sp, #8]
	adds r6, r5, #0
	adds r6, #0x54
	ldr r0, _0804C87C @ =gPlayer
	mov r8, r0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl IsColliding_Cheese
	cmp r0, #1
	bne _0804C880
	adds r0, r5, #0
	bl sub_804C8F4
	b _0804C8E4
	.align 2, 0
_0804C87C: .4byte gPlayer
_0804C880:
	mov r1, r8
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0804C8AA
	adds r0, r5, #0
	bl sub_804C8F4
	mov r2, r8
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0804C8CC
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	b _0804C8CC
_0804C8AA:
	mov r2, r8
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _0804C8CC
	mov r1, r8
	movs r2, #0x10
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _0804C8CC
	rsbs r0, r0, #0
	strh r0, [r1, #0x10]
_0804C8CC:
	ldr r0, _0804C8F0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804C8E4
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	ldr r2, [sp, #8]
	lsls r1, r2, #8
	bl Player_UpdateHomingPosition
_0804C8E4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C8F0: .4byte gSelectedCharacter

	thumb_func_start sub_804C8F4
sub_804C8F4: @ 0x0804C8F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x54
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r7, #8]
	subs r0, #1
	strb r0, [r7, #8]
	movs r1, #0xff
	ands r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804C91C
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804C922
_0804C91C:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804C922:
	ldrb r2, [r7, #8]
	cmp r2, #3
	bne _0804C92E
	ldr r1, _0804C99C @ =gUnknown_030054A8
	movs r0, #0x13
	strb r0, [r1, #1]
_0804C92E:
	cmp r2, #0
	bne _0804C97C
	ldr r1, _0804C9A0 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0804C9A4 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0804C976
	ldr r0, _0804C9A8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C976
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _0804C9AC @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0804C974
	movs r0, #0xff
_0804C974:
	strb r0, [r1]
_0804C976:
	ldr r1, _0804C99C @ =gUnknown_030054A8
	movs r0, #0x30
	strb r0, [r1, #1]
_0804C97C:
	movs r0, #0x40
	strb r0, [r7, #0xb]
	ldr r0, _0804C9B0 @ =0x000002C1
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C99C: .4byte gUnknown_030054A8
_0804C9A0: .4byte gLevelScore
_0804C9A4: .4byte 0x0000C350
_0804C9A8: .4byte gGameMode
_0804C9AC: .4byte gNumLives
_0804C9B0: .4byte 0x000002C1

	thumb_func_start sub_804C9B4
sub_804C9B4: @ 0x0804C9B4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, #9
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804C9EE
	subs r0, #1
	strb r0, [r1]
	movs r1, #0xff
	ands r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804C9DE
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804C9E4
_0804C9DE:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804C9E4:
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r4
	movs r1, #0x40
	strb r1, [r0]
_0804C9EE:
	movs r1, #0
	adds r0, r5, #0
	adds r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C9FE
	movs r1, #1
_0804C9FE:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804CA08
sub_804CA08: @ 0x0804CA08
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	beq _0804CA4C
	subs r0, #1
	strb r0, [r2, #0xb]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804CA4C
	adds r3, r2, #0
	adds r3, #0x54
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _0804CA38
	movs r0, #0
	ldr r1, _0804CA34 @ =0x000002C1
	strh r1, [r3, #0xa]
	adds r1, r2, #0
	adds r1, #0x74
	b _0804CA42
	.align 2, 0
_0804CA34: .4byte 0x000002C1
_0804CA38:
	ldr r0, _0804CA6C @ =0x000002C1
	strh r0, [r3, #0xa]
	adds r1, r2, #0
	adds r1, #0x74
	movs r0, #3
_0804CA42:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804CA4C:
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CA5A
	subs r0, #1
	strb r0, [r1]
_0804CA5A:
	adds r1, r2, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CA68
	subs r0, #1
	strb r0, [r1]
_0804CA68:
	pop {r0}
	bx r0
	.align 2, 0
_0804CA6C: .4byte 0x000002C1

	thumb_func_start sub_804CA70
sub_804CA70: @ 0x0804CA70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	ldr r0, _0804CABC @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	lsrs r6, r0, #1
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0804CACC
	movs r2, #0
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	adds r7, r3, #0
	adds r7, #0x3f
	ldr r1, _0804CAC0 @ =gFlags
	mov r8, r1
	ldr r5, _0804CAC4 @ =gObjPalette
	ldr r4, _0804CAC8 @ =gUnknown_080D88B0
	lsls r3, r6, #5
_0804CA9E:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CA9E
	b _0804CAFA
	.align 2, 0
_0804CABC: .4byte gStageTime
_0804CAC0: .4byte gFlags
_0804CAC4: .4byte gObjPalette
_0804CAC8: .4byte gUnknown_080D88B0
_0804CACC:
	movs r2, #0
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	adds r7, r3, #0
	adds r7, #0x3f
	ldr r1, _0804CB28 @ =gFlags
	mov r8, r1
	ldr r4, _0804CB2C @ =gObjPalette
	ldr r3, _0804CB30 @ =gUnknown_080D88B0
_0804CAE0:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CAE0
_0804CAFA:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CB34
	movs r2, #0
	ldr r5, _0804CB2C @ =gObjPalette
	ldr r4, _0804CB30 @ =gUnknown_080D88B0
	lsls r3, r6, #5
_0804CB0A:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB0A
	b _0804CB54
	.align 2, 0
_0804CB28: .4byte gFlags
_0804CB2C: .4byte gObjPalette
_0804CB30: .4byte gUnknown_080D88B0
_0804CB34:
	movs r2, #0
	ldr r4, _0804CB80 @ =gObjPalette
	ldr r3, _0804CB84 @ =gUnknown_080D88B0
_0804CB3A:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB3A
_0804CB54:
	ldrb r0, [r7]
	cmp r0, #0
	beq _0804CB88
	movs r2, #0
	ldr r5, _0804CB80 @ =gObjPalette
	ldr r4, _0804CB84 @ =gUnknown_080D88B0
	lsls r3, r6, #5
_0804CB62:
	adds r1, r2, #0
	adds r1, #0xc0
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB62
	b _0804CBA8
	.align 2, 0
_0804CB80: .4byte gObjPalette
_0804CB84: .4byte gUnknown_080D88B0
_0804CB88:
	movs r2, #0
	ldr r4, _0804CBC0 @ =gObjPalette
	ldr r3, _0804CBC4 @ =gUnknown_080D88B0
_0804CB8E:
	adds r1, r2, #0
	adds r1, #0xc0
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB8E
_0804CBA8:
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CBC0: .4byte gObjPalette
_0804CBC4: .4byte gUnknown_080D88B0

	thumb_func_start Task_SuperEggRoboZMain
Task_SuperEggRoboZMain: @ 0x0804CBC8
	push {r4, r5, r6, r7, lr}
	ldr r7, _0804CC24 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, r5, #0
	bl sub_804C5B8
	ldr r6, _0804CC28 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r1, #0x14
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0804CC1C
	ldr r0, [r5, #0x14]
	subs r4, r0, #1
	str r4, [r5, #0x14]
	cmp r4, #0
	bne _0804CC1C
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r5, #0x14]
	ldr r1, [r7]
	ldr r0, _0804CC2C @ =sub_804A9D8
	str r0, [r1, #8]
	movs r0, #0x82
	lsls r0, r0, #1
	bl m4aSongNumStart
	adds r0, r6, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_0804CC1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC24: .4byte gCurTask
_0804CC28: .4byte gPlayer
_0804CC2C: .4byte sub_804A9D8

	thumb_func_start Task_804CC30
Task_804CC30: @ 0x0804CC30
	push {r4, lr}
	ldr r4, _0804CC78 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r1, _0804CC7C @ =IWRAM_START + 0x4C
	adds r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #6
	strh r1, [r2]
	ldr r1, _0804CC80 @ =IWRAM_START + 0x48
	adds r0, r0, r1
	bl UpdateScreenFade
	ldr r0, _0804CC84 @ =gCourseTime
	ldr r0, [r0]
	ldr r1, _0804CC88 @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0804CC8C @ =gSpecialRingCount
	ldrb r2, [r2]
	bl CreateStageResults
	movs r0, #0x90
	bl m4aSongNumStop
	ldr r0, _0804CC90 @ =gMPlayInfo_SE3
	ldr r1, _0804CC94 @ =0x0000FFFF
	movs r2, #0xff
	bl m4aMPlayVolumeControl
	ldr r0, [r4]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC78: .4byte gCurTask
_0804CC7C: .4byte IWRAM_START + 0x4C
_0804CC80: .4byte IWRAM_START + 0x48
_0804CC84: .4byte gCourseTime
_0804CC88: .4byte gRingCount
_0804CC8C: .4byte gSpecialRingCount
_0804CC90: .4byte gMPlayInfo_SE3
_0804CC94: .4byte 0x0000FFFF

	thumb_func_start sub_804CC98
sub_804CC98: @ 0x0804CC98
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	beq _0804CCC4
	ldr r1, _0804CCBC @ =gSineTable
	lsls r0, r0, #4
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #7
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0804CCC0 @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	b _0804CCC8
	.align 2, 0
_0804CCBC: .4byte gSineTable
_0804CCC0: .4byte 0x000003FF
_0804CCC4:
	movs r0, #0x80
	lsls r0, r0, #2
_0804CCC8:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804CCD0
sub_804CCD0: @ 0x0804CCD0
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r0]
	movs r5, #0xbe
	lsls r5, r5, #8
	adds r2, r1, r5
	ldr r0, [r0, #4]
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r3, r0, r1
	ldr r5, _0804CD08 @ =gPlayer
	ldr r1, [r5, #0xc]
	asrs r0, r1, #8
	cmp r0, r2
	bge _0804CD00
	subs r0, r3, r4
	cmp r1, r0
	blt _0804CD00
	adds r0, r4, r3
	cmp r1, r0
	bgt _0804CD00
	adds r0, r5, #0
	bl sub_800CBA4
_0804CD00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD08: .4byte gPlayer

	thumb_func_start TaskDestructor_SuperEggRoboZMain
TaskDestructor_SuperEggRoboZMain: @ 0x0804CD0C
	push {r4, r5, lr}
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r0, [r5, #0x44]
	bl VramFree
	ldr r1, _0804CD44 @ =IWRAM_START + 0x94
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _0804CD48 @ =IWRAM_START + 0xD0
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r0, [r5, #0x58]
	bl VramFree
	ldr r1, _0804CD4C @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD44: .4byte IWRAM_START + 0x94
_0804CD48: .4byte IWRAM_START + 0xD0
_0804CD4C: .4byte gActiveBossTask
