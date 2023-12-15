.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
@; Same parameters as sub_80064A8
	thumb_func_start sub_8006228
sub_8006228: @ 0x08006228
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18      @ r7 = param0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18      @ r6 = param1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2              @ sl = param2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3              @ r8 = param3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18      @ r4 = param4
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov ip, r5              @ ip = param5
	ldr r1, _08006278 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08006290
	ldr r1, _0800627C @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006284
	ldr r0, _08006280 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	adds r3, r0, #2
	b _080062B8
	.align 2, 0
_08006278: .4byte gFlags
_0800627C: .4byte gUnknown_03002A80
_08006280: .4byte gBgOffsetsHBlank
_08006284:
	ldr r0, _0800628C @ =gBgOffsetsHBlank
	ldr r3, [r0]
	b _080062B8
	.align 2, 0
_0800628C: .4byte gBgOffsetsHBlank
_08006290:
	ldr r1, _080062A8 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080062AC @ =gBgOffsetsHBlank
	ldr r3, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _080062B8
	ldr r1, _080062B0 @ =gUnknown_03002878
	ldr r0, _080062B4 @ =0x04000042
	b _080062BC
	.align 2, 0
_080062A8: .4byte gUnknown_03002A80
_080062AC: .4byte gBgOffsetsHBlank
_080062B0: .4byte gUnknown_03002878
_080062B4: .4byte 0x04000042
_080062B8:
	ldr r1, _08006320 @ =gUnknown_03002878
	ldr r0, _08006324 @ =0x04000040
_080062BC:
	str r0, [r1]
	mov r0, r8              @ r0 = r8 = param3
	subs r1, r0, r6         @ r1 = (param3 - param1)
	mov r2, sl              @ r2 = sl = param2
	subs r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10      @ r4 = 
	lsls r5, r1, #0x10
	asrs r2, r5, #0x10
	adds r0, r2, #0
	cmp r2, #0
	bge _080062D6
	rsbs r0, r2, #0
_080062D6:
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r4, r1, #0
	mov sb, r0
	cmp r1, #0
	bge _080062EA
	rsbs r4, r1, #0
_080062EA:
	lsls r0, r4, #0x11
	lsrs r7, r0, #0x10
	ldr r4, _08006328 @ =gUnknown_03002A80
	ldrb r0, [r4]
	mov r4, sl              @ r4 = sl = param2
	muls r4, r0, r4
	adds r0, r4, #0
	adds r3, r3, r0
	adds r4, r2, #0
	cmp r2, #0
	bge _08006302
	rsbs r4, r2, #0
_08006302:
	adds r0, r1, #0
	cmp r1, #0
	bge _0800630A
	rsbs r0, r1, #0
_0800630A:
	cmp r4, r0
	ble _080063DC
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _0800637C
	mov r0, ip
	strb r0, [r3, #1]
	movs r2, #0
	b _08006364
	.align 2, 0
_08006320: .4byte gUnknown_03002878
_08006324: .4byte 0x04000040
_08006328: .4byte gUnknown_03002A80
_0800632C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _0800635E
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r6, [r3]
	ldr r1, _08006378 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r3, r3, r0
	mov r0, ip
	strb r0, [r3, #1]
_0800635E:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006364:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _08006370
	rsbs r0, r0, #0
_08006370:
	cmp r2, r0
	blt _0800632C
	strb r6, [r3]
	b _08006496
	.align 2, 0
_08006378: .4byte gUnknown_03002A80
_0800637C:
	strb r6, [r3]
	adds r3, #1
	movs r2, #0
	b _080063C0
_08006384:
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _080063BA
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, ip
	strb r0, [r3]
	ldr r1, _080063D8 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	strb r6, [r3]
	adds r3, #1
_080063BA:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080063C0:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _080063CC
	rsbs r0, r0, #0
_080063CC:
	cmp r2, r0
	blt _08006384
	mov r2, ip
	strb r2, [r3]
	b _08006496
	.align 2, 0
_080063D8: .4byte gUnknown_03002A80
_080063DC:
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _08006440
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r7, r0, #0x10
	b _08006428
_080063F6:
	adds r2, r6, #1
	strb r2, [r3]
	adds r3, #1
	mov r0, ip
	strb r0, [r3]
	ldr r1, _0800643C @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08006422
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08006422:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006428:
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	mov r2, sb
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _08006436
	rsbs r0, r0, #0
_08006436:
	cmp r5, r0
	blt _080063F6
	b _08006496
	.align 2, 0
_0800643C: .4byte gUnknown_03002A80
_08006440:
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	b _08006484
_08006450:
	adds r0, r6, #1
	strb r0, [r3]
	adds r3, #1
	mov r0, ip
	strb r0, [r3]
	ldr r1, _080064A4 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0800647E
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0800647E:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006484:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _08006492
	rsbs r0, r0, #0
_08006492:
	cmp r2, r0
	blt _08006450
_08006496:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080064A4: .4byte gUnknown_03002A80
.endif

@; Same parameters as sub_8006228
	thumb_func_start sub_80064A8
sub_80064A8: @ 0x080064A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov ip, r5
	ldr r1, _080064F8 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08006510
	ldr r1, _080064FC @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006504
	ldr r0, _08006500 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	adds r3, r0, #2
	b _08006538
	.align 2, 0
_080064F8: .4byte gFlags
_080064FC: .4byte gUnknown_03002A80
_08006500: .4byte gBgOffsetsHBlank
_08006504:
	ldr r0, _0800650C @ =gBgOffsetsHBlank
	ldr r3, [r0]
	b _08006538
	.align 2, 0
_0800650C: .4byte gBgOffsetsHBlank
_08006510:
	ldr r1, _08006528 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0800652C @ =gBgOffsetsHBlank
	ldr r3, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006538
	ldr r1, _08006530 @ =gUnknown_03002878
	ldr r0, _08006534 @ =0x04000042
	b _0800653C
	.align 2, 0
_08006528: .4byte gUnknown_03002A80
_0800652C: .4byte gBgOffsetsHBlank
_08006530: .4byte gUnknown_03002878
_08006534: .4byte 0x04000042
_08006538:
	ldr r1, _080065A0 @ =gUnknown_03002878
	ldr r0, _080065A4 @ =0x04000040
_0800653C:
	str r0, [r1]
	mov r0, r8
	subs r1, r0, r6
	mov r2, sl
	subs r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r5, r1, #0x10
	asrs r2, r5, #0x10
	adds r0, r2, #0
	cmp r2, #0
	bge _08006556
	rsbs r0, r2, #0
_08006556:
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r4, r1, #0
	mov sb, r0
	cmp r1, #0
	bge _0800656A
	rsbs r4, r1, #0
_0800656A:
	lsls r0, r4, #0x11
	lsrs r7, r0, #0x10
	ldr r4, _080065A8 @ =gUnknown_03002A80
	ldrb r0, [r4]
	mov r4, sl
	muls r4, r0, r4
	adds r0, r4, #0
	adds r3, r3, r0
	adds r4, r2, #0
	cmp r2, #0
	bge _08006582
	rsbs r4, r2, #0
_08006582:
	adds r0, r1, #0
	cmp r1, #0
	bge _0800658A
	rsbs r0, r1, #0
_0800658A:
	cmp r4, r0
	ble _08006660
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _08006600
	strb r6, [r3, #1]
	movs r2, #0
	b _080065E4
	.align 2, 0
_080065A0: .4byte gUnknown_03002878
_080065A4: .4byte 0x04000040
_080065A8: .4byte gUnknown_03002A80
_080065AC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _080065DE
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, ip
	strb r0, [r3]
	ldr r1, _080065FC @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r3, r3, r0
	strb r6, [r3, #1]
_080065DE:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080065E4:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _080065F0
	rsbs r0, r0, #0
_080065F0:
	cmp r2, r0
	blt _080065AC
	mov r2, ip
	strb r2, [r3]
	b _08006718
	.align 2, 0
_080065FC: .4byte gUnknown_03002A80
_08006600:
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
	movs r2, #0
	b _08006646
_0800660A:
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _08006640
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r6, [r3]
	ldr r1, _0800665C @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
_08006640:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006646:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _08006652
	rsbs r0, r0, #0
_08006652:
	cmp r2, r0
	blt _0800660A
	strb r6, [r3]
	b _08006718
	.align 2, 0
_0800665C: .4byte gUnknown_03002A80
_08006660:
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _080066C4
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	b _080066AC
_0800667A:
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
	strb r6, [r3]
	ldr r1, _080066C0 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080066A6
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080066A6:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080066AC:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _080066BA
	rsbs r0, r0, #0
_080066BA:
	cmp r2, r0
	blt _0800667A
	b _08006718
	.align 2, 0
_080066C0: .4byte gUnknown_03002A80
_080066C4:
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	b _08006706
_080066D4:
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
	strb r6, [r3]
	ldr r1, _08006728 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08006700
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08006700:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006706:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _08006714
	rsbs r0, r0, #0
_08006714:
	cmp r2, r0
	blt _080066D4
_08006718:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006728: .4byte gUnknown_03002A80
