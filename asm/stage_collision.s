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
	b sub_801E4E4__return
_0801E554:
	movs r0, #7
	ands r0, r6
	adds r0, #0x11
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E574:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E592:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E5B4:
	movs r0, #7
	ands r0, r6
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E5D0:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E62C:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E64A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E668:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b sub_801E4E4__return
_0801E672:
	cmp r1, #0
	bne _0801E68C
	mov r1, r8
	cmp r1, #0
	ble _0801E684
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b sub_801E4E4__return
_0801E684:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b sub_801E4E4__return
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
	b sub_801E4E4__return
_0801E6A2:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b sub_801E4E4__return
_0801E6AC:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E6BE
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b sub_801E4E4__return
_0801E6BE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
sub_801E4E4__return:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
    
.if 0
.endif
