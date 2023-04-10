.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
.align 2 , 0
    .global gUnknown_080D69C8
gUnknown_080D69C8:
    .incbin "baserom.gba", 0x000D69C8, 0xB8

    .global gUnknown_080D6A80
gUnknown_080D6A80:
    .incbin "baserom.gba", 0x000D6A80, 0x30

    .global gUnknown_080D6AB0
gUnknown_080D6AB0:
    .incbin "baserom.gba", 0x000D6AB0, 0x1E

    .global gUnknown_080D6ACE
gUnknown_080D6ACE:
    .incbin "baserom.gba", 0x000D6ACE, 0x22

    .global gUnknown_080D6AF0
gUnknown_080D6AF0:
    .incbin "baserom.gba", 0x000D6AF0, 0x18

.arm
.syntax unified
.text

	thumb_func_start sub_802A7A8
sub_802A7A8: @ 0x0802A7A8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802A830 @ =sub_802AA48
	ldr r2, _0802A834 @ =0x00004001
	ldr r1, _0802A838 @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r1, _0802A83C @ =IWRAM_START + 0x30
	adds r0, r4, r1
	movs r1, #0
	mov r8, r1
	strb r6, [r0]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	ldr r0, _0802A840 @ =0x00000352
	strh r0, [r5, #0xa]
	ldr r1, _0802A844 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802A848 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802A84C @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802A850 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0x97
	bl m4aSongNumStart
	mov r0, sb
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802A830: .4byte sub_802AA48
_0802A834: .4byte 0x00004001
_0802A838: .4byte sub_802AE58
_0802A83C: .4byte IWRAM_START + 0x30
_0802A840: .4byte 0x00000352
_0802A844: .4byte IWRAM_START + 0x20
_0802A848: .4byte IWRAM_START + 0x21
_0802A84C: .4byte IWRAM_START + 0x22
_0802A850: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802A854
sub_802A854: @ 0x0802A854
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802A8D8 @ =sub_802AC60
	ldr r2, _0802A8DC @ =0x00004001
	ldr r1, _0802A8E0 @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r1, _0802A8E4 @ =IWRAM_START + 0x30
	adds r0, r4, r1
	movs r1, #0
	mov r8, r1
	strb r6, [r0]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	movs r0, #0xd5
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r1, _0802A8E8 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802A8EC @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802A8F0 @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802A8F4 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	mov r0, sb
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802A8D8: .4byte sub_802AC60
_0802A8DC: .4byte 0x00004001
_0802A8E0: .4byte sub_802AE58
_0802A8E4: .4byte IWRAM_START + 0x30
_0802A8E8: .4byte IWRAM_START + 0x20
_0802A8EC: .4byte IWRAM_START + 0x21
_0802A8F0: .4byte IWRAM_START + 0x22
_0802A8F4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802A8F8
sub_802A8F8: @ 0x0802A8F8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0802A980 @ =sub_802AB04
	ldr r2, _0802A984 @ =0x00004001
	ldr r1, _0802A988 @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r0, [r6, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r1, _0802A98C @ =IWRAM_START + 0x30
	adds r0, r0, r1
	movs r1, #0
	mov r8, r1
	strb r4, [r0]
	ldrh r4, [r6, #6]
	adds r5, r4, r5
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	ldr r0, _0802A990 @ =0x00000353
	strh r0, [r5, #0xa]
	ldr r1, _0802A994 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802A998 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802A99C @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802A9A0 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0x97
	bl m4aSongNumStart
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802A980: .4byte sub_802AB04
_0802A984: .4byte 0x00004001
_0802A988: .4byte sub_802AE58
_0802A98C: .4byte IWRAM_START + 0x30
_0802A990: .4byte 0x00000353
_0802A994: .4byte IWRAM_START + 0x20
_0802A998: .4byte IWRAM_START + 0x21
_0802A99C: .4byte IWRAM_START + 0x22
_0802A9A0: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802A9A4
sub_802A9A4: @ 0x0802A9A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0802AA24 @ =sub_802AD60
	ldr r2, _0802AA28 @ =0x00004001
	ldr r1, _0802AA2C @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r0, [r6, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r1, _0802AA30 @ =IWRAM_START + 0x30
	adds r0, r0, r1
	movs r1, #0
	mov r8, r1
	strb r4, [r0]
	ldrh r4, [r6, #6]
	adds r5, r4, r5
	movs r0, #8
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	ldr r0, _0802AA34 @ =0x00000371
	strh r0, [r5, #0xa]
	ldr r1, _0802AA38 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802AA3C @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802AA40 @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802AA44 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802AA24: .4byte sub_802AD60
_0802AA28: .4byte 0x00004001
_0802AA2C: .4byte sub_802AE58
_0802AA30: .4byte IWRAM_START + 0x30
_0802AA34: .4byte 0x00000371
_0802AA38: .4byte IWRAM_START + 0x20
_0802AA3C: .4byte IWRAM_START + 0x21
_0802AA40: .4byte IWRAM_START + 0x22
_0802AA44: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802AA48
sub_802AA48: @ 0x0802AA48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802AA7C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	ldr r3, _0802AA80 @ =IWRAM_START + 0x30
	adds r0, r1, r3
	ldrb r7, [r0]
	orrs r4, r1
	ldr r6, _0802AA84 @ =gCamera
	ldr r3, _0802AA88 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r5, #3
	ands r5, r1
	cmp r5, #1
	beq _0802AA8C
	adds r0, r2, #0
	bl TaskDestroy
	b _0802AAFA
	.align 2, 0
_0802AA7C: .4byte gCurTask
_0802AA80: .4byte IWRAM_START + 0x30
_0802AA84: .4byte gCamera
_0802AA88: .4byte gPlayer
_0802AA8C:
	movs r0, #2
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _0802AAFA
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	adds r2, r3, #0
	adds r2, #0x7c
	subs r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, _0802AAE8 @ =0xFFFFCFFF
	ands r2, r0
	str r2, [r4, #0x10]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	orrs r2, r0
	str r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r1, r5, #0
	ands r1, r7
	ldr r0, _0802AAEC @ =gUnknown_03005590
	ldr r0, [r0]
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _0802AAF0
	cmp r1, r5
	bne _0802AAF4
	b _0802AAFA
	.align 2, 0
_0802AAE8: .4byte 0xFFFFCFFF
_0802AAEC: .4byte gUnknown_03005590
_0802AAF0:
	cmp r1, #0
	beq _0802AAFA
_0802AAF4:
	adds r0, r4, #0
	bl sub_80051E8
_0802AAFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802AB04
sub_802AB04: @ 0x0802AB04
	push {r4, r5, r6, lr}
	ldr r0, _0802AB3C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	ldr r3, _0802AB40 @ =IWRAM_START + 0x30
	adds r0, r1, r3
	ldrb r6, [r0]
	orrs r4, r1
	ldr r5, _0802AB44 @ =gCamera
	ldr r0, _0802AB48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802AB8E
	ldr r3, _0802AB4C @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #8
	beq _0802AB50
	adds r0, r2, #0
	bl TaskDestroy
	b _0802ABC2
	.align 2, 0
_0802AB3C: .4byte gCurTask
_0802AB40: .4byte IWRAM_START + 0x30
_0802AB44: .4byte gCamera
_0802AB48: .4byte gGameMode
_0802AB4C: .4byte gPlayer
_0802AB50:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802ABC2
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r5]
	adds r2, r3, #0
	adds r2, #0x7c
	subs r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, _0802ABB0 @ =0xFFFFCFFF
	ands r2, r0
	str r2, [r4, #0x10]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	orrs r2, r0
	str r2, [r4, #0x10]
_0802AB8E:
	adds r0, r4, #0
	bl sub_8004558
	lsls r0, r6, #0x18
	asrs r2, r0, #0x18
	movs r3, #1
	ands r2, r3
	ldr r0, _0802ABB4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802ABB8
	cmp r2, r3
	bne _0802ABBC
	b _0802ABC2
	.align 2, 0
_0802ABB0: .4byte 0xFFFFCFFF
_0802ABB4: .4byte gUnknown_03005590
_0802ABB8:
	cmp r2, #0
	beq _0802ABC2
_0802ABBC:
	adds r0, r4, #0
	bl sub_80051E8
_0802ABC2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_802ABC8
sub_802ABC8: @ 0x0802ABC8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ABEC @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r7, _0802ABF0 @ =gCamera
	ldr r3, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r3
	cmp r0, #0
	beq _0802ABF4
	adds r0, r2, #0
	bl TaskDestroy
	b _0802AC4E
	.align 2, 0
_0802ABEC: .4byte gCurTask
_0802ABF0: .4byte gCamera
_0802ABF4:
	movs r5, #0
	movs r6, #0
	movs r2, #0
	ldr r0, _0802AC54 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802AC26
	ldr r1, _0802AC58 @ =gPlayer
	ldr r0, [r1, #8]
	adds r2, r1, #0
	adds r2, #0x7c
	asrs r0, r0, #8
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r1, #0xc]
	lsls r0, r0, #8
	lsrs r6, r0, #0x10
	adds r1, #0x90
	ldr r0, [r1]
	ldr r2, [r0, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
_0802AC26:
	ldr r1, [r7]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r7, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, _0802AC5C @ =0xFFFFCFFF
	ands r3, r0
	orrs r3, r2
	str r3, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802AC4E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AC54: .4byte gGameMode
_0802AC58: .4byte gPlayer
_0802AC5C: .4byte 0xFFFFCFFF

	thumb_func_start sub_802AC60
sub_802AC60: @ 0x0802AC60
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ACB0 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r2, _0802ACB4 @ =IWRAM_START + 0x30
	adds r0, r1, r2
	ldrb r7, [r0]
	orrs r5, r1
	ldr r0, _0802ACB8 @ =gCamera
	mov ip, r0
	ldr r0, _0802ACBC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802ACC8
	ldr r1, _0802ACC0 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #0x18
	asrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r2, r1
	adds r1, #0x57
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802ACD8
	ldr r1, _0802ACC4 @ =IWRAM_START + 0x50
	adds r0, r2, r1
	ldrh r4, [r0]
	adds r1, #2
	adds r0, r2, r1
	ldrh r3, [r0]
	ldr r2, [r6, #0x10]
	b _0802AD02
	.align 2, 0
_0802ACB0: .4byte gCurTask
_0802ACB4: .4byte IWRAM_START + 0x30
_0802ACB8: .4byte gCamera
_0802ACBC: .4byte gGameMode
_0802ACC0: .4byte gMultiplayerPlayerTasks
_0802ACC4: .4byte IWRAM_START + 0x50
_0802ACC8:
	ldr r2, _0802ACE0 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802ACE4
_0802ACD8:
	adds r0, r3, #0
	bl TaskDestroy
	b _0802AD5A
	.align 2, 0
_0802ACE0: .4byte gPlayer
_0802ACE4:
	ldr r0, [r2, #8]
	adds r1, r2, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r2, #0xc]
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r2, [r0, #0x1c]
_0802AD02:
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
	mov r0, ip
	ldr r1, [r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r0, ip
	ldr r1, [r0, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r0, [r5, #0x10]
	ldr r1, _0802AD48 @ =0xFFFFCFFF
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r3, #1
	adds r2, r3, #0
	bics r2, r7
	ldr r0, _0802AD4C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AD50
	cmp r2, r3
	bne _0802AD54
	b _0802AD5A
	.align 2, 0
_0802AD48: .4byte 0xFFFFCFFF
_0802AD4C: .4byte gUnknown_03005590
_0802AD50:
	cmp r2, #0
	beq _0802AD5A
_0802AD54:
	adds r0, r5, #0
	bl sub_80051E8
_0802AD5A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802AD60
sub_802AD60: @ 0x0802AD60
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ADAC @ =gCurTask
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r2, _0802ADB0 @ =IWRAM_START + 0x30
	adds r0, r1, r2
	ldrb r2, [r0]
	orrs r5, r1
	ldr r0, _0802ADB4 @ =gCamera
	mov ip, r0
	ldr r0, _0802ADB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802AE4C
	ldr r1, _0802ADBC @ =gMultiplayerPlayerTasks
	lsls r2, r2, #0x18
	asrs r0, r2, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r3, r1
	adds r1, #0x57
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r0, #0x50
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	bne _0802ADC0
	adds r0, r4, #0
	bl TaskDestroy
	b _0802AE52
	.align 2, 0
_0802ADAC: .4byte gCurTask
_0802ADB0: .4byte IWRAM_START + 0x30
_0802ADB4: .4byte gCamera
_0802ADB8: .4byte gGameMode
_0802ADBC: .4byte gMultiplayerPlayerTasks
_0802ADC0:
	ldr r2, _0802AE04 @ =IWRAM_START + 0x50
	adds r0, r3, r2
	mov r2, ip
	ldr r1, [r2]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, _0802AE08 @ =IWRAM_START + 0x52
	adds r0, r3, r1
	ldr r1, [r2, #4]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r5, #0x10]
	ldr r0, _0802AE0C @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r5, #0x10]
	ldr r2, [r6, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
	orrs r2, r1
	str r2, [r5, #0x10]
	ldr r0, _0802AE10 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802AE14
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	b _0802AE18
	.align 2, 0
_0802AE04: .4byte IWRAM_START + 0x50
_0802AE08: .4byte IWRAM_START + 0x52
_0802AE0C: .4byte 0xFFFFCFFF
_0802AE10: .4byte gUnknown_03005424
_0802AE14:
	ldr r0, _0802AE38 @ =0xFFFFF7FF
	ands r2, r0
_0802AE18:
	str r2, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	asrs r2, r7, #0x18
	movs r3, #1
	ands r2, r3
	ldr r0, _0802AE3C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AE40
	cmp r2, r3
	bne _0802AE44
	b _0802AE52
	.align 2, 0
_0802AE38: .4byte 0xFFFFF7FF
_0802AE3C: .4byte gUnknown_03005590
_0802AE40:
	cmp r2, #0
	beq _0802AE52
_0802AE44:
	adds r0, r5, #0
	bl sub_80051E8
	b _0802AE52
_0802AE4C:
	adds r0, r4, #0
	bl TaskDestroy
_0802AE52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802AE58
sub_802AE58: @ 0x0802AE58
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_802AE6C
sub_802AE6C: @ 0x0802AE6C
	push {r4, r5, r6, r7, lr}
	ldr r2, _0802AEF0 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x1c
	adds r6, r0, r1
	adds r1, #0x30
	adds r5, r0, r1
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r5, #6]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r5, #8]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r3, r0, #3
	movs r7, #0x80
	lsls r7, r7, #1
	cmp r3, r7
	ble _0802AEA0
	adds r3, r7, #0
_0802AEA0:
	strh r3, [r5, #2]
	strh r3, [r5, #4]
	ldrh r1, [r4, #0x14]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802AEB2
	rsbs r0, r3, #0
	strh r0, [r5, #2]
_0802AEB2:
	ldrh r1, [r4, #0x14]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AEC2
	ldrh r0, [r5, #4]
	rsbs r0, r0, #0
	strh r0, [r5, #4]
_0802AEC2:
	ldrh r0, [r5, #6]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802AEE6
	ldrh r0, [r5, #8]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0802AEE6
	ldrh r3, [r4, #0x10]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _0802AEF4
_0802AEE6:
	ldr r0, [r2]
	bl TaskDestroy
	b _0802AF50
	.align 2, 0
_0802AEF0: .4byte gCurTask
_0802AEF4:
	cmp r0, #0x40
	bgt _0802AF1C
	ldr r1, _0802AF58 @ =gSineTable
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	rsbs r0, r0, #0
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_0802AF1C:
	adds r0, r3, #1
	strh r0, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	ldr r2, _0802AF5C @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_0802AF50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF58: .4byte gSineTable
_0802AF5C: .4byte gUnknown_030054B8

	thumb_func_start sub_802AF60
sub_802AF60: @ 0x0802AF60
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	ldr r4, _0802AFFC @ =gCamera
	ldr r0, _0802B000 @ =sub_802AE6C
	str r0, [sp]
	ldr r0, _0802B004 @ =sub_801F550
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F15C
	mov r8, r0
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldr r1, [r4]
	lsls r1, r1, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r2]
	ldr r1, [r4, #4]
	lsls r1, r1, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r2, #4]
	movs r4, #0
	strh r4, [r2, #8]
	movs r0, #0x90
	lsls r0, r0, #1
	strh r0, [r2, #0xa]
	strh r4, [r2, #0x10]
	adds r6, #0x60
	ldrb r0, [r6]
	strb r0, [r2, #0x1a]
	ldr r0, _0802B008 @ =IWRAM_START + 0x1C
	adds r6, r5, r0
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0802B00C @ =0x00000366
	strh r0, [r6, #0xa]
	movs r0, #5
	mov r1, sb
	subs r0, r0, r1
	ldr r2, _0802B010 @ =IWRAM_START + 0x3C
	adds r1, r5, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	ldr r0, _0802B014 @ =IWRAM_START + 0x4C
	adds r5, r5, r0
	strh r4, [r5]
	strh r4, [r5, #2]
	strh r4, [r5, #4]
	strh r4, [r5, #6]
	strh r4, [r5, #8]
	mov r0, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802AFFC: .4byte gCamera
_0802B000: .4byte sub_802AE6C
_0802B004: .4byte sub_801F550
_0802B008: .4byte IWRAM_START + 0x1C
_0802B00C: .4byte 0x00000366
_0802B010: .4byte IWRAM_START + 0x3C
_0802B014: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_802B018
sub_802B018: @ 0x0802B018
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r1, _0802B03C @ =gUnknown_03005B34
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	ble _0802B040
	movs r0, #0
	b _0802B0F2
	.align 2, 0
_0802B03C: .4byte gUnknown_03005B34
_0802B040:
	adds r0, r2, #1
	strb r0, [r1]
	ldr r0, _0802B09C @ =sub_802B1AC
	str r0, [sp]
	ldr r0, _0802B0A0 @ =sub_802B3EC
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F15C
	mov ip, r0
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	adds r0, #0x1c
	adds r4, r2, r0
	ldr r1, _0802B0A4 @ =IWRAM_START + 0x4C
	adds r5, r2, r1
	str r6, [r3]
	str r7, [r3, #4]
	movs r6, #0
	movs r1, #0
	mov r0, r8
	strh r0, [r3, #8]
	ldr r0, _0802B0A8 @ =0x0000FF80
	strh r0, [r3, #0xa]
	strh r1, [r3, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	strh r1, [r3, #0x14]
	mov r1, sb
	cmp r1, #0
	bne _0802B0B8
	ldr r0, _0802B0AC @ =0x06012A40
	str r0, [r4, #4]
	ldr r0, _0802B0B0 @ =0x00000355
	strh r0, [r4, #0xa]
	ldr r1, _0802B0B4 @ =IWRAM_START + 0x3C
	adds r0, r2, r1
	strb r6, [r0]
	b _0802B0DE
	.align 2, 0
_0802B09C: .4byte sub_802B1AC
_0802B0A0: .4byte sub_802B3EC
_0802B0A4: .4byte IWRAM_START + 0x4C
_0802B0A8: .4byte 0x0000FF80
_0802B0AC: .4byte 0x06012A40
_0802B0B0: .4byte 0x00000355
_0802B0B4: .4byte IWRAM_START + 0x3C
_0802B0B8:
	ldr r0, _0802B100 @ =0x06012AC0
	str r0, [r4, #4]
	ldr r0, _0802B104 @ =0x00000356
	strh r0, [r4, #0xa]
	ldr r1, _0802B108 @ =IWRAM_START + 0x3C
	adds r0, r2, r1
	strb r6, [r0]
	ldr r2, _0802B10C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0802B110 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0802B114 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r0, r1
	lsrs r0, r0, #0x10
	strh r0, [r3, #0x14]
_0802B0DE:
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r1, [r5]
	strh r1, [r5, #2]
	strh r1, [r5, #4]
	strh r1, [r5, #6]
	strh r1, [r5, #8]
	mov r0, ip
_0802B0F2:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B100: .4byte 0x06012AC0
_0802B104: .4byte 0x00000356
_0802B108: .4byte IWRAM_START + 0x3C
_0802B10C: .4byte gPseudoRandom
_0802B110: .4byte 0x00196225
_0802B114: .4byte 0x3C6EF35F

	thumb_func_start sub_802B118
sub_802B118: @ 0x0802B118
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r2, #0
	ldr r0, _0802B19C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B192
	ldr r7, _0802B1A0 @ =gPseudoRandom
	ldr r0, [r7]
	ldr r6, _0802B1A4 @ =0x00196225
	muls r0, r6, r0
	ldr r1, _0802B1A8 @ =0x3C6EF35F
	mov ip, r1
	adds r1, r0, r1
	str r1, [r7]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802B192
	muls r1, r6, r1
	ldr r3, _0802B1A8 @ =0x3C6EF35F
	adds r1, r1, r3
	movs r2, #0xf0
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	lsrs r4, r0, #8
	adds r0, r1, #0
	muls r0, r6, r0
	adds r3, r0, r3
	str r3, [r7]
	adds r0, r3, #0
	ands r0, r2
	lsrs r0, r0, #8
	adds r2, r0, #0
	subs r2, #8
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B172
	rsbs r4, r4, #0
_0802B172:
	ldr r0, [r5, #8]
	subs r0, r0, r4
	ldr r1, [r5, #0xc]
	subs r1, r1, r2
	movs r4, #0x10
	ldrsh r2, [r5, r4]
	muls r3, r6, r3
	add r3, ip
	str r3, [r7]
	movs r4, #0x80
	lsls r4, r4, #1
	ands r3, r4
	lsrs r3, r3, #8
	bl sub_802B018
	movs r2, #1
_0802B192:
	adds r0, r2, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B19C: .4byte gUnknown_03005590
_0802B1A0: .4byte gPseudoRandom
_0802B1A4: .4byte 0x00196225
_0802B1A8: .4byte 0x3C6EF35F

	thumb_func_start sub_802B1AC
sub_802B1AC: @ 0x0802B1AC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802B268 @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	adds r1, #0x1c
	adds r5, r0, r1
	ldr r4, _0802B26C @ =IWRAM_START + 0x4C
	adds r7, r0, r4
	ldr r1, [r6]
	ldr r4, [r6, #4]
	movs r0, #0x10
	ldrsh r2, [r6, r0]
	ldr r3, _0802B270 @ =gSineTable
	movs r0, #0xff
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r1, r1, r0
	ldr r3, _0802B274 @ =gCamera
	asrs r1, r1, #8
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r7, #6]
	asrs r4, r4, #8
	ldr r0, [r3, #4]
	subs r0, r4, r0
	strh r0, [r7, #8]
	adds r2, #1
	lsls r2, r2, #4
	movs r0, #0x80
	lsls r0, r0, #1
	mov r3, ip
	cmp r2, r0
	ble _0802B200
	adds r2, r0, #0
_0802B200:
	strh r2, [r7, #2]
	strh r2, [r7, #4]
	ldrh r1, [r6, #0x14]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B212
	rsbs r0, r2, #0
	strh r0, [r7, #2]
_0802B212:
	ldrh r1, [r6, #0x14]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B222
	ldrh r0, [r7, #4]
	rsbs r0, r0, #0
	strh r0, [r7, #4]
_0802B222:
	ldrh r0, [r7, #6]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802B260
	ldrh r0, [r7, #8]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0802B260
	ldr r2, _0802B278 @ =gUnknown_03005660
	ldrb r0, [r2]
	cmp r0, #1
	bne _0802B260
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _0802B260
	subs r1, r4, #3
	cmp r1, r0
	blt _0802B260
	ldrh r2, [r6, #0x10]
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0802B27C
_0802B260:
	ldr r0, [r3]
	bl TaskDestroy
	b _0802B2CE
	.align 2, 0
_0802B268: .4byte gCurTask
_0802B26C: .4byte IWRAM_START + 0x4C
_0802B270: .4byte gSineTable
_0802B274: .4byte gCamera
_0802B278: .4byte gUnknown_03005660
_0802B27C:
	movs r4, #8
	ldrsh r1, [r6, r4]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	movs r0, #0xa
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r6, #4]
	ldrh r1, [r6, #8]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	subs r1, r1, r0
	strh r1, [r6, #8]
	adds r0, r2, #1
	strh r0, [r6, #0x10]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	ldr r2, _0802B2D4 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_0802B2CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B2D4: .4byte gUnknown_030054B8

	thumb_func_start sub_802B2D8
sub_802B2D8: @ 0x0802B2D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0802B304 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r7, [r0]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802B308
	adds r0, r2, #0
	bl TaskDestroy
	b _0802B392
	.align 2, 0
_0802B304: .4byte gCurTask
_0802B308:
	ldr r0, _0802B3A0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0802B392
	ldr r2, _0802B3A4 @ =gPseudoRandom
	ldr r0, [r2]
	ldr r3, _0802B3A8 @ =0x00196225
	muls r0, r3, r0
	ldr r5, _0802B3AC @ =0x3C6EF35F
	adds r1, r0, r5
	str r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802B392
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, r0, r5
	str r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	lsrs r4, r0, #8
	mov sl, r2
	adds r6, r3, #0
	ldr r0, _0802B3B0 @ =0x0007FF00
	mov sb, r0
	ldr r1, _0802B3B4 @ =0xFFFFFC00
	mov r8, r1
_0802B348:
	mov r2, sl
	ldr r0, [r2]
	muls r0, r6, r0
	adds r0, r0, r5
	adds r1, r0, #0
	mov r3, sb
	ands r1, r3
	lsrs r1, r1, #8
	add r1, r8
	muls r0, r6, r0
	adds r0, r0, r5
	adds r2, r0, #0
	ands r2, r3
	lsrs r2, r2, #8
	add r2, r8
	adds r3, r0, #0
	muls r3, r6, r3
	adds r3, r3, r5
	mov r0, sl
	str r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r3, r0
	lsrs r3, r3, #8
	ldr r0, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	adds r1, r1, r2
	ldr r2, _0802B3B8 @ =0xFFFFF400
	adds r1, r1, r2
	movs r2, #0
	bl sub_802B018
	adds r0, r4, #0
	subs r4, #1
	cmp r0, #0
	bne _0802B348
_0802B392:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B3A0: .4byte gUnknown_03005590
_0802B3A4: .4byte gPseudoRandom
_0802B3A8: .4byte 0x00196225
_0802B3AC: .4byte 0x3C6EF35F
_0802B3B0: .4byte 0x0007FF00
_0802B3B4: .4byte 0xFFFFFC00
_0802B3B8: .4byte 0xFFFFF400

	thumb_func_start sub_802B3BC
sub_802B3BC: @ 0x0802B3BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802B3E4 @ =sub_802B2D8
	ldr r2, _0802B3E8 @ =0x00004001
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r4, [r1]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802B3E4: .4byte sub_802B2D8
_0802B3E8: .4byte 0x00004001

	thumb_func_start sub_802B3EC
sub_802B3EC: @ 0x0802B3EC
	ldr r1, _0802B3F8 @ =gUnknown_03005B34
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802B3F8: .4byte gUnknown_03005B34

	thumb_func_start sub_802B3FC
sub_802B3FC: @ 0x0802B3FC
	push {r4, r5, lr}
	ldr r0, _0802B420 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq _0802B416
	ldr r0, [r3]
	cmp r0, #0
	bgt _0802B424
_0802B416:
	adds r0, r2, #0
	bl TaskDestroy
	b _0802B4EA
	.align 2, 0
_0802B420: .4byte gCurTask
_0802B424:
	ldr r5, _0802B448 @ =gCamera
	ldr r0, [r3, #0x10]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802B458
	ldr r2, _0802B44C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0802B450 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0802B454 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x17
	adds r1, r0, #0
	subs r1, #0xff
	b _0802B466
	.align 2, 0
_0802B448: .4byte gCamera
_0802B44C: .4byte gPseudoRandom
_0802B450: .4byte 0x00196225
_0802B454: .4byte 0x3C6EF35F
_0802B458:
	ldr r0, _0802B480 @ =gSineTable
	ldr r1, [r3, #0x14]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
_0802B466:
	ldr r0, [r3]
	muls r0, r1, r0
	asrs r2, r0, #0x10
	ldr r0, [r3, #0x10]
	movs r1, #3
	ands r1, r0
	adds r4, r0, #0
	cmp r1, #1
	beq _0802B484
	cmp r1, #2
	beq _0802B48C
	b _0802B496
	.align 2, 0
_0802B480: .4byte gSineTable
_0802B484:
	cmp r2, #0
	bge _0802B496
	rsbs r2, r2, #0
	b _0802B496
_0802B48C:
	adds r0, r2, #0
	cmp r2, #0
	bge _0802B494
	rsbs r0, r2, #0
_0802B494:
	rsbs r2, r0, #0
_0802B496:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _0802B4AA
	ldr r0, _0802B4F0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B4C8
_0802B4AA:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0802B4B8
	adds r0, r5, #0
	adds r0, #0x60
	strh r2, [r0]
_0802B4B8:
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802B4C8
	adds r0, r5, #0
	adds r0, #0x62
	strh r2, [r0]
_0802B4C8:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	ble _0802B4D2
	subs r0, #1
	str r0, [r3, #0xc]
_0802B4D2:
	ldr r1, [r3]
	cmp r1, #0
	ble _0802B4DE
	ldr r0, [r3, #4]
	subs r0, r1, r0
	str r0, [r3]
_0802B4DE:
	ldr r0, [r3, #0x14]
	ldr r1, [r3, #8]
	adds r0, r0, r1
	ldr r1, _0802B4F4 @ =0x000003FF
	ands r0, r1
	str r0, [r3, #0x14]
_0802B4EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B4F0: .4byte gUnknown_03005590
_0802B4F4: .4byte 0x000003FF

	thumb_func_start sub_802B4F8
sub_802B4F8: @ 0x0802B4F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	ldr r0, _0802B540 @ =sub_802B3FC
	ldr r2, _0802B544 @ =0x00000EFF
	ldr r1, _0802B548 @ =sub_802B54C
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r4, [r1]
	str r5, [r1, #4]
	str r6, [r1, #8]
	movs r2, #0
	str r2, [r1, #0x14]
	mov r2, r8
	str r2, [r1, #0xc]
	str r7, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B540: .4byte sub_802B3FC
_0802B544: .4byte 0x00000EFF
_0802B548: .4byte sub_802B54C

	thumb_func_start sub_802B54C
sub_802B54C: @ 0x0802B54C
	push {lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r3, _0802B580 @ =gCamera
	ldr r0, [r2, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802B56A
	adds r1, r3, #0
	adds r1, #0x60
	movs r0, #0
	strh r0, [r1]
_0802B56A:
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802B57C
	adds r1, r3, #0
	adds r1, #0x62
	movs r0, #0
	strh r0, [r1]
_0802B57C:
	pop {r0}
	bx r0
	.align 2, 0
_0802B580: .4byte gCamera

	thumb_func_start sub_802B584
sub_802B584: @ 0x0802B584
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _0802B5BC @ =gPlayerControls
	mov r3, sp
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	movs r1, #0
	ldr r7, _0802B5C0 @ =gLoadedSaveGame
	movs r5, #0x80
	lsls r5, r5, #1
	movs r6, #1
_0802B5A0:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	add r1, sp
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _0802B5DA
	cmp r1, #1
	bgt _0802B5C4
	cmp r1, #0
	beq _0802B5CA
	b _0802B5F6
	.align 2, 0
_0802B5BC: .4byte gPlayerControls
_0802B5C0: .4byte gLoadedSaveGame
_0802B5C4:
	cmp r1, #2
	beq _0802B5E8
	b _0802B5F6
_0802B5CA:
	cmp r2, #2
	bne _0802B5D2
	strh r5, [r4]
	b _0802B5F6
_0802B5D2:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4]
	b _0802B5F6
_0802B5DA:
	cmp r2, #2
	bne _0802B5E2
	strh r5, [r4, #2]
	b _0802B5F6
_0802B5E2:
	lsls r1, r2
	strh r1, [r4, #2]
	b _0802B5F6
_0802B5E8:
	cmp r2, #2
	bne _0802B5F0
	strh r5, [r4, #4]
	b _0802B5F6
_0802B5F0:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4, #4]
_0802B5F6:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0802B5A0
	ldr r1, [r7]
	ldrh r0, [r4]
	strh r0, [r1, #0x2c]
	ldrh r0, [r4, #2]
	strh r0, [r1, #0x2e]
	ldrh r0, [r4, #4]
	strh r0, [r1, #0x30]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802B61C
sub_802B61C: @ 0x0802B61C
	ldr r3, _0802B628 @ =gPlayerControls
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_0802B628: .4byte gPlayerControls

	thumb_func_start sub_802B62C
sub_802B62C: @ 0x0802B62C
	ldr r3, _0802B704 @ =gPlayer
	movs r2, #0
	movs r0, #0
	strh r0, [r3, #4]
	str r0, [r3, #8]
	str r0, [r3, #0xc]
	strh r0, [r3, #0x10]
	strh r0, [r3, #0x12]
	strh r0, [r3, #0x14]
	strb r2, [r3, #0x16]
	strb r2, [r3, #0x17]
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x24
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	strh r0, [r3, #0x26]
	strh r0, [r3, #0x2a]
	strh r0, [r3, #0x2c]
	strh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	strh r0, [r3, #0x32]
	strh r0, [r3, #0x34]
	adds r1, #0x11
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	str r0, [r3, #0x3c]
	str r0, [r3, #0x40]
	str r0, [r3, #0x44]
	str r0, [r3, #0x48]
	str r0, [r3, #0x4c]
	adds r1, #0x18
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	str r0, [r3, #0x78]
	adds r1, #6
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x84
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0802B704: .4byte gPlayer

	thumb_func_start sub_802B708
sub_802B708: @ 0x0802B708
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	bl sub_802B62C
	ldr r1, _0802B7D8 @ =gRingCount
	movs r0, #0x32
	strh r0, [r1]
	ldr r0, _0802B7DC @ =gPlayer
	movs r4, #0
	str r4, [r0, #0x20]
	str r4, [r0, #0x78]
	movs r5, #0
	movs r6, #0x80
	lsls r6, r6, #2
	strh r6, [r0, #0x10]
	strh r6, [r0, #0x14]
	ldr r0, _0802B7E0 @ =gUnknown_03005490
	str r4, [r0]
	ldr r0, _0802B7E4 @ =sub_802BC10
	movs r1, #0xc0
	lsls r1, r1, #1
	ldr r2, _0802B7E8 @ =0x00004040
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _0802B7EC @ =gUnknown_03005B40
	str r0, [r1]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r0, #0x20
	str r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #0xa
	str r0, [r1, #4]
	movs r0, #0x90
	lsls r0, r0, #9
	str r0, [r1, #8]
	str r4, [r1, #0x10]
	str r4, [r1, #0x14]
	strh r4, [r1, #0x1a]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x20]
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r1, #0xc]
	ldr r2, _0802B7F0 @ =IWRAM_START + 0x22
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _0802B7F4 @ =sub_802C828
	str r0, [r1, #0x24]
	ldr r7, _0802B7F8 @ =IWRAM_START + 0x128
	adds r0, r3, r7
	strb r5, [r0]
	ldr r0, _0802B7FC @ =gInput
	ldrh r0, [r0]
	strh r0, [r1, #0x1c]
	ldr r0, _0802B800 @ =gPressedKeys
	ldrh r0, [r0]
	strh r0, [r1, #0x1e]
	ldr r1, _0802B804 @ =IWRAM_START + 0x129
	adds r0, r3, r1
	strb r5, [r0]
	ldr r2, _0802B808 @ =IWRAM_START + 0x134
	adds r1, r3, r2
	ldr r0, _0802B80C @ =0x06010000
	str r0, [r1, #4]
	ldr r2, _0802B810 @ =gUnknown_080D69C8
	ldrh r0, [r2, #4]
	strh r0, [r1, #0xa]
	ldrb r2, [r2, #6]
	adds r7, #0x2c
	adds r0, r3, r7
	strb r2, [r0]
	strh r6, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0802B814 @ =IWRAM_START + 0x155
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r7, #2
	adds r2, r3, r7
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802B818 @ =IWRAM_START + 0x159
	adds r3, r3, r0
	strb r5, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B7D8: .4byte gRingCount
_0802B7DC: .4byte gPlayer
_0802B7E0: .4byte gUnknown_03005490
_0802B7E4: .4byte sub_802BC10
_0802B7E8: .4byte 0x00004040
_0802B7EC: .4byte gUnknown_03005B40
_0802B7F0: .4byte IWRAM_START + 0x22
_0802B7F4: .4byte sub_802C828
_0802B7F8: .4byte IWRAM_START + 0x128
_0802B7FC: .4byte gInput
_0802B800: .4byte gPressedKeys
_0802B804: .4byte IWRAM_START + 0x129
_0802B808: .4byte IWRAM_START + 0x134
_0802B80C: .4byte 0x06010000
_0802B810: .4byte gUnknown_080D69C8
_0802B814: .4byte IWRAM_START + 0x155
_0802B818: .4byte IWRAM_START + 0x159

	thumb_func_start sub_802B81C
sub_802B81C: @ 0x0802B81C
	push {r4, r5, r6, lr}
	ldr r0, _0802B880 @ =gUnknown_03005B40
	ldr r2, [r0]
	cmp r2, #0
	beq _0802B878
	ldrh r1, [r2, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r1, r5
	ldr r0, _0802B884 @ =sub_802C7E8
	str r0, [r2, #8]
	ldr r0, _0802B888 @ =sub_802C8A0
	str r0, [r5, #0x24]
	ldr r0, _0802B88C @ =IWRAM_START + 0x23
	adds r2, r1, r0
	movs r4, #0
	movs r0, #2
	strb r0, [r2]
	ldr r3, _0802B890 @ =gUnknown_080D69C8
	ldrh r2, [r3, #0x14]
	ldr r6, _0802B894 @ =IWRAM_START + 0x13E
	adds r0, r1, r6
	movs r6, #0
	strh r2, [r0]
	ldrb r2, [r3, #0x16]
	ldr r3, _0802B898 @ =IWRAM_START + 0x154
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0802B89C @ =IWRAM_START + 0x155
	adds r2, r1, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r2, _0802B8A0 @ =IWRAM_START + 0x13C
	adds r0, r1, r2
	strh r4, [r0]
	subs r3, #0xc
	adds r0, r1, r3
	strh r4, [r0]
	adds r2, #0x14
	adds r0, r1, r2
	strh r4, [r0]
	str r4, [r5, #0x10]
	str r4, [r5, #0x14]
	ldr r3, _0802B8A4 @ =IWRAM_START + 0x22
	adds r1, r1, r3
	strb r6, [r1]
_0802B878:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B880: .4byte gUnknown_03005B40
_0802B884: .4byte sub_802C7E8
_0802B888: .4byte sub_802C8A0
_0802B88C: .4byte IWRAM_START + 0x23
_0802B890: .4byte gUnknown_080D69C8
_0802B894: .4byte IWRAM_START + 0x13E
_0802B898: .4byte IWRAM_START + 0x154
_0802B89C: .4byte IWRAM_START + 0x155
_0802B8A0: .4byte IWRAM_START + 0x13C
_0802B8A4: .4byte IWRAM_START + 0x22

	thumb_func_start sub_802B8A8
sub_802B8A8: @ 0x0802B8A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r0, [r4]
	movs r5, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0802B8BA
	b _0802BA72
_0802B8BA:
	ldr r0, _0802B944 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0802B8CC
	b _0802BA72
_0802B8CC:
	ldr r0, _0802B948 @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _0802B94C @ =0x00008C9F
	cmp r1, r0
	bls _0802B964
	ldr r0, _0802B950 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0802B964
	ldr r1, _0802B954 @ =gPlayer
	movs r0, #0x80
	str r0, [r1, #0x20]
	ldr r0, _0802B958 @ =sub_802C8EC
	str r0, [r4, #0x24]
	movs r0, #0x3c
	str r0, [r4, #0xc]
	movs r2, #0
	strh r6, [r4, #0x1a]
	strh r3, [r4, #0x18]
	str r5, [r4]
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #0x15
	strb r0, [r1]
	ldr r1, _0802B95C @ =gUnknown_080D69C8
	adds r0, r1, #0
	adds r0, #0xac
	ldrh r0, [r0]
	movs r5, #0x9f
	lsls r5, r5, #1
	adds r3, r4, r5
	strh r0, [r3]
	adds r1, #0xae
	ldrb r1, [r1]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802B960 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r6, [r0]
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r6, [r0]
	adds r5, #0x12
	adds r0, r4, r5
	strh r6, [r0]
	str r6, [r4, #0x10]
	str r6, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
	b _0802BA72
	.align 2, 0
_0802B944: .4byte gUnknown_03005424
_0802B948: .4byte gUnknown_03005490
_0802B94C: .4byte 0x00008C9F
_0802B950: .4byte gLoadedSaveGame
_0802B954: .4byte gPlayer
_0802B958: .4byte sub_802C8EC
_0802B95C: .4byte gUnknown_080D69C8
_0802B960: .4byte 0x00000155
_0802B964:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802BA0E
	ldr r0, _0802B9F4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _0802BA72
	ldr r1, _0802B9F8 @ =gRingCount
	ldrh r0, [r1]
	adds r5, r0, #0
	cmp r5, #0
	bne _0802BA08
	ldr r1, _0802B9FC @ =gPlayer
	movs r0, #0x80
	str r0, [r1, #0x20]
	movs r1, #0x10
	ldr r0, _0802BA00 @ =sub_802C8EC
	str r0, [r4, #0x24]
	movs r0, #0x3c
	str r0, [r4, #0xc]
	movs r2, #0
	strh r5, [r4, #0x1a]
	adds r0, #0xc4
	strh r0, [r4, #0x18]
	str r1, [r4]
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #0x15
	strb r0, [r1]
	ldr r1, _0802BA04 @ =gUnknown_080D69C8
	adds r0, r1, #0
	adds r0, #0xac
	ldrh r0, [r0]
	movs r7, #0x9f
	lsls r7, r7, #1
	adds r3, r4, r7
	strh r0, [r3]
	adds r1, #0xae
	ldrb r1, [r1]
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	adds r7, #0x17
	adds r1, r4, r7
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r5, [r0]
	subs r3, #0xc
	adds r0, r4, r3
	strh r5, [r0]
	subs r7, #5
	adds r0, r4, r7
	strh r5, [r0]
	str r5, [r4, #0x10]
	str r5, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
	movs r0, #0x77
	bl m4aSongNumStart
	b _0802BA72
	.align 2, 0
_0802B9F4: .4byte gUnknown_03005590
_0802B9F8: .4byte gRingCount
_0802B9FC: .4byte gPlayer
_0802BA00: .4byte sub_802C8EC
_0802BA04: .4byte gUnknown_080D69C8
_0802BA08:
	subs r0, #1
	strh r0, [r1]
	b _0802BA72
_0802BA0E:
	bl sub_8050BB0
	cmp r0, #1
	bne _0802BA72
	ldr r2, _0802BA7C @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0802BA80 @ =sub_802C8A0
	str r0, [r4, #0x24]
	adds r1, r4, #0
	adds r1, #0x23
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802BA84 @ =gUnknown_080D69C8
	ldrh r0, [r1, #0x14]
	movs r3, #0x9f
	lsls r3, r3, #1
	adds r3, r3, r4
	mov ip, r3
	movs r3, #0
	mov r5, ip
	strh r0, [r5]
	ldrb r1, [r1, #0x16]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802BA88 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r2, [r0]
	movs r5, #0xa4
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r2, [r0]
	subs r7, #4
	adds r0, r4, r7
	strh r2, [r0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r3, [r0]
_0802BA72:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802BA7C: .4byte gUnknown_03005424
_0802BA80: .4byte sub_802C8A0
_0802BA84: .4byte gUnknown_080D69C8
_0802BA88: .4byte 0x00000155

	thumb_func_start sub_802BA8C
sub_802BA8C: @ 0x0802BA8C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802BB2C @ =gUnknown_03005B40
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	bl sub_8050BB0
	cmp r0, #1
	beq _0802BB4C
	ldr r1, [r6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802BB4C
	movs r7, #0x80
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _0802BB4C
	movs r2, #0x80
	lsls r2, r2, #2
	adds r4, r1, #0
	ands r4, r2
	cmp r4, #0
	bne _0802BB4C
	ldr r0, _0802BB30 @ =sub_802C480
	str r0, [r6, #0x24]
	movs r3, #0
	movs r0, #0x78
	strh r0, [r6, #0x20]
	movs r0, #0x30
	str r0, [r6, #0xc]
	strh r2, [r6, #0x18]
	subs r0, #0x32
	ands r1, r0
	subs r0, #1
	ands r1, r0
	subs r0, #6
	ands r1, r0
	subs r0, #0x38
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r7
	str r1, [r6]
	ldr r0, _0802BB34 @ =IWRAM_START + 0x23
	adds r1, r5, r0
	movs r0, #3
	strb r0, [r1]
	ldr r2, _0802BB38 @ =gUnknown_080D69C8
	ldrh r1, [r2, #0x1c]
	ldr r7, _0802BB3C @ =IWRAM_START + 0x13E
	adds r0, r5, r7
	strh r1, [r0]
	ldrb r1, [r2, #0x1e]
	ldr r2, _0802BB40 @ =IWRAM_START + 0x154
	adds r0, r5, r2
	strb r1, [r0]
	adds r7, #0x17
	adds r1, r5, r7
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0802BB44 @ =IWRAM_START + 0x13C
	adds r0, r5, r1
	strh r4, [r0]
	subs r2, #0xc
	adds r0, r5, r2
	strh r4, [r0]
	subs r7, #5
	adds r0, r5, r7
	strh r4, [r0]
	str r4, [r6, #0x10]
	str r4, [r6, #0x14]
	ldr r1, _0802BB48 @ =IWRAM_START + 0x22
	adds r0, r5, r1
	strb r3, [r0]
	movs r0, #1
	b _0802BB4E
	.align 2, 0
_0802BB2C: .4byte gUnknown_03005B40
_0802BB30: .4byte sub_802C480
_0802BB34: .4byte IWRAM_START + 0x23
_0802BB38: .4byte gUnknown_080D69C8
_0802BB3C: .4byte IWRAM_START + 0x13E
_0802BB40: .4byte IWRAM_START + 0x154
_0802BB44: .4byte IWRAM_START + 0x13C
_0802BB48: .4byte IWRAM_START + 0x22
_0802BB4C:
	movs r0, #0
_0802BB4E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_802BB54
sub_802BB54: @ 0x0802BB54
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802BBF0 @ =gUnknown_03005B40
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	bl sub_8050BB0
	cmp r0, #1
	beq _0802BBE8
	ldr r1, [r6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802BBE8
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802BBE8
	movs r2, #8
	adds r4, r1, #0
	ands r4, r2
	cmp r4, #0
	bne _0802BBE8
	ldr r0, _0802BBF4 @ =sub_802C55C
	str r0, [r6, #0x24]
	movs r3, #0
	strh r4, [r6, #0x1a]
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r6, #0xc]
	strh r4, [r6, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #1
	ands r1, r0
	orrs r1, r2
	str r1, [r6]
	ldr r0, _0802BBF8 @ =IWRAM_START + 0x23
	adds r1, r5, r0
	movs r0, #0x14
	strb r0, [r1]
	ldr r1, _0802BBFC @ =gUnknown_080D69C8
	adds r0, r1, #0
	adds r0, #0xa4
	ldrh r2, [r0]
	ldr r7, _0802BC00 @ =IWRAM_START + 0x13E
	adds r0, r5, r7
	strh r2, [r0]
	adds r1, #0xa6
	ldrb r1, [r1]
	ldr r2, _0802BC04 @ =IWRAM_START + 0x154
	adds r0, r5, r2
	strb r1, [r0]
	adds r7, #0x17
	adds r1, r5, r7
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0802BC08 @ =IWRAM_START + 0x13C
	adds r0, r5, r1
	strh r4, [r0]
	subs r2, #0xc
	adds r0, r5, r2
	strh r4, [r0]
	subs r7, #5
	adds r0, r5, r7
	strh r4, [r0]
	str r4, [r6, #0x10]
	str r4, [r6, #0x14]
	ldr r1, _0802BC0C @ =IWRAM_START + 0x22
	adds r0, r5, r1
	strb r3, [r0]
_0802BBE8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BBF0: .4byte gUnknown_03005B40
_0802BBF4: .4byte sub_802C55C
_0802BBF8: .4byte IWRAM_START + 0x23
_0802BBFC: .4byte gUnknown_080D69C8
_0802BC00: .4byte IWRAM_START + 0x13E
_0802BC04: .4byte IWRAM_START + 0x154
_0802BC08: .4byte IWRAM_START + 0x13C
_0802BC0C: .4byte IWRAM_START + 0x22

	thumb_func_start sub_802BC10
sub_802BC10: @ 0x0802BC10
	push {r4, r5, lr}
	ldr r0, _0802BC84 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_802BCCC
	ldr r1, [r5, #0x24]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl sub_802C9B0
	adds r0, r5, #0
	bl sub_802B8A8
	ldr r0, _0802BC88 @ =IWRAM_START + 0x129
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802BCBE
	ldr r1, _0802BC8C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0802BC90 @ =gUnknown_03002AE4
	ldr r0, _0802BC94 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802BC98 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0802BC9C @ =gVramGraphicsCopyCursor
	ldr r0, _0802BCA0 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802BCA4 @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802BCB6
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802BCB6
	ldr r0, _0802BCA8 @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _0802BCAC @ =0x00008C9F
	cmp r1, r0
	bls _0802BCB0
	movs r0, #2
	bl CreateGameOverScreen
	b _0802BCC4
	.align 2, 0
_0802BC84: .4byte gCurTask
_0802BC88: .4byte IWRAM_START + 0x129
_0802BC8C: .4byte 0x0000FFFF
_0802BC90: .4byte gUnknown_03002AE4
_0802BC94: .4byte gUnknown_0300287C
_0802BC98: .4byte gUnknown_03005390
_0802BC9C: .4byte gVramGraphicsCopyCursor
_0802BCA0: .4byte gVramGraphicsCopyQueueIndex
_0802BCA4: .4byte gNumLives
_0802BCA8: .4byte gUnknown_03005490
_0802BCAC: .4byte 0x00008C9F
_0802BCB0:
	bl GameStageStart
	b _0802BCC4
_0802BCB6:
	movs r0, #1
	bl CreateGameOverScreen
	b _0802BCC4
_0802BCBE:
	adds r0, r5, #0
	bl sub_802BE1C
_0802BCC4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802BCCC
sub_802BCCC: @ 0x0802BCCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802BCEE
	ldr r0, [r6, #4]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r6, #4]
_0802BCEE:
	ldr r7, [r6, #4]
	ldrh r1, [r6, #0x20]
	movs r2, #0x20
	ldrsh r0, [r6, r2]
	cmp r0, #0
	beq _0802BD04
	subs r0, r1, #1
	strh r0, [r6, #0x20]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802BD0E
_0802BD04:
	ldr r0, [r6]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6]
_0802BD0E:
	ldr r1, _0802BDC8 @ =gUnknown_080D650C
	ldr r0, _0802BDCC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #3
	adds r1, r2, r1
	ldr r0, [r1]
	lsls r0, r0, #8
	adds r3, r6, #0
	adds r3, #0x28
	str r3, [sp, #4]
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp, #8]
	movs r3, #0x94
	lsls r3, r3, #1
	adds r3, r6, r3
	str r3, [sp]
	cmp r7, r0
	blt _0802BDAA
	ldr r0, _0802BDD0 @ =gUnknown_080D661C
	adds r1, r2, r0
	ldr r1, [r1]
	mov r8, r1
	adds r0, #4
	adds r0, r2, r0
	ldr r0, [r0]
	mov sb, r0
	lsls r4, r1, #8
	adds r7, r7, r4
	lsls r5, r0, #8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_804D594
	movs r3, #0
	ldr r0, [sp, #4]
	mov sl, r0
	mov ip, r4
	ldr r4, [sp, #8]
_0802BD60:
	lsls r1, r3, #3
	mov r0, sl
	adds r2, r0, r1
	ldr r0, [r2]
	add r0, ip
	str r0, [r2]
	adds r1, r4, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0802BD60
	ldr r1, _0802BDD4 @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802BDD8 @ =gCamera
	ldr r0, [r1]
	add r0, r8
	str r0, [r1]
	ldr r0, [r1, #0x20]
	add r0, r8
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	add r0, r8
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	add r0, sb
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	add r0, sb
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	add r0, sb
	str r0, [r1, #0x14]
_0802BDAA:
	ldr r1, [r6, #0x24]
	ldr r0, _0802BDDC @ =sub_802C8A0
	cmp r1, r0
	beq _0802BDEC
	ldr r0, _0802BDD8 @ =gCamera
	ldr r0, [r0, #0x10]
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	cmp r7, r1
	bge _0802BDE0
	adds r7, r1, #0
	b _0802BDEC
	.align 2, 0
_0802BDC8: .4byte gUnknown_080D650C
_0802BDCC: .4byte gCurrentLevel
_0802BDD0: .4byte gUnknown_080D661C
_0802BDD4: .4byte gUnknown_03005430
_0802BDD8: .4byte gCamera
_0802BDDC: .4byte sub_802C8A0
_0802BDE0:
	movs r3, #0x9c
	lsls r3, r3, #9
	adds r0, r0, r3
	cmp r7, r0
	ble _0802BDEC
	adds r7, r0, #0
_0802BDEC:
	str r7, [r6, #4]
	ldr r0, [sp]
	ldrb r2, [r0]
	lsls r0, r2, #3
	ldr r3, [sp, #4]
	adds r1, r3, r0
	str r7, [r1]
	ldr r1, [sp, #8]
	adds r0, r1, r0
	ldr r1, [r6, #8]
	str r1, [r0]
	adds r2, #1
	movs r0, #0x1f
	ands r2, r0
	ldr r3, [sp]
	strb r2, [r3]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802BE1C
sub_802BE1C: @ 0x0802BE1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802BE30
	b _0802BF96
_0802BE30:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0x80
	bne _0802BE46
	ldr r0, _0802BEB8 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802BE46
	b _0802BF96
_0802BE46:
	movs r3, #4
	ands r2, r3
	cmp r2, #0
	beq _0802BE5A
	ldr r0, _0802BEB8 @ =gUnknown_03005590
	ldr r0, [r0]
	ands r0, r3
	cmp r0, #0
	beq _0802BE5A
	b _0802BF96
_0802BE5A:
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r1, #0xb6
	lsls r1, r1, #1
	adds r4, r6, r1
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r2, _0802BEBC @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r0, [r6, #0x10]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	ldr r0, [r6, #0x14]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	movs r2, #0
	cmp r0, #0
	beq _0802BE98
	movs r2, #3
_0802BE98:
	ands r1, r3
	cmp r1, #0
	beq _0802BEC4
	lsls r2, r2, #0xc
	ldr r3, _0802BEC0 @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	movs r0, #0x60
	orrs r2, r0
	str r2, [r5, #0x10]
	b _0802BECE
	.align 2, 0
_0802BEB8: .4byte gUnknown_03005590
_0802BEBC: .4byte gCamera
_0802BEC0: .4byte gUnknown_030054B8
_0802BEC4:
	lsls r0, r2, #0xc
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0802BECE:
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, [r6]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802BF24
	ldr r3, _0802BF1C @ =gSineTable
	ldr r1, [r6, #0xc]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0802BF20 @ =0x000003FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	ands r0, r2
	strh r0, [r4]
	strh r1, [r4, #2]
	strh r1, [r4, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r4, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	b _0802BF96
	.align 2, 0
_0802BF1C: .4byte gSineTable
_0802BF20: .4byte 0x000003FF
_0802BF24:
	adds r0, r5, #0
	bl sub_80051E8
	ldr r1, [r6]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0x80
	beq _0802BF96
	movs r0, #0x86
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0802BF96
	movs r4, #0
	subs r0, #0xf0
	adds r0, r0, r6
	mov r8, r0
	ldr r7, _0802BFA0 @ =gCamera
_0802BF48:
	ldr r0, _0802BFA4 @ =gUnknown_03005590
	ldr r0, [r0]
	adds r1, r4, #2
	bl Mod
	adds r4, #1
	cmp r0, #0
	bne _0802BF8E
	lsls r0, r4, #1
	adds r0, r0, r4
	mov r1, r8
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r0, #0x1f
	ands r2, r0
	lsls r2, r2, #3
	adds r0, r6, #0
	adds r0, #0x28
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_0802BF8E:
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0802BF48
_0802BF96:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BFA0: .4byte gCamera
_0802BFA4: .4byte gUnknown_03005590

	thumb_func_start sub_802BFA8
sub_802BFA8: @ 0x0802BFA8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802BFD4 @ =gInput
	ldrh r1, [r0]
	strh r1, [r2, #0x1c]
	ldr r0, _0802BFD8 @ =gPressedKeys
	ldrh r0, [r0]
	strh r0, [r2, #0x1e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802BFF8
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802BFDC
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #0x10
	b _0802C052
	.align 2, 0
_0802BFD4: .4byte gInput
_0802BFD8: .4byte gPressedKeys
_0802BFDC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802BFEE
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #0x18]
	movs r0, #0xc
	b _0802C052
_0802BFEE:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #6
	b _0802C052
_0802BFF8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802C02C
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802C012
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #0x12
	b _0802C052
_0802C012:
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0802C026
	strh r3, [r2, #0x18]
	movs r0, #0xe
	b _0802C052
_0802C026:
	strh r0, [r2, #0x18]
	movs r0, #4
	b _0802C052
_0802C02C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802C03E
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #8
	b _0802C052
_0802C03E:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802C050
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x18]
	movs r0, #0xa
	b _0802C052
_0802C050:
	movs r0, #0
_0802C052:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802C058
sub_802C058: @ 0x0802C058
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x30]
	adds r0, r4, #0
	bl sub_802BFA8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _0802C078
	b _0802C1BC
_0802C078:
	movs r1, #0x1a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0802C082
	rsbs r0, r0, #0
_0802C082:
	movs r2, #0
	mov ip, r2
	movs r7, #0
	adds r0, #0x40
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0802C09A
	strh r1, [r4, #0x1a]
_0802C09A:
	ldrh r1, [r4, #0x1c]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0802C0FC
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r3, r4, r5
	ldrb r0, [r3]
	cmp r0, #1
	bne _0802C0B6
	b _0802C236
_0802C0B6:
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802C0F4 @ =gUnknown_080D69C8
	ldrh r0, [r1, #0xc]
	subs r5, #0x16
	adds r2, r4, r5
	strh r0, [r2]
	ldrb r0, [r1, #0xe]
	strb r0, [r3]
	ldr r0, _0802C0F8 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r7, [r0]
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r7, [r0]
	movs r3, #0xa8
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r7, [r0]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	b _0802C150
	.align 2, 0
_0802C0F4: .4byte gUnknown_080D69C8
_0802C0F8: .4byte 0x00000155
_0802C0FC:
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0802C164
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r3, r4, r7
	ldrb r0, [r3]
	cmp r0, #3
	bne _0802C116
	b _0802C236
_0802C116:
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802C15C @ =gUnknown_080D69C8
	ldrh r0, [r1, #0x14]
	subs r7, #0x16
	adds r2, r4, r7
	strh r0, [r2]
	ldrb r0, [r1, #0x16]
	strb r0, [r3]
	ldr r0, _0802C160 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r5, [r0]
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r5, [r0]
	movs r3, #0xa8
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r5, [r0]
	str r5, [r4, #0x10]
	str r5, [r4, #0x14]
_0802C150:
	adds r0, r4, #0
	adds r0, #0x22
	mov r5, ip
	strb r5, [r0]
	b _0802C236
	.align 2, 0
_0802C15C: .4byte gUnknown_080D69C8
_0802C160: .4byte 0x00000155
_0802C164:
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r5, r4, r7
	ldrb r0, [r5]
	cmp r0, #2
	beq _0802C236
	adds r0, r4, #0
	adds r0, #0x23
	mov r1, ip
	strb r1, [r0]
	ldr r1, _0802C1B4 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	subs r7, #0x16
	adds r2, r4, r7
	strh r0, [r2]
	ldrb r0, [r1, #6]
	strb r0, [r5]
	ldr r0, _0802C1B8 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r3, [r0]
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r3, [r0]
	movs r5, #0xa8
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r3, [r0]
	str r3, [r4, #0x10]
	str r3, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	mov r7, ip
	strb r7, [r0]
	b _0802C236
	.align 2, 0
_0802C1B4: .4byte gUnknown_080D69C8
_0802C1B8: .4byte 0x00000155
_0802C1BC:
	ldrh r0, [r4, #0x1a]
	movs r2, #0x1a
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bge _0802C1D2
	adds r0, #0x40
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0802C1E4
	b _0802C1E0
_0802C1D2:
	cmp r1, #0
	ble _0802C1E4
	subs r0, #0x40
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0802C1E4
_0802C1E0:
	strh r6, [r4, #0x1a]
	strh r6, [r4, #0x18]
_0802C1E4:
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r5, r4, r3
	ldrb r0, [r5]
	cmp r0, #2
	beq _0802C230
	adds r0, r4, #0
	adds r0, #0x23
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0802C2B4 @ =gUnknown_080D69C8
	ldrh r0, [r2, #4]
	movs r7, #0x9f
	lsls r7, r7, #1
	movs r3, #0
	strh r0, [r7, r4]
	ldrb r0, [r2, #6]
	strb r0, [r5]
	ldr r0, _0802C2B8 @ =0x00000155
	adds r2, r4, r0
	movs r0, #0xff
	strb r0, [r2]
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r1, [r0]
	movs r5, #0xa4
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r1, [r0]
	adds r7, #0x12
	adds r0, r4, r7
	strh r1, [r0]
	str r1, [r4, #0x10]
	str r1, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r3, [r0]
_0802C230:
	ldr r0, [r4, #4]
	subs r0, #0x80
	str r0, [r4, #4]
_0802C236:
	ldrh r1, [r4, #0x1e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0802C30C
	ldr r0, _0802C2BC @ =sub_802C358
	str r0, [r4, #0x24]
	movs r0, #0x14
	str r0, [r4, #0xc]
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x82
	orrs r0, r1
	str r0, [r4]
	movs r0, #0x70
	bl m4aSongNumStart
	cmp r6, #0
	beq _0802C2C0
	adds r0, r4, #0
	adds r0, #0x23
	movs r2, #0
	strb r6, [r0]
	ldr r1, _0802C2B4 @ =gUnknown_080D69C8
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	movs r3, #0x9f
	lsls r3, r3, #1
	adds r3, r3, r4
	mov ip, r3
	movs r3, #0
	mov r5, ip
	strh r1, [r5]
	ldrb r1, [r0, #6]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802C2B8 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r2, [r0]
	movs r5, #0xa4
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r2, [r0]
	subs r7, #4
	adds r0, r4, r7
	strh r2, [r0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r3, [r0]
	b _0802C30C
	.align 2, 0
_0802C2B4: .4byte gUnknown_080D69C8
_0802C2B8: .4byte 0x00000155
_0802C2BC: .4byte sub_802C358
_0802C2C0:
	movs r2, #0
	strh r6, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0802C34C @ =gUnknown_080D69C8
	ldrh r1, [r0, #0x24]
	movs r5, #0x9f
	lsls r5, r5, #1
	adds r3, r4, r5
	strh r1, [r3]
	adds r0, #0x26
	ldrb r1, [r0]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802C350 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r6, [r0]
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r6, [r0]
	adds r5, #0x12
	adds r0, r4, r5
	strh r6, [r0]
	str r6, [r4, #0x10]
	str r6, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
_0802C30C:
	ldr r2, _0802C354 @ =gSineTable
	ldrh r0, [r4, #0x18]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r5, #0x1a
	ldrsh r0, [r4, r5]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r2, #0x1a
	ldrsh r0, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C34C: .4byte gUnknown_080D69C8
_0802C350: .4byte 0x00000155
_0802C354: .4byte gSineTable

	thumb_func_start sub_802C358
sub_802C358: @ 0x0802C358
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	subs r4, r0, #1
	str r4, [r3, #0xc]
	cmp r4, #0
	bne _0802C3CC
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r2, r3, r0
	ldr r0, _0802C410 @ =sub_802C058
	str r0, [r3, #0x24]
	ldr r0, [r3]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x30]
	adds r0, r3, #0
	adds r0, #0x23
	strb r4, [r0]
	ldr r1, _0802C414 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	movs r2, #0x9f
	lsls r2, r2, #1
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r5, ip
	strh r0, [r5]
	ldrb r1, [r1, #6]
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r0, r3, r5
	strb r1, [r0]
	ldr r0, _0802C418 @ =0x00000155
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r3, r1
	strh r4, [r0]
	subs r5, #0xc
	adds r0, r3, r5
	strh r4, [r0]
	adds r1, #0x14
	adds r0, r3, r1
	strh r4, [r0]
	str r4, [r3, #0x10]
	str r4, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x22
	strb r2, [r0]
_0802C3CC:
	ldr r0, [r3, #0xc]
	cmp r0, #8
	bne _0802C41C
	ldr r1, _0802C414 @ =gUnknown_080D69C8
	adds r4, r3, #0
	adds r4, #0x23
	ldrb r0, [r4]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	movs r5, #0x9f
	lsls r5, r5, #1
	adds r2, r3, r5
	strh r0, [r2]
	ldrb r0, [r4]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #6]
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r3, r2
	strb r1, [r0]
	ldr r4, _0802C418 @ =0x00000155
	adds r1, r3, r4
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	b _0802C426
	.align 2, 0
_0802C410: .4byte sub_802C058
_0802C414: .4byte gUnknown_080D69C8
_0802C418: .4byte 0x00000155
_0802C41C:
	cmp r0, #8
	ble _0802C428
	ldr r0, [r3]
	movs r1, #0x80
	orrs r0, r1
_0802C426:
	str r0, [r3]
_0802C428:
	ldr r2, _0802C47C @ =gSineTable
	ldr r1, [r3, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #5
	strh r0, [r3, #0x1a]
	ldrh r0, [r3, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r5, #0x1a
	ldrsh r0, [r3, r5]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r4, #0x1a
	ldrsh r0, [r3, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C47C: .4byte gSineTable

	thumb_func_start sub_802C480
sub_802C480: @ 0x0802C480
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	subs r4, r0, #1
	str r4, [r3, #0xc]
	cmp r4, #0
	bne _0802C4E8
	ldr r0, _0802C54C @ =sub_802C058
	str r0, [r3, #0x24]
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	adds r0, r3, #0
	adds r0, #0x23
	strb r4, [r0]
	ldr r1, _0802C550 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	movs r2, #0x9f
	lsls r2, r2, #1
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r5, ip
	strh r0, [r5]
	ldrb r1, [r1, #6]
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r0, r3, r5
	strb r1, [r0]
	ldr r0, _0802C554 @ =0x00000155
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r3, r1
	strh r4, [r0]
	subs r5, #0xc
	adds r0, r3, r5
	strh r4, [r0]
	adds r1, #0x14
	adds r0, r3, r1
	strh r4, [r0]
	str r4, [r3, #0x10]
	str r4, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x22
	strb r2, [r0]
_0802C4E8:
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	ldr r2, _0802C558 @ =gSineTable
	ldr r1, [r3, #0xc]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #5
	strh r0, [r3, #0x1a]
	ldrh r0, [r3, #0x18]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r5, #0x1a
	ldrsh r0, [r3, r5]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r4, #0x1a
	ldrsh r0, [r3, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C54C: .4byte sub_802C058
_0802C550: .4byte gUnknown_080D69C8
_0802C554: .4byte 0x00000155
_0802C558: .4byte gSineTable

	thumb_func_start sub_802C55C
sub_802C55C: @ 0x0802C55C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_802BFA8
	ldr r1, [r7, #0x10]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	asrs r0, r0, #7
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	asrs r0, r0, #7
	str r0, [r7, #0x14]
	ldr r2, [r7, #0xc]
	subs r4, r2, #1
	str r4, [r7, #0xc]
	cmp r4, #0
	bne _0802C5F8
	ldr r0, _0802C5EC @ =sub_802C058
	str r0, [r7, #0x24]
	ldr r0, [r7]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r7]
	adds r0, r7, #0
	adds r0, #0x23
	strb r4, [r0]
	ldr r1, _0802C5F0 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	movs r2, #0x9f
	lsls r2, r2, #1
	adds r3, r7, r2
	movs r2, #0
	strh r0, [r3]
	ldrb r1, [r1, #6]
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r7, r3
	strb r1, [r0]
	ldr r0, _0802C5F4 @ =0x00000155
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r4, [r0]
	subs r3, #0xc
	adds r0, r7, r3
	strh r4, [r0]
	adds r1, #0x14
	adds r0, r7, r1
	strh r4, [r0]
	str r4, [r7, #0x10]
	str r4, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #0x22
	strb r2, [r0]
	b _0802C64C
	.align 2, 0
_0802C5EC: .4byte sub_802C058
_0802C5F0: .4byte gUnknown_080D69C8
_0802C5F4: .4byte 0x00000155
_0802C5F8:
	ldrh r1, [r7, #0x1e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _0802C64C
	cmp r4, #4
	bgt _0802C60A
	movs r0, #1
	b _0802C60C
_0802C60A:
	subs r0, r2, #5
_0802C60C:
	str r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	ble _0802C64C
	movs r0, #0
	strb r0, [r1]
	ldr r6, _0802C654 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r5, _0802C658 @ =0x00196225
	adds r1, r0, #0
	muls r1, r5, r1
	ldr r3, _0802C65C @ =0x3C6EF35F
	adds r1, r1, r3
	ldr r4, _0802C660 @ =0x00000FFF
	adds r0, r1, #0
	ands r0, r4
	ldr r2, _0802C664 @ =0xFFFFF801
	adds r0, r0, r2
	str r0, [r7, #0x10]
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r3
	str r0, [r6]
	ands r0, r4
	adds r0, r0, r2
	str r0, [r7, #0x14]
_0802C64C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C654: .4byte gPseudoRandom
_0802C658: .4byte 0x00196225
_0802C65C: .4byte 0x3C6EF35F
_0802C660: .4byte 0x00000FFF
_0802C664: .4byte 0xFFFFF801

	thumb_func_start sub_802C668
sub_802C668: @ 0x0802C668
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0802C698 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C6A0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r1, #4]
	str r0, [r2]
	ldr r0, [r1, #8]
	str r0, [r3]
	ldr r1, [r1]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0802C6A4
	ldr r0, _0802C69C @ =gPlayer
	str r1, [r0, #0x20]
	b _0802C6AA
	.align 2, 0
_0802C698: .4byte gUnknown_03005B40
_0802C69C: .4byte gPlayer
_0802C6A0:
	str r0, [r2]
	str r0, [r3]
_0802C6A4:
	ldr r1, _0802C6B0 @ =gPlayer
	movs r0, #0x80
	str r0, [r1, #0x20]
_0802C6AA:
	pop {r0}
	bx r0
	.align 2, 0
_0802C6B0: .4byte gPlayer

	thumb_func_start sub_802C6B4
sub_802C6B4: @ 0x0802C6B4
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _0802C6E0 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C6D8
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802C6D8
	str r3, [r2, #4]
	str r4, [r2, #8]
_0802C6D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6E0: .4byte gUnknown_03005B40

	thumb_func_start sub_802C6E4
sub_802C6E4: @ 0x0802C6E4
	push {lr}
	movs r1, #0
	ldr r0, _0802C700 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C6FA
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0]
_0802C6FA:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C700: .4byte gUnknown_03005B40

	thumb_func_start sub_802C704
sub_802C704: @ 0x0802C704
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0802C740 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C73A
	ldrh r2, [r0, #6]
	ldr r1, _0802C744 @ =IWRAM_START + 0x128
	adds r0, r2, r1
	ldrb r1, [r0]
	subs r1, r1, r3
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #3
	ldr r3, _0802C748 @ =IWRAM_START + 0x28
	adds r0, r2, r3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _0802C74C @ =IWRAM_START + 0x2C
	adds r2, r2, r0
	adds r2, r2, r1
	ldr r0, [r2]
	str r0, [r5]
_0802C73A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C740: .4byte gUnknown_03005B40
_0802C744: .4byte IWRAM_START + 0x128
_0802C748: .4byte IWRAM_START + 0x28
_0802C74C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_802C750
sub_802C750: @ 0x0802C750
	push {lr}
	movs r1, #0
	ldr r0, _0802C768 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C762
	ldrh r0, [r0, #6]
	ldr r2, _0802C76C @ =IWRAM_START + 0x134
	adds r1, r0, r2
_0802C762:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C768: .4byte gUnknown_03005B40
_0802C76C: .4byte IWRAM_START + 0x134

	thumb_func_start sub_802C770
sub_802C770: @ 0x0802C770
	push {lr}
	movs r1, #0
	ldr r0, _0802C790 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C78A
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	ldr r1, _0802C794 @ =0x000003FF
	ands r1, r0
_0802C78A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C790: .4byte gUnknown_03005B40
_0802C794: .4byte 0x000003FF

	thumb_func_start sub_802C798
sub_802C798: @ 0x0802C798
	push {r4, lr}
	ldr r0, _0802C7E0 @ =gUnknown_03005B40
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	bl sub_8050BB0
	cmp r0, #1
	beq _0802C7DA
	ldr r1, [r4]
	movs r2, #0x10
	ands r2, r1
	cmp r2, #0
	bne _0802C7DA
	ldr r0, _0802C7E4 @ =sub_802C92C
	str r0, [r4, #0x24]
	movs r0, #0x14
	str r0, [r4, #0xc]
	strh r2, [r4, #0x18]
	subs r0, #0x16
	ands r1, r0
	subs r0, #1
	ands r1, r0
	subs r0, #6
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r1, r0
	movs r0, #0x80
	orrs r1, r0
	str r1, [r4]
_0802C7DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C7E0: .4byte gUnknown_03005B40
_0802C7E4: .4byte sub_802C92C

	thumb_func_start sub_802C7E8
sub_802C7E8: @ 0x0802C7E8
	push {r4, lr}
	ldr r0, _0802C820 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802BCCC
	ldr r0, [r4, #0x24]
	ldr r1, _0802C824 @ =sub_802C8A0
	cmp r0, r1
	beq _0802C806
	str r1, [r4, #0x24]
_0802C806:
	ldr r1, [r4, #0x24]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_802C9B0
	adds r0, r4, #0
	bl sub_802BE1C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C820: .4byte gCurTask
_0802C824: .4byte sub_802C8A0

	thumb_func_start sub_802C828
sub_802C828: @ 0x0802C828
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0802C894 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802C88C
	ldr r0, [r5, #0xc]
	subs r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0
	bne _0802C856
	ldr r0, _0802C898 @ =sub_802C058
	str r0, [r5, #0x24]
	ldr r0, [r5]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r5]
_0802C856:
	ldr r0, _0802C89C @ =gCamera
	ldr r1, [r0]
	adds r1, #0x50
	lsls r1, r1, #8
	ldr r4, [r0, #4]
	adds r4, #0x5a
	lsls r4, r4, #8
	ldr r0, [r5, #4]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #4]
	adds r1, r1, r0
	str r1, [r5, #4]
	ldr r0, [r5, #8]
	subs r4, r4, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #8]
	adds r1, r1, r0
	str r1, [r5, #8]
_0802C88C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C894: .4byte gUnknown_03005424
_0802C898: .4byte sub_802C058
_0802C89C: .4byte gCamera

	thumb_func_start sub_802C8A0
sub_802C8A0: @ 0x0802C8A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5]
	ldr r1, _0802C8E8 @ =gCamera
	ldr r0, [r1]
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #8
	ldr r4, [r1, #4]
	adds r4, #0x50
	lsls r4, r4, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #4]
	adds r1, r1, r0
	str r1, [r5, #4]
	ldr r0, [r5, #8]
	subs r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #8]
	adds r1, r1, r0
	str r1, [r5, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C8E8: .4byte gCamera

	thumb_func_start sub_802C8EC
sub_802C8EC: @ 0x0802C8EC
	push {lr}
	adds r2, r0, #0
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldrh r0, [r2, #0x1a]
	adds r0, #0x20
	strh r0, [r2, #0x1a]
	movs r0, #0x1a
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, _0802C924 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	cmp r0, #0xa0
	ble _0802C920
	ldr r0, _0802C928 @ =0x00000129
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
_0802C920:
	pop {r0}
	bx r0
	.align 2, 0
_0802C924: .4byte gCamera
_0802C928: .4byte 0x00000129

	thumb_func_start sub_802C92C
sub_802C92C: @ 0x0802C92C
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	subs r0, #1
	str r0, [r3, #0xc]
	cmp r0, #0
	bne _0802C94A
	ldr r0, _0802C980 @ =sub_802C988
	str r0, [r3, #0x24]
	ldr r0, [r3]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x64
	str r0, [r3, #0xc]
_0802C94A:
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3, #0x1a]
	ldr r2, _0802C984 @ =gSineTable
	ldrh r0, [r3, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	asrs r1, r1, #6
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	asrs r1, r1, #6
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C980: .4byte sub_802C988
_0802C984: .4byte gSineTable

	thumb_func_start sub_802C988
sub_802C988: @ 0x0802C988
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	subs r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0
	bne _0802C9A8
	ldr r0, [r2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0802C9AC @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r2]
	bl sub_802BA8C
_0802C9A8:
	pop {r0}
	bx r0
	.align 2, 0
_0802C9AC: .4byte 0xFFFFFDFF

	thumb_func_start sub_802C9B0
sub_802C9B0: @ 0x0802C9B0
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0802C9D6
	ldr r1, [r2, #8]
	ldr r0, _0802C9DC @ =0x000031FF
	cmp r1, r0
	bgt _0802C9CA
	adds r0, #1
	str r0, [r2, #8]
_0802C9CA:
	ldr r0, [r2, #8]
	movs r1, #0xfe
	lsls r1, r1, #8
	cmp r0, r1
	ble _0802C9D6
	str r1, [r2, #8]
_0802C9D6:
	pop {r0}
	bx r0
	.align 2, 0
_0802C9DC: .4byte 0x000031FF

	thumb_func_start sub_802C9E0
sub_802C9E0: @ 0x0802C9E0
	movs r0, #0
	bx lr

	thumb_func_start sub_802C9E4
sub_802C9E4: @ 0x0802C9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0802CA40 @ =sub_802CCE0
	movs r1, #0xbc
	lsls r1, r1, #2
	ldr r2, _0802CA44 @ =0x00002102
	ldr r3, _0802CA48 @ =sub_802D25C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _0802CA4C @ =gUnknown_03005B44
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	movs r5, #0
	movs r6, #0
	adds r0, #0xb2
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _0802CA50 @ =gUnknown_080D6A80
	mov sb, r2
	ldr r7, _0802CA54 @ =IWRAM_START + 0x94
	adds r4, r1, r7
	mov sl, r6
	ldr r0, _0802CA58 @ =IWRAM_START + 0x90
	adds r0, r1, r0
	str r0, [sp, #0xc]
_0802CA28:
	strh r6, [r4, #0x12]
	strh r6, [r4, #0x14]
	cmp r5, #0
	bne _0802CA5C
	movs r0, #0x18
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r4]
	ldr r3, [sp, #8]
	b _0802CA68
	.align 2, 0
_0802CA40: .4byte sub_802CCE0
_0802CA44: .4byte 0x00002102
_0802CA48: .4byte sub_802D25C
_0802CA4C: .4byte gUnknown_03005B44
_0802CA50: .4byte gUnknown_080D6A80
_0802CA54: .4byte IWRAM_START + 0x94
_0802CA58: .4byte IWRAM_START + 0x90
_0802CA5C:
	adds r0, r3, #0
	adds r0, #0x94
	lsls r1, r5, #6
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4]
_0802CA68:
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r2, r3, r1
	add r2, sl
	ldr r0, [r4]
	ldr r7, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r7
	lsrs r0, r0, #5
	ldr r1, _0802CCAC @ =0x000003FF
	ands r0, r1
	movs r7, #0xc0
	lsls r7, r7, #7
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4, #0x16]
	strh r6, [r4, #4]
	mov r1, sb
	ldrh r0, [r1]
	strh r0, [r4, #6]
	ldrh r0, [r1, #2]
	strb r0, [r4, #0x1c]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x18]
	movs r7, #1
	rsbs r7, r7, #0
	mov r2, sp
	strb r7, [r2, #4]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	mov r1, r8
	strb r6, [r1, #3]
	adds r2, r7, #0
	str r2, [r4, #0x24]
	movs r0, #0x80
	lsls r0, r0, #0xb
	str r0, [r4, #0xc]
	cmp r5, #0xb
	beq _0802CAC4
	ldr r0, [sp, #0xc]
	str r3, [sp, #8]
	bl sub_8004558
	ldr r3, [sp, #8]
_0802CAC4:
	movs r7, #0x30
	add r8, r7
	movs r0, #4
	add sb, r0
	adds r4, #0x30
	movs r1, #2
	add sl, r1
	ldr r2, [sp, #0xc]
	adds r2, #0x30
	str r2, [sp, #0xc]
	adds r5, #1
	cmp r5, #0xb
	bls _0802CA28
	ldr r4, _0802CCB0 @ =gGameMode
	mov sb, r4
	ldrb r0, [r4]
	cmp r0, #2
	bhi _0802CBA4
	adds r7, r3, #0
	adds r7, #0x60
	movs r5, #0
	mov r8, r5
	movs r6, #0
	movs r0, #6
	strh r0, [r7, #0x16]
	movs r0, #0x8e
	strh r0, [r7, #0x18]
	ldr r4, _0802CCB4 @ =gUnknown_080D6AB0
	ldr r5, _0802CCB8 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldr r2, _0802CCAC @ =0x000003FF
	ands r0, r2
	ldr r3, [sp, #8]
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r2, r3, r1
	strh r0, [r2]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x80
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r1, r3, #0
	adds r1, #0x81
	ldrb r0, [r1]
	mov r4, sp
	ldrb r4, [r4, #4]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x82
	movs r5, #0x10
	strb r5, [r0]
	adds r1, #4
	mov r0, r8
	strb r0, [r1]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	mov r5, sb
	ldrb r0, [r5]
	cmp r0, #2
	bls _0802CB9A
	ldr r0, _0802CCBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1]
	lsls r0, r0, #0xc
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0802CB9A:
	adds r0, r7, #0
	str r3, [sp, #8]
	bl sub_8004558
	ldr r3, [sp, #8]
_0802CBA4:
	adds r7, r3, #0
	adds r7, #0x30
	movs r4, #0
	strh r4, [r7, #0x16]
	movs r0, #1
	strh r0, [r7, #0x18]
	movs r0, #0x20
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldr r2, _0802CCAC @ =0x000003FF
	mov sl, r2
	mov r5, sl
	ands r0, r5
	ldr r3, [sp, #8]
	ldr r2, _0802CCC0 @ =0x000002D6
	adds r1, r3, r2
	movs r5, #0xc0
	lsls r5, r5, #7
	mov sb, r5
	movs r5, #0
	mov r2, sb
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _0802CCC4 @ =0x00000466
	strh r0, [r7, #0xa]
	adds r0, r3, #0
	adds r0, #0x50
	strb r5, [r0]
	movs r0, #0xc0
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r3, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x52
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #8]
	bl sub_8004558
	movs r0, #7
	ldr r3, [sp, #8]
	strh r0, [r3, #0x16]
	movs r0, #9
	strh r0, [r3, #0x18]
	movs r0, #4
	str r3, [sp, #8]
	bl VramMalloc
	ldr r3, [sp, #8]
	str r0, [r3, #4]
	ldr r7, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r7
	lsrs r0, r0, #5
	mov r1, sl
	ands r0, r1
	ldr r2, _0802CCC8 @ =0x000002D2
	adds r1, r3, r2
	mov r7, sb
	orrs r0, r7
	strh r0, [r1]
	ldr r0, _0802CCCC @ =0x00000467
	strh r0, [r3, #0xa]
	adds r0, r3, #0
	adds r0, #0x20
	strb r5, [r0]
	strh r4, [r3, #0x1a]
	strh r4, [r3, #8]
	strh r4, [r3, #0x14]
	strh r4, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x21
	adds r0, r6, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x22
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	strb r5, [r0]
	str r6, [r3, #0x28]
	str r4, [r3, #0x10]
	subs r2, #2
	adds r0, r3, r2
	strh r4, [r0]
	movs r5, #0
	ldr r0, _0802CCD0 @ =gObjPalette
	ldr r2, _0802CCD4 @ =gUnknown_080D6ACE
	adds r1, r0, #0
	adds r1, #0xe0
_0802CC7C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0802CC7C
	ldr r2, _0802CCD8 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
	ldr r0, _0802CCDC @ =gUnknown_03005B44
	ldr r0, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802CCA8: .4byte 0xF9FF0000
_0802CCAC: .4byte 0x000003FF
_0802CCB0: .4byte gGameMode
_0802CCB4: .4byte gUnknown_080D6AB0
_0802CCB8: .4byte gSelectedCharacter
_0802CCBC: .4byte 0x04000128
_0802CCC0: .4byte 0x000002D6
_0802CCC4: .4byte 0x00000466
_0802CCC8: .4byte 0x000002D2
_0802CCCC: .4byte 0x00000467
_0802CCD0: .4byte gObjPalette
_0802CCD4: .4byte gUnknown_080D6ACE
_0802CCD8: .4byte gFlags
_0802CCDC: .4byte gUnknown_03005B44

	thumb_func_start sub_802CCE0
sub_802CCE0: @ 0x0802CCE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0802CD34 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0802CCFC
	b _0802D138
_0802CCFC:
	ldr r0, _0802CD38 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _0802CD3C @ =IWRAM_START + 0x90
	adds r0, r2, r0
	str r0, [sp]
	ldr r0, _0802CD40 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802CD1A
	b _0802CE6A
_0802CD1A:
	ldr r0, _0802CD44 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0802CD74
	ldr r1, _0802CD48 @ =IWRAM_START + 0x2A0
	adds r7, r2, r1
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0
	b _0802CD6C
	.align 2, 0
_0802CD34: .4byte gUnknown_03005424
_0802CD38: .4byte gCurTask
_0802CD3C: .4byte IWRAM_START + 0x90
_0802CD40: .4byte gGameMode
_0802CD44: .4byte gCurrentLevel
_0802CD48: .4byte IWRAM_START + 0x2A0
_0802CD4C:
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x1f
	strh r0, [r3]
	lsls r0, r7, #3
	adds r0, #4
	strh r0, [r3, #2]
	ldr r0, _0802CE18 @ =0x000002EE
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0802CD6C:
	ldr r0, _0802CE1C @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r7, r0
	blo _0802CD4C
_0802CD74:
	ldr r0, _0802CE20 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0802CD9A
	ldr r0, _0802CE24 @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _0802CE28 @ =0x000087EF
	cmp r1, r0
	bls _0802CD9A
	adds r0, r1, #0
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _0802CD9A
	movs r0, #0x8b
	bl m4aSongNumStart
_0802CD9A:
	ldr r0, _0802CE2C @ =gUnknown_03005450
	ldr r6, [r0]
	ldr r0, _0802CE30 @ =0x000F423F
	cmp r6, r0
	ble _0802CDA6
	adds r6, r0, #0
_0802CDA6:
	movs r7, #0
	ldr r2, _0802CE34 @ =0x0000800E
	mov r8, r2
_0802CDAC:
	ldr r1, _0802CE38 @ =gUnknown_080D6AF0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl Div
	adds r4, r0, #0
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r3]
	lsls r0, r7, #3
	adds r0, #0x1c
	strh r0, [r3, #2]
	lsls r1, r4, #1
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sb
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #4]
	adds r0, r4, #0
	muls r0, r5, r0
	subs r6, r6, r0
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bls _0802CDAC
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x8e
	strh r0, [r3]
	ldr r0, _0802CE3C @ =0x00004006
	strh r0, [r3, #2]
	movs r0, #0xb5
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	ldr r1, _0802CE40 @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802CE44
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _0802CE46
	.align 2, 0
_0802CE18: .4byte 0x000002EE
_0802CE1C: .4byte gUnknown_030054F4
_0802CE20: .4byte gLoadedSaveGame
_0802CE24: .4byte gUnknown_03005490
_0802CE28: .4byte 0x000087EF
_0802CE2C: .4byte gUnknown_03005450
_0802CE30: .4byte 0x000F423F
_0802CE34: .4byte 0x0000800E
_0802CE38: .4byte gUnknown_080D6AF0
_0802CE3C: .4byte 0x00004006
_0802CE40: .4byte gNumLives
_0802CE44:
	movs r7, #0
_0802CE46:
	cmp r7, #9
	bls _0802CE4C
	movs r7, #9
_0802CE4C:
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _0802CF04 @ =0x0000808C
	strh r0, [r3]
	movs r0, #0x1e
	strh r0, [r3, #2]
	lsls r1, r7, #1
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sb
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #4]
_0802CE6A:
	movs r0, #4
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r3]
	ldr r0, _0802CF08 @ =0x0000C1FD
	strh r0, [r3, #2]
	ldr r0, _0802CF0C @ =0x000002D6
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r2, #0xb4
	lsls r2, r2, #2
	add r2, sb
	ldr r0, _0802CF10 @ =gPlayer
	ldrh r0, [r0, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r0, #0x40
	ldrh r1, [r2]
	adds r0, r0, r1
	ldr r1, _0802CF14 @ =0x000007FF
	ands r0, r1
	strh r0, [r2]
	lsrs r0, r0, #8
	mov r1, sb
	adds r1, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sb
	bl sub_8004558
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #8
	strh r0, [r3]
	ldr r0, _0802CF18 @ =0x00004007
	strh r0, [r3, #2]
	ldr r0, _0802CF1C @ =0x000002D2
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	ldr r0, _0802CF20 @ =gRingCount
	ldrh r1, [r0]
	ldr r0, _0802CF24 @ =0x000003E7
	cmp r1, r0
	bls _0802CF28
	ldr r2, [sp]
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r7, r2, r0
	movs r4, #0x10
	strh r4, [r7, #0x18]
	movs r0, #0x20
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	strh r4, [r7, #0x18]
	movs r0, #0x28
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	strh r4, [r7, #0x18]
	movs r0, #0x30
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	b _0802CFDC
	.align 2, 0
_0802CF04: .4byte 0x0000808C
_0802CF08: .4byte 0x0000C1FD
_0802CF0C: .4byte 0x000002D6
_0802CF10: .4byte gPlayer
_0802CF14: .4byte 0x000007FF
_0802CF18: .4byte 0x00004007
_0802CF1C: .4byte 0x000002D2
_0802CF20: .4byte gRingCount
_0802CF24: .4byte 0x000003E7
_0802CF28:
	movs r2, #0
	mov sl, r2
	cmp r1, #0
	bne _0802CF42
	ldr r0, _0802D148 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802CF42
	movs r0, #0xe0
	lsls r0, r0, #7
	mov sl, r0
_0802CF42:
	ldr r7, _0802D14C @ =gRingCount
	ldrh r0, [r7]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #8
	mov r8, r1
	mov r2, r8
	strh r2, [r3]
	movs r0, #0x1c
	strh r0, [r3, #2]
	lsls r0, r4, #1
	movs r6, #0xb6
	lsls r6, r6, #2
	add r6, sb
	adds r0, r6, r0
	ldrh r1, [r0]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	movs r0, #0x64
	adds r5, r4, #0
	muls r5, r0, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrh r0, [r7]
	subs r0, r0, r5
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r3]
	movs r0, #0x24
	strh r0, [r3, #2]
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r1, [r0]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r5, r5, r0
	ldrh r4, [r7]
	subs r4, r4, r5
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r1, r8
	strh r1, [r3]
	movs r0, #0x2c
	strh r0, [r3, #2]
	lsls r4, r4, #1
	adds r6, r6, r4
	ldrh r0, [r6]
	mov r2, sl
	orrs r2, r0
	strh r2, [r3, #4]
_0802CFDC:
	ldr r7, _0802D150 @ =gUnknown_03005490
	ldr r0, _0802D154 @ =0x00008C9F
	ldr r6, [r7]
	cmp r6, r0
	bls _0802CFE8
	adds r6, r0, #0
_0802CFE8:
	ldr r0, _0802D158 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802CFF8
	b _0802D138
_0802CFF8:
	movs r0, #0xc0
	lsls r0, r0, #7
	mov sl, r0
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r5, #0x80
	lsls r5, r5, #8
	strh r5, [r3]
	movs r0, #0x63
	strh r0, [r3, #2]
	movs r4, #0xbb
	lsls r4, r4, #2
	add r4, sb
	ldrh r1, [r4]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	strh r5, [r3]
	movs r0, #0x7b
	strh r0, [r3, #2]
	ldrh r0, [r4]
	mov r1, sl
	orrs r1, r0
	strh r1, [r3, #4]
	adds r0, r6, #0
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	movs r1, #0x3c
	bl Div
	str r0, [sp, #4]
	ldr r1, _0802D15C @ =gUnknown_080D6BF8
	adds r2, r0, #0
	lsls r2, r2, #1
	mov sb, r2
	adds r0, r2, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #1
	mov r8, r4
	add r1, r8
	movs r0, #0
	ldrsh r1, [r1, r0]
	subs r1, r6, r1
	ldr r0, _0802D160 @ =gUnknown_080D6C72
	add r0, sb
	ldrh r0, [r0]
	subs r5, r1, r0
	ldr r1, [r7]
	ldr r0, _0802D164 @ =0x00007E90
	movs r2, #0
	mov sl, r2
	cmp r1, r0
	bls _0802D084
	ldr r0, _0802D148 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sl, r0
_0802D084:
	ldr r4, _0802D168 @ =gMillisUnpackTable
	lsls r5, r5, #1
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [sp]
	adds r7, r1, r0
	movs r0, #0x88
	strh r0, [r7, #0x16]
	movs r6, #0x10
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	adds r5, r5, r4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [sp]
	adds r7, r1, r0
	movs r0, #0x90
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r4, _0802D16C @ =gSecondsTable
	mov r1, r8
	adds r0, r1, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x70
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	add r4, r8
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x78
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [sp, #4]
	add r0, sb
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x60
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
_0802D138:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D148: .4byte gUnknown_03005590
_0802D14C: .4byte gRingCount
_0802D150: .4byte gUnknown_03005490
_0802D154: .4byte 0x00008C9F
_0802D158: .4byte gUnknown_03005424
_0802D15C: .4byte gUnknown_080D6BF8
_0802D160: .4byte gUnknown_080D6C72
_0802D164: .4byte 0x00007E90
_0802D168: .4byte gMillisUnpackTable
_0802D16C: .4byte gSecondsTable

	thumb_func_start sub_802D170
sub_802D170: @ 0x0802D170
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _0802D1A8 @ =gUnknown_03005B44
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D1AC @ =IWRAM_START + 0x90
	adds r2, r2, r0
	mov sb, r2
	movs r0, #0xa
	mov r8, r0
	movs r7, #1
	cmp r4, #9
	bhi _0802D1B0
	movs r6, #1
	b _0802D1F2
	.align 2, 0
_0802D1A8: .4byte gUnknown_03005B44
_0802D1AC: .4byte IWRAM_START + 0x90
_0802D1B0:
	cmp r4, #0x63
	bhi _0802D1B8
	movs r6, #2
	b _0802D1F2
_0802D1B8:
	ldr r0, _0802D1C4 @ =0x000003E7
	cmp r4, r0
	bhi _0802D1C8
	movs r6, #3
	b _0802D1F2
	.align 2, 0
_0802D1C4: .4byte 0x000003E7
_0802D1C8:
	ldr r0, _0802D1D4 @ =0x0000270F
	cmp r4, r0
	bhi _0802D1D8
	movs r6, #4
	b _0802D1F2
	.align 2, 0
_0802D1D4: .4byte 0x0000270F
_0802D1D8:
	ldr r0, _0802D1E4 @ =0x0001869F
	cmp r4, r0
	bhi _0802D1E8
	movs r6, #5
	b _0802D1F2
	.align 2, 0
_0802D1E4: .4byte 0x0001869F
_0802D1E8:
	ldr r0, _0802D258 @ =0x000F423F
	movs r6, #7
	cmp r4, r0
	bhi _0802D1F2
	movs r6, #6
_0802D1F2:
	cmp r7, #0
	beq _0802D246
	cmp r6, #0
	beq _0802D246
	adds r5, r1, #0
_0802D1FC:
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r7, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, sb
	mov r2, r8
	muls r2, r7, r2
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r5, [r0, #0x16]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, #0x18]
	adds r1, r0, #0
	adds r1, #0x25
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r0, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r1, r2
	str r1, [r0, #0x10]
	bl sub_80051E8
	adds r4, r7, #0
	subs r5, #8
	subs r6, #1
	cmp r4, #0
	beq _0802D246
	cmp r6, #0
	bne _0802D1FC
_0802D246:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D258: .4byte 0x000F423F

	thumb_func_start sub_802D25C
sub_802D25C: @ 0x0802D25C
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	ldr r0, _0802D290 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802D280
	ldr r0, [r4, #0x64]
	bl VramFree
_0802D280:
	ldr r1, _0802D294 @ =IWRAM_START + 0x94
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D290: .4byte gGameMode
_0802D294: .4byte IWRAM_START + 0x94

	thumb_func_start sub_802D298
sub_802D298: @ 0x0802D298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0802D2E4 @ =sub_802D4B4
	movs r1, #0x8d
	lsls r1, r1, #5
	movs r2, #0xe1
	lsls r2, r2, #8
	ldr r3, _0802D2E8 @ =sub_802D4B8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _0802D2EC @ =IWRAM_START + 0x22
	adds r7, r1, r0
	ldr r2, _0802D2F0 @ =IWRAM_START+4
	adds r4, r1, r2
	ldr r0, _0802D2F4 @ =0x0000045F
	mov sl, r0
_0802D2D4:
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	cmp r6, #0
	bne _0802D2F8
	movs r0, #0xbc
	bl VramMalloc
	b _0802D300
	.align 2, 0
_0802D2E4: .4byte sub_802D4B4
_0802D2E8: .4byte sub_802D4B8
_0802D2EC: .4byte IWRAM_START + 0x22
_0802D2F0: .4byte IWRAM_START+4
_0802D2F4: .4byte 0x0000045F
_0802D2F8:
	lsls r1, r6, #6
	mov r2, sb
	ldr r0, [r2, #4]
	adds r0, r0, r1
_0802D300:
	str r0, [r4]
	strh r5, [r4, #0x16]
	strh r5, [r4, #4]
	mov r0, sl
	strh r0, [r4, #6]
	adds r1, r6, #1
	strb r1, [r4, #0x1c]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x18]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	strb r5, [r7, #3]
	subs r0, #0x11
	str r0, [r4, #0x24]
	str r5, [r4, #0xc]
	adds r7, #0x30
	adds r4, #0x30
	adds r6, r1, #0
	cmp r6, #0x5d
	bls _0802D2D4
	ldr r0, _0802D344 @ =gUnknown_03005B48
	mov r1, r8
	str r1, [r0]
	mov r0, r8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802D344: .4byte gUnknown_03005B48

	thumb_func_start sub_802D348
sub_802D348: @ 0x0802D348
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	ldr r0, _0802D37C @ =gUnknown_03005B48
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D380 @ =IWRAM_START + 0x2D0
	adds r2, r2, r0
	mov sl, r2
	movs r0, #0xa
	mov sb, r0
	movs r2, #1
	mov r8, r2
	cmp r5, #9
	bhi _0802D384
	movs r7, #1
	b _0802D3C6
	.align 2, 0
_0802D37C: .4byte gUnknown_03005B48
_0802D380: .4byte IWRAM_START + 0x2D0
_0802D384:
	cmp r5, #0x63
	bhi _0802D38C
	movs r7, #2
	b _0802D3C6
_0802D38C:
	ldr r0, _0802D398 @ =0x000003E7
	cmp r5, r0
	bhi _0802D39C
	movs r7, #3
	b _0802D3C6
	.align 2, 0
_0802D398: .4byte 0x000003E7
_0802D39C:
	ldr r0, _0802D3A8 @ =0x0000270F
	cmp r5, r0
	bhi _0802D3AC
	movs r7, #4
	b _0802D3C6
	.align 2, 0
_0802D3A8: .4byte 0x0000270F
_0802D3AC:
	ldr r0, _0802D3B8 @ =0x0001869F
	cmp r5, r0
	bhi _0802D3BC
	movs r7, #5
	b _0802D3C6
	.align 2, 0
_0802D3B8: .4byte 0x0001869F
_0802D3BC:
	ldr r0, _0802D430 @ =0x000F423F
	movs r7, #7
	cmp r5, r0
	bhi _0802D3C6
	movs r7, #6
_0802D3C6:
	mov r0, r8
	cmp r0, #0
	beq _0802D41E
	cmp r7, #0
	beq _0802D41E
	adds r6, r1, #0
_0802D3D2:
	adds r0, r5, #0
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	add r4, sl
	mov r2, sb
	mov r1, r8
	muls r1, r2, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	subs r4, r4, r0
	strh r6, [r4, #0x16]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	mov r5, r8
	subs r6, #8
	subs r7, #1
	cmp r5, #0
	beq _0802D41E
	cmp r7, #0
	bne _0802D3D2
_0802D41E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D430: .4byte 0x000F423F

	thumb_func_start sub_802D434
sub_802D434: @ 0x0802D434
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _0802D4AC @ =gUnknown_03005B48
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0802D4B0 @ =0x2FFF9D0
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	ldrb r0, [r7]
	cmp r0, #0
	beq _0802D4A0
_0802D45C:
	adds r1, r7, r5
	ldrb r0, [r1]
	cmp r0, #0x20
	bls _0802D488
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #4
	add r4, r8
	strh r6, [r4, #0x16]
	mov r0, sb
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_0802D488:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802D45C
_0802D4A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4AC: .4byte gUnknown_03005B48
_0802D4B0: .4byte 0x2FFF9D0

	thumb_func_start sub_802D4B4
sub_802D4B4: @ 0x0802D4B4
	bx lr
	.align 2, 0

	thumb_func_start sub_802D4B8
sub_802D4B8: @ 0x0802D4B8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_802D4CC
sub_802D4CC: @ 0x0802D4CC
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D504
	ldr r2, _0802D4FC @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D500 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D520
	.align 2, 0
_0802D4FC: .4byte gDispCnt
_0802D500: .4byte gWinRegs
_0802D504:
	ldr r2, _0802D54C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D550 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D520:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D554 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D558
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D562
	.align 2, 0
_0802D54C: .4byte gDispCnt
_0802D550: .4byte gWinRegs
_0802D554: .4byte gBldRegs
_0802D558:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D562:
	strh r0, [r2, #4]
	ldrh r4, [r3, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D572
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D572:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r3, #6]
	adds r0, r4, r0
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	ldr r1, _0802D58C @ =0x1FFF0000
	cmp r0, r1
	bgt _0802D590
	movs r0, #0
	b _0802D598
	.align 2, 0
_0802D58C: .4byte 0x1FFF0000
_0802D590:
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #4]
	movs r0, #1
_0802D598:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802D5A0
sub_802D5A0: @ 0x0802D5A0
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D5D8
	ldr r2, _0802D5D0 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D5D4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D5F4
	.align 2, 0
_0802D5D0: .4byte gDispCnt
_0802D5D4: .4byte gWinRegs
_0802D5D8:
	ldr r2, _0802D620 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D624 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D5F4:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D628 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D62C
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D636
	.align 2, 0
_0802D620: .4byte gDispCnt
_0802D624: .4byte gWinRegs
_0802D628: .4byte gBldRegs
_0802D62C:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D636:
	strh r0, [r2, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D644
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D644:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_802D650
sub_802D650: @ 0x0802D650
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D6E4 @ =sub_802D6FC
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x3c
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r1, #0x38]
	ldr r0, _0802D6E8 @ =IWRAM_START + 0x3A
	adds r2, r3, r0
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D6EC @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D6F0 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D6F4 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D6F8 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D6E4: .4byte sub_802D6FC
_0802D6E8: .4byte IWRAM_START + 0x3A
_0802D6EC: .4byte 0x06010000
_0802D6F0: .4byte IWRAM_START + 0x20
_0802D6F4: .4byte IWRAM_START + 0x21
_0802D6F8: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D6FC
sub_802D6FC: @ 0x0802D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802D738 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r7, r6, #0
	ldr r5, [r6, #0x30]
	ldr r0, [r6, #0x34]
	mov r8, r0
	ldr r0, _0802D73C @ =IWRAM_START + 0x3A
	adds r2, r1, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0802D740
	ldrh r0, [r6, #0x38]
	adds r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x12
	cmp r0, r1
	ble _0802D752
	movs r0, #0
	b _0802D750
	.align 2, 0
_0802D738: .4byte gCurTask
_0802D73C: .4byte IWRAM_START + 0x3A
_0802D740:
	ldrh r0, [r6, #0x38]
	subs r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	ldr r1, _0802D7D0 @ =0x01FF0000
	cmp r0, r1
	bgt _0802D752
	movs r0, #1
_0802D750:
	strb r0, [r2]
_0802D752:
	ldr r1, _0802D7D4 @ =gSineTable
	mov sb, r1
	ldrh r1, [r7, #0x38]
	ldr r4, _0802D7D8 @ =0x000003FF
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #3
	adds r5, r5, r0
	ldrh r0, [r7, #0x38]
	ands r4, r0
	lsls r4, r4, #1
	add r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #1
	add r8, r0
	str r5, [r7, #0x30]
	mov r0, r8
	str r0, [r7, #0x34]
	asrs r0, r5, #8
	ldr r3, _0802D7DC @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	mov r1, r8
	asrs r2, r1, #8
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r6, #0x18]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802D7C4
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D7C4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D7E4
_0802D7C4:
	ldr r0, _0802D7E0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D7F0
	.align 2, 0
_0802D7D0: .4byte 0x01FF0000
_0802D7D4: .4byte gSineTable
_0802D7D8: .4byte 0x000003FF
_0802D7DC: .4byte gCamera
_0802D7E0: .4byte gCurTask
_0802D7E4:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0802D7F0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802D7FC
sub_802D7FC: @ 0x0802D7FC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D89C @ =sub_802D8B8
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #1
	strh r0, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r2, _0802D8A0 @ =IWRAM_START + 0x3C
	adds r0, r3, r2
	strb r6, [r0]
	ldr r0, _0802D8A4 @ =IWRAM_START + 0x3D
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D8A8 @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D8AC @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D8B0 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D8B4 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D89C: .4byte sub_802D8B8
_0802D8A0: .4byte IWRAM_START + 0x3C
_0802D8A4: .4byte IWRAM_START + 0x3D
_0802D8A8: .4byte 0x06010000
_0802D8AC: .4byte IWRAM_START + 0x20
_0802D8B0: .4byte IWRAM_START + 0x21
_0802D8B4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D8B8
sub_802D8B8: @ 0x0802D8B8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802D8F8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r5, r0, r1
	str r5, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802D8FC @ =IWRAM_START + 0x3D
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r2, r0, #0
	cmp r2, #0
	beq _0802D900
	subs r0, #1
	strb r0, [r3]
	b _0802D93A
	.align 2, 0
_0802D8F8: .4byte gCurTask
_0802D8FC: .4byte IWRAM_START + 0x3D
_0802D900:
	asrs r0, r5, #8
	asrs r1, r1, #8
	str r2, [sp]
	ldr r2, _0802D978 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r5, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802D93A
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r4, #0x3a]
	str r1, [r4, #0x34]
	ldr r0, _0802D97C @ =IWRAM_START + 0x3C
	adds r1, r6, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D936
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #0x38]
_0802D936:
	movs r0, #1
	strb r0, [r1]
_0802D93A:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802D980 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802D96E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D96E
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D988
_0802D96E:
	ldr r0, _0802D984 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D994
	.align 2, 0
_0802D978: .4byte sub_801EE64
_0802D97C: .4byte IWRAM_START + 0x3C
_0802D980: .4byte gCamera
_0802D984: .4byte gCurTask
_0802D988:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802D994:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802D99C
sub_802D99C: @ 0x0802D99C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802DA34 @ =sub_802DA4C
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	strh r5, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r0, _0802DA38 @ =IWRAM_START + 0x3C
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802DA3C @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802DA40 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802DA44 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802DA48 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA34: .4byte sub_802DA4C
_0802DA38: .4byte IWRAM_START + 0x3C
_0802DA3C: .4byte 0x06010000
_0802DA40: .4byte IWRAM_START + 0x20
_0802DA44: .4byte IWRAM_START + 0x21
_0802DA48: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802DA4C
sub_802DA4C: @ 0x0802DA4C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802DA8C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r6, r0, r1
	str r6, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802DA90 @ =IWRAM_START + 0x3C
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	beq _0802DA94
	subs r0, #1
	strb r0, [r2]
	b _0802DAB4
	.align 2, 0
_0802DA8C: .4byte gCurTask
_0802DA90: .4byte IWRAM_START + 0x3C
_0802DA94:
	asrs r0, r6, #8
	asrs r1, r1, #8
	str r5, [sp]
	ldr r2, _0802DAF4 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r6, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802DAB4
	strh r5, [r4, #0x3a]
	str r1, [r4, #0x34]
_0802DAB4:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802DAF8 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802DAE8
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802DAE8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802DB00
_0802DAE8:
	ldr r0, _0802DAFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802DB0C
	.align 2, 0
_0802DAF4: .4byte sub_801EE64
_0802DAF8: .4byte gCamera
_0802DAFC: .4byte gCurTask
_0802DB00:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802DB0C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802DB14
sub_802DB14: @ 0x0802DB14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0802DBB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0802DB34
	movs r2, #6
_0802DB34:
	ldr r3, _0802DBB4 @ =gUnknown_080D6C88
	ldr r4, _0802DBB8 @ =gUnknown_03005444
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [sp]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r1, r3, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r3, #8
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _0802DB96
	movs r0, #0
	strb r0, [r4]
_0802DB96:
	ldr r0, _0802DBBC @ =gUnknown_080D6DD8
	lsls r1, r5, #0x18
	asrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov r0, sp
	bl _call_via_r1
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBB0: .4byte gCurrentLevel
_0802DBB4: .4byte gUnknown_080D6C88
_0802DBB8: .4byte gUnknown_03005444
_0802DBBC: .4byte gUnknown_080D6DD8

	thumb_func_start sub_802DBC0
sub_802DBC0: @ 0x0802DBC0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802DC0C @ =gUnknown_03001884
	ldr r4, [r0]
	movs r5, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DC10 @ =0xFFFFFF00
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0802DCBE
	cmp r6, #1
	bhi _0802DC14
	lsls r0, r7, #1
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0xa0
	subs r0, r0, r7
	cmp r1, r0
	bge _0802DCBE
	movs r3, #0xf0
	adds r2, r0, #0
_0802DBF4:
	adds r4, #1
	strb r3, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _0802DBF4
	b _0802DCBE
	.align 2, 0
_0802DC0C: .4byte gUnknown_03001884
_0802DC10: .4byte 0xFFFFFF00
_0802DC14:
	ldr r2, _0802DC44 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802DC48
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DC4A
	.align 2, 0
_0802DC44: .4byte gSineTable
_0802DC48:
	mov r3, ip
_0802DC4A:
	cmp r3, #0
	bge _0802DC50
	rsbs r3, r3, #0
_0802DC50:
	ldr r0, _0802DC8C @ =0x000001FF
	cmp r6, r0
	bhi _0802DC90
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	cmp r1, #0x9f
	bgt _0802DCBE
_0802DC60:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DC72
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DC72:
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DC60
	b _0802DCBE
	.align 2, 0
_0802DC8C: .4byte 0x000001FF
_0802DC90:
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DCBE
_0802DC9C:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DCAE
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DCAE:
	strb r0, [r4]
	subs r4, #2
	lsls r0, r1, #0x10
	ldr r1, _0802DCC4 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DC9C
_0802DCBE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DCC4: .4byte 0xFFFF0000

	thumb_func_start sub_802DCC8
sub_802DCC8: @ 0x0802DCC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802DD08 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r5, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DD0C @ =0xFFFFFF00
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0802DDBC
	cmp r6, #1
	bhi _0802DD14
	lsls r0, r7, #1
	adds r4, r4, r0
	lsls r1, r7, #0x10
	cmp r1, #0
	beq _0802DDBC
	movs r2, #0xf0
_0802DCF6:
	subs r4, #1
	strb r2, [r4]
	subs r4, #1
	ldr r3, _0802DD10 @ =0xFFFF0000
	adds r1, r1, r3
	asrs r0, r1, #0x10
	cmp r0, #0
	bgt _0802DCF6
	b _0802DDBC
	.align 2, 0
_0802DD08: .4byte gUnknown_03001884
_0802DD0C: .4byte 0xFFFFFF00
_0802DD10: .4byte 0xFFFF0000
_0802DD14:
	ldr r2, _0802DD80 @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802DD46
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	cmp r3, #0
	bge _0802DD46
	rsbs r3, r3, #0
_0802DD46:
	ldr r0, _0802DD84 @ =0x000001FF
	cmp r6, r0
	bhi _0802DD8C
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DDBC
_0802DD58:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DD6A
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DD6A:
	subs r4, #1
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DD88 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DD58
	b _0802DDBC
	.align 2, 0
_0802DD80: .4byte gSineTable
_0802DD84: .4byte 0x000001FF
_0802DD88: .4byte 0xFFFF0000
_0802DD8C:
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	cmp r1, #0x9f
	bgt _0802DDBC
_0802DD96:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DDA8
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DDA8:
	strb r0, [r4]
	adds r4, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DD96
_0802DDBC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802DDC4
sub_802DDC4: @ 0x0802DDC4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0802DE1C @ =gUnknown_03001884
	ldr r4, [r0]
	movs r6, #0
	lsls r1, r1, #0x16
	lsrs r7, r1, #0x16
	ldr r1, _0802DE20 @ =0xFFFFFEFF
	adds r0, r7, r1
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802DDE4
	b _0802DF0A
_0802DDE4:
	ldr r3, _0802DE24 @ =0xFFFFFE00
	adds r0, r7, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802DE28
	lsls r0, r5, #1
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0xa0
	subs r0, r0, r5
	cmp r1, r0
	blt _0802DE00
	b _0802DF0A
_0802DE00:
	movs r3, #0xf0
	adds r2, r0, #0
_0802DE04:
	adds r4, #1
	strb r3, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _0802DE04
	b _0802DF0A
	.align 2, 0
_0802DE1C: .4byte gUnknown_03001884
_0802DE20: .4byte 0xFFFFFEFF
_0802DE24: .4byte 0xFFFFFE00
_0802DE28:
	ldr r2, _0802DE64 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r7, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r7, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	bge _0802DE50
	rsbs r3, r3, #0
_0802DE50:
	cmp r1, #0
	bge _0802DE56
	rsbs r1, r1, #0
_0802DE56:
	cmp r3, #0
	beq _0802DE68
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DE6A
	.align 2, 0
_0802DE64: .4byte gSineTable
_0802DE68:
	mov r3, ip
_0802DE6A:
	ldr r0, _0802DEA8 @ =0x000001FF
	cmp r7, r0
	bhi _0802DEAC
	lsls r0, r5, #1
	adds r4, r4, r0
	adds r1, r5, #0
	cmp r1, #0x9f
	bgt _0802DF0A
	movs r2, #0xf0
_0802DE7C:
	adds r6, r6, r3
	lsls r0, r6, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DE8E
	movs r3, #0
	movs r6, #0xf0
	lsls r6, r6, #8
	movs r0, #0xf0
_0802DE8E:
	subs r0, r2, r0
	strb r0, [r4]
	adds r4, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DE7C
	b _0802DF0A
	.align 2, 0
_0802DEA8: .4byte 0x000001FF
_0802DEAC:
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0xa0
	ldr r0, _0802DF10 @ =gUnknown_03001884
	mov ip, r0
	lsls r7, r5, #1
	cmp r1, r5
	ble _0802DED4
	movs r2, #0xf0
_0802DEC0:
	subs r4, #1
	strb r2, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DF14 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bgt _0802DEC0
_0802DED4:
	mov r0, ip
	ldr r4, [r0]
	adds r4, r4, r7
	adds r1, r5, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DF0A
	movs r2, #0xf0
_0802DEE4:
	adds r6, r6, r3
	lsls r0, r6, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DEF6
	movs r3, #0
	movs r6, #0xf0
	lsls r6, r6, #8
	movs r0, #0xf0
_0802DEF6:
	subs r4, #1
	subs r0, r2, r0
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DF14 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DEE4
_0802DF0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DF10: .4byte gUnknown_03001884
_0802DF14: .4byte 0xFFFF0000

	thumb_func_start sub_802DF18
sub_802DF18: @ 0x0802DF18
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0802DF64 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r7, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DF68 @ =0xFFFFFEFF
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802DF38
	b _0802E03A
_0802DF38:
	ldr r3, _0802DF6C @ =0xFFFFFE00
	adds r0, r6, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802DF70
	movs r1, #0
	cmp r1, r5
	bge _0802E03A
	movs r2, #0xf0
_0802DF4C:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DF4C
	b _0802E03A
	.align 2, 0
_0802DF64: .4byte gUnknown_03001884
_0802DF68: .4byte 0xFFFFFEFF
_0802DF6C: .4byte 0xFFFFFE00
_0802DF70:
	ldr r2, _0802DFAC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	bge _0802DF98
	rsbs r3, r3, #0
_0802DF98:
	cmp r1, #0
	bge _0802DF9E
	rsbs r1, r1, #0
_0802DF9E:
	cmp r3, #0
	beq _0802DFB0
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DFB2
	.align 2, 0
_0802DFAC: .4byte gSineTable
_0802DFB0:
	mov r3, ip
_0802DFB2:
	ldr r0, _0802E004 @ =0x000001FF
	cmp r6, r0
	bhi _0802E008
	movs r1, #0
	cmp r1, r5
	bge _0802DFD6
	movs r2, #0xf0
_0802DFC0:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DFC0
_0802DFD6:
	adds r1, r5, #0
	cmp r1, #0x9f
	bgt _0802E03A
	movs r2, #0xf0
_0802DFDE:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bhi _0802E03A
	adds r4, #1
	subs r0, r2, r0
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DFDE
	b _0802E03A
	.align 2, 0
_0802E004: .4byte 0x000001FF
_0802E008:
	lsls r0, r5, #1
	adds r4, r4, r0
	adds r1, r5, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802E03A
	movs r2, #0xf0
_0802E016:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802E028
	movs r3, #0
	movs r7, #0xf0
	lsls r7, r7, #8
	movs r0, #0xf0
_0802E028:
	subs r0, r2, r0
	strb r0, [r4]
	subs r4, #2
	lsls r0, r1, #0x10
	ldr r1, _0802E040 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802E016
_0802E03A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E040: .4byte 0xFFFF0000

	thumb_func_start sub_802E044
sub_802E044: @ 0x0802E044
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0802E08C @ =gUnknown_03001884
	ldr r6, [r0]
	lsls r1, r1, #0x16
	lsrs r5, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r5, r0
	bls _0802E0CC
	ldr r2, _0802E090 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E096
	cmp r1, #0
	beq _0802E094
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E096
	.align 2, 0
_0802E08C: .4byte gUnknown_03001884
_0802E090: .4byte gSineTable
_0802E094:
	adds r3, r7, #0
_0802E096:
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r6, r6, r0
	movs r1, #0
_0802E09E:
	subs r4, r4, r3
	asrs r0, r4, #8
	cmp r0, #0xf0
	ble _0802E0AE
	movs r3, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r0, #0xf0
_0802E0AE:
	cmp r0, #0
	bge _0802E0B8
	movs r3, #0
	movs r4, #0
	movs r0, #0
_0802E0B8:
	strb r0, [r6]
	subs r6, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E09E
_0802E0CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E0D4
sub_802E0D4: @ 0x0802E0D4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0802E11C @ =gUnknown_03001884
	ldr r4, [r0]
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r6, r0
	bls _0802E15E
	ldr r2, _0802E120 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r6, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E126
	cmp r1, #0
	beq _0802E124
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E126
	.align 2, 0
_0802E11C: .4byte gUnknown_03001884
_0802E120: .4byte gSineTable
_0802E124:
	adds r3, r7, #0
_0802E126:
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0
_0802E12E:
	subs r5, r5, r3
	asrs r0, r5, #8
	cmp r0, #0xf0
	ble _0802E13E
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802E13E:
	cmp r0, #0
	bge _0802E148
	movs r3, #0
	movs r5, #0
	movs r0, #0
_0802E148:
	subs r4, #1
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E12E
_0802E15E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E164
sub_802E164: @ 0x0802E164
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0802E1AC @ =gUnknown_03001884
	ldr r6, [r0]
	lsls r1, r1, #0x16
	lsrs r5, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r5, r0
	bhi _0802E1E6
	ldr r2, _0802E1B0 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E1B6
	cmp r1, #0
	beq _0802E1B4
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E1B6
	.align 2, 0
_0802E1AC: .4byte gUnknown_03001884
_0802E1B0: .4byte gSineTable
_0802E1B4:
	adds r3, r7, #0
_0802E1B6:
	movs r1, #0
_0802E1B8:
	adds r4, r4, r3
	asrs r0, r4, #8
	cmp r0, #0xf0
	ble _0802E1C8
	movs r3, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r0, #0xf0
_0802E1C8:
	cmp r0, #0
	bge _0802E1D2
	movs r3, #0
	movs r4, #0
	movs r0, #0
_0802E1D2:
	strb r0, [r6]
	adds r6, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E1B8
_0802E1E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E1EC
sub_802E1EC: @ 0x0802E1EC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0802E234 @ =gUnknown_03001884
	ldr r4, [r0]
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r6, r0
	bhi _0802E270
	ldr r2, _0802E238 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r6, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E23E
	cmp r1, #0
	beq _0802E23C
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E23E
	.align 2, 0
_0802E234: .4byte gUnknown_03001884
_0802E238: .4byte gSineTable
_0802E23C:
	adds r3, r7, #0
_0802E23E:
	movs r1, #0
_0802E240:
	adds r5, r5, r3
	asrs r0, r5, #8
	cmp r0, #0xf0
	ble _0802E250
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802E250:
	cmp r0, #0
	bge _0802E25A
	movs r3, #0
	movs r5, #0
	movs r0, #0
_0802E25A:
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E240
_0802E270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E278
sub_802E278: @ 0x0802E278
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r3, #0
	cmp r3, r5
	bge _0802E2B6
	mov r6, sp
	adds r6, #2
_0802E294:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	mov r0, sp
	adds r4, r0, r2
	adds r3, r7, r2
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2
	ldrh r0, [r3, #2]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E294
_0802E2B6:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge _0802E374
	movs r1, #2
	add r1, sp
	mov sl, r1
_0802E2C6:
	ldr r0, _0802E310 @ =gUnknown_03001884
	ldr r5, [r0]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #1
	adds r5, r5, r0
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r6, r2, #8
	adds r1, #1
	lsls r1, r1, #2
	mov r7, sl
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0
	mov r8, r4
	cmp r3, #0
	beq _0802E314
	mov r4, sp
	adds r0, r4, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0
	b _0802E320
	.align 2, 0
_0802E310: .4byte gUnknown_03001884
_0802E314:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8
_0802E320:
	mov r7, r8
	asrs r0, r7, #0x10
	lsls r1, r0, #2
	add r1, sl
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E366
_0802E340:
	asrs r0, r6, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	ble _0802E34C
	movs r0, #0xf0
_0802E34C:
	strb r0, [r5]
	adds r5, #2
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E340
_0802E366:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E2C6
_0802E374:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E384
sub_802E384: @ 0x0802E384
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #0
	cmp r3, r5
	bge _0802E3C2
	mov r6, sp
	adds r6, #2
_0802E3A0:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	mov r0, sp
	adds r4, r0, r2
	adds r3, r7, r2
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2
	ldrh r0, [r3, #2]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E3A0
_0802E3C2:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge _0802E48A
	movs r1, #2
	add r1, sp
	mov sl, r1
_0802E3D2:
	ldr r0, _0802E41C @ =gUnknown_03001884
	ldr r5, [r0]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #1
	adds r5, r5, r0
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r6, r2, #8
	adds r1, #1
	lsls r1, r1, #2
	mov r7, sl
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0
	mov r8, r4
	cmp r3, #0
	beq _0802E420
	mov r4, sp
	adds r0, r4, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0
	b _0802E42C
	.align 2, 0
_0802E41C: .4byte gUnknown_03001884
_0802E420:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8
_0802E42C:
	mov r7, r8
	asrs r0, r7, #0x10
	lsls r1, r0, #2
	add r1, sl
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E47C
_0802E44C:
	lsls r0, r6, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E458
	movs r1, #0xf0
_0802E458:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E460
	movs r1, #0
_0802E460:
	adds r5, #1
	strb r1, [r5]
	adds r5, #1
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E44C
_0802E47C:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E3D2
_0802E48A:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E49C
sub_802E49C: @ 0x0802E49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x12c
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	cmp r1, #8
	bls _0802E4B6
	b _0802E774
_0802E4B6:
	cmp r1, #2
	bhi _0802E4BC
	b _0802E774
_0802E4BC:
	movs r4, #0
	movs r0, #2
	add r0, sp
	mov r8, r0
	subs r1, #1
	str r1, [sp, #0x118]
	mov r2, sp
	adds r2, #0x60
	str r2, [sp, #0x10c]
	mov r3, sp
	adds r3, #0x64
	str r3, [sp, #0x110]
	mov r5, sb
	subs r5, #2
	str r5, [sp, #0x114]
	mov r7, sp
	adds r7, #0x20
	str r7, [sp, #0x120]
	mov r0, sp
	adds r0, #0x40
	str r0, [sp, #0x124]
	cmp r4, sb
	bhs _0802E508
	mov r5, r8
_0802E4EC:
	lsls r1, r4, #2
	mov r2, sp
	adds r3, r2, r1
	adds r2, r6, r1
	ldrh r0, [r2]
	strh r0, [r3]
	adds r1, r5, r1
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E4EC
_0802E508:
	movs r4, #0
	ldr r3, [sp, #0x118]
	cmp r4, r3
	bge _0802E588
_0802E510:
	adds r1, r4, #1
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	str r1, [sp, #0x11c]
	cmp r5, sb
	bhs _0802E57C
	lsls r4, r4, #2
	mov ip, r4
	mov r4, r8
	str r4, [sp, #0x108]
	mov r7, r8
	add r7, ip
	str r7, [sp, #0x128]
	mov r0, sp
	add r0, ip
	mov sl, r0
_0802E530:
	lsls r0, r5, #2
	ldr r1, [sp, #0x108]
	adds r6, r1, r0
	ldr r2, [sp, #0x128]
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r7, #0
	ldrsh r1, [r6, r7]
	cmp r3, r1
	blt _0802E572
	mov r4, sp
	add r4, ip
	mov r7, sp
	adds r2, r7, r0
	cmp r3, r1
	bne _0802E55E
	mov r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	blt _0802E572
_0802E55E:
	ldrh r1, [r4]
	ldrh r0, [r2]
	strh r0, [r4]
	strh r1, [r2]
	ldr r0, [sp, #0x128]
	ldrh r1, [r0]
	ldrh r0, [r6]
	ldr r2, [sp, #0x128]
	strh r0, [r2]
	strh r1, [r6]
_0802E572:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sb
	blo _0802E530
_0802E57C:
	ldr r3, [sp, #0x11c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x118]
	cmp r4, r5
	blt _0802E510
_0802E588:
	ldr r7, [sp, #0x10c]
	mov r0, sp
	ldrh r0, [r0]
	adds r1, r7, #0
	strh r0, [r1]
	mov r0, sp
	ldrh r1, [r0, #2]
	ldr r2, [sp, #0x10c]
	strh r1, [r2, #2]
	movs r4, #1
	cmp r4, sb
	bhs _0802E5EE
	mov r6, r8
	adds r0, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0802E5EE
_0802E5B0:
	adds r2, r7, #0
	lsls r3, r4, #2
	mov r5, sp
	adds r0, r5, r3
	movs r5, #0
	ldrsh r1, [r2, r5]
	ldrh r5, [r0]
	mov sl, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _0802E5D2
	mov r0, sl
	strh r0, [r2]
	adds r0, r6, r3
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E5D2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	bhs _0802E5EE
	lsls r0, r4, #2
	mov r6, r8
	add r0, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	beq _0802E5B0
_0802E5EE:
	ldr r6, [sp, #0x110]
	ldr r7, [sp, #0x118]
	lsls r1, r7, #2
	mov r2, sp
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r6]
	mov sl, r8
	add r1, r8
	ldrh r1, [r1]
	ldr r3, [sp, #0x110]
	strh r1, [r3, #2]
	ldr r4, [sp, #0x114]
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov r7, r8
	adds r0, r7, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	b _0802E650
_0802E61C:
	adds r2, r6, #0
	mov r3, sp
	adds r0, r3, r5
	movs r7, #0
	ldrsh r1, [r2, r7]
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	bge _0802E63A
	strh r3, [r2]
	mov r1, sl
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E63A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov sl, r8
	mov r3, r8
	adds r0, r3, r5
	movs r7, #2
	ldrsh r1, [r2, r7]
_0802E650:
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0802E61C
_0802E658:
	ldr r3, [sp, #0x10c]
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r5, r2, #8
	ldr r7, [sp, #0x110]
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r1, r1, r0
	cmp r1, #0
	beq _0802E682
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, #0x80
	bl Div
	adds r2, r0, #0
	b _0802E68C
_0802E682:
	ldr r4, [sp, #0x110]
	movs r7, #0
	ldrsh r0, [r4, r7]
	subs r0, r0, r2
	lsls r2, r0, #8
_0802E68C:
	ldr r1, [sp, #0x10c]
	ldrh r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #0x110]
	movs r7, #2
	ldrsh r0, [r3, r7]
	cmp r4, r0
	bgt _0802E6C8
	add r6, sp, #0x68
_0802E6A0:
	lsls r0, r5, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E6AC
	movs r1, #0xf0
_0802E6AC:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E6B4
	movs r1, #0
_0802E6B4:
	adds r0, r6, r4
	strb r1, [r0]
	adds r5, r5, r2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r4, r0
	ble _0802E6A0
_0802E6C8:
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E716
	add r2, sp, #0x68
	mov ip, r2
	ldr r3, [sp, #0x120]
	mov sl, r3
	mov r7, r8
_0802E6DA:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bgt _0802E70C
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x22
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E70C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E6DA
_0802E716:
	ldr r0, [sp, #0x120]
	adds r1, r5, #0
	bl sub_802E278
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E76C
	add r1, sp, #0x68
	mov ip, r1
	ldr r2, [sp, #0x124]
	mov sl, r2
	mov r7, r8
_0802E730:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r3, #0
	ldrsh r0, [r6, r3]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	blt _0802E762
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x42
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E762:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E730
_0802E76C:
	ldr r0, [sp, #0x124]
	adds r1, r5, #0
	bl sub_802E384
_0802E774:
	add sp, #0x12c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E784
sub_802E784: @ 0x0802E784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r4, [sp, #0x58]
	ldr r5, [sp, #0x5c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x24]
	lsls r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x28]
	movs r0, #0
	mov sl, r0
	ldr r1, _0802E80C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802E810 @ =gUnknown_03002878
	ldr r0, _0802E814 @ =0x04000040
	str r0, [r1]
	ldr r2, _0802E818 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	lsrs r1, r3, #0x10
	mov ip, r1
	asrs r2, r3, #0x10
	ldr r5, _0802E81C @ =0xFFFF0000
	adds r3, r3, r5
	lsrs r3, r3, #0x10
	cmp r3, #0xee
	bls _0802E7DC
	b _0802EABC
_0802E7DC:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x9f
	ble _0802E7E8
	b _0802EABC
_0802E7E8:
	cmp r2, #0
	bgt _0802E7EE
	b _0802EABC
_0802E7EE:
	ldr r0, _0802E820 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802E824 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802E830
	add r1, sp, #0x1c
	mov r6, sl
	strh r6, [r1]
	ldr r0, _0802E828 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802E82C @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802E848
	.align 2, 0
_0802E80C: .4byte gUnknown_03002A80
_0802E810: .4byte gUnknown_03002878
_0802E814: .4byte 0x04000040
_0802E818: .4byte gFlags
_0802E81C: .4byte 0xFFFF0000
_0802E820: .4byte gUnknown_03001884
_0802E824: .4byte gUnknown_03001B60
_0802E828: .4byte 0x040000D4
_0802E82C: .4byte 0x81000140
_0802E830:
	add r0, sp, #0x1c
	mov r1, sl
	strh r1, [r0]
	ldr r1, _0802E938 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802E93C @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802E848:
	ldr r4, [sp, #0x20]
	ldr r6, _0802E940 @ =0xFFFFFF00
	adds r1, r4, r6
	ldr r2, _0802E944 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldr r4, _0802E948 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
	str r3, [sp, #0x34]
	adds r0, r3, #0
	muls r0, r7, r0
	asrs r6, r0, #0xf
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r8, r0
	mov r0, r8
	muls r0, r7, r0
	asrs r7, r0, #0xf
	mov r1, sp
	mov r0, ip
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	adds r0, r3, r6
	strh r0, [r1, #4]
	asrs r5, r5, #0x10
	adds r0, r5, r7
	strh r0, [r1, #6]
	subs r0, r3, r6
	strh r0, [r1]
	subs r0, r5, r7
	strh r0, [r1, #2]
	ldr r1, [sp, #0x20]
	adds r2, r1, r2
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r6, [r2, r0]
	mov ip, r6
	ldr r1, [sp, #0x28]
	mov r0, ip
	muls r0, r1, r0
	asrs r6, r0, #0xe
	ldr r0, [sp, #0x20]
	lsls r2, r0, #1
	adds r2, r2, r4
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r4, [sp, #0x28]
	muls r0, r4, r0
	asrs r7, r0, #0xe
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #4]
	adds r0, r0, r6
	strh r0, [r1, #4]
	mov r0, sp
	ldrh r0, [r0, #6]
	adds r0, r0, r7
	strh r0, [r1, #6]
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r0, r6
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r0, r0, r7
	strh r0, [r1, #2]
	mov r0, sp
	ldrh r0, [r0, #4]
	str r0, [sp, #0x2c]
	mov r0, sp
	ldrh r0, [r0, #6]
	str r0, [sp, #0x30]
	mov r0, sp
	ldrh r4, [r0]
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r6, [sp, #0x34]
	ldr r1, [sp, #0x24]
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r6, r0, #0xf
	mov r0, r8
	muls r0, r1, r0
	asrs r7, r0, #0xf
	mov r1, sp
	adds r0, r3, r6
	strh r0, [r1, #8]
	adds r0, r5, r7
	strh r0, [r1, #0xa]
	mov r0, sp
	subs r3, r3, r6
	strh r3, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	mov r3, ip
	lsls r0, r3, #4
	subs r0, r0, r3
	asrs r6, r0, #2
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r7, r0, #0x16
	cmp r6, #0
	beq _0802E950
	cmp r7, #0
	beq _0802E94C
	adds r0, r6, #0
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	b _0802E950
	.align 2, 0
_0802E938: .4byte 0x040000D4
_0802E93C: .4byte 0x81000140
_0802E940: .4byte 0xFFFFFF00
_0802E944: .4byte 0x000003FF
_0802E948: .4byte gSineTable
_0802E94C:
	movs r6, #0xf0
	lsls r6, r6, #8
_0802E950:
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #0x10
	asrs r1, r0, #8
	ldr r0, _0802E968 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802E996
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r5, sb
	lsls r3, r5, #0x10
	b _0802E972
	.align 2, 0
_0802E968: .4byte 0x000001FF
_0802E96C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E972:
	cmp r2, #0x9e
	bhi _0802E9C0
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E98A
	cmp r0, #0
	bge _0802E96C
	b _0802E9BC
_0802E98A:
	movs r1, #0xf0
	mov sl, r1
	b _0802E9C0
_0802E990:
	movs r5, #0xf0
	mov sl, r5
	b _0802E9C0
_0802E996:
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r0, sb
	lsls r3, r0, #0x10
	b _0802E9A6
_0802E9A0:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E9A6:
	cmp r2, #0
	beq _0802E9C0
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E990
	cmp r0, #0
	bge _0802E9A0
_0802E9BC:
	movs r0, #0
	mov sl, r0
_0802E9C0:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	asrs r1, r4, #8
	ldr r0, _0802EA08 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802EA18
	lsrs r2, r3, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	blt _0802EA30
_0802E9EA:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	bge _0802E9EA
	b _0802EA52
	.align 2, 0
_0802EA08: .4byte 0x000001FF
_0802EA0C:
	movs r0, #0xf0
	mov sl, r0
	b _0802EA56
_0802EA12:
	movs r1, #0xf0
	mov sl, r1
	b _0802EA56
_0802EA18:
	lsrs r2, r3, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA30:
	movs r4, #0
	mov sl, r4
	b _0802EA56
_0802EA36:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA52:
	movs r6, #0
	mov sl, r6
_0802EA56:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	mov r1, sp
	ldrh r6, [r0, #0x14]
	movs r3, #0x14
	ldrsh r4, [r0, r3]
	ldrh r5, [r1, #0x10]
	movs r0, #0x10
	ldrsh r3, [r1, r0]
	cmp r4, r3
	beq _0802EAB2
	mov r0, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	cmp r1, r0
	beq _0802EAB2
	cmp r3, #0
	bne _0802EA8C
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA8C:
	cmp r4, #0
	beq _0802EA9E
	cmp r3, #0xf0
	bne _0802EA9E
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA9E:
	mov r0, sp
	strh r6, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x12]
_0802EAA6:
	strh r0, [r1, #0x1a]
	mov r0, sp
	movs r1, #7
	bl sub_802E49C
	b _0802ED86
_0802EAB2:
	mov r0, sp
	movs r1, #6
	bl sub_802E49C
	b _0802ED86
_0802EABC:
	lsrs r0, r7, #1
	adds r2, r0, #0
	mov r8, r2
	cmp r2, #0
	bne _0802EB14
	ldr r0, _0802EAE4 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r3, _0802EAE8 @ =gUnknown_03001B60
	cmp r0, r3
	bne _0802EAF4
	add r1, sp, #0x1c
	strh r2, [r1]
	ldr r0, _0802EAEC @ =0x040000D4
	str r1, [r0]
	str r3, [r0, #4]
	ldr r1, _0802EAF0 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802ED86
	.align 2, 0
_0802EAE4: .4byte gUnknown_03001884
_0802EAE8: .4byte gUnknown_03001B60
_0802EAEC: .4byte 0x040000D4
_0802EAF0: .4byte 0x81000140
_0802EAF4:
	add r0, sp, #0x1c
	strh r2, [r0]
	ldr r1, _0802EB0C @ =0x040000D4
	str r0, [r1]
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r0, r3, r4
	str r0, [r1, #4]
	ldr r0, _0802EB10 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0802ED86
	.align 2, 0
_0802EB0C: .4byte 0x040000D4
_0802EB10: .4byte 0x81000140
_0802EB14:
	ldr r5, [sp, #0x20]
	ldr r6, _0802EB6C @ =0xFFFFFEFF
	adds r0, r5, r6
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	lsls r5, r4, #0x10
	cmp r0, r1
	bhi _0802EBE8
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0xef
	ble _0802EBE8
	ldr r1, _0802EB70 @ =gSineTable
	ldr r3, [sp, #0x20]
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r2, #0
	subs r0, #0xf0
	muls r0, r1, r0
	asrs r7, r0, #0xe
	asrs r0, r5, #0x10
	adds r7, r7, r0
	subs r0, r7, #1
	cmp r0, #0x9e
	bhi _0802EBE8
	movs r3, #0xf1
	ldr r0, _0802EB74 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802EB78 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EB84
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EB7C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EB80 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EB9A
	.align 2, 0
_0802EB6C: .4byte 0xFFFFFEFF
_0802EB70: .4byte gSineTable
_0802EB74: .4byte gUnknown_03001884
_0802EB78: .4byte gUnknown_03001B60
_0802EB7C: .4byte 0x040000D4
_0802EB80: .4byte 0x81000140
_0802EB84:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EBAC @ =0x040000D4
	str r0, [r1]
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r0, r2, r5
	str r0, [r1, #4]
	ldr r0, _0802EBB0 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EB9A:
	mov r6, r8
	subs r0, r7, r6
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBB4
	movs r3, #0
	b _0802EBBA
	.align 2, 0
_0802EBAC: .4byte 0x040000D4
_0802EBB0: .4byte 0x81000140
_0802EBB4:
	cmp r0, #0xa0
	ble _0802EBBA
	movs r3, #0xa0
_0802EBBA:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DF18
	mov r1, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBD6
	movs r3, #0
	b _0802EBDC
_0802EBD6:
	cmp r0, #0xa0
	ble _0802EBDC
	movs r3, #0xa0
_0802EBDC:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DDC4
	b _0802ED86
_0802EBE8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bls _0802ECC2
	asrs r2, r5, #0x10
	cmp r2, #0x9f
	ble _0802ECB8
	ldr r1, _0802EC40 @ =gSineTable
	ldr r3, [sp, #0x20]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r3, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, r2, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi _0802ECB8
	movs r3, #0xf1
	ldr r0, _0802EC44 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802EC48 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EC54
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EC4C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EC50 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EC6A
	.align 2, 0
_0802EC40: .4byte gSineTable
_0802EC44: .4byte gUnknown_03001884
_0802EC48: .4byte gUnknown_03001B60
_0802EC4C: .4byte 0x040000D4
_0802EC50: .4byte 0x81000140
_0802EC54:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EC7C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802EC80 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EC6A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EC84
	movs r4, #0
	b _0802EC8A
	.align 2, 0
_0802EC7C: .4byte 0x040000D4
_0802EC80: .4byte 0x81000140
_0802EC84:
	cmp r0, #0xf0
	ble _0802EC8A
	movs r4, #0xf0
_0802EC8A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E0D4
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ECA6
	movs r4, #0
	b _0802ECAC
_0802ECA6:
	cmp r0, #0xf0
	ble _0802ECAC
	movs r4, #0xf0
_0802ECAC:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E044
	b _0802ED86
_0802ECB8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r6, [sp, #0x20]
	cmp r6, r0
	bhi _0802ED86
_0802ECC2:
	asrs r5, r5, #0x10
	cmp r5, #0
	bge _0802ED86
	ldr r1, _0802ED10 @ =gSineTable
	ldr r2, [sp, #0x20]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r5, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r5, ip
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi _0802ED86
	movs r3, #0xf1
	ldr r0, _0802ED14 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802ED18 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802ED24
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802ED1C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802ED20 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802ED3A
	.align 2, 0
_0802ED10: .4byte gSineTable
_0802ED14: .4byte gUnknown_03001884
_0802ED18: .4byte gUnknown_03001B60
_0802ED1C: .4byte 0x040000D4
_0802ED20: .4byte 0x81000140
_0802ED24:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802ED4C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802ED50 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802ED3A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED54
	movs r4, #0
	b _0802ED5A
	.align 2, 0
_0802ED4C: .4byte 0x040000D4
_0802ED50: .4byte 0x81000140
_0802ED54:
	cmp r0, #0xf0
	ble _0802ED5A
	movs r4, #0xf0
_0802ED5A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E1EC
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED76
	movs r4, #0
	b _0802ED7C
_0802ED76:
	cmp r0, #0xf0
	ble _0802ED7C
	movs r4, #0xf0
_0802ED7C:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E164
_0802ED86:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802ED98
sub_802ED98: @ 0x0802ED98
	push {r4, lr}
	ldr r4, _0802EDCC @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802EE64
	ldr r0, [r4]
	bl TaskDestroy
	ldr r0, _0802EDD0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802EDD8
	ldr r0, _0802EDD4 @ =gUnknown_03005490
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _0802EE64
	.align 2, 0
_0802EDCC: .4byte gCurTask
_0802EDD0: .4byte gGameMode
_0802EDD4: .4byte gUnknown_03005490
_0802EDD8:
	ldr r3, _0802EE0C @ =gCurrentLevel
	ldrb r0, [r3]
	lsls r2, r0, #0x18
	cmp r0, #0x1c
	beq _0802EE64
	ldr r0, _0802EE10 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802EE54
	ldr r0, _0802EE14 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bgt _0802EE54
	asrs r0, r2, #0x1a
	cmp r0, #2
	beq _0802EE26
	cmp r0, #2
	bgt _0802EE18
	cmp r0, #0
	beq _0802EE1E
	b _0802EE36
	.align 2, 0
_0802EE0C: .4byte gCurrentLevel
_0802EE10: .4byte gSelectedCharacter
_0802EE14: .4byte gLoadedSaveGame
_0802EE18:
	cmp r0, #4
	beq _0802EE2E
	b _0802EE36
_0802EE1E:
	movs r0, #0
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE26:
	movs r0, #1
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE2E:
	movs r0, #2
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE36:
	ldr r0, _0802EE48 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0802EE4C @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0802EE50 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
	b _0802EE64
	.align 2, 0
_0802EE48: .4byte gUnknown_03005490
_0802EE4C: .4byte gRingCount
_0802EE50: .4byte gUnknown_030054F4
_0802EE54:
	ldr r0, _0802EE6C @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0802EE70 @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0802EE74 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0802EE64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EE6C: .4byte gUnknown_03005490
_0802EE70: .4byte gRingCount
_0802EE74: .4byte gUnknown_030054F4

	thumb_func_start sub_802EE78
sub_802EE78: @ 0x0802EE78
	push {r4, r5, r6, lr}
	ldr r0, _0802EF44 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0802EF3C
	strh r1, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	strh r1, [r4, #6]
	movs r0, #0xbf
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r3, _0802EF48 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x1a
	beq _0802EEC0
	ldr r0, _0802EF4C @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
_0802EEC0:
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x1c
	bne _0802EF34
	ldr r2, _0802EF50 @ =gUnknown_080D6DE4
	ldrb r1, [r4, #0x11]
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrh r5, [r0]
	ldr r4, _0802EF54 @ =gPlayer
	ldr r3, [r4, #8]
	asrs r0, r3, #8
	subs r5, r5, r0
	adds r2, #2
	adds r1, r1, r2
	ldrh r2, [r1]
	ldr r1, [r4, #0xc]
	asrs r0, r1, #8
	subs r2, r2, r0
	lsls r6, r5, #8
	adds r3, r3, r6
	str r3, [r4, #8]
	lsls r3, r2, #8
	adds r1, r1, r3
	str r1, [r4, #0xc]
	ldr r1, _0802EF58 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	adds r0, r0, r2
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	adds r0, r0, r2
	str r0, [r1, #0x14]
	ldr r0, _0802EF5C @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _0802EF2C
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r3
	str r0, [r1, #4]
_0802EF2C:
	ldr r1, _0802EF60 @ =gUnknown_030055B0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0802EF34:
	ldr r0, _0802EF44 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0802EF64 @ =sub_802F06C
	str r0, [r1, #8]
_0802EF3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF44: .4byte gCurTask
_0802EF48: .4byte gCurrentLevel
_0802EF4C: .4byte gFlags
_0802EF50: .4byte gUnknown_080D6DE4
_0802EF54: .4byte gPlayer
_0802EF58: .4byte gCamera
_0802EF5C: .4byte gUnknown_030056A4
_0802EF60: .4byte gUnknown_030055B0
_0802EF64: .4byte sub_802F06C

	thumb_func_start sub_802EF68
sub_802EF68: @ 0x0802EF68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802EFD4 @ =sub_802EE78
	movs r2, #0xc1
	lsls r2, r2, #7
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0, #0x10]
	strh r4, [r0, #0xc]
	strh r5, [r0, #0xe]
	strb r6, [r0, #0x11]
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #4]
	movs r1, #1
	strh r1, [r0, #2]
	movs r1, #0xc0
	strh r1, [r0, #6]
	movs r1, #0xbf
	strh r1, [r0, #8]
	mov r1, r8
	strh r1, [r0, #0xa]
	ldr r0, _0802EFD8 @ =0x0000014D
	bl m4aSongNumStart
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EFD4: .4byte sub_802EE78
_0802EFD8: .4byte 0x0000014D

	thumb_func_start sub_802EFDC
sub_802EFDC: @ 0x0802EFDC
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0802F004 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802F008 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802F014
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0802F00C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802F010 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802F02A
	.align 2, 0
_0802F004: .4byte gUnknown_03001884
_0802F008: .4byte gUnknown_03001B60
_0802F00C: .4byte 0x040000D4
_0802F010: .4byte 0x81000140
_0802F014:
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0802F030 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802F034 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802F02A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802F030: .4byte 0x040000D4
_0802F034: .4byte 0x81000140

	thumb_func_start sub_802F038
sub_802F038: @ 0x0802F038
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0802F068 @ =gUnknown_03001884
	ldr r3, [r0]
	lsls r0, r1, #1
	adds r3, r3, r0
	cmp r1, r2
	bhs _0802F060
_0802F052:
	strh r4, [r3]
	adds r3, #2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blo _0802F052
_0802F060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F068: .4byte gUnknown_03001884

	thumb_func_start sub_802F06C
sub_802F06C: @ 0x0802F06C
	push {r4, r5, lr}
	ldr r5, _0802F0A0 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _0802F098
	movs r0, #0x3c
	strh r0, [r4, #6]
	ldr r1, [r5]
	ldr r0, _0802F0A4 @ =sub_802ED98
	str r0, [r1, #8]
_0802F098:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F0A0: .4byte gCurTask
_0802F0A4: .4byte sub_802ED98

	thumb_func_start sub_802F0A8
sub_802F0A8: @ 0x0802F0A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r2, _0802F200 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r7, _0802F204 @ =gPlayer
	adds r0, r7, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	orrs r0, r2
	str r0, [r1, #0x1c]
	adds r0, r7, #0
	adds r0, #0x94
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r0, _0802F208 @ =gUnknown_03005B4C
	movs r4, #0
	str r4, [r0]
	ldr r0, _0802F20C @ =sub_802F75C
	movs r2, #0x88
	lsls r2, r2, #6
	ldr r1, _0802F210 @ =sub_80303CC
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r0, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r0, r0, r5
	str r0, [sp, #8]
	movs r6, #2
	str r6, [r0]
	strb r4, [r0, #4]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r7, #0x20]
	ldr r0, _0802F214 @ =sub_802F9F8
	ldr r2, _0802F218 @ =0x00002210
	ldr r1, _0802F21C @ =sub_8030458
	mov r8, r1
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r3, _0802F220 @ =IWRAM_START+4
	adds r0, r0, r3
	strh r4, [r0]
	strh r4, [r0, #4]
	strh r6, [r0, #2]
	strh r4, [r0, #6]
	ldr r1, _0802F224 @ =0x00003FFF
	strh r1, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_802D4CC
	ldr r0, _0802F228 @ =sub_802FD34
	ldr r2, _0802F22C @ =0x00002220
	mov r1, r8
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r3, _0802F230 @ =IWRAM_START + 0x10
	adds r1, r0, r3
	strh r4, [r1]
	strh r4, [r1, #2]
	ldr r2, _0802F234 @ =IWRAM_START + 0x14
	adds r1, r0, r2
	strh r4, [r1]
	strh r4, [r1, #2]
	ldr r0, _0802F238 @ =sub_802FF94
	movs r1, #0xc4
	lsls r1, r1, #2
	ldr r2, _0802F23C @ =0x00002230
	ldr r3, _0802F240 @ =sub_803045C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r0, r0, r5
	mov r8, r0
	ldr r3, [sp, #8]
	str r3, [r0]
	ldr r0, _0802F244 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802F260
	ldr r2, _0802F248 @ =gUnknown_080D6E00
	ldr r0, _0802F24C @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F250 @ =gUnknown_080D6E1E
	ldr r1, _0802F254 @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r1, r4, #3
	adds r1, r1, r5
	ldrh r6, [r1]
	lsls r2, r2, #2
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r6
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r3, r2, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r3, [r1]
	adds r2, #3
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0802F258 @ =gUnknown_080D6F0E
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, _0802F25C @ =gUnknown_080D6F44
	ldrh r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	b _0802F2BE
	.align 2, 0
_0802F200: .4byte gUnknown_03005424
_0802F204: .4byte gPlayer
_0802F208: .4byte gUnknown_03005B4C
_0802F20C: .4byte sub_802F75C
_0802F210: .4byte sub_80303CC
_0802F214: .4byte sub_802F9F8
_0802F218: .4byte 0x00002210
_0802F21C: .4byte sub_8030458
_0802F220: .4byte IWRAM_START+4
_0802F224: .4byte 0x00003FFF
_0802F228: .4byte sub_802FD34
_0802F22C: .4byte 0x00002220
_0802F230: .4byte IWRAM_START + 0x10
_0802F234: .4byte IWRAM_START + 0x14
_0802F238: .4byte sub_802FF94
_0802F23C: .4byte 0x00002230
_0802F240: .4byte sub_803045C
_0802F244: .4byte gGameMode
_0802F248: .4byte gUnknown_080D6E00
_0802F24C: .4byte gSelectedCharacter
_0802F250: .4byte gUnknown_080D6E1E
_0802F254: .4byte gCurrentLevel
_0802F258: .4byte gUnknown_080D6F0E
_0802F25C: .4byte gUnknown_080D6F44
_0802F260:
	ldr r2, _0802F3E0 @ =gUnknown_080D6E00
	ldr r0, _0802F3E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F3E8 @ =gUnknown_080D6E1E
	ldr r1, _0802F3EC @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r1, r4, #3
	adds r1, r1, r5
	ldrh r6, [r1]
	lsls r2, r2, #2
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r6
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r3, r2, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r3, [r1]
	adds r2, #3
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0802F3F0 @ =gUnknown_080D6F0E
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x24
_0802F2BE:
	adds r0, r0, r1
	bl VramMalloc
	adds r6, r0, #0
	movs r5, #0xda
	lsls r5, r5, #1
	add r5, r8
	movs r4, #0
	movs r7, #0
	strh r7, [r5, #0x16]
	strh r7, [r5, #0x18]
	str r6, [r5, #4]
	ldr r2, _0802F3E0 @ =gUnknown_080D6E00
	ldr r3, _0802F3E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r7, [r5, #8]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0xea
	lsls r0, r0, #1
	add r0, r8
	strb r1, [r0]
	strh r7, [r5, #0x14]
	strh r7, [r5, #0x1c]
	ldr r1, _0802F3F4 @ =0x000001D5
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0xeb
	lsls r1, r1, #1
	add r1, r8
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802F3F8 @ =0x000001D9
	add r1, r8
	strb r4, [r1]
	ldr r0, _0802F3FC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802F34C
	ldr r0, _0802F400 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1]
_0802F34C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r7, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r7, #0
	movs r4, #0xb1
	lsls r4, r4, #2
	add r4, r8
	str r4, [sp, #0x20]
	ldr r0, _0802F404 @ =0x000002C5
	add r0, r8
	str r0, [sp, #0x24]
	ldr r1, _0802F408 @ =0x000002C6
	add r1, r8
	str r1, [sp, #0x28]
	ldr r2, _0802F40C @ =0x000002C9
	add r2, r8
	str r2, [sp, #0x2c]
	movs r3, #0xbd
	lsls r3, r3, #2
	add r3, r8
	str r3, [sp, #0x10]
	ldr r4, _0802F410 @ =0x000002F5
	add r4, r8
	str r4, [sp, #0x14]
	ldr r0, _0802F414 @ =0x000002F6
	add r0, r8
	str r0, [sp, #0x18]
	ldr r1, _0802F418 @ =0x000002F9
	add r1, r8
	str r1, [sp, #0x1c]
	movs r2, #0
	ldr r3, _0802F3E8 @ =gUnknown_080D6E1E
	adds r4, r3, #2
	mov sl, r4
	adds r0, r3, #4
	mov ip, r0
_0802F39C:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r4, r8
	adds r5, r4, r0
	strh r2, [r5, #0x16]
	strh r2, [r5, #0x18]
	ldr r0, _0802F3EC @ =gCurrentLevel
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0802F41C
	str r6, [r5, #4]
	adds r0, r7, #0
	adds r0, #0x20
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r4, r1, #0
	add r4, sl
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	add r1, ip
	ldrh r1, [r1]
	b _0802F47E
	.align 2, 0
_0802F3E0: .4byte gUnknown_080D6E00
_0802F3E4: .4byte gSelectedCharacter
_0802F3E8: .4byte gUnknown_080D6E1E
_0802F3EC: .4byte gCurrentLevel
_0802F3F0: .4byte gUnknown_080D6F0E
_0802F3F4: .4byte 0x000001D5
_0802F3F8: .4byte 0x000001D9
_0802F3FC: .4byte gGameMode
_0802F400: .4byte 0x04000128
_0802F404: .4byte 0x000002C5
_0802F408: .4byte 0x000002C6
_0802F40C: .4byte 0x000002C9
_0802F410: .4byte 0x000002F5
_0802F414: .4byte 0x000002F6
_0802F418: .4byte 0x000002F9
_0802F41C:
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _0802F446
	str r6, [r5, #4]
	adds r0, r7, #0
	adds r0, #0x24
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r4, r1, #0
	add r4, sl
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	add r1, ip
	ldrh r1, [r1]
	b _0802F47E
_0802F446:
	str r6, [r5, #4]
	ldr r1, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #2
	adds r0, r0, r7
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	add r1, sl
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldr r4, _0802F5D8 @ =gCurrentLevel
	ldrb r1, [r4]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r1, r1, #2
	adds r1, r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, ip
	ldrh r1, [r0]
_0802F47E:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	movs r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov r4, sp
	strb r0, [r4, #0xc]
	movs r0, #0xff
	strb r0, [r1, r5]
	adds r0, r5, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r2, [r0]
	movs r4, #1
	rsbs r4, r4, #0
	mov sb, r4
	str r4, [r5, #0x28]
	str r2, [r5, #0x10]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _0802F4C0
	b _0802F39C
_0802F4C0:
	movs r5, #0xa9
	lsls r5, r5, #2
	add r5, r8
	movs r7, #0
	movs r4, #0
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	str r6, [r5, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	adds r6, r6, r0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r5, #0x1a]
	strh r4, [r5, #8]
	subs r0, #0x25
	strh r0, [r5, #0xa]
	ldr r2, [sp, #0x20]
	strb r7, [r2]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	movs r0, #0x20
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	ldr r2, [sp, #0x2c]
	strb r7, [r2]
	mov r3, sb
	str r3, [r5, #0x28]
	str r4, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r5, #0xb5
	lsls r5, r5, #2
	add r5, r8
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	str r6, [r5, #4]
	ldr r3, _0802F5DC @ =gUnknown_080D6F0E
	ldr r2, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r0, r3, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldrb r1, [r2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r3, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1d
	bne _0802F558
	ldrh r0, [r3, #0x32]
	strh r0, [r5, #0xa]
	ldrh r0, [r3, #0x34]
	strb r0, [r1]
_0802F558:
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	mov r4, sp
	ldrb r4, [r4, #0xc]
	orrs r0, r4
	strb r0, [r3]
	movs r1, #0x10
	ldr r0, [sp, #0x18]
	strb r1, [r0]
	ldr r2, [sp, #0x1c]
	strb r7, [r2]
	mov r3, sb
	str r3, [r5, #0x28]
	ldr r2, _0802F5E0 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _0802F5E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802F652
	movs r7, #0
	movs r4, #0
	mov sb, r4
	movs r3, #0
	ldr r4, _0802F5E8 @ =gUnknown_080D6F44
_0802F5A8:
	lsls r0, r7, #1
	adds r1, r0, r7
	lsls r0, r1, #4
	adds r0, #4
	mov r2, r8
	adds r5, r2, r0
	strh r3, [r5, #0x16]
	ldr r0, _0802F5EC @ =0x0000FFE0
	strh r0, [r5, #0x18]
	str r6, [r5, #4]
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r6, r6, r0
	ldr r0, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r2, r0, #0x18
	cmp r0, #0x1d
	bne _0802F5F0
	cmp r7, #8
	bne _0802F5FE
	ldrh r0, [r4, #0x38]
	strh r0, [r5, #0xa]
	ldrh r1, [r4, #0x3a]
	b _0802F60E
	.align 2, 0
_0802F5D8: .4byte gCurrentLevel
_0802F5DC: .4byte gUnknown_080D6F0E
_0802F5E0: .4byte gUnknown_030054B8
_0802F5E4: .4byte gGameMode
_0802F5E8: .4byte gUnknown_080D6F44
_0802F5EC: .4byte 0x0000FFE0
_0802F5F0:
	asrs r0, r2, #0x1a
	cmp r7, r0
	bne _0802F5FE
	ldrh r0, [r4, #0x38]
	strh r0, [r5, #0xa]
	ldrh r1, [r4, #0x3a]
	b _0802F60E
_0802F5FE:
	lsls r1, r1, #1
	adds r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	adds r0, r4, #4
	adds r1, r1, r0
	ldrh r1, [r1]
_0802F60E:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r3, [r5, #0x10]
	adds r0, r5, #0
	str r3, [sp, #0x30]
	bl sub_8004558
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #8
	bls _0802F5A8
_0802F652:
	ldr r0, _0802F73C @ =sub_80302AC
	movs r2, #0x89
	lsls r2, r2, #6
	ldr r1, _0802F740 @ =sub_8030474
	str r1, [sp]
	movs r1, #0xc4
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r4, _0802F744 @ =gUnknown_080D6F80
	ldrh r0, [r4]
	lsls r0, r0, #2
	bl VramMalloc
	adds r6, r0, #0
	movs r7, #0
	movs r3, #0
	mov sl, r3
	movs r3, #0
	mov sb, r4
_0802F688:
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r0, r1, #4
	adds r0, #4
	mov r2, r8
	adds r5, r2, r0
	strh r3, [r5, #0x16]
	ldr r0, _0802F748 @ =0x0000FFE0
	strh r0, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	adds r0, r4, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r2, r5, #0
	adds r2, #0x20
	strb r0, [r2]
	cmp r7, #3
	bne _0802F6C8
	ldr r0, _0802F74C @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802F6C8
	ldrh r0, [r4, #0x1a]
	strh r0, [r5, #0xa]
	ldrh r0, [r4, #0x1c]
	strb r0, [r2]
_0802F6C8:
	str r6, [r5, #4]
	mov r1, sb
	ldrh r0, [r1]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r0, #0x80
	strh r0, [r5, #0x1a]
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r3, [r5, #0x10]
	adds r0, r5, #0
	str r3, [sp, #0x30]
	bl sub_8004558
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #3
	bls _0802F688
	ldr r0, _0802F750 @ =sub_8030404
	ldr r2, _0802F754 @ =0x000022F0
	ldr r1, _0802F758 @ =sub_8030458
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r3, [sp, #8]
	str r3, [r1]
	ldr r0, [sp, #4]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F73C: .4byte sub_80302AC
_0802F740: .4byte sub_8030474
_0802F744: .4byte gUnknown_080D6F80
_0802F748: .4byte 0x0000FFE0
_0802F74C: .4byte gCurrentLevel
_0802F750: .4byte sub_8030404
_0802F754: .4byte 0x000022F0
_0802F758: .4byte sub_8030458

	thumb_func_start sub_802F75C
sub_802F75C: @ 0x0802F75C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802F7E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r5, [r6]
	adds r5, #1
	ldr r0, _0802F7E4 @ =gGameMode
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #2
	bhi _0802F7BA
	ldr r0, _0802F7E8 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r2, #3
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #2
	beq _0802F7BA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802F796
	ldr r0, _0802F7EC @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F7BA
_0802F796:
	cmp r1, #0x1d
	beq _0802F7BA
	ldr r0, _0802F7F0 @ =gPressedKeys
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0802F7BA
	ldr r2, _0802F7F4 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802F7F8 @ =0xFFEFFFFF
	ands r0, r1
	ldr r1, _0802F7FC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r5, #0xc8
	movs r0, #1
	strb r0, [r6, #4]
_0802F7BA:
	str r5, [r6]
	ldr r0, _0802F800 @ =gUnknown_03005AF0
	ldr r1, [r0, #0x1c]
	ldr r2, _0802F804 @ =0xFFFFFE7F
	ands r1, r2
	str r1, [r0, #0x1c]
	cmp r5, #0x95
	bhi _0802F808
	ldr r2, _0802F7F4 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	b _0802F82E
	.align 2, 0
_0802F7E0: .4byte gCurTask
_0802F7E4: .4byte gGameMode
_0802F7E8: .4byte gCurrentLevel
_0802F7EC: .4byte gUnknown_030054B0
_0802F7F0: .4byte gPressedKeys
_0802F7F4: .4byte gPlayer
_0802F7F8: .4byte 0xFFEFFFFF
_0802F7FC: .4byte 0xFFBFFFFF
_0802F800: .4byte gUnknown_03005AF0
_0802F804: .4byte 0xFFFFFE7F
_0802F808:
	cmp r5, #0x97
	bne _0802F81C
	ldr r0, _0802F814 @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _0802F818 @ =0xFFEFFFFF
	b _0802F82A
	.align 2, 0
_0802F814: .4byte gPlayer
_0802F818: .4byte 0xFFEFFFFF
_0802F81C:
	adds r0, r5, #0
	subs r0, #0x96
	cmp r0, #0x10
	bhi _0802F82E
	ldr r0, _0802F8B0 @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _0802F8B4 @ =0xFFBFFFFF
_0802F82A:
	ands r1, r2
	str r1, [r0, #0x20]
_0802F82E:
	ldr r0, _0802F8B8 @ =gUnknown_080D6FF0
	ldr r7, _0802F8BC @ =gSelectedCharacter
	movs r4, #0
	ldrsb r4, [r7, r4]
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, #0xc8
	subs r0, r0, r1
	cmp r5, r0
	bne _0802F8D8
	ldr r0, _0802F8C0 @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802F8D8
	ldr r0, _0802F8C4 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0802F8D8
	ldr r3, _0802F8B0 @ =gPlayer
	ldr r2, _0802F8C8 @ =gUnknown_080D6FA0
	lsls r0, r4, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #6]
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x90
	ldr r1, [r4]
	ldr r0, [r1, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	orrs r0, r2
	str r0, [r1, #0x1c]
	adds r0, r3, #0
	adds r0, #0x94
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	orrs r0, r2
	str r0, [r1, #0x1c]
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #2
	bls _0802F8D0
	ldr r1, [r4]
	ldr r0, _0802F8CC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #0x31
	strb r0, [r1]
	b _0802F8D8
	.align 2, 0
_0802F8B0: .4byte gPlayer
_0802F8B4: .4byte 0xFFBFFFFF
_0802F8B8: .4byte gUnknown_080D6FF0
_0802F8BC: .4byte gSelectedCharacter
_0802F8C0: .4byte gUnknown_030055B0
_0802F8C4: .4byte gCurrentLevel
_0802F8C8: .4byte gUnknown_080D6FA0
_0802F8CC: .4byte 0x04000128
_0802F8D0:
	ldr r0, [r4]
	adds r0, #0x31
	movs r1, #0
	strb r1, [r0]
_0802F8D8:
	cmp r5, #0xc8
	bhi _0802F8DE
	b _0802F9E6
_0802F8DE:
	ldr r4, _0802F924 @ =gUnknown_03005424
	ldrh r0, [r4]
	ldr r3, _0802F928 @ =0x0000FEFF
	ands r3, r0
	strh r3, [r4]
	ldr r1, _0802F92C @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #2
	beq _0802F90A
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802F906
	ldr r0, _0802F930 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F90A
_0802F906:
	cmp r1, #0x1d
	bne _0802F988
_0802F90A:
	ldrb r0, [r5]
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0x1c
	bne _0802F938
	ldr r0, _0802F934 @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802F962
	movs r0, #0
	bl sub_8039EA4
	b _0802F962
	.align 2, 0
_0802F924: .4byte gUnknown_03005424
_0802F928: .4byte 0x0000FEFF
_0802F92C: .4byte gCurrentLevel
_0802F930: .4byte gUnknown_030054B0
_0802F934: .4byte gUnknown_030055B0
_0802F938:
	cmp r2, #0x1d
	bne _0802F958
	movs r0, #8
	bl sub_8039EA4
	ldr r0, _0802F954 @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _0802F962
	.align 2, 0
_0802F954: .4byte gDispCnt
_0802F958:
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_8039EA4
_0802F962:
	ldr r2, _0802F978 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802F97C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r2, _0802F980 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _0802F984 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2]
	b _0802F9AC
	.align 2, 0
_0802F978: .4byte gPlayer
_0802F97C: .4byte 0xFFDFFFFF
_0802F980: .4byte gUnknown_03005424
_0802F984: .4byte 0x0000FFFE
_0802F988:
	ldr r0, _0802F998 @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802F99C
	ldrb r0, [r6, #4]
	bl CreateCourseStartCountdown
	b _0802F9AC
	.align 2, 0
_0802F998: .4byte gUnknown_030055B0
_0802F99C:
	ldr r2, _0802F9BC @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802F9C0 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _0802F9C4 @ =0x0000FFFE
	ands r0, r3
	strh r0, [r4]
_0802F9AC:
	ldr r0, _0802F9C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802F9CC
	bl sub_8018818
	b _0802F9D6
	.align 2, 0
_0802F9BC: .4byte gPlayer
_0802F9C0: .4byte 0xFFDFFFFF
_0802F9C4: .4byte 0x0000FFFE
_0802F9C8: .4byte gGameMode
_0802F9CC:
	ldr r0, _0802F9EC @ =gUnknown_03005AF0
	ldr r1, [r0, #0x1c]
	ldr r2, _0802F9F0 @ =0xFFFBFFFF
	ands r1, r2
	str r1, [r0, #0x1c]
_0802F9D6:
	bl sub_802C9E4
	ldr r0, _0802F9F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_801583C
_0802F9E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F9EC: .4byte gUnknown_03005AF0
_0802F9F0: .4byte 0xFFFBFFFF
_0802F9F4: .4byte gCurTask

	thumb_func_start sub_802F9F8
sub_802F9F8: @ 0x0802F9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0802FB04 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _0802FB08 @ =IWRAM_START+4
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [sp]
	ldr r5, [r1]
	ldr r2, _0802FB0C @ =gDispCnt
	ldrh r1, [r2]
	ldr r3, _0802FB10 @ =0x00001FFF
	adds r0, r3, #0
	ands r0, r1
	strh r0, [r2]
	cmp r5, #0x95
	bhi _0802FA30
	b _0802FC5C
_0802FA30:
	subs r5, #0x96
	cmp r5, #0xf
	bls _0802FA38
	movs r5, #0x10
_0802FA38:
	lsls r0, r5, #9
	ldr r1, [sp, #4]
	strh r0, [r1, #4]
	lsls r0, r5, #0x19
	asrs r0, r0, #0x10
	cmp r0, r3
	ble _0802FA4C
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r1, #4]
_0802FA4C:
	ldr r0, _0802FB14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802FB28
	movs r6, #0
	ldr r3, _0802FB18 @ =gUnknown_080D6FF5
	mov ip, r3
	ldr r0, _0802FB1C @ =gObjPalette
	mov sb, r0
	mov r8, ip
	movs r1, #2
	add r1, ip
	mov sl, r1
_0802FA66:
	lsls r3, r6, #1
	adds r7, r3, r6
	ldr r1, _0802FB20 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4
	adds r2, r7, r2
	mov r1, r8
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r8
	adds r0, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r5, r1
	lsrs r1, r1, #4
	lsls r1, r1, #0x18
	add r2, sl
	ldrb r0, [r2]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	add r3, sb
	lsrs r0, r0, #0xe
	lsrs r1, r1, #0x13
	orrs r0, r1
	orrs r0, r4
	strh r0, [r3]
	ldr r3, _0802FB24 @ =gUnknown_030056A4
	ldr r0, [r3]
	cmp r0, #0
	beq _0802FAF8
	mov r0, ip
	adds r0, #0xf0
	adds r0, r7, r0
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, ip
	adds r0, #0xf1
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	mov r0, ip
	adds r0, #0xf2
	adds r0, r7, r0
	ldrb r0, [r0]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0xe0
	lsls r1, r1, #1
	add r1, sb
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
_0802FAF8:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FA66
	b _0802FC12
	.align 2, 0
_0802FB04: .4byte gCurTask
_0802FB08: .4byte IWRAM_START+4
_0802FB0C: .4byte gDispCnt
_0802FB10: .4byte 0x00001FFF
_0802FB14: .4byte gGameMode
_0802FB18: .4byte gUnknown_080D6FF5
_0802FB1C: .4byte gObjPalette
_0802FB20: .4byte gSelectedCharacter
_0802FB24: .4byte gUnknown_030056A4
_0802FB28:
	movs r2, #0
_0802FB2A:
	ldr r0, _0802FC34 @ =gMultiplayerConnections
	ldrb r1, [r0]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	adds r3, r2, #1
	mov sb, r3
	cmp r1, #0
	beq _0802FBA8
	movs r6, #0
	ldr r0, _0802FC38 @ =gUnknown_080D6FF5
	mov ip, r0
	lsls r1, r2, #4
	mov r8, r1
	mov r7, ip
	ldr r0, _0802FC3C @ =gMultiplayerCharacters
	adds r2, r2, r0
	mov ip, r2
	ldr r3, _0802FC40 @ =gObjPalette
	mov sl, r3
_0802FB52:
	lsls r3, r6, #1
	adds r3, r3, r6
	mov r0, ip
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r0, r3, r7
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r7, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	ldr r1, _0802FC44 @ =gUnknown_080D6FF7
	adds r3, r3, r1
	ldrb r0, [r3]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	mov r3, r8
	adds r1, r3, r6
	lsls r1, r1, #1
	add r1, sl
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FB52
_0802FBA8:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0802FB2A
	ldr r3, _0802FC48 @ =gUnknown_030056A4
	ldr r0, [r3]
	cmp r0, #0
	beq _0802FC12
	movs r6, #0
	ldr r3, _0802FC38 @ =gUnknown_080D6FF5
	movs r0, #0xf2
	adds r0, r0, r3
	mov r8, r0
	ldr r7, _0802FC40 @ =gObjPalette
_0802FBC6:
	lsls r1, r6, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0xf0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	adds r0, #0xf1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	add r1, r8
	ldrb r0, [r1]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0xe0
	lsls r1, r1, #1
	adds r1, r1, r7
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FBC6
_0802FC12:
	ldr r1, _0802FC4C @ =gFlags
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	ldr r3, _0802FC4C @ =gFlags
	str r0, [r3]
	ldr r0, _0802FC50 @ =0x00003FCF
	ldr r1, [sp, #4]
	strh r0, [r1, #8]
	ldr r0, [sp, #4]
	bl sub_802D4CC
	ldr r1, _0802FC54 @ =gWinRegs
	ldr r0, _0802FC58 @ =0x00001F3F
	strh r0, [r1, #8]
	movs r0, #0x1f
	b _0802FC70
	.align 2, 0
_0802FC34: .4byte gMultiplayerConnections
_0802FC38: .4byte gUnknown_080D6FF5
_0802FC3C: .4byte gMultiplayerCharacters
_0802FC40: .4byte gObjPalette
_0802FC44: .4byte gUnknown_080D6FF7
_0802FC48: .4byte gUnknown_030056A4
_0802FC4C: .4byte gFlags
_0802FC50: .4byte 0x00003FCF
_0802FC54: .4byte gWinRegs
_0802FC58: .4byte 0x00001F3F
_0802FC5C:
	ldr r0, _0802FCC0 @ =0x000030EF
	ldr r3, [sp, #4]
	strh r0, [r3, #8]
	ldr r0, [sp, #4]
	bl sub_802D4CC
	ldr r1, _0802FCC4 @ =gWinRegs
	ldr r0, _0802FCC8 @ =0x00003F3F
	strh r0, [r1, #8]
	ldr r0, _0802FCCC @ =0x00001010
_0802FC70:
	strh r0, [r1, #0xa]
	ldr r5, _0802FCD0 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1d
	bne _0802FC86
	ldr r2, _0802FCC4 @ =gWinRegs
	ldrh r1, [r2, #8]
	ldr r0, _0802FCD4 @ =0x0000FFF9
	ands r0, r1
	strh r0, [r2, #8]
_0802FC86:
	ldr r1, [sp]
	ldr r0, [r1]
	cmp r0, #0xc7
	bls _0802FD0C
	ldr r4, _0802FCD8 @ =gBldRegs
	movs r0, #0
	strh r0, [r4, #4]
	strh r0, [r4]
	strh r0, [r4, #2]
	ldr r3, _0802FCC4 @ =gWinRegs
	ldr r2, _0802FCDC @ =0x0000F0F0
	strh r2, [r3]
	ldr r1, _0802FCE0 @ =0x0000A0A0
	strh r1, [r3, #4]
	strh r2, [r3, #2]
	strh r1, [r3, #6]
	strh r0, [r3, #8]
	strh r0, [r3, #0xa]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1d
	beq _0802FCEC
	ldr r2, _0802FCE4 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0802FCE8 @ =0x00001FFF
	ands r0, r1
	strh r0, [r2]
	b _0802FD04
	.align 2, 0
_0802FCC0: .4byte 0x000030EF
_0802FCC4: .4byte gWinRegs
_0802FCC8: .4byte 0x00003F3F
_0802FCCC: .4byte 0x00001010
_0802FCD0: .4byte gCurrentLevel
_0802FCD4: .4byte 0x0000FFF9
_0802FCD8: .4byte gBldRegs
_0802FCDC: .4byte 0x0000F0F0
_0802FCE0: .4byte 0x0000A0A0
_0802FCE4: .4byte gDispCnt
_0802FCE8: .4byte 0x00001FFF
_0802FCEC:
	ldr r2, _0802FD1C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0802FD20 @ =0x000099FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0802FD24 @ =0x00003735
	strh r0, [r3, #0xa]
	ldr r0, _0802FD28 @ =0x00001346
	strh r0, [r4]
	ldr r0, _0802FD2C @ =0x00000404
	strh r0, [r4, #2]
	strh r0, [r4, #4]
_0802FD04:
	ldr r0, _0802FD30 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0802FD0C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FD1C: .4byte gDispCnt
_0802FD20: .4byte 0x000099FF
_0802FD24: .4byte 0x00003735
_0802FD28: .4byte 0x00001346
_0802FD2C: .4byte 0x00000404
_0802FD30: .4byte gCurTask

	thumb_func_start sub_802FD34
sub_802FD34: @ 0x0802FD34
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802FD90 @ =gCurTask
	ldr r0, [r0]
	mov ip, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0802FD94 @ =IWRAM_START + 0x10
	adds r4, r1, r2
	ldr r3, _0802FD98 @ =IWRAM_START + 0x14
	adds r6, r1, r3
	ldr r5, [r0]
	cmp r5, #1
	bls _0802FE1C
	subs r2, r5, #1
	movs r3, #0
	strh r3, [r4, #2]
	movs r0, #0xa0
	strh r0, [r4]
	movs r7, #0x80
	lsls r7, r7, #2
	strh r7, [r6, #2]
	strh r3, [r6]
	cmp r2, #9
	bhi _0802FD9C
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	rsbs r0, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r4, #2]
	movs r0, #0x58
	strh r0, [r4]
	cmp r2, #6
	bls _0802FE1C
	subs r2, r5, #7
	strh r7, [r6, #2]
	lsls r0, r2, #2
	adds r0, r0, r2
	strh r0, [r6]
	b _0802FE1C
	.align 2, 0
_0802FD90: .4byte gCurTask
_0802FD94: .4byte IWRAM_START + 0x10
_0802FD98: .4byte IWRAM_START + 0x14
_0802FD9C:
	cmp r5, #0x77
	bhi _0802FDB4
	ldr r0, _0802FDB0 @ =0x0000021E
	strh r0, [r4, #2]
	movs r0, #0x89
	strh r0, [r4]
	strh r7, [r6, #2]
	movs r0, #0x10
	strh r0, [r6]
	b _0802FE1C
	.align 2, 0
_0802FDB0: .4byte 0x0000021E
_0802FDB4:
	cmp r5, #0x87
	bhi _0802FDE4
	adds r2, r5, #0
	subs r2, #0x78
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r3, _0802FDE0 @ =0x0000021E
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r4, #2]
	lsls r0, r2, #1
	rsbs r0, r0, #0
	adds r0, #0x89
	strh r0, [r4]
	lsls r0, r2, #4
	subs r0, r7, r0
	strh r0, [r6, #2]
	adds r0, r5, #0
	subs r0, #0x68
	strh r0, [r6]
	b _0802FE1C
	.align 2, 0
_0802FDE0: .4byte 0x0000021E
_0802FDE4:
	cmp r5, #0x95
	bls _0802FE00
	ldr r0, _0802FDFC @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	mov r0, ip
	bl TaskDestroy
	b _0802FE70
	.align 2, 0
_0802FDFC: .4byte gFlags
_0802FE00:
	adds r2, r5, #0
	subs r2, #0x88
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	movs r7, #0x88
	lsls r7, r7, #2
	adds r1, r7, #0
	subs r1, r1, r0
	strh r1, [r4, #2]
	lsls r0, r2, #3
	subs r0, r0, r2
	strh r0, [r4]
	strh r3, [r6, #2]
_0802FE1C:
	ldr r1, _0802FE50 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802FE54 @ =gUnknown_03002878
	ldr r0, _0802FE58 @ =0x04000040
	str r0, [r1]
	ldr r2, _0802FE5C @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	cmp r5, #0xa
	bls _0802FE60
	ldrb r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_802DDC4
	ldrb r0, [r6]
	ldrh r1, [r6, #2]
	bl sub_802DF18
	b _0802FE70
	.align 2, 0
_0802FE50: .4byte gUnknown_03002A80
_0802FE54: .4byte gUnknown_03002878
_0802FE58: .4byte 0x04000040
_0802FE5C: .4byte gFlags
_0802FE60:
	ldrb r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_802DBC0
	ldrb r0, [r6]
	ldrh r1, [r6, #2]
	bl sub_802DF18
_0802FE70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802FE78
sub_802FE78: @ 0x0802FE78
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802FF70 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _0802FF74 @ =IWRAM_START + 0x1B4
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80051E8
	movs r6, #0
	ldr r1, _0802FF78 @ =IWRAM_START + 0x205
	adds r5, r4, r1
	ldr r0, _0802FF7C @ =IWRAM_START + 0x1E4
	adds r4, r4, r0
_0802FEA6:
	movs r0, #0xff
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r5, #0x30
	adds r4, #0x30
	adds r6, #1
	cmp r6, #3
	bls _0802FEA6
	ldr r0, _0802FF80 @ =gGameMode
	ldrb r0, [r0]
	mov r1, r8
	lsls r1, r1, #1
	mov sb, r1
	cmp r0, #2
	bhi _0802FEE0
	movs r6, #0
	adds r4, r7, #4
_0802FED2:
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r6, #1
	cmp r6, #8
	bls _0802FED2
_0802FEE0:
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r5, r7, r0
	mov r1, r8
	cmp r1, #0x1d
	bls _0802FF0C
	cmp r1, #0x1e
	bne _0802FF06
	ldr r0, _0802FF84 @ =0x0000045B
	strh r0, [r5, #0xa]
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0802FF88 @ =0x000002C5
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
_0802FF06:
	adds r0, r5, #0
	bl sub_8004558
_0802FF0C:
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r5, r7, r1
	movs r0, #0xc1
	lsls r0, r0, #2
	adds r4, r7, r0
	ldr r2, _0802FF8C @ =gSineTable
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _0802FF90 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r1, r2
	bne _0802FF3E
	movs r1, #0xff
_0802FF3E:
	cmp r1, #0
	bne _0802FF44
	movs r1, #4
_0802FF44:
	movs r0, #0
	strh r0, [r4]
	strh r1, [r4, #2]
	strh r2, [r4, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r4, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF70: .4byte gCurTask
_0802FF74: .4byte IWRAM_START + 0x1B4
_0802FF78: .4byte IWRAM_START + 0x205
_0802FF7C: .4byte IWRAM_START + 0x1E4
_0802FF80: .4byte gGameMode
_0802FF84: .4byte 0x0000045B
_0802FF88: .4byte 0x000002C5
_0802FF8C: .4byte gSineTable
_0802FF90: .4byte 0x000003FF

	thumb_func_start sub_802FF94
sub_802FF94: @ 0x0802FF94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0802FFC8 @ =gCurTask
	ldr r1, [r0]
	ldrh r6, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov ip, r0
	ldr r0, [r0]
	ldr r3, [r0]
	adds r0, r3, #0
	subs r0, #0xa
	cmp r0, #0x7c
	bls _0803004E
	cmp r3, #0xc7
	bls _0802FFCC
	adds r0, r1, #0
	bl TaskDestroy
	b _0803029C
	.align 2, 0
_0802FFC8: .4byte gCurTask
_0802FFCC:
	cmp r3, #0x95
	bhi _0802FFD2
	b _0803029C
_0802FFD2:
	ldr r0, _08030018 @ =IWRAM_START + 0x1B4
	adds r5, r6, r0
	cmp r3, #0x96
	bne _08030030
	ldr r2, _0803001C @ =gUnknown_080D6FC8
	ldr r1, _08030020 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	movs r3, #0
	movs r4, #0
	strh r0, [r5, #0xa]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r1, [r0, #6]
	ldr r2, _08030024 @ =IWRAM_START + 0x1D4
	adds r0, r6, r2
	strb r1, [r0]
	ldr r7, _08030028 @ =IWRAM_START + 0x1D9
	adds r0, r6, r7
	strb r3, [r0]
	ldr r0, _0803002C @ =IWRAM_START + 0x1D5
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xf0
	strh r0, [r5, #0x16]
	movs r0, #0xa0
	strh r0, [r5, #0x18]
	str r4, [r5, #0x10]
	b _08030040
	.align 2, 0
_08030018: .4byte IWRAM_START + 0x1B4
_0803001C: .4byte gUnknown_080D6FC8
_08030020: .4byte gSelectedCharacter
_08030024: .4byte IWRAM_START + 0x1D4
_08030028: .4byte IWRAM_START + 0x1D9
_0803002C: .4byte IWRAM_START + 0x1D5
_08030030:
	cmp r3, #0xbd
	bls _08030040
	ldrh r0, [r5, #0x16]
	adds r0, #4
	strh r0, [r5, #0x16]
	ldrh r0, [r5, #0x18]
	adds r0, #4
	strh r0, [r5, #0x18]
_08030040:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	b _0803029C
_0803004E:
	subs r3, #9
	ldr r1, _08030074 @ =IWRAM_START + 0x1B4
	adds r5, r6, r1
	cmp r3, #0xc
	bhi _08030078
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r1, #0xfe
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #2
	subs r0, r0, r3
	b _080300A4
	.align 2, 0
_08030074: .4byte IWRAM_START + 0x1B4
_08030078:
	cmp r3, #0x64
	bhi _08030086
	movs r0, #0x18
	strh r0, [r5, #0x16]
	movs r0, #0x4a
	strh r0, [r5, #0x18]
	b _080300AE
_08030086:
	adds r2, r3, #0
	subs r2, #0x58
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r1, #0xfe
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
_080300A4:
	lsls r0, r0, #3
	lsrs r0, r0, #8
	movs r1, #0x79
	subs r1, r1, r0
	strh r1, [r5, #0x18]
_080300AE:
	movs r4, #0
	lsls r2, r3, #0x18
	str r2, [sp, #8]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r7, #0x8e
	lsls r7, r7, #1
	mov r8, r7
	mov r1, r8
	subs r0, r1, r0
	mov sl, r0
	movs r6, #0
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #2
	subs r0, r0, r3
	lsls r0, r0, #3
	lsrs r0, r0, #8
	movs r7, #0x7f
	subs r0, r7, r0
	mov sb, r0
	adds r2, r3, #0
	subs r2, #0x58
_080300E4:
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r6, r1
	mov r1, ip
	adds r5, r1, r0
	cmp r3, #0xc
	bhi _080300FC
	mov r0, sl
	strh r0, [r5, #0x16]
	mov r1, sb
	strh r1, [r5, #0x18]
	b _0803012A
_080300FC:
	cmp r3, #0x64
	bhi _08030108
	movs r0, #0x36
	strh r0, [r5, #0x16]
	movs r0, #0x50
	b _08030128
_08030108:
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #6
	lsrs r1, r1, #8
	mov r0, r8
	subs r1, r0, r1
	strh r1, [r5, #0x16]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #3
	lsrs r0, r0, #8
	subs r0, r7, r0
_08030128:
	strh r0, [r5, #0x18]
_0803012A:
	cmp r4, #3
	bne _08030134
	ldrh r0, [r5, #0x16]
	subs r0, #0x18
	strh r0, [r5, #0x16]
_08030134:
	adds r6, #0x30
	adds r4, #1
	cmp r4, #3
	bls _080300E4
	ldr r1, [sp, #8]
	lsrs r2, r1, #0x18
	movs r4, #0
	movs r7, #1
	mov r8, r7
	movs r0, #0x14
	mov sl, r0
	movs r1, #0xc
	mov sb, r1
	adds r0, r3, #0
	subs r0, #0x64
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #1
	subs r1, #0x16
	str r1, [sp, #0xc]
	adds r6, r2, #0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r7, sl
	subs r7, r7, r1
	str r7, [sp]
	mov r0, sb
	subs r0, r0, r1
	str r0, [sp, #4]
_08030170:
	movs r0, #8
	subs r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, #4
	mov r7, ip
	adds r5, r7, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	adds r1, #0x43
	strh r1, [r5, #0x16]
	movs r0, #0x16
	rsbs r0, r0, #0
	strh r0, [r5, #0x18]
	cmp r2, #0x31
	bhi _080301C8
	lsls r1, r4, #1
	cmp r2, r1
	blo _080301F8
	adds r0, r4, #0
	mov r7, r8
	ands r0, r7
	cmp r0, #0
	bne _080301B2
	cmp r6, #4
	bhi _080301AC
	mov r0, sp
	ldrh r0, [r0, #0xc]
	b _080301F6
_080301AC:
	mov r1, sl
	strh r1, [r5, #0x18]
	b _080301F8
_080301B2:
	subs r1, r2, r1
	cmp r1, #4
	bhi _080301C2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #0x16
	b _080301F6
_080301C2:
	mov r7, sb
	strh r7, [r5, #0x18]
	b _080301F8
_080301C8:
	cmp r3, #0x63
	bhi _080301E0
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080301DC
	mov r7, sl
	strh r7, [r5, #0x18]
	b _080301F8
_080301DC:
	mov r0, sb
	b _080301F6
_080301E0:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080301F2
	mov r7, sp
	ldrh r7, [r7]
	strh r7, [r5, #0x18]
	b _080301F8
_080301F2:
	mov r0, sp
	ldrh r0, [r0, #4]
_080301F6:
	strh r0, [r5, #0x18]
_080301F8:
	ldr r1, [sp, #0xc]
	subs r1, #0x14
	str r1, [sp, #0xc]
	subs r6, #2
	adds r4, #1
	cmp r4, #8
	bls _08030170
	movs r5, #0xa9
	lsls r5, r5, #2
	add r5, ip
	movs r0, #0x24
	strh r0, [r5, #0x16]
	cmp r3, #0x10
	bhi _0803021C
	ldr r0, _08030218 @ =0x0000FFD0
	b _08030240
	.align 2, 0
_08030218: .4byte 0x0000FFD0
_0803021C:
	cmp r3, #0x19
	bhi _0803022C
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	subs r0, #0x28
	b _08030240
_0803022C:
	cmp r3, #0x64
	bhi _08030234
	movs r0, #0x20
	b _08030240
_08030234:
	adds r1, r3, #0
	subs r1, #0x64
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	movs r0, #0x20
	subs r0, r0, r1
_08030240:
	strh r0, [r5, #0x18]
	movs r5, #0xb5
	lsls r5, r5, #2
	add r5, ip
	ldr r2, _08030268 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	movs r0, #0x23
	strh r0, [r5, #0x16]
	cmp r3, #0x10
	bhi _08030270
	ldr r0, _0803026C @ =0x0000FFCF
	b _08030296
	.align 2, 0
_08030268: .4byte gUnknown_030054B8
_0803026C: .4byte 0x0000FFCF
_08030270:
	cmp r3, #0x19
	bhi _08030280
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	subs r0, #0x29
	b _08030296
_08030280:
	cmp r3, #0x64
	bhi _0803028A
	strh r0, [r5, #0x16]
	movs r0, #0x20
	b _08030296
_0803028A:
	adds r1, r3, #0
	subs r1, #0x64
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	movs r0, #0x20
	subs r0, r0, r1
_08030296:
	strh r0, [r5, #0x18]
	bl sub_802FE78
_0803029C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80302AC
sub_80302AC: @ 0x080302AC
	push {r4, r5, r6, r7, lr}
	ldr r1, _080302D4 @ =gCurTask
	ldr r2, [r1]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r3, [r0]
	adds r0, r3, #0
	subs r0, #0x97
	mov ip, r1
	cmp r0, #0x27
	bls _080302D8
	cmp r3, #0xc7
	bls _080303BA
	adds r0, r2, #0
	bl TaskDestroy
	b _080303BA
	.align 2, 0
_080302D4: .4byte gCurTask
_080302D8:
	subs r3, #0x96
	cmp r3, #0xd
	bhi _0803031C
	movs r4, #0
	ldr r7, _08030310 @ =gCurrentLevel
	ldr r0, _08030314 @ =IWRAM_START + 0x1A
	adds r1, r5, r0
	ldr r5, _08030318 @ =gUnknown_080D7120
	movs r6, #0
_080302EA:
	subs r2, r3, r6
	cmp r2, #3
	ble _080302F2
	movs r2, #4
_080302F2:
	lsls r2, r2, #3
	ldrh r0, [r5]
	strh r0, [r1]
	adds r0, r2, #0
	subs r0, #0x20
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r5, #4
	adds r6, #3
	adds r4, #1
	cmp r4, #3
	bls _080302EA
	b _08030378
	.align 2, 0
_08030310: .4byte gCurrentLevel
_08030314: .4byte IWRAM_START + 0x1A
_08030318: .4byte gUnknown_080D7120
_0803031C:
	cmp r3, #0x11
	bhi _0803035C
	subs r3, #0xd
	ldr r1, _0803034C @ =gUnknown_080D7130
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r4, #0
	ldr r7, _08030350 @ =gCurrentLevel
	ldr r0, _08030354 @ =IWRAM_START + 0x1A
	adds r1, r5, r0
	ldr r3, _08030358 @ =gUnknown_080D7120
_08030336:
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r3, #4
	adds r4, #1
	cmp r4, #3
	bls _08030336
	b _08030378
	.align 2, 0
_0803034C: .4byte gUnknown_080D7130
_08030350: .4byte gCurrentLevel
_08030354: .4byte IWRAM_START + 0x1A
_08030358: .4byte gUnknown_080D7120
_0803035C:
	movs r4, #0
	ldr r7, _080303C0 @ =gCurrentLevel
	ldr r2, _080303C4 @ =IWRAM_START + 0x1A
	adds r1, r5, r2
	ldr r2, _080303C8 @ =gUnknown_080D7120
_08030366:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r2, #4
	adds r4, #1
	cmp r4, #3
	bls _08030366
_08030378:
	ldrb r1, [r7]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080303BA
	lsls r0, r1, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #7
	beq _080303BA
	mov r1, ip
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r5, r0, r2
	movs r4, #0
_08030398:
	lsls r0, r4, #1
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r0, [r0]
	subs r0, #0x96
	cmp r1, r0
	bhs _080303B0
	lsls r0, r1, #4
	adds r0, #4
	adds r0, r5, r0
	bl sub_80051E8
_080303B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08030398
_080303BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080303C0: .4byte gCurrentLevel
_080303C4: .4byte IWRAM_START + 0x1A
_080303C8: .4byte gUnknown_080D7120

	thumb_func_start sub_80303CC
sub_80303CC: @ 0x080303CC
	push {lr}
	ldr r0, _080303F4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080303DE
	bl sub_8011328
_080303DE:
	ldr r0, _080303F8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080303F0
	ldr r2, _080303FC @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08030400 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
_080303F0:
	pop {r0}
	bx r0
	.align 2, 0
_080303F4: .4byte gCurrentLevel
_080303F8: .4byte gGameMode
_080303FC: .4byte gUnknown_03005424
_08030400: .4byte 0x0000FFDF

	thumb_func_start sub_8030404
sub_8030404: @ 0x08030404
	push {r4, lr}
	ldr r0, _08030444 @ =gCurTask
	ldr r4, [r0]
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	ldr r2, _08030448 @ =gBgPalette
	ldr r1, _0803044C @ =gUnknown_080D7116
	ldr r0, _08030450 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, _08030454 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	cmp r3, #0xc7
	bls _0803043E
	adds r0, r4, #0
	bl TaskDestroy
_0803043E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030444: .4byte gCurTask
_08030448: .4byte gBgPalette
_0803044C: .4byte gUnknown_080D7116
_08030450: .4byte gSelectedCharacter
_08030454: .4byte gFlags

	thumb_func_start sub_8030458
sub_8030458: @ 0x08030458
	bx lr
	.align 2, 0

	thumb_func_start sub_803045C
sub_803045C: @ 0x0803045C
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08030470 @ =IWRAM_START + 0x1B8
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_08030470: .4byte IWRAM_START + 0x1B8

	thumb_func_start sub_8030474
sub_8030474: @ 0x08030474
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #8]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8030488
sub_8030488: @ 0x08030488
	push {r4, r5, lr}
	ldr r0, _080304D4 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080304CE
	lsls r0, r1, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #7
	beq _080304CE
	ldr r0, _080304D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
_080304AC:
	lsls r0, r4, #1
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r0, [r0]
	subs r0, #0x96
	cmp r1, r0
	bhs _080304C4
	lsls r0, r1, #4
	adds r0, #4
	adds r0, r5, r0
	bl sub_80051E8
_080304C4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080304AC
_080304CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080304D4: .4byte gCurrentLevel
_080304D8: .4byte gCurTask

	thumb_func_start sub_80304DC
sub_80304DC: @ 0x080304DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r7, #0
	ldr r0, _0803056C @ =gLoadedSaveGame
	ldr r1, [r0]
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08030570 @ =gRingCount
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08030574 @ =sub_8030A4C
	movs r1, #0xba
	lsls r1, r1, #1
	movs r2, #0xc1
	lsls r2, r2, #8
	ldr r3, _08030578 @ =sub_8031370
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r2, _0803057C @ =IWRAM_START + 0x168
	adds r1, r0, r2
	str r7, [r1]
	ldr r3, _08030580 @ =IWRAM_START + 0x170
	adds r0, r0, r3
	strb r7, [r0]
	mov r0, sl
	strh r7, [r0]
	movs r0, #1
	mov r1, sl
	strh r0, [r1, #2]
	adds r0, #0xff
	strh r0, [r1, #6]
	strh r7, [r1, #4]
	ldr r0, _08030584 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r7, [r1, #0xa]
	ldr r0, _08030588 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08030594
	ldr r0, _0803058C @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08030594
	movs r0, #0x40
	mov r2, sl
	strh r0, [r2, #6]
	ldr r0, _08030590 @ =0x00003FBF
	strh r0, [r2, #8]
	b _080305B4
	.align 2, 0
_0803056C: .4byte gLoadedSaveGame
_08030570: .4byte gRingCount
_08030574: .4byte sub_8030A4C
_08030578: .4byte sub_8031370
_0803057C: .4byte IWRAM_START + 0x168
_08030580: .4byte IWRAM_START + 0x170
_08030584: .4byte 0x00003FFF
_08030588: .4byte gPlayer
_0803058C: .4byte gUnknown_030054F4
_08030590: .4byte 0x00003FBF
_08030594:
	ldr r0, _080305C4 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080305B4
	ldr r0, _080305C8 @ =0x00003FAF
	mov r3, sl
	strh r0, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #4]
	mov r0, sl
	bl sub_802D4CC
_080305B4:
	ldr r0, _080305CC @ =0x00000707
	cmp r4, r0
	bhi _080305D4
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080305D0 @ =0x00013880
	b _0803069C
	.align 2, 0
_080305C4: .4byte gCurrentLevel
_080305C8: .4byte 0x00003FAF
_080305CC: .4byte 0x00000707
_080305D0: .4byte 0x00013880
_080305D4:
	ldr r0, _080305E4 @ =0x00000BB7
	cmp r4, r0
	bhi _080305EC
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080305E8 @ =0x0000C350
	b _0803069C
	.align 2, 0
_080305E4: .4byte 0x00000BB7
_080305E8: .4byte 0x0000C350
_080305EC:
	ldr r0, _080305FC @ =0x00000E0F
	cmp r4, r0
	bhi _08030604
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _08030600 @ =0x00002710
	b _0803069C
	.align 2, 0
_080305FC: .4byte 0x00000E0F
_08030600: .4byte 0x00002710
_08030604:
	ldr r0, _08030614 @ =0x00001517
	cmp r4, r0
	bhi _0803061C
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _08030618 @ =0x00001388
	b _0803069C
	.align 2, 0
_08030614: .4byte 0x00001517
_08030618: .4byte 0x00001388
_0803061C:
	ldr r0, _08030630 @ =0x00001C1F
	cmp r4, r0
	bhi _08030634
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #4
	b _0803069C
	.align 2, 0
_08030630: .4byte 0x00001C1F
_08030634:
	ldr r0, _08030644 @ =0x00002A2F
	cmp r4, r0
	bhi _0803064C
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _08030648 @ =0x00000BB8
	b _0803069C
	.align 2, 0
_08030644: .4byte 0x00002A2F
_08030648: .4byte 0x00000BB8
_0803064C:
	ldr r0, _08030660 @ =0x0000383F
	cmp r4, r0
	bhi _08030664
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #3
	b _0803069C
	.align 2, 0
_08030660: .4byte 0x0000383F
_08030664:
	ldr r0, _08030678 @ =0x0000464F
	cmp r4, r0
	bhi _0803067C
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #2
	b _0803069C
	.align 2, 0
_08030678: .4byte 0x0000464F
_0803067C:
	ldr r0, _08030690 @ =0x0000545F
	cmp r4, r0
	bhi _08030694
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #1
	b _0803069C
	.align 2, 0
_08030690: .4byte 0x0000545F
_08030694:
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0
_0803069C:
	str r0, [r1]
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0x64
	muls r1, r6, r1
	str r1, [r0]
	cmp r5, #7
	bne _080306BC
	movs r1, #0xb2
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080306B8 @ =0x00002710
	b _080306CC
	.align 2, 0
_080306B8: .4byte 0x00002710
_080306BC:
	movs r1, #0xb2
	lsls r1, r1, #1
	add r1, sl
	lsls r0, r5, #5
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r0, r0, #3
_080306CC:
	str r0, [r1]
	movs r0, #0xb2
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0xb0
	lsls r1, r1, #1
	add r1, sl
	ldr r2, [r0]
	ldr r1, [r1]
	cmp r2, r1
	bls _080306F2
	movs r0, #0xae
	lsls r0, r0, #1
	add r0, sl
	ldr r0, [r0]
	cmp r2, r0
	bls _08030700
	adds r0, r2, #0
	b _08030700
_080306F2:
	movs r0, #0xae
	lsls r0, r0, #1
	add r0, sl
	ldr r0, [r0]
	cmp r1, r0
	bls _08030700
	adds r0, r1, #0
_08030700:
	movs r1, #0x64
	bl Div
	movs r1, #0xb6
	lsls r1, r1, #1
	add r1, sl
	str r0, [r1]
	movs r7, #0x96
	lsls r7, r7, #1
	add r7, sl
	movs r0, #0
	mov sb, r0
	movs r6, #0
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	mov r2, r8
	strh r2, [r7, #0x16]
	movs r0, #0x50
	strh r0, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0x8c
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #0xa6
	lsls r0, r0, #1
	add r0, sl
	mov r3, sb
	strb r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	ldr r1, _08030888 @ =0x0000014D
	add r1, sl
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #0x4f
	add r0, sl
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _0803088C @ =0x00000151
	add r0, sl
	strb r3, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	mov r7, sl
	adds r7, #0xc
	mov r3, r8
	strh r3, [r7, #0x16]
	movs r0, #0x29
	strh r0, [r7, #0x18]
	ldr r4, _08030890 @ =gUnknown_080D713C
	ldr r5, _08030894 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	mov r0, sl
	adds r0, #0x2c
	strb r1, [r0]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x2d
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x2e
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	mov r2, sb
	strb r2, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r5, _08030898 @ =gCurrentLevel
	ldrb r1, [r5]
	movs r0, #3
	ands r0, r1
	lsrs r0, r0, #1
	mov sb, r0
	adds r7, #0x30
	mov r0, r8
	strh r0, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r6, _0803089C @ =gUnknown_080D715A
	mov r1, sb
	lsls r4, r1, #1
	add r4, sb
	lsls r4, r4, #1
	adds r0, r4, r6
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	adds r0, r6, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r0, r6, #4
	adds r4, r4, r0
	ldrh r0, [r4]
	mov r1, sl
	adds r1, #0x5c
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1c
	beq _08030836
	cmp r0, #0x1d
	bne _0803083E
_08030836:
	ldrh r0, [r6, #2]
	strh r0, [r7, #0xa]
	ldrh r0, [r6, #4]
	strb r0, [r1]
_0803083E:
	movs r2, #0
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, r7, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	mov r2, sb
	cmp r2, #0
	beq _080308A0
	ldr r0, _08030898 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _080308A8
	.align 2, 0
_08030888: .4byte 0x0000014D
_0803088C: .4byte 0x00000151
_08030890: .4byte gUnknown_080D713C
_08030894: .4byte gSelectedCharacter
_08030898: .4byte gCurrentLevel
_0803089C: .4byte gUnknown_080D715A
_080308A0:
	ldr r0, _080308F0 @ =gCurrentLevel
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
_080308A8:
	mov r7, sl
	adds r7, #0x6c
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r5, _080308F4 @ =gUnknown_080D7178
	lsls r4, r1, #1
	adds r4, r4, r1
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r0, r5, #4
	adds r4, r4, r0
	ldrh r0, [r4]
	mov r1, sl
	adds r1, #0x8c
	strb r0, [r1]
	ldr r0, _080308F0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _080308F8
	ldrh r0, [r5, #0x38]
	strh r0, [r7, #0xa]
	ldrh r0, [r5, #0x3a]
	b _08030906
	.align 2, 0
_080308F0: .4byte gCurrentLevel
_080308F4: .4byte gUnknown_080D7178
_080308F8:
	cmp r0, #0x1d
	bne _08030908
	ldrh r0, [r5, #0x3e]
	strh r0, [r7, #0xa]
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r0, [r0]
_08030906:
	strb r0, [r1]
_08030908:
	movs r2, #0
	movs r1, #0
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r7, #0x1a]
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, r7, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r5, #0
	movs r6, #0
	mov sb, r4
	ldr r3, _080309DC @ =gUnknown_080D71BA
	mov r8, r3
_08030944:
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r0, r4, #4
	adds r0, #0x9c
	mov r1, sl
	adds r7, r1, r0
	mov r2, sb
	strh r2, [r7, #0x16]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x4a
	strh r0, [r7, #0x18]
	lsls r4, r4, #1
	mov r3, r8
	adds r0, r4, r3
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	mov r0, r8
	adds r0, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r0, _080309E0 @ =gUnknown_080D71BE
	adds r4, r4, r0
	ldrh r1, [r4]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	mov r1, sb
	strh r1, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r2, #1
	rsbs r2, r2, #0
	adds r4, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	movs r3, #0
	strb r3, [r0]
	adds r0, r2, #0
	str r0, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08030944
	ldr r0, _080309E4 @ =gUnknown_030054A8
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	ldr r0, _080309E8 @ =gCurrentLevel
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _080309F0
	ldr r0, _080309EC @ =0x00000193
	bl m4aSongNumStart
	b _08030A2E
	.align 2, 0
_080309DC: .4byte gUnknown_080D71BA
_080309E0: .4byte gUnknown_080D71BE
_080309E4: .4byte gUnknown_030054A8
_080309E8: .4byte gCurrentLevel
_080309EC: .4byte 0x00000193
_080309F0:
	cmp r0, #0x1d
	bne _080309FE
	movs r0, #0xca
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _08030A2E
_080309FE:
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _08030A28
	movs r0, #0xc9
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _08030A24 @ =gPlayer
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #9
	bne _08030A2E
	movs r0, #0x20
	strh r0, [r1]
	b _08030A2E
	.align 2, 0
_08030A24: .4byte gPlayer
_08030A28:
	ldr r0, _08030A48 @ =0x00000191
	bl m4aSongNumStart
_08030A2E:
	movs r0, #0xb6
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08030A48: .4byte 0x00000191

	thumb_func_start sub_8030A4C
sub_8030A4C: @ 0x08030A4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08030CF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r0, _08030CF4 @ =IWRAM_START + 0x168
	adds r3, r2, r0
	ldr r1, [r3]
	mov r8, r1
	movs r4, #1
	add r8, r4
	ldr r1, _08030CF8 @ =IWRAM_START + 0x16C
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r4, _08030CFC @ =0x00000135
	adds r0, r1, r4
	cmp r8, r0
	bls _08030A80
	movs r0, #0x9b
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
_08030A80:
	mov r1, r8
	str r1, [r3]
	ldr r0, _08030D00 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _08030A96
	ldr r1, _08030D04 @ =gBldRegs
	ldr r0, _08030D08 @ =0x00003FAF
	strh r0, [r1]
_08030A96:
	mov r3, r8
	cmp r3, #0x95
	bhi _08030A9E
	b _08030D3E
_08030A9E:
	ldr r4, _08030D0C @ =IWRAM_START + 0x160
	adds r1, r2, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _08030AEE
	subs r0, #0x64
	str r0, [r1]
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030AEE
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030AEE
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030AEC
	movs r0, #0xff
_08030AEC:
	strb r0, [r1]
_08030AEE:
	movs r3, #0xb2
	lsls r3, r3, #1
	adds r1, r7, r3
	ldr r0, [r1]
	cmp r0, #0
	beq _08030B40
	subs r0, #0x64
	str r0, [r1]
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030B40
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030B40
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r4, [r1]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030B3E
	movs r0, #0xff
_08030B3E:
	strb r0, [r1]
_08030B40:
	movs r0, #0xae
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _08030B92
	subs r0, #0x64
	str r0, [r1]
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030B92
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030B92
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030B90
	movs r0, #0xff
_08030B90:
	strb r0, [r1]
_08030B92:
	ldr r0, _08030D00 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08030BA2
	b _08030CB8
_08030BA2:
	ldr r0, _08030D20 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08030BB0
	b _08030CB8
_08030BB0:
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r3, #0xb0
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030BF8
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030BF8
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r4, [r1]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030BF6
	movs r0, #0xff
_08030BF6:
	strb r0, [r1]
_08030BF8:
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xb2
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030C40
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030C40
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030C3E
	movs r0, #0xff
_08030C3E:
	strb r0, [r1]
_08030C40:
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030C88
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030C88
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030C86
	movs r0, #0xff
_08030C86:
	strb r0, [r1]
_08030C88:
	movs r3, #0xb0
	lsls r3, r3, #1
	adds r0, r7, r3
	movs r1, #0
	str r1, [r0]
	movs r4, #0xb2
	lsls r4, r4, #1
	adds r0, r7, r4
	str r1, [r0]
	movs r2, #0xae
	lsls r2, r2, #1
	adds r0, r7, r2
	str r1, [r0]
	adds r3, #0xc
	adds r0, r7, r3
	ldr r0, [r0]
	adds r0, #0x95
	cmp r8, r0
	bhs _08030CB8
	mov r8, r0
	adds r4, #4
	adds r0, r7, r4
	mov r1, r8
	str r1, [r0]
_08030CB8:
	ldr r0, _08030D24 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08030D3E
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _08030CE8
	movs r3, #0xb2
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	cmp r0, #0
	bne _08030CE8
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _08030D28
_08030CE8:
	movs r0, #0x8c
	bl m4aSongNumStart
	b _08030D3E
	.align 2, 0
_08030CF0: .4byte gCurTask
_08030CF4: .4byte IWRAM_START + 0x168
_08030CF8: .4byte IWRAM_START + 0x16C
_08030CFC: .4byte 0x00000135
_08030D00: .4byte gCurrentLevel
_08030D04: .4byte gBldRegs
_08030D08: .4byte 0x00003FAF
_08030D0C: .4byte IWRAM_START + 0x160
_08030D10: .4byte gUnknown_03005450
_08030D14: .4byte 0x0000C350
_08030D18: .4byte gGameMode
_08030D1C: .4byte gNumLives
_08030D20: .4byte gPressedKeys
_08030D24: .4byte gUnknown_03005590
_08030D28:
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08030D3E
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x8d
	bl m4aSongNumStart
_08030D3E:
	movs r1, #0xb6
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	ldr r2, _08030DA4 @ =0x00000135
	adds r0, r0, r2
	cmp r8, r0
	bhi _08030D50
	b _0803109C
_08030D50:
	ldr r4, _08030DA8 @ =gCurrentLevel
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	bne _08030DD0
	ldr r0, _08030DAC @ =gMPlayInfo_BGM
	ldr r5, _08030DB0 @ =0x0000FFFF
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _08030D68
	b _0803106C
_08030D68:
	ldr r0, _08030DB4 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _08030DB8 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	movs r1, #0x1d
	strb r1, [r0]
	bl WriteSaveGame
	movs r0, #0
	adds r1, r5, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08030DBC @ =gUnknown_03002AE4
	ldr r0, _08030DC0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08030DC4 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08030DC8 @ =gVramGraphicsCopyCursor
	ldr r0, _08030DCC @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl StartEndingCutScenes
	b _080310E6
	.align 2, 0
_08030DA4: .4byte 0x00000135
_08030DA8: .4byte gCurrentLevel
_08030DAC: .4byte gMPlayInfo_BGM
_08030DB0: .4byte 0x0000FFFF
_08030DB4: .4byte gLoadedSaveGame
_08030DB8: .4byte gSelectedCharacter
_08030DBC: .4byte gUnknown_03002AE4
_08030DC0: .4byte gUnknown_0300287C
_08030DC4: .4byte gUnknown_03005390
_08030DC8: .4byte gVramGraphicsCopyCursor
_08030DCC: .4byte gVramGraphicsCopyQueueIndex
_08030DD0:
	cmp r0, #0x1d
	bne _08030E40
	ldr r0, _08030E1C @ =gMPlayInfo_BGM
	ldr r3, _08030E20 @ =0x0000FFFF
	ldrh r5, [r0, #4]
	cmp r5, #0
	beq _08030DE0
	b _0803106C
_08030DE0:
	adds r2, #1
	strb r2, [r4]
	ldr r0, _08030E24 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _08030E28 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	strb r2, [r0]
	movs r0, #0
	adds r1, r3, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08030E2C @ =gUnknown_03002AE4
	ldr r0, _08030E30 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08030E34 @ =gUnknown_03005390
	strb r5, [r0]
	ldr r1, _08030E38 @ =gVramGraphicsCopyCursor
	ldr r0, _08030E3C @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl StartEndingCutScenes
_08030E16:
	bl WriteSaveGame
	b _080310E6
	.align 2, 0
_08030E1C: .4byte gMPlayInfo_BGM
_08030E20: .4byte 0x0000FFFF
_08030E24: .4byte gLoadedSaveGame
_08030E28: .4byte gSelectedCharacter
_08030E2C: .4byte gUnknown_03002AE4
_08030E30: .4byte gUnknown_0300287C
_08030E34: .4byte gUnknown_03005390
_08030E38: .4byte gVramGraphicsCopyCursor
_08030E3C: .4byte gVramGraphicsCopyQueueIndex
_08030E40:
	adds r0, r7, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08030E50
	b _0803106C
_08030E50:
	ldr r6, _08030ED0 @ =gBldRegs
	movs r3, #0
	mov r8, r3
	movs r7, #0x10
	strh r7, [r6, #4]
	ldr r5, _08030ED4 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r5, #0x20]
	ldrb r1, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08030E72
	b _08030F74
_08030E72:
	ldr r1, _08030ED8 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08030EDC @ =gUnknown_03002AE4
	ldr r0, _08030EE0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08030EE4 @ =gUnknown_03005390
	movs r7, #0
	mov r1, r8
	strb r1, [r0]
	ldr r1, _08030EE8 @ =gVramGraphicsCopyCursor
	ldr r0, _08030EEC @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r4]
	adds r5, r0, #1
	strb r5, [r4]
	movs r2, #0
	ldrsb r2, [r4, r2]
	ldr r6, _08030EF0 @ =gLoadedSaveGame
	ldr r0, [r6]
	ldr r3, _08030EF4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, #7
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	ble _08030F6A
	strb r5, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08030F54
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r0, #1
	asrs r0, r0, #2
	cmp r0, #2
	beq _08030F10
	cmp r0, #2
	bgt _08030EF8
	cmp r0, #0
	beq _08030EFE
	b _08030F34
	.align 2, 0
_08030ED0: .4byte gBldRegs
_08030ED4: .4byte gPlayer
_08030ED8: .4byte 0x0000FFFF
_08030EDC: .4byte gUnknown_03002AE4
_08030EE0: .4byte gUnknown_0300287C
_08030EE4: .4byte gUnknown_03005390
_08030EE8: .4byte gVramGraphicsCopyCursor
_08030EEC: .4byte gVramGraphicsCopyQueueIndex
_08030EF0: .4byte gLoadedSaveGame
_08030EF4: .4byte gSelectedCharacter
_08030EF8:
	cmp r0, #4
	beq _08030F22
	b _08030F34
_08030EFE:
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0, #0x13]
	movs r0, #0
	bl CreateCharacterUnlockCutScene
	b _08030E16
_08030F10:
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #0x13]
	movs r0, #2
	bl CreateCharacterUnlockCutScene
	b _08030E16
_08030F22:
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #0x13]
	movs r0, #1
	bl CreateCharacterUnlockCutScene
	b _08030E16
_08030F34:
	ldr r0, _08030F48 @ =gCurrentLevel
	ldrb r0, [r0]
	ldr r1, _08030F4C @ =gLoadedSaveGame
	ldr r1, [r1]
	ldr r2, _08030F50 @ =gSelectedCharacter
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	b _08030F5C
	.align 2, 0
_08030F48: .4byte gCurrentLevel
_08030F4C: .4byte gLoadedSaveGame
_08030F50: .4byte gSelectedCharacter
_08030F54:
	ldrb r0, [r4]
	ldr r1, [r6]
	movs r2, #0
	ldrsb r2, [r3, r2]
_08030F5C:
	adds r1, #7
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #1
	bl CreateCourseSelectionScreen
	b _08030E16
_08030F6A:
	ldrb r0, [r4]
	movs r2, #4
	bl CreateCourseSelectionScreen
	b _08030E16
_08030F74:
	adds r3, r1, #1
	strb r3, [r4]
	movs r2, #0
	ldrsb r2, [r4, r2]
	ldr r0, _08031000 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _08031004 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r2, r4
	ble _08030F94
	strb r3, [r0]
_08030F94:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08031030
	ldr r0, _08031008 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08031030
	ldr r1, _0803100C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08031010 @ =gUnknown_03002AE4
	ldr r0, _08031014 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08031018 @ =gUnknown_03005390
	mov r1, r8
	strb r1, [r0]
	ldr r1, _0803101C @ =gVramGraphicsCopyCursor
	ldr r0, _08031020 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl CreateSpecialStage
	ldr r2, _08031024 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _08031028 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r2]
	movs r0, #0xa0
	strh r0, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0x3f
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0xa]
	ldr r0, _0803102C @ =0x00003FBF
	strh r0, [r6]
	strh r7, [r6, #4]
	b _08030E16
	.align 2, 0
_08031000: .4byte gLoadedSaveGame
_08031004: .4byte gSelectedCharacter
_08031008: .4byte gUnknown_030054F4
_0803100C: .4byte 0x0000FFFF
_08031010: .4byte gUnknown_03002AE4
_08031014: .4byte gUnknown_0300287C
_08031018: .4byte gUnknown_03005390
_0803101C: .4byte gVramGraphicsCopyCursor
_08031020: .4byte gVramGraphicsCopyQueueIndex
_08031024: .4byte gDispCnt
_08031028: .4byte gWinRegs
_0803102C: .4byte 0x00003FBF
_08031030:
	ldr r1, _08031054 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08031058 @ =gUnknown_03002AE4
	ldr r0, _0803105C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08031060 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08031064 @ =gVramGraphicsCopyCursor
	ldr r0, _08031068 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl GameStageStart
	b _08030E16
	.align 2, 0
_08031054: .4byte 0x0000FFFF
_08031058: .4byte gUnknown_03002AE4
_0803105C: .4byte gUnknown_0300287C
_08031060: .4byte gUnknown_03005390
_08031064: .4byte gVramGraphicsCopyCursor
_08031068: .4byte gVramGraphicsCopyQueueIndex
_0803106C:
	ldr r4, _08031094 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0803109C
	ldr r0, _08031098 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0803109C
	bl sub_80313D0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [r4, #0x20]
	b _080310E6
	.align 2, 0
_08031094: .4byte gPlayer
_08031098: .4byte gUnknown_030054F4
_0803109C:
	bl sub_80310F0
	bl sub_8031314
	ldr r0, _080310D4 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080310E0
	movs r4, #0xb6
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf5
	cmp r8, r0
	bls _080310D8
	mov r0, r8
	subs r0, #0xf5
	subs r0, r0, r1
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	bl sub_8031138
	b _080310E6
	.align 2, 0
_080310D4: .4byte gCurrentLevel
_080310D8:
	movs r0, #0
	bl sub_8031138
	b _080310E6
_080310E0:
	movs r0, #0
	bl sub_8031138
_080310E6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80310F0
sub_80310F0: @ 0x080310F0
	push {lr}
	ldr r0, _08031114 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _08031118 @ =IWRAM_START + 0x168
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _0803111C @ =IWRAM_START + 0x12C
	adds r3, r1, r0
	cmp r2, #0xf
	bhi _08031120
	movs r0, #0x10
	subs r0, r0, r2
	lsls r1, r0, #4
	subs r1, r1, r0
	strh r1, [r3, #0x16]
	movs r0, #0x64
	b _08031130
	.align 2, 0
_08031114: .4byte gCurTask
_08031118: .4byte IWRAM_START + 0x168
_0803111C: .4byte IWRAM_START + 0x12C
_08031120:
	cmp r2, #0x17
	bhi _08031128
	movs r0, #0x64
	b _08031130
_08031128:
	cmp r2, #0x1c
	bhi _08031132
	ldrh r0, [r3, #0x18]
	subs r0, #7
_08031130:
	strh r0, [r3, #0x18]
_08031132:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8031138
sub_8031138: @ 0x08031138
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803118C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r2, _08031190 @ =IWRAM_START + 0x168
	adds r0, r1, r2
	ldr r7, [r0]
	cmp r7, #0x17
	bhi _08031198
	ldr r0, _08031194 @ =IWRAM_START + 0x12C
	adds r5, r1, r0
	movs r0, #0
	cmp r7, #0x10
	bhi _08031174
	movs r1, #0x10
	subs r1, r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
_08031174:
	movs r6, #0
	mov r1, r8
	subs r4, r0, r1
_0803117A:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _0803117A
	b _080311B2
	.align 2, 0
_0803118C: .4byte gCurTask
_08031190: .4byte IWRAM_START + 0x168
_08031194: .4byte IWRAM_START + 0x12C
_08031198:
	ldr r2, _08031214 @ =IWRAM_START + 0x12C
	adds r5, r1, r2
	movs r6, #0
	mov r0, r8
	rsbs r4, r0, #0
_080311A2:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _080311A2
_080311B2:
	cmp r7, #0x1c
	bls _080311F4
	ldr r0, _08031218 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r1, #3
	cmp r0, #2
	bne _080311C6
	movs r1, #2
_080311C6:
	movs r6, #0
	cmp r6, r1
	bhs _080311F4
	mov r4, sb
	adds r4, #0x22
	mov r0, sb
	adds r0, #0xc
_080311D4:
	adds r5, r0, #0
	ldrh r0, [r4]
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r4]
	adds r0, r5, #0
	str r1, [sp]
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r5, #0
	adds r0, #0x30
	adds r6, #1
	ldr r1, [sp]
	cmp r6, r1
	blo _080311D4
_080311F4:
	cmp r7, #0x26
	bls _0803124C
	mov r5, sb
	adds r5, #0x9c
	cmp r7, #0x37
	bhi _0803121C
	adds r0, r7, #0
	subs r0, #0x27
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803121E
	.align 2, 0
_08031214: .4byte IWRAM_START + 0x12C
_08031218: .4byte gCurrentLevel
_0803121C:
	movs r4, #0x30
_0803121E:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xae
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x5a
	movs r3, #0
	bl sub_802D170
_0803124C:
	cmp r7, #0x30
	bls _0803129C
	mov r5, sb
	adds r5, #0xcc
	cmp r7, #0x41
	bhi _0803126C
	adds r0, r7, #0
	subs r0, #0x31
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803126E
_0803126C:
	movs r4, #0x30
_0803126E:
	mov r2, r8
	subs r0, r4, r2
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x6e
	movs r3, #0
	bl sub_802D170
_0803129C:
	ldr r0, _080312D0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08031304
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1b
	bgt _08031304
	cmp r7, #0x3a
	bls _08031304
	mov r5, sb
	adds r5, #0xfc
	cmp r7, #0x4b
	bhi _080312D4
	adds r0, r7, #0
	subs r0, #0x3b
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _080312D6
	.align 2, 0
_080312D0: .4byte gCurrentLevel
_080312D4:
	movs r4, #0x30
_080312D6:
	mov r2, r8
	subs r0, r4, r2
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb2
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x82
	movs r3, #0
	bl sub_802D170
_08031304:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8031314
sub_8031314: @ 0x08031314
	push {r4, r5, lr}
	ldr r0, _08031340 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _08031344 @ =IWRAM_START + 0x168
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0x1c
	bls _08031366
	cmp r0, #0x2c
	bhi _08031348
	subs r0, #0x1d
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0803134A
	.align 2, 0
_08031340: .4byte gCurTask
_08031344: .4byte IWRAM_START + 0x168
_08031348:
	movs r0, #3
_0803134A:
	movs r3, #0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r2, _0803136C @ =gUnknown_080D71CC
	adds r1, r5, #0
	adds r1, #0xc
_08031356:
	ldrh r0, [r2]
	adds r0, r4, r0
	strh r0, [r1, #0x16]
	adds r2, #2
	adds r1, #0x30
	adds r3, #1
	cmp r3, #2
	bls _08031356
_08031366:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803136C: .4byte gUnknown_080D71CC

	thumb_func_start sub_8031370
sub_8031370: @ 0x08031370
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _080313C0 @ =IWRAM_START + 0x130
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080313B8
	bl VramFree
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	ldr r1, _080313C4 @ =IWRAM_START + 0xA0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080313C8 @ =IWRAM_START + 0xD0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080313CC @ =IWRAM_START + 0x100
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
_080313B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080313C0: .4byte IWRAM_START + 0x130
_080313C4: .4byte IWRAM_START + 0xA0
_080313C8: .4byte IWRAM_START + 0xD0
_080313CC: .4byte IWRAM_START + 0x100

	thumb_func_start sub_80313D0
sub_80313D0: @ 0x080313D0
	push {r4, r5, r6, lr}
	ldr r0, _08031428 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0803142C @ =IWRAM_START + 0x130
	adds r6, r5, r0
	ldr r0, [r6]
	cmp r0, #0
	beq _08031420
	bl VramFree
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	ldr r1, _08031430 @ =IWRAM_START + 0xA0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08031434 @ =IWRAM_START + 0xD0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08031438 @ =IWRAM_START + 0x100
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	movs r0, #0
	str r0, [r6]
_08031420:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031428: .4byte gCurTask
_0803142C: .4byte IWRAM_START + 0x130
_08031430: .4byte IWRAM_START + 0xA0
_08031434: .4byte IWRAM_START + 0xD0
_08031438: .4byte IWRAM_START + 0x100
