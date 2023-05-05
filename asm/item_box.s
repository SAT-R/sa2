.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080E0294
gUnknown_080E0294:
    .byte 1, 5, 10, 30, 50, 0

    .global gUnknown_080E029A
gUnknown_080E029A:
    .2byte 0x0000, 0x0001, 0x0001, 0x0000
    .2byte 0x0001, 0x0001, 0x0000, 0x0001

    .global gUnknown_080E02AA
gUnknown_080E02AA:
    .2byte 0x02D5, 0x0009, 0x0004, 0x02D5
    .2byte 0x000C, 0x0004, 0x0000


.arm
.syntax unified
.text

	thumb_func_start initSprite_ItemBox
initSprite_ItemBox: @ 0x08085F88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _08085FC8 @ =gRandomItemBox 
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	movs r1, #3
	ldrsb r1, [r7, r1]
	cmp r0, r1
	bne _08085FD0
	movs r1, #4
	ldrsb r1, [r7, r1]
	lsrs r0, r2, #4
	cmp r1, r0
	bgt _08085FD0
	ldr r0, _08085FCC @ =sub_80865E4
	b _08085FD2
	.align 2, 0
_08085FC8: .4byte gRandomItemBox 
_08085FCC: .4byte sub_80865E4
_08085FD0:
	ldr r0, _08086124 @ =sub_808673C
_08085FD2:
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08086128 @ =sub_80867E8
	str r1, [sp]
	movs r1, #0x88
	movs r3, #0
	bl TaskCreate
	adds r2, r0, #0
	movs r0, #4
	ldrsb r0, [r7, r0]
	ldr r1, _0808612C @ =gRandomItemBox 
	ldrb r1, [r1]
	lsrs r1, r1, #4
	cmp r0, r1
	bgt _08085FF4
	strb r1, [r7, #4]
_08085FF4:
	ldrh r4, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, _08086130 @ =gMultiplayerPseudoRandom
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08086134 @ =gUnknown_080E029A
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r3, _08086138 @ =IWRAM_START + 0x82
	adds r6, r4, r3
	movs r5, #0
	strb r0, [r6]
	ldr r1, _0808613C @ =IWRAM_START + 0x80
	adds r0, r4, r1
	strh r5, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x78]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r3, r8
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x7c]
	mov r0, sb
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r1, sl
	strb r1, [r2, #9]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r7]
	ldr r0, _08086140 @ =IWRAM_START + 0xC
	adds r7, r4, r0
	ldr r1, _08086144 @ =IWRAM_START + 0x2E
	adds r0, r4, r1
	movs r3, #0x10
	mov sl, r3
	mov r1, sl
	strb r1, [r0]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r3, _08086148 @ =IWRAM_START + 0x2D
	adds r1, r4, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0808614C @ =IWRAM_START + 0x31
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	str r1, [r7, #0x10]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xb5
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r3, _08086150 @ =IWRAM_START + 0x2C
	adds r0, r4, r3
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_8004558
	ldr r3, _08086154 @ =IWRAM_START + 0x3C
	adds r7, r4, r3
	ldr r1, _08086158 @ =IWRAM_START + 0x5E
	adds r0, r4, r1
	mov r3, sl
	strb r3, [r0]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r0, _0808615C @ =IWRAM_START + 0x5D
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08086160 @ =IWRAM_START + 0x61
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sb
	str r0, [r7, #0x28]
	mov r1, r8
	str r1, [r7, #0x10]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r2, _08086164 @ =gUnknown_080E02AA
	ldrb r0, [r6]
	lsls r0, r0, #1
	ldr r3, _08086134 @ =gUnknown_080E029A
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _08086168 @ =IWRAM_START + 0x5C
	adds r4, r4, r1
	strb r0, [r4]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086124: .4byte sub_808673C
_08086128: .4byte sub_80867E8
_0808612C: .4byte gRandomItemBox 
_08086130: .4byte gMultiplayerPseudoRandom
_08086134: .4byte gUnknown_080E029A
_08086138: .4byte IWRAM_START + 0x82
_0808613C: .4byte IWRAM_START + 0x80
_08086140: .4byte IWRAM_START + 0xC
_08086144: .4byte IWRAM_START + 0x2E
_08086148: .4byte IWRAM_START + 0x2D
_0808614C: .4byte IWRAM_START + 0x31
_08086150: .4byte IWRAM_START + 0x2C
_08086154: .4byte IWRAM_START + 0x3C
_08086158: .4byte IWRAM_START + 0x5E
_0808615C: .4byte IWRAM_START + 0x5D
_08086160: .4byte IWRAM_START + 0x61
_08086164: .4byte gUnknown_080E02AA
_08086168: .4byte IWRAM_START + 0x5C

	thumb_func_start sub_808616C
sub_808616C: @ 0x0808616C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, _0808621C @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov r8, r1
	add r8, r4
	ldr r6, _08086220 @ =gUnknown_080E029A
	ldr r0, _08086224 @ =gMultiplayerPseudoRandom
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	ldr r2, _08086228 @ =IWRAM_START + 0x82
	adds r3, r4, r2
	movs r1, #0
	mov sb, r1
	strb r0, [r3]
	subs r2, #0x46
	adds r0, r4, r2
	ldr r5, _0808622C @ =gUnknown_080E02AA
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r5, #2
	adds r1, r1, r5
	ldrh r2, [r1]
	ldr r3, _08086230 @ =IWRAM_START + 0x5C
	adds r1, r4, r3
	strb r2, [r1]
	bl sub_8004558
	mov r1, r8
	ldr r0, [r1, #0x1c]
	movs r1, #0x20
	orrs r0, r1
	mov r2, r8
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x4c]
	orrs r0, r1
	str r0, [r2, #0x4c]
	ldr r3, _08086234 @ =IWRAM_START + 0x6C
	adds r4, r4, r3
	mov r0, sb
	strh r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #2]
	mov r1, sb
	strh r1, [r4, #4]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	mov r2, sl
	ldr r1, [r2]
	ldr r0, _08086238 @ =sub_808623C
	str r0, [r1, #8]
	bl _call_via_r0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808621C: .4byte gCurTask
_08086220: .4byte gUnknown_080E029A
_08086224: .4byte gMultiplayerPseudoRandom
_08086228: .4byte IWRAM_START + 0x82
_0808622C: .4byte gUnknown_080E02AA
_08086230: .4byte IWRAM_START + 0x5C
_08086234: .4byte IWRAM_START + 0x6C
_08086238: .4byte sub_808623C

	thumb_func_start sub_808623C
sub_808623C: @ 0x0808623C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080862B4 @ =gCurTask
	ldr r3, [r7]
	ldrh r4, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x6c
	adds r6, r4, r0
	ldr r0, [r5, #0x78]
	ldr r2, _080862B8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #6]
	ldr r0, [r5, #0x7c]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r6, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0808630C
	ldr r0, [r5, #0x1c]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r1
	str r0, [r5, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldr r0, _080862BC @ =IWRAM_START + 0x80
	adds r1, r4, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080862C0 @ =sub_80865E4
	str r0, [r3, #8]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r5, [r4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	ldr r0, _080862C4 @ =gRandomItemBox 
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	beq _080862C8
	adds r0, r4, #0
	bl sub_8086804
	b _08086358
	.align 2, 0
_080862B4: .4byte gCurTask
_080862B8: .4byte gCamera
_080862BC: .4byte IWRAM_START + 0x80
_080862C0: .4byte sub_80865E4
_080862C4: .4byte gRandomItemBox 
_080862C8:
	movs r1, #4
	ldrsb r1, [r5, r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	cmp r1, r0
	ble _080862DC
	adds r0, r4, #0
	bl sub_8086858
	b _08086358
_080862DC:
	adds r0, r4, #0
	bl sub_808693C
	cmp r0, #0
	beq _080862EC
	adds r0, r4, #0
	bl sub_8086474
_080862EC:
	adds r0, r4, #0
	bl sub_80868F4
	cmp r0, #0
	beq _08086302
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r7]
	bl TaskDestroy
	b _08086358
_08086302:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80868A8
	b _08086358
_0808630C:
	ldr r0, [r5, #0x1c]
	movs r3, #0x20
	rsbs r3, r3, #0
	ands r0, r3
	str r0, [r5, #0x1c]
	ldr r2, _08086360 @ =gUnknown_030054B8
	ldrb r1, [r2]
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r3
	str r0, [r5, #0x4c]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x4c]
	orrs r0, r1
	str r0, [r5, #0x4c]
	ldr r0, _08086364 @ =IWRAM_START + 0xC
	adds r5, r4, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	ldr r1, _08086368 @ =IWRAM_START + 0x3C
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_80051E8
_08086358:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086360: .4byte gUnknown_030054B8
_08086364: .4byte IWRAM_START + 0xC
_08086368: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_808636C
sub_808636C: @ 0x0808636C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080863E4 @ =gCurTask
	ldr r3, [r7]
	ldrh r4, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x6c
	adds r6, r4, r0
	ldr r0, [r5, #0x78]
	ldr r2, _080863E8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #6]
	ldr r0, [r5, #0x7c]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08086414
	ldr r0, [r5, #0x1c]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r1
	str r0, [r5, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldr r0, _080863EC @ =sub_808673C
	str r0, [r3, #8]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r4, [r5]
	movs r1, #3
	ldrsb r1, [r4, r1]
	ldr r0, _080863F0 @ =gRandomItemBox 
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	bne _080863F8
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsrs r1, r2, #4
	cmp r0, r1
	bgt _080863F8
	strb r1, [r4, #4]
	ldr r1, [r7]
	ldr r0, _080863F4 @ =sub_808616C
	str r0, [r1, #8]
	b _08086460
	.align 2, 0
_080863E4: .4byte gCurTask
_080863E8: .4byte gCamera
_080863EC: .4byte sub_808673C
_080863F0: .4byte gRandomItemBox 
_080863F4: .4byte sub_808616C
_080863F8:
	adds r0, r5, #0
	bl sub_80868F4
	cmp r0, #0
	beq _08086460
	ldrb r0, [r5, #8]
	strb r0, [r4]
	ldr r0, _08086410 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08086460
	.align 2, 0
_08086410: .4byte gCurTask
_08086414:
	ldr r0, [r5, #0x1c]
	movs r3, #0x20
	rsbs r3, r3, #0
	ands r0, r3
	str r0, [r5, #0x1c]
	ldr r2, _08086468 @ =gUnknown_030054B8
	ldrb r1, [r2]
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r3
	str r0, [r5, #0x4c]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x4c]
	orrs r0, r1
	str r0, [r5, #0x4c]
	ldr r0, _0808646C @ =IWRAM_START + 0xC
	adds r5, r4, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	ldr r1, _08086470 @ =IWRAM_START + 0x3C
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_80051E8
_08086460:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086468: .4byte gUnknown_030054B8
_0808646C: .4byte IWRAM_START + 0xC
_08086470: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_8086474
sub_8086474: @ 0x08086474
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldrb r0, [r0]
	ldr r2, _080864F4 @ =gPlayer
	cmp r0, #1
	bne _0808648C
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080864A6
_0808648C:
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080864F8 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #7
	movs r0, #5
	strb r0, [r1]
_080864A6:
	ldr r1, [r5]
	ldrb r0, [r1, #4]
	adds r0, #1
	movs r4, #0
	strb r0, [r1, #4]
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r5, #0x78]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x7c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r0, r5, #0
	adds r0, #0x83
	strb r4, [r0]
	bl sub_8019224
	movs r1, #5
	strb r1, [r0]
	ldrh r1, [r5, #4]
	strb r1, [r0, #1]
	ldrh r1, [r5, #6]
	strb r1, [r0, #2]
	ldrb r1, [r5, #9]
	strb r1, [r0, #3]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0, #4]
	ldr r0, _080864FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08086500 @ =sub_808665C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080864F4: .4byte gPlayer
_080864F8: .4byte 0x0000FFFF
_080864FC: .4byte gCurTask
_08086500: .4byte sub_808665C

	thumb_func_start sub_8086504
sub_8086504: @ 0x08086504
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	beq _08086516
	cmp r0, #1
	beq _080865B8
	b _080865C4
_08086516:
	ldr r4, _08086594 @ =gUnknown_080E0294
	ldr r2, _08086598 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0808659C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080865A0 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #5
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _080865A4 @ =gRingCount
	ldrh r5, [r1]
	adds r0, r5, r0
	strh r0, [r1]
	ldr r0, _080865A8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08086576
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08086576
	ldr r0, _080865AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08086576
	ldr r1, _080865B0 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0808656E
	movs r0, #0xff
_0808656E:
	strb r0, [r1]
	ldr r1, _080865B4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08086576:
	ldr r0, _080865AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808658A
	ldr r1, _080865A4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0808658A
	movs r0, #0xff
	strh r0, [r1]
_0808658A:
	movs r0, #0x75
	bl m4aSongNumStart
	b _080865C4
	.align 2, 0
_08086594: .4byte gUnknown_080E0294
_08086598: .4byte gPseudoRandom
_0808659C: .4byte 0x00196225
_080865A0: .4byte 0x3C6EF35F
_080865A4: .4byte gRingCount
_080865A8: .4byte gCurrentLevel
_080865AC: .4byte gGameMode
_080865B0: .4byte gNumLives
_080865B4: .4byte gUnknown_030054A8
_080865B8:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
_080865C4:
	adds r1, r6, #0
	adds r1, #0x83
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080865DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080865E0 @ =sub_80866FC
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080865DC: .4byte gCurTask
_080865E0: .4byte sub_80866FC

	thumb_func_start sub_80865E4
sub_80865E4: @ 0x080865E4
	push {r4, r5, r6, lr}
	ldr r6, _0808660C @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	ldr r0, _08086610 @ =gRandomItemBox 
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	beq _08086614
	adds r0, r4, #0
	bl sub_8086804
	b _08086656
	.align 2, 0
_0808660C: .4byte gCurTask
_08086610: .4byte gRandomItemBox 
_08086614:
	movs r1, #4
	ldrsb r1, [r5, r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	cmp r1, r0
	ble _08086628
	adds r0, r4, #0
	bl sub_8086858
	b _08086656
_08086628:
	adds r0, r4, #0
	bl sub_808693C
	cmp r0, #0
	beq _08086638
	adds r0, r4, #0
	bl sub_8086474
_08086638:
	adds r0, r4, #0
	bl sub_80868F4
	cmp r0, #0
	beq _0808664E
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r6]
	bl TaskDestroy
	b _08086656
_0808664E:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80868A8
_08086656:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_808665C
sub_808665C: @ 0x0808665C
	push {r4, lr}
	ldr r0, _08086684 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x83
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _08086688
	adds r0, r4, #0
	bl sub_8086504
	b _08086696
	.align 2, 0
_08086684: .4byte gCurTask
_08086688:
	ldr r2, _080866A4 @ =IWRAM_START + 0x80
	adds r1, r3, r2
	ldr r2, _080866A8 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_08086696:
	adds r0, r4, #0
	movs r1, #1
	bl sub_80868A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866A4: .4byte IWRAM_START + 0x80
_080866A8: .4byte 0xFFFFFF00

	thumb_func_start sub_80866AC
sub_80866AC: @ 0x080866AC
	push {r4, lr}
	ldr r0, _080866D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x83
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _080866D8
	adds r0, r4, #0
	bl sub_8086890
	b _080866E6
	.align 2, 0
_080866D4: .4byte gCurTask
_080866D8:
	ldr r2, _080866F4 @ =IWRAM_START + 0x80
	adds r1, r3, r2
	ldr r2, _080866F8 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_080866E6:
	adds r0, r4, #0
	movs r1, #1
	bl sub_80868A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866F4: .4byte IWRAM_START + 0x80
_080866F8: .4byte 0xFFFFFF00

	thumb_func_start sub_80866FC
sub_80866FC: @ 0x080866FC
	push {r4, lr}
	ldr r4, _08086724 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x83
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _0808672C
	ldr r1, [r4]
	ldr r0, _08086728 @ =sub_808673C
	str r0, [r1, #8]
	b _08086734
	.align 2, 0
_08086724: .4byte gCurTask
_08086728: .4byte sub_808673C
_0808672C:
	adds r0, r3, #0
	movs r1, #1
	bl sub_80868A8
_08086734:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808673C
sub_808673C: @ 0x0808673C
	push {r4, r5, lr}
	ldr r3, _08086770 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, [r5]
	movs r1, #3
	ldrsb r1, [r4, r1]
	ldr r0, _08086774 @ =gRandomItemBox 
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	bne _0808677C
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsrs r1, r2, #4
	cmp r0, r1
	bgt _0808677C
	strb r1, [r4, #4]
	ldr r1, [r3]
	ldr r0, _08086778 @ =sub_808616C
	str r0, [r1, #8]
	b _08086792
	.align 2, 0
_08086770: .4byte gCurTask
_08086774: .4byte gRandomItemBox 
_08086778: .4byte sub_808616C
_0808677C:
	adds r0, r5, #0
	bl sub_80868F4
	cmp r0, #0
	beq _08086792
	ldrb r0, [r5, #8]
	strb r0, [r4]
	ldr r0, _08086798 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08086792:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086798: .4byte gCurTask

	thumb_func_start sub_808679C
sub_808679C: @ 0x0808679C
	push {r4, lr}
	ldr r0, _080867DC @ =gCurTask
	ldr r4, [r0]
	ldrh r2, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, [r1, #0x1c]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r1, #0x1c]
	ldr r0, [r1, #0x4c]
	orrs r0, r3
	str r0, [r1, #0x4c]
	ldr r0, _080867E0 @ =IWRAM_START + 0x6C
	adds r2, r2, r0
	movs r1, #0
	strh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r1, [r2, #6]
	strh r1, [r2, #8]
	ldr r0, _080867E4 @ =sub_808636C
	str r0, [r4, #8]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080867DC: .4byte gCurTask
_080867E0: .4byte IWRAM_START + 0x6C
_080867E4: .4byte sub_808636C

	thumb_func_start sub_80867E8
sub_80867E8: @ 0x080867E8
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8086804
sub_8086804: @ 0x08086804
	push {r4, lr}
	ldr r0, _08086848 @ =gCurTask
	ldr r4, [r0]
	ldr r0, _0808684C @ =sub_808679C
	str r0, [r4, #8]
	ldrh r1, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2, #0x1c]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x4c]
	orrs r0, r3
	str r0, [r2, #0x4c]
	ldr r0, _08086850 @ =IWRAM_START + 0x6C
	adds r1, r1, r0
	movs r2, #0
	strh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	strh r2, [r1, #8]
	ldr r0, _08086854 @ =sub_808636C
	str r0, [r4, #8]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086848: .4byte gCurTask
_0808684C: .4byte sub_808679C
_08086850: .4byte IWRAM_START + 0x6C
_08086854: .4byte sub_808636C

	thumb_func_start sub_8086858
sub_8086858: @ 0x08086858
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r4, #0x78]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x7c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r4, #0x83
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08086888 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808688C @ =sub_80866AC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086888: .4byte gCurTask
_0808688C: .4byte sub_80866AC

	thumb_func_start sub_8086890
sub_8086890: @ 0x08086890
	adds r0, #0x83
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080868A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080868A4 @ =sub_80866FC
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080868A0: .4byte gCurTask
_080868A4: .4byte sub_80866FC

	thumb_func_start sub_80868A8
sub_80868A8: @ 0x080868A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x78]
	ldr r2, _080868F0 @ =gCamera
	ldr r0, [r2]
	subs r3, r3, r0
	strh r3, [r4, #0x22]
	ldr r0, [r4, #0x7c]
	ldr r2, [r2, #4]
	subs r0, r0, r2
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x52
	strh r3, [r0]
	adds r0, #0x2e
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	cmp r1, #0
	bne _080868E2
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_80051E8
_080868E2:
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080868F0: .4byte gCamera

	thumb_func_start sub_80868F4
sub_80868F4: @ 0x080868F4
	push {lr}
	ldr r1, [r0, #0x78]
	ldr r3, _08086930 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x7c]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0808692C
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0808692C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08086934
_0808692C:
	movs r0, #1
	b _08086936
	.align 2, 0
_08086930: .4byte gCamera
_08086934:
	movs r0, #0
_08086936:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808693C
sub_808693C: @ 0x0808693C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r7, _0808696C @ =gPlayer
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08086984
	adds r6, r4, #0
	adds r6, #0xc
	ldr r1, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	adds r0, r6, #0
	bl sub_800C944
	adds r5, r0, #0
	cmp r5, #0
	beq _08086970
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #1
	strb r0, [r1]
	b _08086990
	.align 2, 0
_0808696C: .4byte gPlayer
_08086970:
	ldr r1, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	bne _08086988
_08086984:
	movs r0, #0
	b _08086990
_08086988:
	adds r0, r4, #0
	adds r0, #0x84
	strb r5, [r0]
	movs r0, #1
_08086990:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
