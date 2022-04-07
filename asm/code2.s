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
