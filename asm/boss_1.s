.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

   .global gUnknown_080D7A18
gUnknown_080D7A18:
    .incbin "baserom.gba", 0x000D7A18, 0x10

    .global gUnknown_080D7A28
gUnknown_080D7A28:
    .incbin "baserom.gba", 0x000D7A28, 0x10

    .global gUnknown_080D7A38
gUnknown_080D7A38:
    .incbin "baserom.gba", 0x000D7A38, 0x20

    .global gUnknown_080D7A58
gUnknown_080D7A58:
    .incbin "baserom.gba", 0x000D7A58, 0x20

    .global gUnknown_080D7A78
gUnknown_080D7A78:
    .incbin "baserom.gba", 0x000D7A78, 0x20

    .global gUnknown_080D7A98
gUnknown_080D7A98:
    .incbin "baserom.gba", 0x000D7A98, 0xA

    .global gUnknown_080D7AA2
gUnknown_080D7AA2:
    .incbin "baserom.gba", 0x000D7AA2, 0x6

    .global gUnknown_080D7AA8
gUnknown_080D7AA8:
    .4byte sub_803CAC8, sub_803B018

    .global gUnknown_080D7AB0
gUnknown_080D7AB0:
    .4byte sub_803B17C, sub_803B264, sub_803CB84, sub_803B2F8
    .4byte sub_803CBA4, sub_803B4A0, sub_803B57C, sub_803B62C

    .global gUnknown_080D7AD0
gUnknown_080D7AD0:
    .incbin "baserom.gba", 0x000D7AD0, 0x40

.text
.syntax unified
.arm

	thumb_func_start sub_803B4A0
sub_803B4A0: @ 0x0803B4A0
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x94
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	mov r5, ip
	adds r5, #0x74
	ldr r6, _0803B504 @ =gUnknown_080D7A78
_0803B4BA:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B4BA
	movs r4, #0
	movs r3, #1
	mov r1, ip
	adds r1, #0xa4
	ldr r0, [r1]
	ands r0, r3
	mov r5, ip
	adds r5, #0xac
	cmp r0, #0
	beq _0803B50C
	ldr r0, _0803B508 @ =gUnknown_080D7A98
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0803B52A
	.align 2, 0
_0803B504: .4byte gUnknown_080D7A78
_0803B508: .4byte gUnknown_080D7A98
_0803B50C:
	lsls r3, r3, #1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B52C
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _0803B50C
	ldr r0, _0803B574 @ =gUnknown_080D7A98
	lsls r1, r4, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
_0803B52A:
	lsls r3, r0, #1
_0803B52C:
	ldr r0, [r5]
	cmp r0, #0x39
	bhi _0803B558
	movs r4, #0
	mov r6, ip
	adds r6, #0x54
	ldr r7, _0803B578 @ =gUnknown_080D7A58
_0803B53A:
	lsls r1, r4, #2
	adds r2, r6, r1
	ldr r0, [r2]
	subs r0, r0, r3
	str r0, [r2]
	adds r1, r1, r7
	ldr r1, [r1]
	cmp r0, r1
	bge _0803B54E
	str r1, [r2]
_0803B54E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B53A
_0803B558:
	ldr r0, [r5]
	subs r2, r0, #1
	str r2, [r5]
	cmp r2, #0
	bne _0803B56C
	movs r0, #0x50
	str r0, [r5]
	mov r0, ip
	adds r0, #0xa0
	str r2, [r0]
_0803B56C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B574: .4byte gUnknown_080D7A98
_0803B578: .4byte gUnknown_080D7A58

	thumb_func_start sub_803B57C
sub_803B57C: @ 0x0803B57C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	movs r1, #0
	movs r5, #1
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0803B5A0
	ldr r0, _0803B59C @ =gUnknown_080D7A98
	ldrh r0, [r0]
	b _0803B5BC
	.align 2, 0
_0803B59C: .4byte gUnknown_080D7A98
_0803B5A0:
	lsls r5, r5, #1
	adds r1, #1
	cmp r1, #4
	bgt _0803B5C0
	mov r0, ip
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0803B5A0
	ldr r0, _0803B624 @ =gUnknown_080D7A98
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_0803B5BC:
	lsls r0, r0, #0x10
	asrs r5, r0, #0x12
_0803B5C0:
	adds r4, r5, #0
	mov r7, ip
	adds r7, #0xac
	mov sb, r7
	movs r0, #0xa0
	add r0, ip
	mov r8, r0
	mov r3, ip
	adds r3, #0x54
	ldr r6, _0803B628 @ =gUnknown_080D7A58
	movs r2, #5
	mov sl, r2
	movs r1, #7
_0803B5DA:
	adds r4, r4, r5
	ldr r0, [r3]
	subs r0, r0, r4
	str r0, [r3]
	ldr r2, [r6]
	cmp r0, r2
	bge _0803B5F6
	str r2, [r3]
	movs r0, #0x44
	mov r2, sb
	str r0, [r2]
	mov r0, sl
	mov r2, r8
	str r0, [r2]
_0803B5F6:
	adds r3, #4
	adds r6, #4
	subs r1, #1
	cmp r1, #0
	bge _0803B5DA
	ldr r0, [r7]
	subs r0, #1
	str r0, [r7]
	cmp r0, #0
	bne _0803B616
	movs r0, #0x44
	str r0, [r7]
	mov r1, ip
	adds r1, #0xa0
	movs r0, #5
	str r0, [r1]
_0803B616:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B624: .4byte gUnknown_080D7A98
_0803B628: .4byte gUnknown_080D7A58

	thumb_func_start sub_803B62C
sub_803B62C: @ 0x0803B62C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	mov r1, ip
	adds r1, #0x94
	ldr r0, [r1]
	adds r0, #0xc
	str r0, [r1]
	mov r3, ip
	adds r3, #0xac
	ldr r0, [r3]
	movs r2, #0xc0
	lsls r2, r2, #2
	cmp r0, r2
	bls _0803B64E
	str r2, [r1]
_0803B64E:
	ldr r0, [r1]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	adds r6, r3, #0
	mov r5, ip
	adds r5, #0x74
	ldr r7, _0803B6A8 @ =gUnknown_080D7A78
	mov r8, r7
_0803B660:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, r8
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B660
	ldr r0, [r6]
	subs r1, r0, #1
	str r1, [r6]
	cmp r1, #0
	bne _0803B69E
	movs r0, #0x50
	str r0, [r6]
	mov r0, ip
	adds r0, #0xa0
	str r1, [r0]
_0803B69E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B6A8: .4byte gUnknown_080D7A78

	thumb_func_start sub_803B6AC
sub_803B6AC: @ 0x0803B6AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0xb0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B77C
	subs r0, #1
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B6D2
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0803B6D8
_0803B6D2:
	movs r0, #0xeb
	bl m4aSongNumStart
_0803B6D8:
	adds r1, r6, #0
	adds r1, #0xb1
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #0xde
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B764
	ldr r0, _0803B74C @ =0x00000275
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0803B750 @ =gLevelScore
	ldr r5, [r1]
	adds r2, #0x50
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0803B754 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _0803B774
	ldr r0, _0803B758 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B774
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _0803B75C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0803B742
	movs r0, #0xff
_0803B742:
	strb r0, [r1]
	ldr r1, _0803B760 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0803B774
	.align 2, 0
_0803B74C: .4byte 0x00000275
_0803B750: .4byte gLevelScore
_0803B754: .4byte 0x0000C350
_0803B758: .4byte gGameMode
_0803B75C: .4byte gNumLives
_0803B760: .4byte gUnknown_030054A8
_0803B764:
	ldr r0, _0803B7A4 @ =0x00000275
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
_0803B774:
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0803B77C:
	ldr r0, _0803B7A8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _0803B798
	adds r0, r6, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #4
	bne _0803B798
	ldr r1, _0803B7AC @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_0803B798:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B7A4: .4byte 0x00000275
_0803B7A8: .4byte gCurrentLevel
_0803B7AC: .4byte gUnknown_030054A8

	thumb_func_start sub_803B7B0
sub_803B7B0: @ 0x0803B7B0
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xde
	lsls r0, r0, #2
	adds r4, r3, r0
	adds r1, r3, #0
	adds r1, #0xb1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B810
	adds r2, r3, #0
	adds r2, #0xb2
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B83E
	adds r0, r3, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B7F4
	ldr r0, _0803B7F0 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _0803B800
	.align 2, 0
_0803B7F0: .4byte 0x00000275
_0803B7F4:
	movs r0, #0
	ldr r1, _0803B80C @ =0x00000275
	strh r1, [r4, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r3, r2
_0803B800:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _0803B83C
	.align 2, 0
_0803B80C: .4byte 0x00000275
_0803B810:
	adds r1, r3, #0
	adds r1, #0xb2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B83E
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B83E
	movs r1, #0
	ldr r0, _0803B844 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r4, #0xe6
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0803B848 @ =0x00000399
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_0803B83C:
	strb r0, [r1]
_0803B83E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B844: .4byte 0x00000275
_0803B848: .4byte 0x00000399

	thumb_func_start sub_803B84C
sub_803B84C: @ 0x0803B84C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov sb, r0
	mov r7, sb
	adds r7, #0xb4
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _0803B868
	movs r0, #0
	str r0, [r7, #0x14]
_0803B868:
	ldr r2, [r7, #0x18]
	adds r2, #0x40
	str r2, [r7, #0x18]
	ldr r1, [r7, #0xc]
	ldr r0, [r7, #0x14]
	adds r1, r1, r0
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	adds r0, r0, r2
	str r0, [r7, #0x10]
	asrs r0, r0, #8
	adds r0, #0x1c
	asrs r1, r1, #8
	ldr r2, _0803B94C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	movs r0, #0xb7
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B954
	movs r1, #0x9e
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	ldr r6, _0803B950 @ =0xFFFFEA00
	adds r0, r0, r6
	str r0, [r1]
	movs r2, #0x9f
	lsls r2, r2, #2
	add r2, sb
	movs r0, #0x98
	add r0, sb
	mov r8, r0
	ldr r0, [r7, #0x10]
	mov r3, r8
	ldr r1, [r3]
	adds r0, r0, r1
	movs r3, #0xe8
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xa4
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	movs r4, #0xc0
	lsls r4, r4, #5
	adds r0, r0, r4
	str r0, [r1]
	movs r2, #0xa5
	lsls r2, r2, #2
	add r2, sb
	mov r5, sb
	adds r5, #0x9c
	ldr r0, [r7, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xaa
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	adds r0, r0, r6
	str r0, [r1]
	movs r2, #0xab
	lsls r2, r2, #2
	add r2, sb
	ldr r0, [r7, #0x10]
	mov r6, r8
	ldr r1, [r6]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xb0
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	adds r0, r0, r4
	str r0, [r1]
	movs r2, #0xb1
	lsls r2, r2, #2
	add r2, sb
	ldr r0, [r7, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	str r1, [sp, #0x30]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x28]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x2c]
	movs r5, #0x84
	lsls r5, r5, #1
	add r5, sb
	str r5, [sp, #0x38]
	b _0803BA42
	.align 2, 0
_0803B94C: .4byte sub_801EC3C
_0803B950: .4byte 0xFFFFEA00
_0803B954:
	movs r6, #0
	mov sl, r6
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	str r1, [sp, #0x30]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x28]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x2c]
	movs r5, #0x84
	lsls r5, r5, #1
	add r5, sb
	str r5, [sp, #0x38]
_0803B97C:
	mov r6, sl
	lsls r0, r6, #1
	add r0, sl
	lsls r6, r0, #3
	movs r1, #0xe6
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r1, r0, r6
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	cmp r0, #0x7f
	bgt _0803B99A
	movs r0, #0x80
	str r0, [r1]
_0803B99A:
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r5, r0, r6
	ldr r0, [r5]
	adds r0, #0x28
	str r0, [r5]
	movs r3, #0xe2
	lsls r3, r3, #1
	adds r2, r7, r3
	adds r2, r2, r6
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r4, r0, r6
	ldr r0, [r4]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r2, _0803BA60 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r1, r0, #0
	cmp r1, #0
	bge _0803BA0C
	movs r2, #0xea
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r2, r0, r6
	ldr r0, [r2]
	cmp r0, #0
	beq _0803B9F2
	subs r0, #1
	str r0, [r2]
_0803B9F2:
	lsls r1, r1, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	asrs r0, r0, #8
	str r0, [r5]
_0803BA0C:
	mov r3, sl
	lsls r0, r3, #1
	add r0, sl
	lsls r1, r0, #3
	movs r5, #0xea
	lsls r5, r5, #1
	adds r0, r7, r5
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BA34
	movs r6, #0xec
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BA34
	subs r0, #1
	str r0, [r1]
_0803BA34:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #3
	bls _0803B97C
_0803BA42:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BA94
	movs r2, #0x8a
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803BA64
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r7, #0x18]
	rsbs r0, r0, #0
	b _0803BA7A
	.align 2, 0
_0803BA60: .4byte sub_801EC3C
_0803BA64:
	ldr r0, [r7, #0x14]
	subs r0, #0x20
	str r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #3
	rsbs r0, r0, #0
	asrs r0, r0, #8
_0803BA7A:
	str r0, [r7, #0x18]
	ldr r1, [r7, #0x18]
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0803BA8A
	movs r0, #0
	str r0, [r7, #0x18]
_0803BA8A:
	ldr r3, [sp, #0x24]
	lsls r1, r3, #8
	ldr r0, [r7, #0x10]
	adds r0, r0, r1
	str r0, [r7, #0x10]
_0803BA94:
	movs r5, #0
	mov sl, r5
_0803BA98:
	mov r6, sl
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r4, r0, #3
	ldr r0, [sp, #0x34]
	adds r5, r0, r4
	ldr r0, [r5]
	adds r0, #0x20
	str r0, [r5]
	ldr r2, [sp, #0x30]
	adds r2, r2, r4
	mov r8, r2
	ldr r2, [r2]
	mov sb, r1
	cmp r2, #0
	ble _0803BAC2
	ldr r3, [sp, #0x28]
	adds r1, r3, r4
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0803BAC2:
	ldr r0, [sp, #0x2c]
	adds r6, r0, r4
	ldr r0, [r6]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r6]
	asrs r0, r0, #8
	adds r0, #5
	ldr r2, [sp, #0x28]
	adds r1, r2, r4
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BB1A
	ldr r3, [sp, #0x38]
	adds r1, r3, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BAFA
	subs r0, #1
	str r0, [r1]
_0803BAFA:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x20
	str r0, [r1]
	ldr r2, [sp, #0x24]
	lsls r1, r2, #8
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r3, sl
	lsls r0, r3, #2
	subs r0, #0x40
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r5]
_0803BB1A:
	mov r0, sb
	add r0, sl
	lsls r1, r0, #3
	ldr r5, [sp, #0x38]
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BB3A
	adds r0, r7, #0
	adds r0, #0x58
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BB3A
	subs r0, #1
	str r0, [r1]
_0803BB3A:
	mov r0, sb
	add r0, sl
	lsls r4, r0, #3
	movs r6, #0x88
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r5, r0, r4
	ldr r0, [r5]
	adds r0, #0x28
	str r0, [r5]
	movs r1, #0x86
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	mov r8, r0
	ldr r2, [r0]
	cmp r2, #0
	ble _0803BB6C
	movs r3, #0x82
	lsls r3, r3, #1
	adds r1, r7, r3
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0803BB6C:
	movs r6, #0x84
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r6, r0, r4
	ldr r0, [r6]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r6]
	asrs r0, r0, #8
	adds r0, #5
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r7, r2
	adds r1, r1, r4
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BBD2
	movs r3, #0x8a
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r1, r0, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BBB0
	subs r0, #1
	str r0, [r1]
_0803BBB0:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x20
	str r0, [r1]
	ldr r2, [sp, #0x24]
	lsls r1, r2, #8
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r3, sl
	lsls r0, r3, #2
	adds r0, #0x40
	rsbs r0, r0, #0
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r5]
_0803BBD2:
	mov r0, sb
	add r0, sl
	lsls r1, r0, #3
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r0, r7, r5
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BBF8
	movs r6, #0x8c
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BBF8
	subs r0, #1
	str r0, [r1]
_0803BBF8:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #7
	bhi _0803BC08
	b _0803BA98
_0803BC08:
	ldr r2, [r7, #0x28]
	adds r2, #0x60
	str r2, [r7, #0x28]
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x24]
	adds r1, r1, r0
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x20]
	adds r0, r0, r2
	str r0, [r7, #0x20]
	asrs r0, r0, #8
	adds r0, #0x18
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	blt _0803BC36
	b _0803BD76
_0803BC36:
	ldr r2, [r7, #0x30]
	cmp r2, #0
	bne _0803BD06
	ldr r0, [r7, #0x1c]
	asrs r0, r0, #8
	ldr r1, _0803BD2C @ =gCamera
	mov r8, r1
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	str r0, [sp, #0x1c]
	add r0, sp, #4
	strh r2, [r0, #0x1c]
	adds r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	subs r0, #0xe8
	strh r0, [r1, #0xe]
	ldr r0, _0803BD30 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803BD34 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r2, [r0, #0xa]
	str r2, [sp, #8]
	ldr r5, _0803BD38 @ =0x00000229
	adds r5, r5, r7
	mov sb, r5
	mov r1, sb
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, _0803BD3C @ =gPseudoRandom
	ldr r0, [r3]
	ldr r6, _0803BD40 @ =0x00196225
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r4, _0803BD44 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r1, [r7, #0x1c]
	asrs r1, r1, #8
	mov r5, r8
	ldr r0, [r5]
	subs r1, r1, r0
	movs r5, #0xf
	adds r0, r2, #0
	ands r0, r5
	adds r1, r1, r0
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r4
	str r2, [r3]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov ip, r0
	mov r0, r8
	ldr r0, [r0, #4]
	mov r1, ip
	subs r1, r1, r0
	ands r2, r5
	adds r0, r1, r2
	str r0, [sp, #0x1c]
	add r0, sp, #4
	mov r1, sb
	str r3, [sp, #0x3c]
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, [sp, #0x3c]
	ldr r0, [r3]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r4
	ldr r1, [r7, #0x1c]
	asrs r1, r1, #8
	mov sl, r1
	mov r1, r8
	ldr r0, [r1]
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	adds r0, r2, #0
	ands r0, r5
	add r0, sl
	str r0, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r4
	str r2, [r3]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	ands r2, r5
	adds r0, r0, r2
	str r0, [sp, #0x1c]
	add r0, sp, #4
	mov r1, sb
	bl CreateBossParticleWithExplosionUpdate
_0803BD06:
	ldr r1, [r7, #0x28]
	ldr r0, _0803BD48 @ =0x000002FF
	cmp r1, r0
	bgt _0803BD1C
	ldr r0, [r7, #0x30]
	cmp r0, #0
	bne _0803BD18
	movs r0, #1
	str r0, [r7, #0x30]
_0803BD18:
	movs r0, #0
	str r0, [r7, #0x28]
_0803BD1C:
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	beq _0803BD4C
	movs r0, #0
	b _0803BD4E
	.align 2, 0
_0803BD28: .4byte sub_801EC3C
_0803BD2C: .4byte gCamera
_0803BD30: .4byte 0x06012980
_0803BD34: .4byte 0x0000026B
_0803BD38: .4byte 0x00000229
_0803BD3C: .4byte gPseudoRandom
_0803BD40: .4byte 0x00196225
_0803BD44: .4byte 0x3C6EF35F
_0803BD48: .4byte 0x000002FF
_0803BD4C:
	movs r0, #1
_0803BD4E:
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x24]
	subs r0, #0x20
	str r0, [r7, #0x24]
	cmp r0, #0
	bge _0803BD5E
	movs r0, #0
	str r0, [r7, #0x24]
_0803BD5E:
	ldr r5, [sp, #0x24]
	lsls r1, r5, #8
	ldr r0, [r7, #0x20]
	adds r0, r0, r1
	str r0, [r7, #0x20]
	ldr r1, [r7, #0x28]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	rsbs r0, r0, #0
	asrs r0, r0, #8
	str r0, [r7, #0x28]
_0803BD76:
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	beq _0803BD90
	movs r6, #0x89
	lsls r6, r6, #2
	adds r0, r7, r6
	ldrh r1, [r0]
	adds r1, #0x30
	ldr r3, _0803BD8C @ =0x000003FF
	adds r2, r3, #0
	b _0803BD9E
	.align 2, 0
_0803BD8C: .4byte 0x000003FF
_0803BD90:
	movs r5, #0x89
	lsls r5, r5, #2
	adds r0, r7, r5
	ldrh r1, [r0]
	subs r1, #0x30
	ldr r6, _0803BDB4 @ =0x000003FF
	adds r2, r6, #0
_0803BD9E:
	ands r1, r2
	strh r1, [r0]
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BDB4: .4byte 0x000003FF

	thumb_func_start sub_803BDB8
sub_803BDB8: @ 0x0803BDB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _0803BE4C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xb4
	adds r0, r0, r1
	mov ip, r0
	ldr r2, _0803BE50 @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	movs r3, #0
	str r3, [r0]
	ldr r4, _0803BE54 @ =IWRAM_START + 0x2DC
	adds r2, r1, r4
	movs r0, #5
	strb r0, [r2]
	ldr r5, _0803BE58 @ =IWRAM_START + 0x2DD
	adds r0, r1, r5
	strb r3, [r0]
	ldr r6, _0803BE5C @ =IWRAM_START + 0x2E0
	adds r2, r1, r6
	movs r0, #0x9d
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r2, _0803BE60 @ =IWRAM_START + 0x300
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0803BE64 @ =IWRAM_START + 0x301
	adds r2, r1, r3
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r7]
	mov r4, ip
	str r0, [r4, #0xc]
	ldr r0, [r7, #4]
	str r0, [r4, #0x10]
	movs r5, #8
	ldrsh r0, [r7, r5]
	str r0, [r4, #0x14]
	ldr r0, _0803BE68 @ =0xFFFFFD00
	str r0, [r4, #0x18]
	movs r6, #0
	mov r8, r6
	ldr r0, _0803BE6C @ =IWRAM_START + 0x278
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r2, _0803BE70 @ =IWRAM_START + 0x280
	adds r2, r2, r1
	mov sl, r2
	subs r3, #0x85
	adds r3, r1, r3
	str r3, [sp, #0xc]
_0803BE2E:
	mov r4, r8
	lsls r0, r4, #0x18
	asrs r2, r0, #0x18
	adds r3, r0, #0
	cmp r2, #1
	bgt _0803BE78
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r5, [sp, #8]
	adds r1, r5, r1
	ldr r0, [r7]
	ldr r6, _0803BE74 @ =0xFFFFEA00
	adds r0, r0, r6
	b _0803BE8A
	.align 2, 0
_0803BE4C: .4byte gCurTask
_0803BE50: .4byte IWRAM_START + 0xA8
_0803BE54: .4byte IWRAM_START + 0x2DC
_0803BE58: .4byte IWRAM_START + 0x2DD
_0803BE5C: .4byte IWRAM_START + 0x2E0
_0803BE60: .4byte IWRAM_START + 0x300
_0803BE64: .4byte IWRAM_START + 0x301
_0803BE68: .4byte 0xFFFFFD00
_0803BE6C: .4byte IWRAM_START + 0x278
_0803BE70: .4byte IWRAM_START + 0x280
_0803BE74: .4byte 0xFFFFEA00
_0803BE78:
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r0, [sp, #8]
	adds r1, r0, r1
	ldr r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r0, r2
_0803BE8A:
	str r0, [r1]
	asrs r5, r3, #0x18
	lsls r0, r5, #1
	adds r6, r0, r5
	lsls r4, r6, #3
	ldr r0, [sp, #0xc]
	adds r3, r0, r4
	adds r2, r7, #0
	adds r2, #0x98
	ldr r0, [r7, #4]
	ldr r1, [r2]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r3]
	mov sb, r2
	cmp r5, #1
	bgt _0803BEC4
	mov r2, sl
	adds r3, r2, r4
	movs r4, #8
	ldrsh r2, [r7, r4]
	adds r1, r5, #2
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r3]
	b _0803BED2
_0803BEC4:
	mov r5, sl
	adds r0, r5, r4
	movs r2, #8
	ldrsh r1, [r7, r2]
	lsls r2, r6, #4
	adds r1, r1, r2
	str r1, [r0]
_0803BED2:
	mov r3, r8
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #1
	adds r4, r1, r2
	lsls r4, r4, #3
	movs r3, #0xe8
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r4
	movs r0, #0x60
	rsbs r0, r0, #0
	subs r0, r0, r1
	mov r5, sb
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r3]
	movs r0, #0xea
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #4
	str r1, [r0]
	movs r0, #0xec
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #0x3c
	str r1, [r0]
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	mov r8, r6
	asrs r2, r2, #0x18
	cmp r2, #3
	ble _0803BE2E
	movs r0, #0
	mov r8, r0
	mov r1, ip
	adds r1, #0x44
	str r1, [sp, #0x18]
	mov r2, ip
	adds r2, #0x48
	str r2, [sp, #0x1c]
	mov r3, ip
	adds r3, #0x4c
	str r3, [sp, #0x20]
	adds r4, r7, #0
	adds r4, #0x2c
	str r4, [sp, #0x40]
	adds r5, r7, #0
	adds r5, #0xc
	str r5, [sp, #0x3c]
	mov r6, ip
	adds r6, #0x50
	str r6, [sp, #0x24]
	mov r0, ip
	adds r0, #0x54
	str r0, [sp, #0x2c]
	adds r1, #0x14
	str r1, [sp, #0x30]
	adds r2, r7, #0
	adds r2, #0x74
	str r2, [sp, #0x34]
	adds r3, r7, #0
	adds r3, #0x54
	str r3, [sp, #0x28]
	adds r4, #0x5c
	str r4, [sp, #0x38]
	ldr r5, _0803C188 @ =gSineTable
	mov sl, r5
	ldr r6, _0803C18C @ =0x000003FF
	mov sb, r6
_0803BF66:
	mov r0, r8
	lsls r5, r0, #0x18
	asrs r5, r5, #0x18
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r1, [sp, #0x18]
	adds r3, r1, r4
	ldr r0, [r3]
	ldr r2, _0803C190 @ =gCamera
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	ldr r6, [sp, #0x1c]
	adds r2, r6, r4
	ldr r0, [r2]
	ldr r6, _0803C190 @ =gCamera
	ldr r1, [r6, #4]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	lsls r0, r0, #8
	str r0, [r3]
	ldr r0, [r2]
	lsls r0, r0, #8
	str r0, [r2]
	ldr r0, [sp, #0x20]
	adds r0, r0, r4
	mov r8, r0
	movs r2, #8
	ldrsh r1, [r7, r2]
	str r1, [sp, #0x44]
	lsls r2, r5, #2
	ldr r3, [sp, #0x40]
	adds r6, r3, r2
	ldr r0, [r6]
	mov r1, sb
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x3c]
	adds r2, r0, r2
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	ldr r1, [sp, #0x44]
	adds r3, r1, r0
	mov r0, r8
	str r3, [r0]
	ldr r1, [sp, #0x24]
	adds r3, r1, r4
	ldr r0, [r6]
	mov r6, sb
	ands r0, r6
	lsls r0, r0, #1
	add r0, sl
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r3]
	ldr r0, [sp, #0x2c]
	adds r1, r0, r4
	movs r0, #3
	str r0, [r1]
	ldr r1, [sp, #0x30]
	adds r4, r1, r4
	movs r0, #0x1e
	str r0, [r4]
	adds r5, #1
	lsls r5, r5, #0x18
	lsrs r2, r5, #0x18
	mov r8, r2
	asrs r5, r5, #0x18
	cmp r5, #7
	ble _0803BF66
	ldr r3, [r7]
	str r3, [sp]
	ldr r4, [r7, #4]
	str r4, [sp, #4]
	movs r5, #0
	mov r8, r5
	movs r6, #0x82
	lsls r6, r6, #1
	add r6, ip
	str r6, [sp, #0x10]
	ldr r0, _0803C188 @ =gSineTable
	mov sl, r0
	ldr r1, _0803C18C @ =0x000003FF
	mov sb, r1
	movs r2, #0x84
	lsls r2, r2, #1
	add r2, ip
	str r2, [sp, #0x14]
_0803C02E:
	mov r3, r8
	lsls r4, r3, #0x18
	asrs r4, r4, #0x18
	lsls r5, r4, #1
	adds r5, r5, r4
	lsls r5, r5, #3
	ldr r6, [sp, #0x10]
	adds r2, r6, r5
	lsls r6, r4, #2
	ldr r0, [sp, #0x34]
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x28]
	adds r6, r0, r6
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	str r0, [r2]
	ldr r3, [sp, #0x14]
	adds r2, r3, r5
	mov r1, r8
	ldr r0, [r1]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r0, r3
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp, #4]
	adds r0, r1, r0
	str r0, [r2]
	movs r3, #0x86
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r5
	str r3, [sp, #0x44]
	movs r3, #8
	ldrsh r2, [r7, r3]
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	adds r2, r2, r0
	ldr r0, [sp, #0x44]
	str r2, [r0]
	movs r2, #0x88
	lsls r2, r2, #1
	add r2, ip
	adds r2, r2, r5
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r2]
	movs r0, #0x8a
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #3
	str r1, [r0]
	movs r0, #0x8c
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #0x1e
	str r1, [r0]
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	mov r8, r5
	asrs r4, r4, #0x18
	cmp r4, #7
	ble _0803C02E
	movs r6, #0x87
	lsls r6, r6, #3
	adds r3, r7, r6
	ldr r1, [sp, #0x38]
	ldr r0, [r1]
	ldr r2, _0803C18C @ =0x000003FF
	ands r0, r2
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r5, _0803C188 @ =gSineTable
	adds r0, r0, r5
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	mov r4, ip
	str r0, [r4, #0x1c]
	ldr r5, [sp, #0x38]
	ldr r0, [r5]
	ands r0, r2
	lsls r0, r0, #1
	ldr r6, _0803C188 @ =gSineTable
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r4, [sp, #4]
	adds r0, r4, r0
	mov r5, ip
	str r0, [r5, #0x20]
	movs r6, #8
	ldrsh r0, [r7, r6]
	str r0, [r5, #0x24]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	ldr r2, _0803C194 @ =0xFFFFF800
	adds r0, r0, r2
	str r0, [r5, #0x28]
	ldrh r1, [r3]
	movs r0, #0x89
	lsls r0, r0, #2
	add r0, ip
	movs r2, #0
	strh r1, [r0]
	movs r0, #1
	str r0, [r5, #0x2c]
	str r2, [r5, #0x30]
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C188: .4byte gSineTable
_0803C18C: .4byte 0x000003FF
_0803C190: .4byte gCamera
_0803C194: .4byte 0xFFFFF800

	thumb_func_start sub_803C198
sub_803C198: @ 0x0803C198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	mov r7, sb
	adds r7, #0xb4
	mov r5, sb
	adds r5, #0xa8
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r1, #0x3c
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, [r5]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	bne _0803C256
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	mov r8, r1
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	mov r3, sp
	ldr r2, _0803C310 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803C318 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0803C31C @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r2, _0803C320 @ =gUnknown_080D79D0
	mov r3, r8
	lsls r1, r3, #1
	add r1, r8
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0803C324 @ =0x06010000
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
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, _0803C328 @ =0x000002DD
	add r1, sb
	mov r0, sp
	bl CreateBossParticleWithExplosionUpdate
_0803C256:
	ldr r2, _0803C310 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803C318 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0803C278
	movs r0, #0x90
	bl m4aSongNumStart
_0803C278:
	movs r6, #0xb8
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	mov r1, sb
	adds r1, #0xb3
	str r1, [sp, #0x20]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x24]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x28]
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x2c]
	mov r5, sp
	movs r2, #0
	movs r1, #1
	mov r8, r1
	ldr r3, _0803C32C @ =0x06012980
	mov sl, r3
_0803C2C6:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C338
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C330 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C334 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C344
	.align 2, 0
_0803C30C: .4byte gCamera
_0803C310: .4byte gPseudoRandom
_0803C314: .4byte 0x00196225
_0803C318: .4byte 0x3C6EF35F
_0803C31C: .4byte 0x000003FF
_0803C320: .4byte gUnknown_080D79D0
_0803C324: .4byte 0x06010000
_0803C328: .4byte 0x000002DD
_0803C32C: .4byte 0x06012980
_0803C330: .4byte 0x0000026B
_0803C334: .4byte 0x00000229
_0803C338:
	cmp r4, #0x3c
	bls _0803C344
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C344:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C398
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C390 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C394 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C3A4
	.align 2, 0
_0803C390: .4byte 0x0000026B
_0803C394: .4byte 0x00000229
_0803C398:
	cmp r4, #0x3c
	bls _0803C3A4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C3A4:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C3F8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C3F0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C3F4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C404
	.align 2, 0
_0803C3F0: .4byte 0x0000026B
_0803C3F4: .4byte 0x00000229
_0803C3F8:
	cmp r4, #0x3c
	bls _0803C404
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C404:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C458
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C450 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C454 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C464
	.align 2, 0
_0803C450: .4byte 0x0000026B
_0803C454: .4byte 0x00000229
_0803C458:
	cmp r4, #0x3c
	bls _0803C464
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C464:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C4B8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C4B0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C4B4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C4C4
	.align 2, 0
_0803C4B0: .4byte 0x0000026B
_0803C4B4: .4byte 0x00000229
_0803C4B8:
	cmp r4, #0x3c
	bls _0803C4C4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C4C4:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	blt _0803C4D2
	b _0803C2C6
_0803C4D2:
	movs r2, #0x16
	ldrsh r0, [r6, r2]
	cmp r0, #0x31
	bgt _0803C4F6
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C4F6
	movs r0, #1
	strb r0, [r3]
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r2, #0x80
	lsls r2, r2, #6
	bl CreateEggmobileEscapeSequence
_0803C4F6:
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r4, _0803C7C0 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0803C528
	movs r1, #0
	strh r1, [r7]
	strh r1, [r7, #4]
	movs r0, #2
	strh r0, [r7, #2]
	strh r1, [r7, #6]
	movs r0, #0xbf
	strh r0, [r7, #8]
	strh r1, [r7, #0xa]
	mov r0, sb
	adds r0, #0xa8
	str r1, [r0]
	ldr r0, _0803C7C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803C7C8 @ =sub_803AA40
	str r0, [r1, #8]
_0803C528:
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C556
	movs r6, #0xde
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0803C556:
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C572
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5A4
_0803C572:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xe2
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0803C5A4:
	movs r2, #0xf6
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C5C0
	movs r3, #0xf8
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5EE
_0803C5C0:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0xee
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl DisplaySprite
_0803C5EE:
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C60A
	movs r2, #0x82
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C63E
_0803C60A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xfa
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0803C63E:
	movs r2, #0x87
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C65A
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C688
_0803C65A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl DisplaySprite
_0803C688:
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	movs r0, #6
	mov r8, r0
	ldr r1, _0803C7C0 @ =gCamera
	mov sl, r1
	ldr r2, [sp, #0x2c]
	adds r2, #0x90
	ldr r5, [sp, #0x28]
	adds r5, #0x90
	ldr r4, [sp, #0x24]
	adds r4, #0x90
	movs r3, #0x90
_0803C6AA:
	ldr r0, [r4]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0, #4]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	ldr r0, [r2]
	cmp r0, #0
	bne _0803C6EA
	adds r0, r7, #0
	adds r0, #0x58
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C6F8
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C6F8
_0803C6EA:
	adds r0, r6, #0
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	bl DisplaySprite
	ldr r3, [sp, #0x34]
	ldr r2, [sp, #0x30]
_0803C6F8:
	subs r2, #0x18
	subs r5, #0x18
	subs r4, #0x18
	subs r3, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C6AA
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r5, _0803C7C0 @ =gCamera
	movs r4, #0
	movs r2, #5
	mov r8, r2
_0803C720:
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C76C
	adds r3, #0x14
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C772
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C772
_0803C76C:
	adds r0, r6, #0
	bl DisplaySprite
_0803C772:
	adds r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C720
	movs r6, #0x81
	lsls r6, r6, #3
	add r6, sb
	movs r3, #0x87
	lsls r3, r3, #3
	add r3, sb
	ldr r0, [r7, #0x1c]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r2, _0803C7CC @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803C7D0 @ =0x00002060
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803C7D4
	movs r0, #2
	str r0, [r7, #0x30]
	b _0803C7FC
	.align 2, 0
_0803C7C0: .4byte gCamera
_0803C7C4: .4byte gCurTask
_0803C7C8: .4byte sub_803AA40
_0803C7CC: .4byte gUnknown_030054B8
_0803C7D0: .4byte 0x00002060
_0803C7D4:
	movs r2, #0x89
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r3, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r3, #8]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_8004860
	adds r0, r6, #0
	bl DisplaySprite
_0803C7FC:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803C80C
sub_803C80C: @ 0x0803C80C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0803C8D4 @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, _0803C8D8 @ =IWRAM_START + 0xB4
	adds r0, r0, r2
	mov ip, r0
	ldr r0, [r0, #0xc]
	adds r0, r0, r4
	mov r3, ip
	str r0, [r3, #0xc]
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, [r3, #0x10]
	adds r0, r0, r5
	str r0, [r3, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r5
	str r0, [r1, #4]
	movs r3, #0
	ldr r0, _0803C8DC @ =IWRAM_START + 0x278
	adds r7, r2, r0
	ldr r1, _0803C8E0 @ =IWRAM_START + 0x27C
	adds r6, r2, r1
_0803C848:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C848
	movs r3, #0
	mov r7, ip
	adds r7, #0x44
	mov r6, ip
	adds r6, #0x48
_0803C872:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803C872
	movs r3, #0
	movs r7, #0x82
	lsls r7, r7, #1
	add r7, ip
	movs r6, #0x84
	lsls r6, r6, #1
	add r6, ip
_0803C8A0:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803C8A0
	mov r3, ip
	ldr r0, [r3, #0x1c]
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x20]
	adds r0, r0, r5
	str r0, [r3, #0x20]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C8D4: .4byte gActiveBossTask
_0803C8D8: .4byte IWRAM_START + 0xB4
_0803C8DC: .4byte IWRAM_START + 0x278
_0803C8E0: .4byte IWRAM_START + 0x27C

	thumb_func_start TaskDestructor_EggHammerTankIIMain
TaskDestructor_EggHammerTankIIMain: @ 0x0803C8E4
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _0803C958 @ =IWRAM_START + 0x2E4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C95C @ =IWRAM_START + 0x31C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C960 @ =IWRAM_START + 0x34C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C964 @ =IWRAM_START + 0x37C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C968 @ =IWRAM_START + 0x3AC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C96C @ =IWRAM_START + 0x3DC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C970 @ =IWRAM_START + 0x40C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C974 @ =IWRAM_START + 0x448
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C93C
	bl VramFree
_0803C93C:
	ldr r1, _0803C978 @ =IWRAM_START + 0x478
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C94A
	bl VramFree
_0803C94A:
	ldr r1, _0803C97C @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C958: .4byte IWRAM_START + 0x2E4
_0803C95C: .4byte IWRAM_START + 0x31C
_0803C960: .4byte IWRAM_START + 0x34C
_0803C964: .4byte IWRAM_START + 0x37C
_0803C968: .4byte IWRAM_START + 0x3AC
_0803C96C: .4byte IWRAM_START + 0x3DC
_0803C970: .4byte IWRAM_START + 0x40C
_0803C974: .4byte IWRAM_START + 0x448
_0803C978: .4byte IWRAM_START + 0x478
_0803C97C: .4byte gActiveBossTask

	thumb_func_start Task_803C980
Task_803C980: @ 0x0803C980
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803CA04 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r5, _0803CA08 @ =gUnknown_080D7AA8
	bl sub_803CA40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0803CA0C @ =gUnknown_080D7AB0
	ldr r2, _0803CA10 @ =IWRAM_START + 0xA0
	adds r0, r6, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_803CB18
	adds r0, r4, #0
	bl sub_803A8E4
	adds r0, r4, #0
	bl sub_803B7B0
	adds r0, r4, #0
	bl sub_803AC2C
	adds r0, r4, #0
	bl sub_803CC3C
	ldr r0, _0803CA14 @ =IWRAM_START + 0xB0
	adds r6, r6, r0
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803C9FE
	bl sub_803BDB8
	ldr r1, [r7]
	ldr r0, _0803CA18 @ =Task_803CA1C
	str r0, [r1, #8]
	bl sub_802A018
_0803C9FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA04: .4byte gCurTask
_0803CA08: .4byte gUnknown_080D7AA8
_0803CA0C: .4byte gUnknown_080D7AB0
_0803CA10: .4byte IWRAM_START + 0xA0
_0803CA14: .4byte IWRAM_START + 0xB0
_0803CA18: .4byte Task_803CA1C

	thumb_func_start Task_803CA1C
Task_803CA1C: @ 0x0803CA1C
	push {r4, lr}
	ldr r0, _0803CA3C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_803B84C
	adds r0, r4, #0
	bl sub_803C198
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA3C: .4byte gCurTask

	thumb_func_start sub_803CA40
sub_803CA40: @ 0x0803CA40
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803CAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r2, r0, r1
	ldr r0, _0803CAAC @ =IWRAM_START + 0x9C
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r6, _0803CAB0 @ =sub_801EC3C
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	ldr r0, [r4]
	ldr r1, _0803CAB4 @ =0xFFFFEA00
	adds r2, r0, r1
	ldr r0, _0803CAB8 @ =IWRAM_START + 0x98
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	movs r0, #0
	b _0803CABE
	.align 2, 0
_0803CAA8: .4byte gCurTask
_0803CAAC: .4byte IWRAM_START + 0x9C
_0803CAB0: .4byte sub_801EC3C
_0803CAB4: .4byte 0xFFFFEA00
_0803CAB8: .4byte IWRAM_START + 0x98
_0803CABC:
	movs r0, #1
_0803CABE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

@; Refd in gUnknown_080D7AA8
	thumb_func_start sub_803CAC8
sub_803CAC8: @ 0x0803CAC8
	push {lr}
	ldr r0, _0803CB0C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldrh r0, [r1, #0xa]
	adds r0, #0x40
	strh r0, [r1, #0xa]
	ldr r0, _0803CB10 @ =IWRAM_START + 0x9C
	adds r3, r2, r0
	ldr r0, [r3]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _0803CB14 @ =IWRAM_START + 0x98
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803CB00
	str r1, [r3]
_0803CB00:
	ldr r0, [r2]
	cmp r0, r1
	ble _0803CB08
	str r1, [r2]
_0803CB08:
	pop {r0}
	bx r0
	.align 2, 0
_0803CB0C: .4byte gCurTask
_0803CB10: .4byte IWRAM_START + 0x9C
_0803CB14: .4byte IWRAM_START + 0x98

	thumb_func_start sub_803CB18
sub_803CB18: @ 0x0803CB18
	push {r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x4c]
	adds r1, #8
	ldr r2, _0803CB74 @ =0x000003FF
	ands r1, r2
	str r1, [r0, #0x4c]
	ldr r2, _0803CB78 @ =gSineTable
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [r0, #0x50]
	str r1, [r0, #0x2c]
	movs r4, #1
	adds r5, r0, #0
	adds r5, #0x2c
	ldr r0, _0803CB7C @ =gUnknown_080D7A28
	mov ip, r0
	ldr r6, _0803CB80 @ =0xFFFFF400
_0803CB40:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	adds r0, r0, r6
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803CB40
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB74: .4byte 0x000003FF
_0803CB78: .4byte gSineTable
_0803CB7C: .4byte gUnknown_080D7A28
_0803CB80: .4byte 0xFFFFF400

	thumb_func_start sub_803CB84
sub_803CB84: @ 0x0803CB84
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0xac
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _0803CBA0
	movs r0, #0x3c
	str r0, [r2]
	adds r1, #0xa0
	movs r0, #3
	str r0, [r1]
_0803CBA0:
	pop {r0}
	bx r0

	thumb_func_start sub_803CBA4
sub_803CBA4: @ 0x0803CBA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xac
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _0803CBF6
	ldr r2, _0803CBD8 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803CBDC @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803CBE0 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0803CBE4
	movs r0, #0x44
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #5
	b _0803CBF4
	.align 2, 0
_0803CBD8: .4byte gPseudoRandom
_0803CBDC: .4byte 0x00196225
_0803CBE0: .4byte 0x3C6EF35F
_0803CBE4:
	movs r0, #0xef
	bl m4aSongNumStart
	movs r0, #0x3c
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #6
_0803CBF4:
	str r0, [r1]
_0803CBF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_803CBFC
sub_803CBFC: @ 0x0803CBFC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0xb2
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CC2E
	movs r0, #0xde
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _0803CC34 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803CC38 @ =0x00000399
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803CC2E:
	pop {r0}
	bx r0
	.align 2, 0
_0803CC34: .4byte 0x00000275
_0803CC38: .4byte 0x00000399

	thumb_func_start sub_803CC3C
sub_803CC3C: @ 0x0803CC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r2, #0xb1
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803CC90
	movs r4, #0
	ldr r0, _0803CC9C @ =gFlags
	mov r8, r0
	ldr r1, _0803CCA0 @ =gObjPalette
	mov ip, r1
	ldr r7, _0803CCA4 @ =gUnknown_080D7AD0
	adds r5, r2, #0
	movs r6, #4
_0803CC5C:
	adds r3, r4, #0
	adds r3, #0x80
	lsls r3, r3, #1
	add r3, ip
	lsls r1, r4, #1
	ldrb r2, [r5]
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0803CC5C
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
_0803CC90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC9C: .4byte gFlags
_0803CCA0: .4byte gObjPalette
_0803CCA4: .4byte gUnknown_080D7AD0
