.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x44
	movs r6, #0
	ldr r2, _0805847C @ =gDispCnt
	ldr r1, _08058480 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _08058484 @ =0x00001C06
	strh r0, [r1, #2]
	ldr r0, _08058488 @ =0x00001A09
	strh r0, [r1, #4]
	ldr r0, _0805848C @ =gBgScrollRegs
	strh r6, [r0, #4]
	strh r6, [r0, #6]
	strh r6, [r0, #8]
	strh r6, [r0, #0xa]
	movs r0, #0xd9
	lsls r0, r0, #6
	strh r0, [r2]
	ldr r1, _08058490 @ =gBldRegs
	movs r0, #0x1f
	strh r0, [r1]
	ldr r0, _08058494 @ =gWinRegs
	movs r1, #1
	mov r8, r1
	movs r5, #1
	strh r5, [r0]
	strh r5, [r0, #4]
	bl sub_80535FC
	ldr r0, _08058498 @ =sub_8058830
	movs r7, #0x80
	lsls r7, r7, #1
	movs r2, #0x80
	lsls r2, r2, #6
	str r6, [sp]
	adds r1, r7, #0
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r0, [r6, #6]
	ldr r2, _0805849C @ =0x03000024
	adds r0, r0, r2
	strh r4, [r0]
	ldrh r0, [r6, #6]
	ldr r3, _080584A0 @ =0x03000028
	adds r0, r0, r3
	strh r4, [r0]
	ldrh r0, [r6, #6]
	ldr r1, _080584A4 @ =0x0300002C
	adds r0, r0, r1
	strh r4, [r0]
	ldrh r0, [r6, #6]
	adds r2, #0xc
	adds r0, r0, r2
	strh r4, [r0]
	ldrh r0, [r6, #6]
	adds r3, #0x2c
	adds r0, r0, r3
	strh r4, [r0]
	ldrh r0, [r6, #6]
	adds r1, #0xd0
	adds r0, r0, r1
	strh r4, [r0]
	ldrh r0, [r6, #6]
	subs r1, #0xfc
	adds r0, r0, r1
	movs r1, #0x1e
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r5, [r0, #0xe]
	strh r4, [r0, #8]
	movs r1, #3
	strh r1, [r0, #0x10]
	mov r2, r8
	strb r2, [r0, #0x16]
	strh r4, [r0, #0x12]
	ldrh r0, [r6, #6]
	subs r3, #0x3c
	adds r3, r3, r0
	mov sb, r3
	strh r4, [r3]
	strh r5, [r3, #2]
	movs r0, #2
	strh r0, [r3, #4]
	strh r4, [r3, #6]
	strh r7, [r3, #8]
	strb r2, [r3, #0xa]
	movs r0, #0
	mov r8, r0
	add r7, sp, #0x30
	mov r1, sp
	adds r1, #0x2f
	str r1, [sp, #0x40]
	mov r2, sp
	adds r2, #0x2c
	str r2, [sp, #0x34]
	mov r3, sp
	adds r3, #0x2d
	str r3, [sp, #0x38]
	mov r0, sp
	adds r0, #0x2e
	str r0, [sp, #0x3c]
	ldr r1, _080584A8 @ =gLoadedSaveGame
	mov sl, r1
	ldr r5, _080584AC @ =gUnknown_08688492
_0805843C:
	ldr r0, _080584A8 @ =gLoadedSaveGame
	adds r0, #0x10
	mov r2, r8
	adds r3, r2, r0
	ldrb r0, [r3]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x69
	bhi _080584BC
	ldrh r2, [r6, #6]
	adds r2, r4, r2
	ldr r0, _080584B0 @ =0x030000C8
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r3]
	subs r0, #0x20
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r2, _080584B4 @ =0x00001001
	adds r1, r2, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	ldrh r2, [r6, #6]
	adds r2, r4, r2
	ldr r1, _080584B8 @ =0x030000CA
	adds r1, r1, r2
	mov ip, r1
	b _080584DC
	.align 2, 0
_0805847C: .4byte gDispCnt
_08058480: .4byte gBgCntRegs
_08058484: .4byte 0x00001C06
_08058488: .4byte 0x00001A09
_0805848C: .4byte gBgScrollRegs
_08058490: .4byte gBldRegs
_08058494: .4byte gWinRegs
_08058498: .4byte sub_8058830
_0805849C: .4byte 0x03000024
_080584A0: .4byte 0x03000028
_080584A4: .4byte 0x0300002C
_080584A8: .4byte gLoadedSaveGame
_080584AC: .4byte gUnknown_08688492
_080584B0: .4byte 0x030000C8
_080584B4: .4byte 0x00001001
_080584B8: .4byte 0x030000CA
_080584BC:
	movs r0, #0x20
	strb r0, [r3]
	ldrh r1, [r6, #6]
	adds r1, r4, r1
	ldr r0, _080587EC @ =0x030000C8
	adds r1, r1, r0
	ldr r2, _080587F0 @ =0x00001001
	adds r0, r2, #0
	ldrh r2, [r5]
	adds r0, r0, r2
	strh r0, [r1]
	ldrh r2, [r6, #6]
	adds r2, r4, r2
	ldr r0, _080587F4 @ =0x030000CA
	adds r0, r0, r2
	mov ip, r0
_080584DC:
	ldrb r0, [r3]
	subs r0, #0x20
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r2, _080587F8 @ =0x00001002
	adds r1, r2, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	ldrh r2, [r6, #6]
	adds r2, r4, r2
	ldr r1, _080587FC @ =0x030000E0
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r3]
	subs r0, #0x20
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r2, _08058800 @ =0x00001015
	adds r1, r2, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	ldrh r2, [r6, #6]
	adds r2, r4, r2
	ldr r1, _08058804 @ =0x030000E2
	adds r2, r2, r1
	ldrb r0, [r3]
	subs r0, #0x20
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r3, _08058808 @ =0x00001016
	adds r1, r3, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2]
	adds r4, #4
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #5
	ble _0805843C
	movs r2, #5
	mov r8, r2
	mov r3, sl
	ldrb r0, [r3, #0x15]
	ldrh r1, [r6, #6]
	cmp r0, #0x20
	bne _0805855A
	mov r2, sl
	adds r2, #0x10
_08058546:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r3, r8
	cmp r3, #0
	blt _0805855A
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _08058546
_0805855A:
	ldr r0, _0805880C @ =0x030000F8
	adds r1, r1, r0
	mov r0, r8
	adds r0, #1
	strh r0, [r1]
	bl UiGfxStackInit
	movs r0, #0x23
	strb r0, [r7]
	movs r2, #0
	ldr r1, [sp, #0x40]
	strb r2, [r1]
	ldr r3, _08058810 @ =gUiGraphics
	mov sl, r3
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08058814 @ =gUiGraphics + 0x4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x24]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp, #0x1c]
	movs r2, #0x20
	str r2, [sp, #0x28]
	movs r0, #0
	ldr r3, [sp, #0x34]
	strb r0, [r3]
	movs r2, #2
	ldr r1, [sp, #0x38]
	strb r2, [r1]
	ldr r0, _08058818 @ =gUnknown_08684D3C
	str r0, [sp, #0x14]
	movs r0, #0xa0
	lsls r0, r0, #3
	str r0, [sp, #0x20]
	movs r0, #0x15
	ldr r3, [sp, #0x3c]
	strb r0, [r3]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805881C @ =gUiGraphics + 0x8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08058820 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x10
	add r1, sl
	mov r8, r1
	add r0, r8
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08058824 @ =gUiGraphics + 0x14
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r5, sl
	adds r5, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	movs r0, #0x24
	strb r0, [r7]
	movs r4, #1
	ldr r0, [sp, #0x40]
	strb r4, [r0]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08058814 @ =gUiGraphics + 0x4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x24]
	movs r0, #0xa0
	lsls r0, r0, #6
	str r0, [sp, #0x1c]
	movs r2, #0x20
	str r2, [sp, #0x28]
	movs r0, #0
	ldr r3, [sp, #0x34]
	strb r0, [r3]
	ldr r1, [sp, #0x38]
	strb r4, [r1]
	ldr r0, _08058828 @ =gUnknown_08685D3C
	str r0, [sp, #0x14]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #0x20]
	movs r3, #0x15
	ldr r2, [sp, #0x3c]
	strb r3, [r2]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805881C @ =gUiGraphics + 0x8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08058820 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08058824 @ =gUiGraphics + 0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	movs r0, #0x25
	strb r0, [r7]
	ldr r2, [sp, #0x40]
	strb r4, [r2]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08058814 @ =gUiGraphics + 0x4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #0x24]
	movs r0, #0x20
	str r0, [sp, #0x28]
	movs r2, #2
	ldr r1, [sp, #0x34]
	strb r2, [r1]
	ldr r3, [sp, #0x38]
	strb r4, [r3]
	movs r0, #4
	ldr r1, [sp, #0x3c]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0805881C @ =gUiGraphics + 0x8
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08058820 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08058824 @ =gUiGraphics + 0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	movs r0, #0x26
	strb r0, [r7]
	movs r0, #3
	ldr r2, [sp, #0x40]
	strb r0, [r2]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08058814 @ =gUiGraphics + 0x4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #0x1c]
	movs r0, #0x20
	str r0, [sp, #0x28]
	movs r2, #0
	ldr r1, [sp, #0x34]
	strb r2, [r1]
	ldr r0, _0805882C @ =0x06012000
	str r0, [sp, #0x10]
	movs r0, #0xd
	ldr r3, [sp, #0x3c]
	strb r0, [r3]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805881C @ =gUiGraphics + 0x8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08058820 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08058824 @ =gUiGraphics + 0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	mov r0, sb
	bl sub_805423C
	movs r0, #0x30      @ MUS_PLAYER_DATA
	bl m4aSongNumStartOrChange
	add sp, #0x44
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080587EC: .4byte 0x030000C8
_080587F0: .4byte 0x00001001
_080587F4: .4byte 0x030000CA
_080587F8: .4byte 0x00001002
_080587FC: .4byte 0x030000E0
_08058800: .4byte 0x00001015
_08058804: .4byte 0x030000E2
_08058808: .4byte 0x00001016
_0805880C: .4byte 0x030000F8
_08058810: .4byte gUiGraphics
_08058814: .4byte gUiGraphics + 0x4
_08058818: .4byte gUnknown_08684D3C
_0805881C: .4byte gUiGraphics + 0x8
_08058820: .4byte gUiGraphics + 0xC
_08058824: .4byte gUiGraphics + 0x14
_08058828: .4byte gUnknown_08685D3C
_0805882C: .4byte 0x06012000

.syntax divided
