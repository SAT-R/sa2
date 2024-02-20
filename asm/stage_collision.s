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
    
.if 0
.endif
