.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

@ s32 sub_801E4E4(s32, s32, u32, s32, void *, Func801F100);
	thumb_func_start sub_801E4E4
sub_801E4E4: @ 0x0801E4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r7, [sp, #0x28]
	cmp r7, #0
	bne _0801E500
	mov r7, sp
_0801E500:
	mov r4, sp
	adds r4, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E5DA
	mov r1, r8
	adds r0, r6, r1
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E59C
	mov r5, r8
	lsls r5, r5, #1
	adds r0, r6, r5
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E55C
	mov r0, r8
	cmp r0, #0
	ble _0801E554
	movs r0, #7
	ands r0, r6
	movs r1, #0x18
	subs r0, r1, r0
	b _0801E6C4
_0801E554:
	movs r0, #7
	ands r0, r6
	adds r0, #0x11
	b _0801E6C4
_0801E55C:
	cmp r1, #8
	bne _0801E57C
	ldrb r0, [r4]
	strb r0, [r7]
	mov r1, r8
	cmp r1, #0
	ble _0801E574
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0801E6C4
_0801E574:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0801E6C4
_0801E57C:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E592
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0801E6C4
_0801E592:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0801E6C4
_0801E59C:
	cmp r1, #8
	bne _0801E5BA
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0801E5B4
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0801E6C4
_0801E5B4:
	movs r0, #7
	ands r0, r6
	b _0801E6C4
_0801E5BA:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E5D0
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0801E6C4
_0801E5D0:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0801E6C4
_0801E5DA:
	cmp r1, #8
	bne _0801E6AC
	ldrb r0, [r4]
	strb r0, [r7]
	mov r0, r8
	rsbs r0, r0, #0
	str r0, [sp, #4]
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E672
	ldrb r0, [r4]
	strb r0, [r7]
	ldr r0, [sp, #4]
	mov r1, r8
	subs r0, r0, r1
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E634
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0801E62C
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x10
	b _0801E6C4
_0801E62C:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0801E6C4
_0801E634:
	cmp r1, #0
	bne _0801E652
	mov r0, r8
	cmp r0, #0
	ble _0801E64A
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801E6C4
_0801E64A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801E6C4
_0801E652:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E668
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0801E6C4
_0801E668:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801E6C4
_0801E672:
	cmp r1, #0
	bne _0801E68C
	mov r1, r8
	cmp r1, #0
	ble _0801E684
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0801E6C4
_0801E684:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0801E6C4
_0801E68C:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E6A2
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0801E6C4
_0801E6A2:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0801E6C4
_0801E6AC:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E6BE
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0801E6C4
_0801E6BE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0801E6C4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

@ s32 sub_801E6D4(s32, s32, s32, s32, void *, Func801F100);
	thumb_func_start sub_801E6D4
sub_801E6D4: @ 0x0801E6D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0801E6F2
	mov r1, sp
	str r1, [sp, #0x24]
_0801E6F2:
	mov r5, sp
	adds r5, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r4, [sp, #0x28]
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E70C
	b _0801E8E0
_0801E70C:
	mov r7, r8
	adds r0, r6, r7
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E722
	b _0801E89E
_0801E722:
	lsls r4, r7, #1
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E73A
	b _0801E85A
_0801E73A:
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E816
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E7D2
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E78E
	mov r0, r8
	cmp r0, #0
	ble _0801E786
	movs r0, #7
	ands r0, r6
	movs r1, #0x30
	subs r0, r1, r0
	b _0801EB34
_0801E786:
	movs r0, #7
	ands r0, r6
	adds r0, #0x29
	b _0801EB34
_0801E78E:
	cmp r1, #8
	bne _0801E7B0
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	cmp r2, #0
	ble _0801E7A8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x28
	b _0801EB34
_0801E7A8:
	movs r0, #7
	ands r0, r6
	adds r0, #0x20
	b _0801EB34
_0801E7B0:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	cmp r1, #0
	ble _0801E7C8
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x28
	b _0801EB34
_0801E7C8:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x28
	b _0801EB34
_0801E7D2:
	cmp r1, #8
	bne _0801E7F4
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	cmp r0, #0
	ble _0801E7EC
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x20
	b _0801EB34
_0801E7EC:
	movs r0, #7
	ands r0, r6
	adds r0, #0x18
	b _0801EB34
_0801E7F4:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E80C
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x20
	b _0801EB34
_0801E80C:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x20
	b _0801EB34
_0801E816:
	cmp r1, #8
	bne _0801E838
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E830
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x18
	b _0801EB34
_0801E830:
	movs r0, #7
	ands r0, r6
	adds r0, #0x10
	b _0801EB34
_0801E838:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E850
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x18
	b _0801EB34
_0801E850:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x18
	b _0801EB34
_0801E85A:
	cmp r1, #8
	bne _0801E87C
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E874
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0801EB34
_0801E874:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0801EB34
_0801E87C:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E894
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0801EB34
_0801E894:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0801EB34
_0801E89E:
	cmp r1, #8
	bne _0801E8BE
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E8B8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0801EB34
_0801E8B8:
	movs r0, #7
	ands r0, r6
	b _0801EB34
_0801E8BE:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E8D6
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0801EB34
_0801E8D6:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0801EB34
_0801E8E0:
	cmp r1, #8
	beq _0801E8E6
	b _0801EB1A
_0801E8E6:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	rsbs r4, r7, #0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E906
	b _0801EADE
_0801E906:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E924
	b _0801EAB8
_0801E924:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E944
	b _0801EA78
_0801E944:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801EA38
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E9F8
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E9B8
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E9B0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x28
	b _0801EB34
_0801E9B0:
	movs r0, #7
	ands r0, r6
	subs r0, #0x30
	b _0801EB34
_0801E9B8:
	cmp r1, #0
	bne _0801E9D6
	mov r0, r8
	cmp r0, #0
	ble _0801E9CE
	movs r0, #7
	ands r0, r6
	movs r1, #0x21
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801E9CE:
	movs r0, #7
	ands r0, r6
	subs r0, #0x28
	b _0801EB34
_0801E9D6:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E9EE
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x28
	b _0801EB34
_0801E9EE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x28
	b _0801EB34
_0801E9F8:
	cmp r1, #0
	bne _0801EA16
	mov r4, r8
	cmp r4, #0
	ble _0801EA0E
	movs r0, #7
	ands r0, r6
	movs r1, #0x19
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA0E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x20
	b _0801EB34
_0801EA16:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EA2E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x20
	b _0801EB34
_0801EA2E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x20
	b _0801EB34
_0801EA38:
	cmp r1, #0
	bne _0801EA56
	mov r0, r8
	cmp r0, #0
	ble _0801EA4E
	movs r0, #7
	ands r0, r6
	movs r1, #0x11
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA4E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0801EB34
_0801EA56:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801EA6E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x18
	b _0801EB34
_0801EA6E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x18
	b _0801EB34
_0801EA78:
	cmp r1, #0
	bne _0801EA96
	mov r4, r8
	cmp r4, #0
	ble _0801EA8E
_0801EA82:
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA8E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801EB34
_0801EA96:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EAAE
_0801EAA0:
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0801EB34
_0801EAAE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801EB34
_0801EAB8:
	cmp r1, #0
	bne _0801EACA
	mov r0, r8
	cmp r0, #0
	bgt _0801EA82
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801EB34
_0801EACA:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	bgt _0801EAA0
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801EB34
_0801EADE:
	cmp r1, #0
	bne _0801EAF8
	mov r4, r8
	cmp r4, #0
	ble _0801EAF0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0801EB34
_0801EAF0:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0801EB34
_0801EAF8:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EB10
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0801EB34
_0801EB10:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0801EB34
_0801EB1A:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801EB2E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0801EB34
_0801EB2E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0801EB34:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801EB44
sub_801EB44: @ 0x0801EB44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	blt _0801EB6C
	ldr r0, _0801EB68 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0801EB6E
	adds r0, r1, #0
	b _0801EB6E
	.align 2, 0
_0801EB68: .4byte gUnknown_030059C8
_0801EB6C:
	movs r0, #0
_0801EB6E:
	adds r3, r0, #0
	cmp r4, #0
	blt _0801EB8C
	ldr r0, _0801EB88 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r4, #0
	cmp r1, r0
	bls _0801EB8E
	adds r1, r0, #0
	b _0801EB8E
	.align 2, 0
_0801EB88: .4byte gUnknown_030059C8
_0801EB8C:
	movs r1, #0
_0801EB8E:
	adds r4, r1, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r3, #0
	bl sub_801EF94
	adds r5, r0, #0
	ldr r3, _0801EC24 @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0801EBB6
	subs r2, r6, r2
_0801EBB6:
	ldr r0, _0801EC28 @ =gUnknown_030059C8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r0, #0xf
	ands r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0801EBD8
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r2, r0
_0801EBD8:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0801EBE2
	movs r2, #8
_0801EBE2:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0801EC04
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EC04
	movs r2, #0
_0801EC04:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0801EC30
	cmp r2, #8
	beq _0801EC2C
	cmp r2, #0
	beq _0801EC2C
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0801EC2E
	subs r0, #0x10
	b _0801EC2E
	.align 2, 0
_0801EC24: .4byte 0x000003FF
_0801EC28: .4byte gUnknown_030059C8
_0801EC2C:
	adds r0, r2, #0
_0801EC2E:
	adds r2, r0, #0
_0801EC30:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801EC3C
sub_801EC3C: @ 0x0801EC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r4, #0
	blt _0801EC64
	ldr r0, _0801EC60 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801EC66
	adds r0, r1, #0
	b _0801EC66
	.align 2, 0
_0801EC60: .4byte gUnknown_030059C8
_0801EC64:
	movs r0, #0
_0801EC66:
	adds r4, r0, #0
	cmp r3, #0
	blt _0801EC84
	ldr r0, _0801EC80 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0801EC86
	adds r0, r1, #0
	b _0801EC86
	.align 2, 0
_0801EC80: .4byte gUnknown_030059C8
_0801EC84:
	movs r0, #0
_0801EC86:
	adds r3, r0, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_801EF94
	adds r5, r0, #0
	ldr r3, _0801ED0C @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0801ECB0
	subs r2, r6, r2
_0801ECB0:
	ldr r0, _0801ED10 @ =gUnknown_030059C8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	asrs r2, r2, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0801ECCC
	movs r2, #8
_0801ECCC:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0801ECEE
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801ECEE
	movs r2, #0
_0801ECEE:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0801ED18
	cmp r2, #8
	beq _0801ED14
	cmp r2, #0
	beq _0801ED14
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0801ED16
	subs r0, #0x10
	b _0801ED16
	.align 2, 0
_0801ED0C: .4byte 0x000003FF
_0801ED10: .4byte gUnknown_030059C8
_0801ED14:
	adds r0, r2, #0
_0801ED16:
	adds r2, r0, #0
_0801ED18:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801ED24
sub_801ED24: @ 0x0801ED24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r4, #0
	blt _0801ED50
	ldr r0, _0801ED4C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801ED52
	adds r0, r1, #0
	b _0801ED52
	.align 2, 0
_0801ED4C: .4byte gUnknown_030059C8
_0801ED50:
	movs r0, #0
_0801ED52:
	adds r4, r0, #0
	cmp r5, #0
	blt _0801ED70
	ldr r0, _0801ED6C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r5, #0
	cmp r1, r0
	bls _0801ED72
	adds r1, r0, #0
	b _0801ED72
	.align 2, 0
_0801ED6C: .4byte gUnknown_030059C8
_0801ED70:
	movs r1, #0
_0801ED72:
	adds r5, r1, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r4, #0
	bl sub_801EF94
	adds r4, r0, #0
	ldr r6, _0801EE0C @ =0x000003FF
	ands r6, r4
	movs r7, #7
	adds r3, r7, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801ED9A
	subs r3, r7, r3
_0801ED9A:
	ldr r2, _0801EE10 @ =gUnknown_030059C8
	ldr r5, [r2]
	lsls r0, r6, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r0, #0xf
	ands r3, r0
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0801EDBC
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r3, r0
_0801EDBC:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0801EDC6
	movs r3, #8
_0801EDC6:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EDEC
	lsrs r0, r6, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r7
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0801EDEC
	movs r3, #0
_0801EDEC:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EE18
	cmp r3, #8
	beq _0801EE14
	cmp r3, #0
	beq _0801EE14
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0801EE16
	subs r0, #0x10
	b _0801EE16
	.align 2, 0
_0801EE0C: .4byte 0x000003FF
_0801EE10: .4byte gUnknown_030059C8
_0801EE14:
	adds r0, r3, #0
_0801EE16:
	adds r3, r0, #0
_0801EE18:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EE34
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0801EE34:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EE4E
	cmp r3, #0
	beq _0801EE4A
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0801EE4C
_0801EE4A:
	adds r0, r2, #0
_0801EE4C:
	adds r2, r0, #0
_0801EE4E:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

@ Function prototype: Func801F100
	thumb_func_start sub_801EE64
sub_801EE64: @ 0x0801EE64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r5, #0
	blt _0801EE90
	ldr r0, _0801EE8C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r5, #0
	cmp r0, r1
	bls _0801EE92
	adds r0, r1, #0
	b _0801EE92
	.align 2, 0
_0801EE8C: .4byte gUnknown_030059C8
_0801EE90:
	movs r0, #0
_0801EE92:
	adds r5, r0, #0
	cmp r4, #0
	blt _0801EEB0
	ldr r0, _0801EEAC @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801EEB2
	adds r0, r1, #0
	b _0801EEB2
	.align 2, 0
_0801EEAC: .4byte gUnknown_030059C8
_0801EEB0:
	movs r0, #0
_0801EEB2:
	adds r4, r0, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_801EF94
	adds r4, r0, #0
	ldr r7, _0801EF3C @ =0x000003FF
	ands r7, r4
	movs r6, #7
	adds r3, r6, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EEDC
	subs r3, r6, r3
_0801EEDC:
	ldr r2, _0801EF40 @ =gUnknown_030059C8
	ldr r5, [r2]
	lsls r0, r7, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	asrs r3, r3, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0801EEF8
	movs r3, #8
_0801EEF8:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EF1E
	lsrs r0, r7, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r6
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0801EF1E
	movs r3, #0
_0801EF1E:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EF48
	cmp r3, #8
	beq _0801EF44
	cmp r3, #0
	beq _0801EF44
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0801EF46
	subs r0, #0x10
	b _0801EF46
	.align 2, 0
_0801EF3C: .4byte 0x000003FF
_0801EF40: .4byte gUnknown_030059C8
_0801EF44:
	adds r0, r3, #0
_0801EF46:
	adds r3, r0, #0
_0801EF48:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r7
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EF60
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0801EF60:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EF7E
	cmp r3, #0
	beq _0801EF7A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0801EF7C
_0801EF7A:
	adds r0, r2, #0
_0801EF7C:
	adds r2, r0, #0
_0801EF7E:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801EF94
sub_801EF94: @ 0x0801EF94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	mov sb, r2
	asrs r4, r0, #3
	ldr r5, _0801EFB0 @ =IWRAM_START + 0x410
	ldr r0, [r5]
	cmp r0, r4
	bne _0801EFB4
	ldr r7, [r5, #8]
	ldr r0, [r5, #4]
	b _0801EFCC
	.align 2, 0
_0801EFB0: .4byte IWRAM_START + 0x410
_0801EFB4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	str r4, [r5]
	str r0, [r5, #4]
	str r1, [r5, #8]
	adds r7, r1, #0
_0801EFCC:
	mov r8, r0
	asrs r4, r6, #3
	ldr r6, _0801EFE0 @ =IWRAM_START + 0x420
	ldr r0, [r6]
	cmp r0, r4
	bne _0801EFE4
	ldr r5, [r6, #8]
	ldr r3, [r6, #4]
	b _0801EFFE
	.align 2, 0
_0801EFE0: .4byte IWRAM_START + 0x420
_0801EFE4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	adds r3, r0, #0
	str r4, [r6]
	str r3, [r6, #4]
	str r1, [r6, #8]
	adds r5, r1, #0
_0801EFFE:
	ldr r0, _0801F040 @ =gUnknown_030059C8
	ldr r4, [r0]
	mov r1, sb
	lsls r0, r1, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r1, r1, r0
	ldrh r0, [r4, #0x18]
	muls r0, r3, r0
	add r0, r8
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r1, r5, #3
	lsls r0, r5, #2
	adds r1, r1, r0
	adds r1, r1, r7
	lsls r3, r2, #8
	lsls r2, r2, #5
	lsls r1, r1, #1
	ldr r0, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F040: .4byte gUnknown_030059C8

@ Once decompiling these, make
@ (IWRAM_START + 0x410) and (IWRAM_START + 0x420) static u16[3]
@ and add to top of sym_iwram.txt
	thumb_func_start sub_801F044
sub_801F044: @ 0x0801F044
	sub sp, #4
	movs r3, #0
	str r3, [sp]
	ldr r0, _0801F06C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _0801F070 @ =IWRAM_START + 0x410
	str r1, [r0, #4]
	ldr r2, _0801F074 @ =0x85000003
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _0801F078 @ =IWRAM_START + 0x420
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0801F06C: .4byte 0x040000D4
_0801F070: .4byte IWRAM_START + 0x410
_0801F074: .4byte 0x85000003
_0801F078: .4byte IWRAM_START + 0x420

.if 0
@; s32 sub_801F07C(s32, s32, s32, s32, void *, func);
	thumb_func_start sub_801F07C
sub_801F07C: @ 0x0801F07C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4              @ sp00 = array
	adds r5, r0, #0         @ r5 = r0 = p0
	mov r8, r3              @ r8 = p3
	ldr r6, [sp, #0x1c]     @ r6 = data
	cmp r6, #0
	bne _0801F090
	mov r6, sp              @ r6 = data = &array
_0801F090:
	mov r4, sp
	adds r4, #1
	adds r0, r5, #0
	adds r3, r4, #0
	ldr r7, [sp, #0x20]     @ r7 = func
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801F0BC
	mov r0, r8
	cmp r0, #0
	ble _0801F0B4
	movs r0, #7
	ands r0, r5
	movs r1, #8
	subs r0, r1, r0
	b sub_801F07C_return
_0801F0B4:
	movs r0, #7
	ands r0, r5
	adds r0, #1
	b sub_801F07C_return
_0801F0BC:
	cmp r1, #8
	bne _0801F0DA
	ldrb r0, [r4]
	strb r0, [r6]
	mov r7, r8               @ r7 = r8 = p3
	cmp r7, #0
	ble _0801F0D2
	movs r0, #7
	ands r0, r5
	mvns r0, r0
	b sub_801F07C_return
_0801F0D2:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r5
	b sub_801F07C_return
_0801F0DA:
	ldrb r0, [r4]
	strb r0, [r6]
	cmp r1, #0
	ble _0801F0EC
	subs r1, #1
	movs r0, #7
	ands r0, r5
	subs r0, r1, r0
	b sub_801F07C_return
_0801F0EC:
	movs r0, #7
	ands r0, r5
	adds r0, r1, r0
sub_801F07C_return:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
    
.endif
