.include "asm/macros.inc"
.include "constants/constants.inc"

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
