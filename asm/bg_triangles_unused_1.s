.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

    @ Unused
	thumb_func_start sub_800672C
sub_800672C: @ 0x0800672C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08006760 @ =gFlags
	ldr r0, [r1]
	movs r3, #4
	orrs r0, r3
	str r0, [r1]
	cmp r2, #1
	bls _08006778
	ldr r1, _08006764 @ =gUnknown_03002A80
	strb r3, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800676C
	ldr r0, _08006768 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	adds r7, r0, #2
	b _080067A0
	.align 2, 0
_08006760: .4byte gFlags
_08006764: .4byte gUnknown_03002A80
_08006768: .4byte gBgOffsetsHBlank
_0800676C:
	ldr r0, _08006774 @ =gBgOffsetsHBlank
	ldr r7, [r0]
	b _080067A0
	.align 2, 0
_08006774: .4byte gBgOffsetsHBlank
_08006778:
	ldr r1, _08006790 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08006794 @ =gBgOffsetsHBlank
	ldr r7, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080067A0
	ldr r1, _08006798 @ =gUnknown_03002878
	ldr r0, _0800679C @ =0x04000042
	b _080067A4
	.align 2, 0
_08006790: .4byte gUnknown_03002A80
_08006794: .4byte gBgOffsetsHBlank
_08006798: .4byte gUnknown_03002878
_0800679C: .4byte 0x04000042
_080067A0:
	ldr r1, _080068A4 @ =gUnknown_03002878
	ldr r0, _080068A8 @ =0x04000040
_080067A4:
	str r0, [r1]
	mov r2, sp
	mov r1, ip
	ldrb r0, [r1, #2]
	ldrb r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	add r2, sp, #4
	mov r3, ip
	ldrb r0, [r3, #3]
	ldrb r1, [r3, #1]
	subs r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldrb r3, [r3]
	mov r1, ip
	ldrb r4, [r1, #1]
	adds r2, #8
	str r2, [sp, #0x24]
	cmp r0, #0
	bge _080067D4
	rsbs r0, r0, #0
_080067D4:
	lsls r0, r0, #1
	ldr r5, [sp, #0x24]
	strh r0, [r5]
	mov r1, sp
	movs r2, #4
	ldrsh r0, [r1, r2]
	adds r1, #0x10
	str r1, [sp, #0x28]
	cmp r0, #0
	bge _080067EA
	rsbs r0, r0, #0
_080067EA:
	lsls r0, r0, #1
	ldr r5, [sp, #0x28]
	strh r0, [r5]
	mov r1, sp
	mov r2, ip
	ldrb r0, [r2, #4]
	subs r0, r0, r3
	strh r0, [r1, #2]
	ldrb r0, [r2, #5]
	subs r0, r0, r4
	strh r0, [r1, #6]
	mov r0, sp
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0800680C
	rsbs r0, r0, #0
_0800680C:
	lsls r0, r0, #1
	ldr r5, [sp, #0x24]
	strh r0, [r5, #2]
	mov r1, sp
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0800681E
	rsbs r0, r0, #0
_0800681E:
	lsls r0, r0, #1
	ldr r3, [sp, #0x28]
	strh r0, [r3, #2]
	add r2, sp, #0x14
	mov r5, ip
	ldrb r0, [r5]
	strb r0, [r2, #1]
	strb r0, [r2]
	ldr r1, _080068AC @ =gUnknown_03002A80
	ldrb r0, [r1]
	muls r0, r4, r0
	adds r7, r7, r0
	add r1, sp, #8
	mov r3, sp
	ldrh r0, [r3, #4]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r3, #6]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	ldrb r0, [r5, #5]
	ldrb r3, [r5, #3]
	adds r6, r2, #0
	mov sb, r1
	cmp r0, r3
	bls _08006854
	adds r0, r3, #0
_08006854:
	str r0, [sp, #0x18]
	cmp r4, r0
	bhs _0800693A
	mov r8, sb
_0800685C:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	mov r5, sp
	ldrh r2, [r5, #0xc]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r5, #0xe]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _080068D6
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_08006888:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _080068B0
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _080068CC
	.align 2, 0
_080068A4: .4byte gUnknown_03002878
_080068A8: .4byte 0x04000040
_080068AC: .4byte gUnknown_03002A80
_080068B0:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080068BA
	subs r0, #1
	strb r0, [r6]
_080068BA:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080068CC
	ldrb r0, [r6]
	strb r0, [r7, #1]
_080068CC:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08006888
_080068D6:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006928
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_080068E6:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800690C
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800691E
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _0800691E
_0800690C:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006916
	subs r0, #1
	strb r0, [r6, #1]
_08006916:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_0800691E:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080068E6
_08006928:
	ldr r2, _080069EC @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _0800685C
_0800693A:
	mov r1, ip
	ldrb r0, [r1, #3]
	ldrb r2, [r1, #5]
	cmp r0, r2
	bne _08006946
	b _08006C30
_08006946:
	ldr r3, [sp, #0x18]
	cmp r3, r0
	beq _0800694E
	b _08006AB4
_0800694E:
	mov r2, sp
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #2]
	subs r0, r0, r1
	strh r0, [r2]
	mov r5, ip
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #3]
	subs r0, r0, r1
	strh r0, [r2, #4]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0800696E
	rsbs r0, r0, #0
_0800696E:
	lsls r0, r0, #1
	ldr r2, [sp, #0x24]
	strh r0, [r2]
	mov r3, sp
	movs r5, #4
	ldrsh r0, [r3, r5]
	cmp r0, #0
	bge _08006980
	rsbs r0, r0, #0
_08006980:
	lsls r0, r0, #1
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	mov r2, sp
	ldrh r0, [r2, #4]
	rsbs r0, r0, #0
	mov r3, sb
	strh r0, [r3]
	mov r5, ip
	ldrb r0, [r5, #2]
	strb r0, [r6]
	ldrb r0, [r5, #5]
	str r0, [sp, #0x18]
	cmp r4, r0
	bhs _08006A7A
	mov r8, sb
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x1c]
_080069A4:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	ldr r5, [sp, #0x1c]
	ldrh r2, [r5]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _08006A16
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_080069D0:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _080069F0
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _08006A0C
	.align 2, 0
_080069EC: .4byte gUnknown_03002A80
_080069F0:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080069FA
	subs r0, #1
	strb r0, [r6]
_080069FA:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006A0C
	ldrb r0, [r6]
	strb r0, [r7, #1]
_08006A0C:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080069D0
_08006A16:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006A68
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_08006A26:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08006A4C
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006A5E
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _08006A5E
_08006A4C:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006A56
	subs r0, #1
	strb r0, [r6, #1]
_08006A56:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_08006A5E:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006A26
_08006A68:
	ldr r2, _08006AB0 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _080069A4
_08006A7A:
	mov r2, sp
	mov r1, ip
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	mov r2, ip
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #5]
	subs r0, r0, r1
	mov r3, sp
	strh r0, [r3, #6]
	mov r0, sp
	movs r5, #2
	ldrsh r0, [r0, r5]
	ldrb r3, [r2, #7]
	cmp r0, #0
	bge _08006AA0
	rsbs r0, r0, #0
_08006AA0:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1, #2]
	mov r2, sp
	movs r5, #6
	ldrsh r0, [r2, r5]
	b _08006CA4
	.align 2, 0
_08006AB0: .4byte gUnknown_03002A80
_08006AB4:
	mov r2, sp
	mov r3, ip
	ldrb r0, [r3, #6]
	ldrb r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrb r0, [r3, #7]
	ldrb r1, [r3, #5]
	subs r0, r0, r1
	strh r0, [r2, #6]
	mov r0, sp
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, #0
	bge _08006AD4
	rsbs r0, r0, #0
_08006AD4:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1, #2]
	mov r2, sp
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08006AE6
	rsbs r0, r0, #0
_08006AE6:
	lsls r0, r0, #1
	ldr r5, [sp, #0x28]
	strh r0, [r5, #2]
	mov r1, sp
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	mov r2, sb
	strh r0, [r2, #2]
	mov r3, ip
	ldrb r0, [r3, #4]
	strb r0, [r6, #1]
	ldrb r5, [r3, #3]
	str r5, [sp, #0x18]
	cmp r4, r5
	bhs _08006BDC
	mov r8, sb
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x20]
_08006B0A:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	ldr r1, [sp, #0x20]
	ldrh r2, [r1]
	ldrh r5, [r3]
	adds r2, r2, r5
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _08006B78
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_08006B36:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08006B52
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _08006B6E
_08006B52:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08006B5C
	subs r0, #1
	strb r0, [r6]
_08006B5C:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006B6E
	ldrb r0, [r6]
	strb r0, [r7, #1]
_08006B6E:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08006B36
_08006B78:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006BCA
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_08006B88:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08006BAE
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006BC0
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _08006BC0
_08006BAE:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006BB8
	subs r0, #1
	strb r0, [r6, #1]
_08006BB8:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_08006BC0:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006B88
_08006BCA:
	ldr r2, _08006C2C @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _08006B0A
_08006BDC:
	mov r2, sp
	mov r1, ip
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #2]
	subs r0, r0, r1
	strh r0, [r2]
	mov r2, ip
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #3]
	subs r0, r0, r1
	mov r3, sp
	strh r0, [r3, #4]
	mov r0, sp
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldrb r3, [r2, #7]
	cmp r0, #0
	bge _08006C02
	rsbs r0, r0, #0
_08006C02:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1]
	mov r2, sp
	movs r5, #4
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _08006C14
	rsbs r0, r0, #0
_08006C14:
	lsls r0, r0, #1
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	mov r2, sp
	ldrh r0, [r2, #4]
	rsbs r0, r0, #0
	mov r5, sb
	strh r0, [r5]
	mov r1, ip
	ldrb r0, [r1, #2]
	strb r0, [r6]
	b _08006CC0
	.align 2, 0
_08006C2C: .4byte gUnknown_03002A80
_08006C30:
	mov r2, sp
	mov r3, ip
	ldrb r0, [r3, #6]
	ldrb r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2]
	add r2, sp, #4
	ldrb r0, [r3, #7]
	ldrb r1, [r3, #3]
	subs r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldrb r1, [r3, #6]
	mov r8, r1
	ldrb r3, [r3, #7]
	cmp r0, #0
	bge _08006C58
	rsbs r0, r0, #0
_08006C58:
	lsls r0, r0, #1
	ldr r5, [sp, #0x24]
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08006C68
	rsbs r0, r0, #0
_08006C68:
	lsls r0, r0, #1
	ldr r5, [sp, #0x28]
	strh r0, [r5]
	ldrh r0, [r2]
	rsbs r0, r0, #0
	mov r1, sb
	strh r0, [r1]
	mov r5, ip
	ldrb r0, [r5, #2]
	strb r0, [r6]
	mov r1, sp
	ldrb r0, [r5, #4]
	mov r5, r8
	subs r0, r5, r0
	strh r0, [r1, #2]
	mov r1, ip
	ldrb r0, [r1, #5]
	subs r0, r3, r0
	strh r0, [r2, #2]
	mov r0, sp
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, #0
	bge _08006C9A
	rsbs r0, r0, #0
_08006C9A:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
_08006CA4:
	cmp r0, #0
	bge _08006CAA
	rsbs r0, r0, #0
_08006CAA:
	lsls r0, r0, #1
	ldr r1, [sp, #0x28]
	strh r0, [r1, #2]
	mov r2, sp
	ldrh r0, [r2, #6]
	rsbs r0, r0, #0
	mov r5, sb
	strh r0, [r5, #2]
	mov r1, ip
	ldrb r0, [r1, #4]
	strb r0, [r6, #1]
_08006CC0:
	str r3, [sp, #0x18]
	cmp r4, r3
	bhs _08006D9E
	mov r8, sb
	ldr r2, [sp, #0x24]
	mov ip, r2
_08006CCC:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	mov r5, ip
	ldrh r2, [r5]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _08006D3A
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_08006CF8:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08006D14
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _08006D30
_08006D14:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08006D1E
	subs r0, #1
	strb r0, [r6]
_08006D1E:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006D30
	ldrb r0, [r6]
	strb r0, [r7, #1]
_08006D30:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08006CF8
_08006D3A:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006D8C
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_08006D4A:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08006D70
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006D82
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _08006D82
_08006D70:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006D7A
	subs r0, #1
	strb r0, [r6, #1]
_08006D7A:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_08006D82:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006D4A
_08006D8C:
	ldr r2, _08006DB0 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _08006CCC
_08006D9E:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006DB0: .4byte gUnknown_03002A80

    @ Unused
    @ Very similar to sub_800724C
	thumb_func_start sub_8006DB4
sub_8006DB4: @ 0x08006DB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r1
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	add r6, sp, #4
	ldr r1, _08006E10 @ =gUnknown_080984F4
	adds r0, r6, #0
	movs r2, #4
	bl memcpy
	add r5, sp, #0xc
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl memset
	add r4, sp, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	ldr r1, _08006E14 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08006E2C
	ldr r1, _08006E18 @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006E20
	ldr r0, _08006E1C @ =gBgOffsetsHBlank
	ldr r0, [r0]
	adds r4, r0, #2
	b _08006E54
	.align 2, 0
_08006E10: .4byte gUnknown_080984F4
_08006E14: .4byte gFlags
_08006E18: .4byte gUnknown_03002A80
_08006E1C: .4byte gBgOffsetsHBlank
_08006E20:
	ldr r0, _08006E28 @ =gBgOffsetsHBlank
	ldr r4, [r0]
	b _08006E54
	.align 2, 0
_08006E28: .4byte gBgOffsetsHBlank
_08006E2C:
	ldr r1, _08006E44 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08006E48 @ =gBgOffsetsHBlank
	ldr r4, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006E54
	ldr r1, _08006E4C @ =gUnknown_03002878
	ldr r0, _08006E50 @ =0x04000042
	b _08006E58
	.align 2, 0
_08006E44: .4byte gUnknown_03002A80
_08006E48: .4byte gBgOffsetsHBlank
_08006E4C: .4byte gUnknown_03002878
_08006E50: .4byte 0x04000042
_08006E54:
	ldr r1, _08006F68 @ =gUnknown_03002878
	ldr r0, _08006F6C @ =0x04000040
_08006E58:
	str r0, [r1]
	mov r1, sl
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #1]
	adds r5, r2, #0
	adds r1, r0, #0
	cmp r0, r5
	bls _08006E6A
	adds r0, r2, #0
_08006E6A:
	adds r3, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp ip, r5
	bhs _08006E78
	adds r1, r2, #0
_08006E78:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, _08006F70 @ =gUnknown_03002A80
	ldrb r0, [r2]
	muls r0, r3, r0
	adds r4, r4, r0
	mov r2, sp
	mov r7, sl
	ldrb r0, [r7, #2]
	ldrb r1, [r7]
	subs r0, r0, r1
	strh r0, [r2]
	adds r7, r6, #0
	mov r1, sl
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #1]
	subs r0, r0, r1
	strh r0, [r7]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _08006EAA
	rsbs r0, r0, #0
_08006EAA:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0xc]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _08006EBA
	rsbs r0, r0, #0
_08006EBA:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0x10]
	mov r2, sp
	mov r1, sl
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	mov r2, sl
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #5]
	subs r0, r0, r1
	strh r0, [r7, #2]
	mov r0, sp
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08006EE2
	rsbs r0, r0, #0
_08006EE2:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0xe]
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bge _08006EF2
	rsbs r0, r0, #0
_08006EF2:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0x12]
	add r2, sp, #0x14
	mov r7, sl
	ldrb r0, [r7]
	strb r0, [r2]
	ldrb r0, [r7, #4]
	strb r0, [r2, #1]
	add r1, sp, #8
	ldrh r0, [r6]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	adds r6, r2, #0
	cmp r3, r8
	bne _08006F1A
	b _0800702C
_08006F1A:
	cmp r5, ip
	bhs _08006FB0
	cmp r3, r8
	blo _08006F24
	b _0800702C
_08006F24:
	adds r7, r6, #0
	adds r5, r1, #0
_08006F28:
	mov r0, sb
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldrh r2, [r5]
	adds r0, r0, r2
	strh r0, [r5]
	lsls r0, r0, #0x10
	adds r3, #1
	mov ip, r3
	cmp r0, #0
	blt _08006F98
	add r2, sp, #8
	add r3, sp, #0x10
_08006F48:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08006F74
	ldrb r0, [r7]
	cmp sb, r0
	ble _08006F5C
	adds r0, #1
	strb r0, [r6]
_08006F5C:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _08006F90
	.align 2, 0
_08006F68: .4byte gUnknown_03002878
_08006F6C: .4byte 0x04000040
_08006F70: .4byte gUnknown_03002A80
_08006F74:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08006F7E
	subs r0, #1
	strb r0, [r6]
_08006F7E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006F90
	ldrb r0, [r6]
	strb r0, [r4, #1]
_08006F90:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08006F48
_08006F98:
	ldr r2, _08006FAC @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08006F28
	b _0800702C
	.align 2, 0
_08006FAC: .4byte gUnknown_03002A80
_08006FB0:
	cmp r3, r8
	bhs _0800702C
	adds r7, r6, #0
	add r5, sp, #8
_08006FB8:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	ldrh r1, [r5, #2]
	mov r2, sp
	ldrh r0, [r2, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #2]
	lsls r1, r1, #0x10
	adds r3, #1
	mov ip, r3
	cmp r1, #0
	blt _0800701C
	add r2, sp, #8
	add r3, sp, #0x10
_08006FD8:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08007002
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _08006FEC
	adds r0, #1
	strb r0, [r6, #1]
_08006FEC:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007014
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _08007014
_08007002:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0800700C
	subs r0, #1
	strb r0, [r6, #1]
_0800700C:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_08007014:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006FD8
_0800701C:
	ldr r1, _08007090 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r4, r4, r0
	mov r2, ip
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08006FB8
_0800702C:
	mov r7, sl
	ldrb r0, [r7, #7]
	ldrb r1, [r7, #3]
	cmp r0, r1
	bls _08007038
	adds r0, r1, #0
_08007038:
	mov r8, r0
	cmp r3, r8
	bhs _08007118
	adds r7, r6, #0
	add r5, sp, #8
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x18]
_08007048:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	ldr r1, [sp, #0x18]
	ldrh r2, [r1]
	ldrh r0, [r5]
	adds r2, r2, r0
	strh r2, [r5]
	ldrh r1, [r1, #2]
	mov ip, r1
	ldrh r0, [r5, #2]
	add r0, ip
	strh r0, [r5, #2]
	lsls r2, r2, #0x10
	adds r3, #1
	mov ip, r3
	cmp r2, #0
	blt _080070B8
	add r2, sp, #8
	add r3, sp, #0x10
_08007072:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08007094
	ldrb r0, [r7]
	cmp sb, r0
	ble _08007086
	adds r0, #1
	strb r0, [r6]
_08007086:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _080070B0
	.align 2, 0
_08007090: .4byte gUnknown_03002A80
_08007094:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800709E
	subs r0, #1
	strb r0, [r6]
_0800709E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080070B0
	ldrb r0, [r6]
	strb r0, [r4, #1]
_080070B0:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08007072
_080070B8:
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007108
	add r2, sp, #8
	add r3, sp, #0x10
_080070C4:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _080070EE
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _080070D8
	adds r0, #1
	strb r0, [r6, #1]
_080070D8:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007100
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _08007100
_080070EE:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _080070F8
	subs r0, #1
	strb r0, [r6, #1]
_080070F8:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_08007100:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080070C4
_08007108:
	ldr r2, _08007188 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08007048
_08007118:
	mov r2, sl
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #3]
	adds r2, r1, #0
	adds r7, r0, #0
	cmp r0, r2
	bhs _08007128
	adds r0, r1, #0
_08007128:
	mov r8, r0
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	cmp r2, r0
	bhi _080071BC
	cmp r3, r8
	blo _08007138
	b _08007238
_08007138:
	adds r7, r6, #0
	add r5, sp, #8
_0800713C:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	ldrh r1, [r5, #2]
	mov r2, sp
	ldrh r0, [r2, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #2]
	lsls r1, r1, #0x10
	adds r3, #1
	mov ip, r3
	cmp r1, #0
	blt _080071A6
	add r2, sp, #8
	add r3, sp, #0x10
_0800715C:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800718C
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _08007170
	adds r0, #1
	strb r0, [r6, #1]
_08007170:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800719E
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _0800719E
	.align 2, 0
_08007188: .4byte gUnknown_03002A80
_0800718C:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _08007196
	subs r0, #1
	strb r0, [r6, #1]
_08007196:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_0800719E:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800715C
_080071A6:
	ldr r1, _080071B8 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r4, r4, r0
	mov r2, ip
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _0800713C
	b _08007238
	.align 2, 0
_080071B8: .4byte gUnknown_03002A80
_080071BC:
	cmp r3, r8
	bhs _08007238
	adds r7, r6, #0
	add r5, sp, #8
_080071C4:
	mov r0, sb
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldrh r2, [r5]
	adds r0, r0, r2
	strh r0, [r5]
	lsls r0, r0, #0x10
	adds r3, #1
	mov ip, r3
	cmp r0, #0
	blt _08007228
	add r2, sp, #8
	add r3, sp, #0x10
_080071E4:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08007202
	ldrb r0, [r7]
	cmp sb, r0
	ble _080071F8
	adds r0, #1
	strb r0, [r6]
_080071F8:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _08007220
_08007202:
	adds r1, r6, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800720E
	subs r0, #1
	strb r0, [r1]
_0800720E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007220
	ldrb r0, [r6]
	strb r0, [r4, #1]
_08007220:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080071E4
_08007228:
	ldr r2, _08007248 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _080071C4
_08007238:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007248: .4byte gUnknown_03002A80

.if 0
.endif
