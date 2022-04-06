.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_080971E8
sub_080971E8: @ 0x080971E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	movs r4, #0
	str r4, [sp]
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0
	bge _08097218
	ldr r0, [sp]
	mvns r0, r0
	str r0, [sp]
	rsbs r0, r4, #0
	adds r6, r0, #0
	rsbs r1, r5, #0
	cmp r0, #0
	beq _08097212
	subs r1, #1
_08097212:
	adds r7, r1, #0
	adds r5, r7, #0
	adds r4, r6, #0
_08097218:
	cmp r3, #0
	bge _08097234
	ldr r1, [sp]
	mvns r1, r1
	str r1, [sp]
	rsbs r0, r2, #0
	str r0, [sp, #4]
	rsbs r2, r3, #0
	cmp r0, #0
	beq _0809722E
	subs r2, #1
_0809722E:
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
_08097234:
	adds r7, r2, #0
	adds r6, r3, #0
	mov sl, r4
	mov r8, r5
	cmp r6, #0
	beq _08097242
	b _08097490
_08097242:
	cmp r7, r8
	bls _0809731C
	ldr r0, _08097258 @ =0x0000FFFF
	cmp r7, r0
	bhi _0809725C
	movs r1, #0
	cmp r7, #0xff
	bls _08097266
	movs r1, #8
	b _08097266
	.align 2, 0
_08097258: .4byte 0x0000FFFF
_0809725C:
	ldr r0, _08097310 @ =0x00FFFFFF
	movs r1, #0x18
	cmp r7, r0
	bhi _08097266
	movs r1, #0x10
_08097266:
	ldr r0, _08097314 @ =gUnknown_08C86F98
	lsrs r2, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	beq _0809728E
	lsls r7, r2
	mov r3, r8
	lsls r3, r2
	subs r1, r1, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
_0809728E:
	lsrs r0, r7, #0x10
	mov sb, r0
	ldr r1, _08097318 @ =0x0000FFFF
	ands r1, r7
	str r1, [sp, #0xc]
	mov r0, r8
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	mov r0, r8
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r3, [sp, #0xc]
	adds r2, r6, #0
	muls r2, r3, r2
	lsls r4, r4, #0x10
	mov r1, sl
	lsrs r0, r1, #0x10
	orrs r4, r0
	cmp r4, r2
	bhs _080972CE
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _080972CE
	cmp r4, r2
	bhs _080972CE
	subs r6, #1
	adds r4, r4, r7
_080972CE:
	subs r4, r4, r2
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r1, r0, #0
	ldr r3, [sp, #0xc]
	adds r2, r1, #0
	muls r2, r3, r2
	lsls r5, r5, #0x10
	ldr r0, _08097318 @ =0x0000FFFF
	mov r4, sl
	ands r4, r0
	orrs r5, r4
	cmp r5, r2
	bhs _08097306
	subs r1, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _08097306
	cmp r5, r2
	bhs _08097306
	subs r1, #1
_08097306:
	lsls r6, r6, #0x10
	orrs r6, r1
	movs r0, #0
	str r0, [sp, #0x10]
	b _080975E6
	.align 2, 0
_08097310: .4byte 0x00FFFFFF
_08097314: .4byte gUnknown_08C86F98
_08097318: .4byte 0x0000FFFF
_0809731C:
	cmp r2, #0
	bne _0809732A
	movs r0, #1
	movs r1, #0
	bl __udivsi3
	adds r7, r0, #0
_0809732A:
	adds r1, r7, #0
	ldr r0, _0809733C @ =0x0000FFFF
	cmp r7, r0
	bhi _08097340
	movs r2, #0
	cmp r7, #0xff
	bls _0809734A
	movs r2, #8
	b _0809734A
	.align 2, 0
_0809733C: .4byte 0x0000FFFF
_08097340:
	ldr r0, _08097368 @ =0x00FFFFFF
	movs r2, #0x18
	cmp r7, r0
	bhi _0809734A
	movs r2, #0x10
_0809734A:
	ldr r0, _0809736C @ =gUnknown_08C86F98
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r0, r2
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	bne _08097370
	mov r1, r8
	subs r1, r1, r7
	mov r8, r1
	movs r2, #1
	str r2, [sp, #0x10]
	b _0809740E
	.align 2, 0
_08097368: .4byte 0x00FFFFFF
_0809736C: .4byte gUnknown_08C86F98
_08097370:
	subs r1, r1, r2
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
	lsrs r0, r7, #0x10
	mov sb, r0
	ldr r1, _0809748C @ =0x0000FFFF
	ands r1, r7
	str r1, [sp, #0x14]
	adds r0, r5, #0
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r2, [sp, #0x14]
	adds r1, r6, #0
	muls r1, r2, r1
	lsls r4, r4, #0x10
	mov r3, r8
	lsrs r0, r3, #0x10
	orrs r4, r0
	cmp r4, r1
	bhs _080973CA
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _080973CA
	cmp r4, r1
	bhs _080973CA
	subs r6, #1
	adds r4, r4, r7
_080973CA:
	subs r4, r4, r1
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r2, r0, #0
	ldr r4, [sp, #0x14]
	adds r1, r2, #0
	muls r1, r4, r1
	lsls r5, r5, #0x10
	ldr r0, _0809748C @ =0x0000FFFF
	mov r3, r8
	ands r3, r0
	orrs r5, r3
	cmp r5, r1
	bhs _08097404
	subs r2, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _08097404
	cmp r5, r1
	bhs _08097404
	subs r2, #1
	adds r5, r5, r7
_08097404:
	lsls r6, r6, #0x10
	orrs r6, r2
	str r6, [sp, #0x10]
	subs r1, r5, r1
	mov r8, r1
_0809740E:
	lsrs r4, r7, #0x10
	mov sb, r4
	ldr r0, _0809748C @ =0x0000FFFF
	ands r0, r7
	str r0, [sp, #0x18]
	mov r0, r8
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	mov r0, r8
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r4, r4, #0x10
	mov r3, sl
	lsrs r0, r3, #0x10
	orrs r4, r0
	cmp r4, r2
	bhs _0809744E
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _0809744E
	cmp r4, r2
	bhs _0809744E
	subs r6, #1
	adds r4, r4, r7
_0809744E:
	subs r4, r4, r2
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r1, r0, #0
	ldr r4, [sp, #0x18]
	adds r2, r1, #0
	muls r2, r4, r2
	lsls r5, r5, #0x10
	ldr r0, _0809748C @ =0x0000FFFF
	mov r3, sl
	ands r3, r0
	orrs r5, r3
	cmp r5, r2
	bhs _08097486
	subs r1, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _08097486
	cmp r5, r2
	bhs _08097486
	subs r1, #1
_08097486:
	lsls r6, r6, #0x10
	orrs r6, r1
	b _080975E6
	.align 2, 0
_0809748C: .4byte 0x0000FFFF
_08097490:
	cmp r6, r8
	bls _0809749C
	movs r6, #0
	movs r4, #0
	str r4, [sp, #0x10]
	b _080975E6
_0809749C:
	adds r1, r6, #0
	ldr r0, _080974B0 @ =0x0000FFFF
	cmp r6, r0
	bhi _080974B4
	movs r2, #0
	cmp r6, #0xff
	bls _080974BE
	movs r2, #8
	b _080974BE
	.align 2, 0
_080974B0: .4byte 0x0000FFFF
_080974B4:
	ldr r0, _080974E0 @ =0x00FFFFFF
	movs r2, #0x18
	cmp r6, r0
	bhi _080974BE
	movs r2, #0x10
_080974BE:
	ldr r0, _080974E4 @ =gUnknown_08C86F98
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r0, r2
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	bne _080974EC
	cmp r8, r6
	bhi _080974D8
	cmp sl, r7
	blo _080974E8
_080974D8:
	movs r6, #1
	mov r1, sl
	b _080975E0
	.align 2, 0
_080974E0: .4byte 0x00FFFFFF
_080974E4: .4byte gUnknown_08C86F98
_080974E8:
	movs r6, #0
	b _080975E2
_080974EC:
	subs r1, r1, r2
	lsls r6, r2
	adds r0, r7, #0
	lsrs r0, r1
	orrs r6, r0
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
	lsrs r0, r6, #0x10
	mov sb, r0
	ldr r1, _08097618 @ =0x0000FFFF
	ands r1, r6
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sb
	bl __udivsi3
	adds r3, r0, #0
	ldr r2, [sp, #0x1c]
	adds r1, r3, #0
	muls r1, r2, r1
	lsls r4, r4, #0x10
	mov r2, r8
	lsrs r0, r2, #0x10
	orrs r4, r0
	cmp r4, r1
	bhs _0809754E
	subs r3, #1
	adds r4, r4, r6
	cmp r4, r6
	blo _0809754E
	cmp r4, r1
	bhs _0809754E
	subs r3, #1
	adds r4, r4, r6
_0809754E:
	subs r4, r4, r1
	adds r0, r4, #0
	mov r1, sb
	str r3, [sp, #0x30]
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r2, r0, #0
	ldr r4, [sp, #0x1c]
	adds r1, r2, #0
	muls r1, r4, r1
	lsls r5, r5, #0x10
	ldr r0, _08097618 @ =0x0000FFFF
	mov r4, r8
	ands r4, r0
	orrs r5, r4
	ldr r3, [sp, #0x30]
	cmp r5, r1
	bhs _0809758C
	subs r2, #1
	adds r5, r5, r6
	cmp r5, r6
	blo _0809758C
	cmp r5, r1
	bhs _0809758C
	subs r2, #1
	adds r5, r5, r6
_0809758C:
	lsls r6, r3, #0x10
	orrs r6, r2
	subs r1, r5, r1
	mov r8, r1
	ldr r0, _08097618 @ =0x0000FFFF
	mov sb, r0
	adds r1, r6, #0
	ands r1, r0
	lsrs r3, r6, #0x10
	adds r0, r7, #0
	mov r2, sb
	ands r0, r2
	lsrs r2, r7, #0x10
	adds r5, r1, #0
	muls r5, r0, r5
	adds r4, r1, #0
	muls r4, r2, r4
	adds r1, r3, #0
	muls r1, r0, r1
	muls r3, r2, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r1
	cmp r4, r1
	bhs _080975C4
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_080975C4:
	lsrs r0, r4, #0x10
	adds r3, r3, r0
	mov r1, sb
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r1, r0, r5
	cmp r3, r8
	bhi _080975DE
	cmp r3, r8
	bne _080975E2
	cmp r1, sl
	bls _080975E2
_080975DE:
	subs r6, #1
_080975E0:
	subs r0, r1, r7
_080975E2:
	movs r2, #0
	str r2, [sp, #0x10]
_080975E6:
	str r6, [sp, #0x20]
	ldr r3, [sp, #0x10]
	str r3, [sp, #0x24]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r4, [sp]
	cmp r4, #0
	beq _08097608
	rsbs r0, r1, #0
	str r0, [sp, #0x28]
	rsbs r1, r2, #0
	cmp r0, #0
	beq _08097602
	subs r1, #1
_08097602:
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
_08097608:
	adds r0, r1, #0
	adds r1, r2, #0
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08097618: .4byte 0x0000FFFF

	thumb_func_start __divsi3
__divsi3: @ 0x0809761C
	cmp r1, #0
	beq _080976A4
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _08097632
	rsbs r1, r1, #0
_08097632:
	cmp r0, #0
	bpl _08097638
	rsbs r0, r0, #0
_08097638:
	cmp r0, r1
	blo _08097696
	movs r4, #1
	lsls r4, r4, #0x1c
_08097640:
	cmp r1, r4
	bhs _0809764E
	cmp r1, r0
	bhs _0809764E
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _08097640
_0809764E:
	lsls r4, r4, #3
_08097650:
	cmp r1, r4
	bhs _0809765E
	cmp r1, r0
	bhs _0809765E
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _08097650
_0809765E:
	cmp r0, r1
	blo _08097666
	subs r0, r0, r1
	orrs r2, r3
_08097666:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08097672
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_08097672:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _0809767E
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_0809767E:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _0809768A
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_0809768A:
	cmp r0, #0
	beq _08097696
	lsrs r3, r3, #4
	beq _08097696
	lsrs r1, r1, #4
	b _0809765E
_08097696:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _080976A0
	rsbs r0, r0, #0
_080976A0:
	pop {r4}
	mov pc, lr
_080976A4:
	push {lr}
	bl sub_80976B0
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start sub_80976B0
sub_80976B0: @ 0x080976B0
	mov pc, lr
	.align 2, 0

	thumb_func_start __modsi3
__modsi3: @ 0x080976B4
	movs r3, #1
	cmp r1, #0
	beq _08097778
	bpl _080976BE
	rsbs r1, r1, #0
_080976BE:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _080976C8
	rsbs r0, r0, #0
_080976C8:
	cmp r0, r1
	blo _0809776C
	movs r4, #1
	lsls r4, r4, #0x1c
_080976D0:
	cmp r1, r4
	bhs _080976DE
	cmp r1, r0
	bhs _080976DE
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080976D0
_080976DE:
	lsls r4, r4, #3
_080976E0:
	cmp r1, r4
	bhs _080976EE
	cmp r1, r0
	bhs _080976EE
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080976E0
_080976EE:
	movs r2, #0
	cmp r0, r1
	blo _080976F6
	subs r0, r0, r1
_080976F6:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08097708
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08097708:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _0809771A
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0809771A:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _0809772C
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0809772C:
	mov ip, r3
	cmp r0, #0
	beq _0809773A
	lsrs r3, r3, #4
	beq _0809773A
	lsrs r1, r1, #4
	b _080976EE
_0809773A:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _0809776C
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _08097750
	lsrs r4, r1, #3
	adds r0, r0, r4
_08097750:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _0809775E
	lsrs r4, r1, #2
	adds r0, r0, r4
_0809775E:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _0809776C
	lsrs r4, r1, #1
	adds r0, r0, r4
_0809776C:
	pop {r4}
	cmp r4, #0
	bpl _08097774
	rsbs r0, r0, #0
_08097774:
	pop {r4}
	mov pc, lr
_08097778:
	push {lr}
	bl sub_80976B0
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start sub_08097784
sub_08097784: @ 0x08097784
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r3, [sp]
	ldr r0, _080977F0 @ =0x0000FFFF
	mov ip, r0
	adds r2, r3, #0
	ands r2, r0
	lsrs r3, r3, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, #0
	mov r4, ip
	ands r0, r4
	lsrs r1, r1, #0x10
	adds r5, r2, #0
	muls r5, r0, r5
	adds r4, r2, #0
	muls r4, r1, r4
	adds r2, r3, #0
	muls r2, r0, r2
	muls r3, r1, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r2
	cmp r4, r2
	bhs _080977C4
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_080977C4:
	lsrs r0, r4, #0x10
	adds r7, r3, r0
	mov r1, ip
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r6, r0, #0
	orrs r6, r5
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r3, [sp]
	ldr r4, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r5, [sp, #4]
	ldr r4, [sp, #8]
	adds r3, r5, #0
	muls r3, r4, r3
	adds r2, r2, r3
	adds r1, r7, r2
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080977F0: .4byte 0x0000FFFF

	thumb_func_start sub_080977F4
sub_080977F4: @ 0x080977F4
	push {r4, lr}
	rsbs r2, r0, #0
	adds r3, r2, #0
	rsbs r1, r1, #0
	cmp r2, #0
	beq _08097802
	subs r1, #1
_08097802:
	adds r4, r1, #0
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __udivsi3
__udivsi3: @ 0x0809780C
	cmp r1, #0
	beq _0809787A
	movs r3, #1
	movs r2, #0
	push {r4}
	cmp r0, r1
	blo _08097874
	movs r4, #1
	lsls r4, r4, #0x1c
_0809781E:
	cmp r1, r4
	bhs _0809782C
	cmp r1, r0
	bhs _0809782C
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _0809781E
_0809782C:
	lsls r4, r4, #3
_0809782E:
	cmp r1, r4
	bhs _0809783C
	cmp r1, r0
	bhs _0809783C
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0809782E
_0809783C:
	cmp r0, r1
	blo _08097844
	subs r0, r0, r1
	orrs r2, r3
_08097844:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08097850
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_08097850:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _0809785C
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_0809785C:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _08097868
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_08097868:
	cmp r0, #0
	beq _08097874
	lsrs r3, r3, #4
	beq _08097874
	lsrs r1, r1, #4
	b _0809783C
_08097874:
	adds r0, r2, #0
	pop {r4}
	mov pc, lr
_0809787A:
	push {lr}
	bl sub_80976B0
	movs r0, #0
	pop {pc}

	thumb_func_start __umodsi3
__umodsi3: @ 0x08097884
	cmp r1, #0
	beq _0809793A
	movs r3, #1
	cmp r0, r1
	bhs _08097890
	mov pc, lr
_08097890:
	push {r4}
	movs r4, #1
	lsls r4, r4, #0x1c
_08097896:
	cmp r1, r4
	bhs _080978A4
	cmp r1, r0
	bhs _080978A4
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _08097896
_080978A4:
	lsls r4, r4, #3
_080978A6:
	cmp r1, r4
	bhs _080978B4
	cmp r1, r0
	bhs _080978B4
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080978A6
_080978B4:
	movs r2, #0
	cmp r0, r1
	blo _080978BC
	subs r0, r0, r1
_080978BC:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080978CE
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080978CE:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080978E0
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080978E0:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080978F2
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080978F2:
	mov ip, r3
	cmp r0, #0
	beq _08097900
	lsrs r3, r3, #4
	beq _08097900
	lsrs r1, r1, #4
	b _080978B4
_08097900:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	bne _0809790C
	pop {r4}
	mov pc, lr
_0809790C:
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _0809791A
	lsrs r4, r1, #3
	adds r0, r0, r4
_0809791A:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _08097928
	lsrs r4, r1, #2
	adds r0, r0, r4
_08097928:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _08097936
	lsrs r4, r1, #1
	adds r0, r0, r4
_08097936:
	pop {r4}
	mov pc, lr
_0809793A:
	push {lr}
	bl sub_80976B0
	movs r0, #0
	pop {pc}

	thumb_func_start sub_08097944
sub_08097944: @ 0x08097944
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _08097984
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08097984
	adds r1, r5, #0
_0809795E:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _0809795E
	cmp r2, #3
	bls _08097982
_08097978:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _08097978
_08097982:
	adds r4, r1, #0
_08097984:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0809799E
	adds r1, r0, #0
_08097990:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _08097990
_0809799E:
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start sub_080979A4
sub_080979A4: @ 0x080979A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _080979EA
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _080979EA
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _080979DE
_080979CA:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080979CA
	b _080979DE
_080979DA:
	stm r1!, {r3}
	subs r2, #4
_080979DE:
	cmp r2, #3
	bhi _080979DA
	adds r3, r1, #0
	b _080979EA
_080979E6:
	strb r4, [r3]
	adds r3, #1
_080979EA:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080979E6
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0
	