.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

@ sub_081569A0 in KATAM?
	thumb_func_start sub_800550C
sub_800550C: @ 0x0800550C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0          @ r8 = Sprite* 
	str r1, [sp, #8]    @ sp08 = p1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	ldr r2, [r0, #0xc]  @ r2 = SpriteOffset *dims ???
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0800552E
	b _08005888
_0800552E:
	mov sl, r2
	ldrh r1, [r2, #2]
	mov r0, r8
	adds r0, #0x24
	strb r1, [r0]
	mov r1, r8
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [sp]
	movs r4, #0x18
	ldrsh r0, [r1, r4]
	str r0, [sp, #4]
	ldr r3, [r1, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	cmp r0, #0
	beq _08005568
	ldr r2, _080055A8 @ =gUnknown_030017F4
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
	movs r4, #2
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
_08005568:
	mov r0, sl
	ldrh r0, [r0, #4]
	str r0, [sp, #0x10]
	mov r1, sl
	ldrh r1, [r1, #6]
	str r1, [sp, #0x14]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080055AC
	movs r0, #0x40
	ands r3, r0
	cmp r3, #0
	beq _080055F4
	ldr r2, [sp, #0x10]
	lsrs r1, r2, #1
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
	mov r4, sl
	ldrh r1, [r4, #6]
	lsrs r1, r1, #1
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	lsls r2, r2, #1
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x14]
	lsls r0, r0, #1
	str r0, [sp, #0x14]
	b _080055F4
	.align 2, 0
_080055A8: .4byte gUnknown_030017F4
_080055AC:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r3, r0
	cmp r3, #0
	beq _080055C2
	mov r2, sl
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #0x14]
	subs r1, r0, r1
	b _080055C8
_080055C2:
	mov r2, sl
	movs r4, #0xa
	ldrsh r1, [r2, r4]
_080055C8:
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080055E8
	mov r2, sl
	movs r4, #8
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #0x10]
	subs r1, r0, r1
	b _080055EE
_080055E8:
	mov r2, sl
	movs r4, #8
	ldrsh r1, [r2, r4]
_080055EE:
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
_080055F4:
	mov r0, r8
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp, #0x24]
	mov r4, r8
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #0x28]
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	cmp r0, #0
	bge _08005618
	b _08005888
_08005618:
	ldr r0, [sp]
	cmp r0, #0xf0
	ble _08005620
	b _08005888
_08005620:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x14]
	adds r0, r0, r2
	cmp r0, #0
	bge _0800562C
	b _08005888
_0800562C:
	ldr r0, [sp, #4]
	cmp r0, #0xa0
	ble _08005634
	b _08005888
_08005634:
	movs r4, #0
	str r4, [sp, #0x18]
	mov r0, sl
	ldrh r0, [r0, #2]
	cmp r4, r0
	blo _08005642
	b _08005888
_08005642:
	ldr r0, _080056FC @ =gUnknown_03002794
	ldr r1, [r0]
	mov r2, r8
	ldrh r0, [r2, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldrh r0, [r2, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r6, r0, #0
	ldr r0, _08005700 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r6
	bne _0800566E
	b _08005888
_0800566E:
	ldr r2, _08005704 @ =0x040000D4
	mov r0, sl
	ldrb r1, [r0, #1]
	ldr r0, [sp, #0x18]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	str r0, [r2]
	str r6, [r2, #4]
	ldr r0, _08005708 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrh r1, [r6, #2]
	ldr r2, _0800570C @ =0x000001FF
	adds r0, r2, #0
	adds r4, r0, #0
	ands r4, r1
	str r4, [sp, #0x1c]
	ldrh r0, [r6]
	ldrb r2, [r6]
	str r2, [sp, #0x20]
	movs r3, #0xfe
	lsls r3, r3, #8
	ands r3, r1
	movs r4, #0
	strh r3, [r6, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	strh r2, [r6]
	mov r0, r8
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	strh r0, [r6, #4]
	mov r0, r8
	ldr r5, [r0, #0x10]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08005710
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r2, r0
	orrs r2, r4
	strh r2, [r6]
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080056EA
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	orrs r2, r0
	strh r2, [r6]
_080056EA:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #9
	ldrh r1, [r6, #2]
	orrs r0, r1
	strh r0, [r6, #2]
	b _08005786
	.align 2, 0
_080056FC: .4byte gUnknown_03002794
_08005700: .4byte iwram_end
_08005704: .4byte 0x040000D4
_08005708: .4byte 0x80000003
_0800570C: .4byte 0x000001FF
_08005710:
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r2, #0
	ands r0, r1
	lsrs r4, r0, #0xc
	adds r0, r3, #0
	ands r0, r1
	lsrs r0, r0, #0xe
	orrs r4, r0
	lsrs r1, r5, #0xb
	movs r5, #1
	mov r2, sl
	ldrb r0, [r2]
	lsrs r0, r0, #1
	eors r0, r1
	ands r0, r5
	cmp r0, #0
	beq _08005754
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r0, #0
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r6, #2]
	ldr r0, _08005898 @ =gOamShapesSizes
	lsls r1, r4, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	ldr r1, [sp, #0x14]
	subs r0, r1, r0
	ldr r2, [sp, #0x20]
	subs r2, r0, r2
	str r2, [sp, #0x20]
_08005754:
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsrs r0, r0, #0xa
	ands r0, r5
	mov r1, sl
	ldrb r2, [r1]
	adds r1, r5, #0
	ands r1, r2
	cmp r0, r1
	beq _08005786
	ldrh r0, [r6, #2]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r6, #2]
	ldr r1, _08005898 @ =gOamShapesSizes
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r4, [sp, #0x10]
	subs r0, r4, r0
	ldr r1, [sp, #0x1c]
	subs r1, r0, r1
	str r1, [sp, #0x1c]
_08005786:
	mov r4, r8
	ldr r2, [r4, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r2, r0
	lsls r2, r2, #3
	ldrh r0, [r6]
	orrs r2, r0
	strh r2, [r6]
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r3, r0, #2
	ldrh r0, [r6, #4]
	orrs r3, r0
	strh r3, [r6, #4]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r6]
	ldr r0, [sp]
	ldr r4, [sp, #0x1c]
	adds r0, r0, r4
	ldr r4, _0800589C @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r6, #2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ands r2, r0
	cmp r2, #0
	beq _080057E0
	ldr r0, _080058A0 @ =0x000003FF
	adds r1, r0, #0
	adds r0, r3, #0
	ands r0, r1
	adds r0, r3, r0
	strh r0, [r6, #4]
_080057E0:
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r2, _080058A4 @ =0xF9FF0000
	adds r0, r0, r2
	lsrs r0, r0, #5
	ldrh r4, [r6, #4]
	adds r0, r0, r4
	strh r0, [r6, #4]
	movs r7, #0
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bhs _08005874
	ldr r1, _080058A8 @ =0x040000D4
	mov sb, r1
_080057FC:
	mov r2, r8
	ldrh r0, [r2, #0x1a]
	movs r4, #0xf8
	lsls r4, r4, #3
	adds r1, r4, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r5, r0, #0
	ldr r0, _080058AC @ =iwram_end
	ldr r0, [r0]
	cmp r0, r6
	beq _08005888
	mov r0, sb
	str r6, [r0]
	str r5, [r0, #4]
	ldr r0, _080058B0 @ =0x80000003
	mov r1, sb
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r4, [r5, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r4, r2
	strh r4, [r5, #2]
	ldrh r2, [r5]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r5]
	lsls r3, r7, #2
	ldr r0, [sp, #8]
	adds r3, r3, r0
	ldrh r0, [r3, #2]
	ldr r1, [sp, #0x28]
	adds r0, r0, r1
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r5]
	ldrh r0, [r3]
	ldr r2, [sp, #0x24]
	adds r0, r0, r2
	ldr r1, [sp, #0x1c]
	adds r0, r0, r1
	ldr r2, _0800589C @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	adds r4, r4, r0
	strh r4, [r5, #2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, [sp, #0xc]
	cmp r7, r4
	blo _080057FC
_08005874:
	ldr r0, [sp, #0x18]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	mov r1, sl
	ldrh r1, [r1, #2]
	cmp r0, r1
	bhs _08005888
	b _08005642
_08005888:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005898: .4byte gOamShapesSizes
_0800589C: .4byte 0x000001FF
_080058A0: .4byte 0x000003FF
_080058A4: .4byte 0xF9FF0000
_080058A8: .4byte 0x040000D4
_080058AC: .4byte iwram_end
_080058B0: .4byte 0x80000003
