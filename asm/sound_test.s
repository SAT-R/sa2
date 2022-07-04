.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateSoundTestScreen
CreateSoundTestScreen: @ 0x0808A258
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r0, _0808A35C @ =sub_808AF74
	ldr r1, _0808A360 @ =0x0000075C
	movs r2, #0xc0
	lsls r2, r2, #5
	ldr r3, _0808A364 @ =sub_808B2B0
	str r3, [sp]
	movs r3, #4
	bl TaskCreate
	mov r8, r0
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r0, _0808A368 @ =IWRAM_START+4
	adds r6, r4, r0
	ldr r1, _0808A36C @ =IWRAM_START + 0x10
	adds r7, r4, r1
	bl m4aMPlayAllStop
	mov r2, sb
	str r2, [r5]
	ldr r3, _0808A370 @ =gUnknown_030006FC
	adds r0, r4, r3
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0808A374 @ =gUnknown_03000700
	adds r0, r4, r2
	str r1, [r0]
	adds r3, #8
	adds r2, r4, r3
	movs r0, #0x80
	lsls r0, r0, #9
	str r0, [r2]
	ldr r0, _0808A378 @ =gUnknown_0300070B
	adds r2, r4, r0
	movs r0, #1
	strb r0, [r2]
	ldr r2, _0808A37C @ =gUnknown_03000709
	adds r0, r4, r2
	strb r1, [r0]
	adds r3, #4
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _0808A380 @ =IWRAM_START + 0x2D8
	adds r2, r4, r0
	ldr r3, _0808A384 @ =IWRAM_START + 0x278
	adds r0, r4, r3
	str r0, [r2]
	ldr r2, _0808A388 @ =gUnknown_0300070C
	adds r0, r4, r2
	strb r1, [r0]
	ldr r3, _0808A38C @ =gUnknown_0300070D
	adds r0, r4, r3
	strb r1, [r0]
	adds r2, #2
	adds r0, r4, r2
	movs r2, #0
	strh r1, [r0]
	adds r3, #3
	adds r0, r4, r3
	strh r1, [r0]
	ldr r1, _0808A390 @ =gUnknown_03000712
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _0808A394 @ =0x0000035B
	add r2, sb
	ldrb r1, [r2]
	adds r3, #0x48
	adds r0, r4, r3
	strb r1, [r0]
	movs r0, #0
	movs r1, #0
	ldr r2, _0808A398 @ =gUnknown_03000718
	adds r4, r4, r2
_0808A2FA:
	str r1, [r4]
	str r1, [r4, #0x20]
	adds r4, #4
	adds r0, #1
	cmp r0, #7
	bls _0808A2FA
	ldr r1, _0808A39C @ =gProfileScreenNextVramAddress
	ldr r0, _0808A3A0 @ =0x06010000
	str r0, [r1]
	ldr r0, _0808A3A4 @ =gProfileScreenSubMenuNextVramAddress
	movs r4, #0
	str r4, [r0]
	mov r0, r8
	bl sub_808B2F4
	mov r0, r8
	bl sub_808A3B4
	movs r1, #0
	strh r4, [r6]
	movs r0, #2
	strh r0, [r6, #2]
	strh r4, [r6, #4]
	adds r0, #0xfe
	strh r0, [r6, #6]
	strh r4, [r6, #0xa]
	movs r0, #0xff
	strh r0, [r6, #8]
	strb r1, [r7]
	strb r1, [r7, #2]
	movs r0, #1
	strb r0, [r7, #0xc]
	strb r0, [r7, #0xd]
	strb r0, [r7, #0xe]
	strb r1, [r7, #1]
	ldr r0, _0808A3A8 @ =gUnknown_080E0C38
	str r0, [r7, #4]
	ldr r0, _0808A3AC @ =gUnknown_08C8796C
	str r0, [r7, #8]
	strh r4, [r7, #0x34]
	ldr r0, _0808A3B0 @ =gUnknown_03005B80
	str r7, [r0]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A35C: .4byte sub_808AF74
_0808A360: .4byte 0x0000075C
_0808A364: .4byte sub_808B2B0
_0808A368: .4byte IWRAM_START+4
_0808A36C: .4byte IWRAM_START + 0x10
_0808A370: .4byte gUnknown_030006FC
_0808A374: .4byte gUnknown_03000700
_0808A378: .4byte gUnknown_0300070B
_0808A37C: .4byte gUnknown_03000709
_0808A380: .4byte IWRAM_START + 0x2D8
_0808A384: .4byte IWRAM_START + 0x278
_0808A388: .4byte gUnknown_0300070C
_0808A38C: .4byte gUnknown_0300070D
_0808A390: .4byte gUnknown_03000712
_0808A394: .4byte 0x0000035B
_0808A398: .4byte gUnknown_03000718
_0808A39C: .4byte gProfileScreenNextVramAddress
_0808A3A0: .4byte 0x06010000
_0808A3A4: .4byte gProfileScreenSubMenuNextVramAddress
_0808A3A8: .4byte gUnknown_080E0C38
_0808A3AC: .4byte gUnknown_08C8796C
_0808A3B0: .4byte gUnknown_03005B80

	thumb_func_start sub_808A3B4
sub_808A3B4: @ 0x0808A3B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	str r0, [sp, #0x18]
	ldr r1, _0808A52C @ =IWRAM_START + 0xC8
	adds r0, r5, r1
	ldr r2, _0808A530 @ =IWRAM_START + 0xF8
	adds r2, r5, r2
	str r2, [sp, #0x1c]
	ldr r3, _0808A534 @ =IWRAM_START + 0x30C
	adds r3, r5, r3
	str r3, [sp, #0x20]
	adds r1, #0xf0
	adds r1, r5, r1
	str r1, [sp, #0x24]
	ldr r2, _0808A538 @ =IWRAM_START + 0x33C
	adds r7, r5, r2
	ldr r3, _0808A53C @ =IWRAM_START + 0x2DC
	adds r3, r5, r3
	str r3, [sp, #0x28]
	ldr r1, _0808A540 @ =IWRAM_START + 0x278
	adds r1, r5, r1
	str r1, [sp, #0x2c]
	ldr r2, _0808A544 @ =IWRAM_START + 0x188
	adds r2, r5, r2
	str r2, [sp, #0x30]
	ldr r3, _0808A548 @ =IWRAM_START + 0x3CC
	adds r3, r5, r3
	str r3, [sp, #0x34]
	ldr r2, _0808A54C @ =gUnknown_03000758
	adds r1, r5, r2
	ldr r6, _0808A550 @ =gUnknown_080E0C44
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #1
	adds r4, r4, r1
	lsls r3, r4, #2
	mov sl, r3
	adds r1, r3, r6
	ldr r2, [r1]
	adds r1, r4, #1
	lsls r1, r1, #2
	mov sb, r1
	adds r1, r1, r6
	ldrh r3, [r1]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	movs r1, #5
	str r1, [sp, #0xc]
	adds r1, r4, #2
	lsls r1, r1, #2
	mov r8, r1
	add r6, r8
	ldrb r1, [r6]
	str r1, [sp, #0x10]
	movs r6, #0
	str r6, [sp, #0x14]
	movs r1, #0
	bl sub_806A568
	ldr r3, _0808A554 @ =0x000003C9
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	movs r2, #0x60
	bl sub_806A568
	ldr r3, _0808A558 @ =IWRAM_START + 0x128
	adds r3, r5, r3
	str r3, [sp, #0x1c]
	ldr r0, _0808A55C @ =gUnknown_080E0C8C
	add sl, r0
	mov r1, sl
	ldr r2, [r1]
	add sb, r0
	mov r1, sb
	ldrh r3, [r1]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x86
	mov sb, r1
	str r1, [sp, #8]
	movs r1, #5
	str r1, [sp, #0xc]
	add r8, r0
	mov r1, r8
	ldrb r0, [r1]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl sub_806A568
	ldr r1, _0808A560 @ =gUnknown_080E0CD4
	lsls r4, r4, #1
	adds r0, r4, #3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r4, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r5, #0x5a
	str r5, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	adds r4, #5
	lsls r4, r4, #2
	adds r4, r4, r1
	ldrb r0, [r4]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl sub_806A568
	ldr r3, _0808A564 @ =0x000003C5
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #5
	str r2, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x30]
	movs r1, #0
	movs r2, #1
	bl sub_806A568
	movs r5, #0
	movs r4, #0x50
	movs r6, #0x60
_0808A4FE:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _0808A56C
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0x11
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #2
	ldr r3, _0808A568 @ =0x0000045F
	bl sub_806A568
	b _0808A592
	.align 2, 0
_0808A52C: .4byte IWRAM_START + 0xC8
_0808A530: .4byte IWRAM_START + 0xF8
_0808A534: .4byte IWRAM_START + 0x30C
_0808A538: .4byte IWRAM_START + 0x33C
_0808A53C: .4byte IWRAM_START + 0x2DC
_0808A540: .4byte IWRAM_START + 0x278
_0808A544: .4byte IWRAM_START + 0x188
_0808A548: .4byte IWRAM_START + 0x3CC
_0808A54C: .4byte gUnknown_03000758
_0808A550: .4byte gUnknown_080E0C44
_0808A554: .4byte 0x000003C9
_0808A558: .4byte IWRAM_START + 0x128
_0808A55C: .4byte gUnknown_080E0C8C
_0808A560: .4byte gUnknown_080E0CD4
_0808A564: .4byte 0x000003C5
_0808A568: .4byte 0x0000045F
_0808A56C:
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #2
	ldr r3, _0808A708 @ =0x0000045F
	bl sub_806A568
_0808A592:
	lsls r1, r5, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r1, r3
	adds r7, #0x30
	ldr r2, _0808A70C @ =0xFFF80000
	adds r0, r4, r2
	lsrs r4, r0, #0x10
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	ble _0808A4FE
	movs r5, #0
	ldr r7, [sp, #0x2c]
	adds r7, #0x30
_0808A5B0:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r3, [sp, #0x24]
	adds r0, r3, r0
	movs r1, #0x83
	lsls r1, r1, #5
	adds r2, r1, #0
	adds r1, r4, #0
	orrs r1, r2
	str r1, [sp]
	movs r1, #0x4c
	str r1, [sp, #4]
	movs r1, #0x5a
	str r1, [sp, #8]
	movs r1, #6
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r2, #0x40
	ldr r3, _0808A710 @ =0x000003CE
	bl sub_806A568
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808A5B0
	movs r5, #0
	movs r3, #0x80
	lsls r3, r3, #1
	movs r6, #0x4c
	movs r4, #0x5a
_0808A5FA:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, [sp, #0x34]
	adds r1, r1, r2
	lsls r2, r0, #8
	strh r2, [r1]
	strh r3, [r1, #2]
	strh r3, [r1, #4]
	strh r6, [r1, #6]
	strh r4, [r1, #8]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0808A5FA
	ldr r3, [sp, #0x34]
	ldrh r0, [r3, #0x12]
	subs r0, #1
	movs r6, #0
	strh r0, [r3, #0x12]
	ldrh r0, [r3, #0x20]
	subs r0, #1
	strh r0, [r3, #0x20]
	ldrh r0, [r3, #0x1e]
	subs r0, #1
	strh r0, [r3, #0x1e]
	ldrh r0, [r3, #0x2c]
	subs r0, #1
	strh r0, [r3, #0x2c]
	movs r3, #0xf3
	lsls r3, r3, #2
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [sp]
	movs r4, #0xb4
	str r4, [sp, #4]
	movs r0, #0x8c
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	movs r1, #0
	movs r2, #0x14
	bl sub_806A568
	ldr r3, _0808A714 @ =0x000003CA
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x74
	mov sb, r0
	str r0, [sp, #8]
	movs r1, #5
	mov r8, r1
	str r1, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	movs r1, #0
	movs r2, #0x40
	bl sub_806A568
	str r7, [sp, #0x2c]
	movs r3, #0xf2
	lsls r3, r3, #2
	str r5, [sp]
	str r4, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x48
	bl sub_806A568
	movs r5, #0
	ldr r1, _0808A718 @ =gUnknown_080E05E4
	mov r8, r1
	ldr r0, _0808A71C @ =gUnknown_080E0BB8
	ldrb r0, [r0]
	lsls r7, r0, #4
_0808A6AE:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r2, #0xff
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r3, [sp, #0x18]
	adds r0, r3, r0
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r1, #5
	str r1, [sp, #0xc]
	adds r1, r4, r7
	add r1, r8
	ldrb r1, [r1]
	subs r1, #0x20
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	movs r2, #2
	ldr r3, _0808A708 @ =0x0000045F
	bl sub_806A568
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0xf
	ble _0808A6AE
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A708: .4byte 0x0000045F
_0808A70C: .4byte 0xFFF80000
_0808A710: .4byte 0x000003CE
_0808A714: .4byte 0x000003CA
_0808A718: .4byte gUnknown_080E05E4
_0808A71C: .4byte gUnknown_080E0BB8

	thumb_func_start sub_808A720
sub_808A720: @ 0x0808A720
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0808A75C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	ldr r1, _0808A760 @ =IWRAM_START + 0x33C
	adds r7, r0, r1
	ldr r2, _0808A764 @ =IWRAM_START + 0x30C
	adds r2, r2, r0
	mov sb, r2
	ldr r3, _0808A768 @ =IWRAM_START+4
	adds r3, r3, r0
	mov sl, r3
	ldr r0, _0808A76C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0x1d
	bls _0808A774
	ldr r0, _0808A770 @ =gUnknown_080E0BB8
	str r0, [sp]
	movs r1, #0x3f
	mov r8, r1
	b _0808A77C
	.align 2, 0
_0808A75C: .4byte gCurTask
_0808A760: .4byte IWRAM_START + 0x33C
_0808A764: .4byte IWRAM_START + 0x30C
_0808A768: .4byte IWRAM_START+4
_0808A76C: .4byte gLoadedSaveGame
_0808A770: .4byte gUnknown_080E0BB8
_0808A774:
	ldr r2, _0808A7E4 @ =gUnknown_080E0BF7
	str r2, [sp]
	movs r3, #0x39
	mov r8, r3
_0808A77C:
	bl sub_808B18C
	ldr r5, _0808A7E8 @ =gRepeatedKeys
	ldrh r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0808A78E
	b _0808A912
_0808A78E:
	ldr r0, _0808A7EC @ =0x0000070B
	adds r4, r6, r0
	ldrb r1, [r4]
	str r1, [sp, #4]
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrh r1, [r5]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0808A7AC
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
_0808A7AC:
	ldrh r1, [r5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808A7BC
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0808A7BC:
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808A7CC
	ldrb r0, [r4]
	adds r0, #0xa
	strb r0, [r4]
_0808A7CC:
	ldrh r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808A7F2
	ldrb r0, [r4]
	subs r0, #0xa
	cmp r0, #0
	bge _0808A7F0
	mov r2, r8
	strb r2, [r4]
	b _0808A7F2
	.align 2, 0
_0808A7E4: .4byte gUnknown_080E0BF7
_0808A7E8: .4byte gRepeatedKeys
_0808A7EC: .4byte 0x0000070B
_0808A7F0:
	strb r0, [r4]
_0808A7F2:
	ldr r3, _0808A830 @ =0x0000070B
	adds r1, r6, r3
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808A800
	mov r0, r8
	strb r0, [r1]
_0808A800:
	ldrb r0, [r1]
	cmp r0, r8
	bls _0808A80A
	movs r0, #1
	strb r0, [r1]
_0808A80A:
	ldrb r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0xa
	bl __umodsi3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bls _0808A838
	ldr r2, _0808A834 @ =0x0000070C
	adds r1, r6, r2
	movs r0, #0xf9
	b _0808A842
	.align 2, 0
_0808A830: .4byte 0x0000070B
_0808A834: .4byte 0x0000070C
_0808A838:
	cmp r4, r0
	bhs _0808A844
	ldr r3, _0808A884 @ =0x0000070C
	adds r1, r6, r3
	movs r0, #7
_0808A842:
	strb r0, [r1]
_0808A844:
	ldr r1, _0808A888 @ =0x0000070B
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bls _0808A890
	ldr r2, _0808A88C @ =0x0000070D
	adds r1, r6, r2
	movs r0, #0xf9
	b _0808A89A
	.align 2, 0
_0808A884: .4byte 0x0000070C
_0808A888: .4byte 0x0000070B
_0808A88C: .4byte 0x0000070D
_0808A890:
	cmp r4, r0
	bhs _0808A89C
	ldr r3, _0808AA30 @ =0x0000070D
	adds r1, r6, r3
	movs r0, #7
_0808A89A:
	strb r0, [r1]
_0808A89C:
	ldr r0, _0808AA34 @ =0x0000070B
	adds r4, r6, r0
	ldrb r0, [r4]
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x10
	adds r1, r7, #0
	adds r1, #0x20
	strb r0, [r1]
	ldrb r0, [r4]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x10
	adds r1, r7, #0
	adds r1, #0x50
	strb r0, [r1]
	ldrb r0, [r4]
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x10
	adds r1, r7, #0
	adds r1, #0x80
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r0, #0x30
	bl sub_8004558
	adds r0, r7, #0
	adds r0, #0x60
	bl sub_8004558
	ldr r1, _0808AA38 @ =0x00000709
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808A912
	ldrb r0, [r4]
	ldr r2, [sp]
	adds r0, r0, r2
	subs r0, #1
	ldrb r0, [r0]
	bl sub_808B3A0
_0808A912:
	ldr r7, _0808AA38 @ =0x00000709
	adds r3, r6, r7
	ldrb r2, [r3]
	cmp r2, #1
	bne _0808A952
	ldr r0, _0808AA3C @ =gMPlayTable
	ldr r0, [r0]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r1, r0
	bne _0808A952
	movs r4, #0
	strb r4, [r3]
	mov r0, sb
	adds r0, #0x20
	strb r2, [r0]
	mov r0, sb
	bl sub_8004558
	bl m4aMPlayAllStop
	ldr r1, _0808AA40 @ =0x000006FC
	adds r0, r6, r1
	strb r4, [r0]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r6, r2
	str r4, [r0]
	movs r0, #5
	bl sub_808B030
_0808A952:
	ldr r3, _0808AA44 @ =gPressedKeys
	ldrh r1, [r3]
	movs r7, #1
	mov r8, r7
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A9EC
	ldr r0, _0808AA48 @ =0x00000704
	adds r2, r6, r0
	ldr r1, _0808AA4C @ =gUnknown_080E0AAC
	ldr r3, _0808AA34 @ =0x0000070B
	adds r5, r6, r3
	ldrb r0, [r5]
	ldr r7, [sp]
	adds r0, r0, r7
	subs r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	lsrs r0, r0, #0xc
	ldr r2, _0808AA50 @ =0x000002CA
	adds r1, r6, r2
	movs r4, #0
	strb r0, [r1]
	bl m4aMPlayAllStop
	ldr r0, _0808AA54 @ =gMPlayInfo_BGM
	ldr r3, _0808AA58 @ =gSongTable
	ldr r2, _0808AA5C @ =gUnknown_080E0A24
	ldrb r1, [r5]
	adds r1, r1, r7
	subs r1, #1
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldr r1, [r1]
	bl MPlayStart
	ldr r3, _0808AA38 @ =0x00000709
	adds r0, r6, r3
	mov r7, r8
	strb r7, [r0]
	mov r0, sb
	adds r0, #0x20
	strb r4, [r0]
	ldr r1, _0808AA40 @ =0x000006FC
	adds r0, r6, r1
	strb r4, [r0]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r6, r2
	str r4, [r0]
	subs r3, #1
	adds r0, r6, r3
	strb r4, [r0]
	ldr r7, _0808AA60 @ =0x0000070A
	adds r0, r6, r7
	strb r4, [r0]
	mov r0, sb
	bl sub_8004558
	ldrb r0, [r5]
	ldr r1, [sp]
	adds r0, r0, r1
	subs r0, #1
	ldrb r0, [r0]
	bl sub_808B3A0
	movs r0, #2
	bl sub_808B030
_0808A9EC:
	ldr r2, _0808AA44 @ =gPressedKeys
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808AAA4
	ldr r3, _0808AA38 @ =0x00000709
	adds r5, r6, r3
	ldrb r0, [r5]
	cmp r0, #1
	bne _0808AA64
	movs r4, #0
	strb r4, [r5]
	mov r0, sb
	adds r0, #0x20
	mov r7, r8
	strb r7, [r0]
	mov r0, sb
	bl sub_8004558
	bl m4aMPlayAllStop
	ldr r1, _0808AA40 @ =0x000006FC
	adds r0, r6, r1
	strb r4, [r0]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r6, r2
	str r4, [r0]
	movs r0, #5
	bl sub_808B030
	b _0808AAA4
	.align 2, 0
_0808AA30: .4byte 0x0000070D
_0808AA34: .4byte 0x0000070B
_0808AA38: .4byte 0x00000709
_0808AA3C: .4byte gMPlayTable
_0808AA40: .4byte 0x000006FC
_0808AA44: .4byte gPressedKeys
_0808AA48: .4byte 0x00000704
_0808AA4C: .4byte gUnknown_080E0AAC
_0808AA50: .4byte 0x000002CA
_0808AA54: .4byte gMPlayInfo_BGM
_0808AA58: .4byte gSongTable
_0808AA5C: .4byte gUnknown_080E0A24
_0808AA60: .4byte 0x0000070A
_0808AA64:
	movs r0, #0
	bl sub_808B030
	movs r0, #0x6b
	bl m4aSongNumStart
	movs r2, #0
	movs r1, #0
	mov r3, sl
	strh r1, [r3]
	movs r7, #1
	strh r7, [r3, #2]
	strh r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #6]
	strh r1, [r3, #0xa]
	movs r0, #0xff
	strh r0, [r3, #8]
	ldr r3, _0808AAF4 @ =0x000006FC
	adds r0, r6, r3
	strb r2, [r0]
	movs r7, #0xe0
	lsls r7, r7, #3
	adds r0, r6, r7
	str r1, [r0]
	movs r0, #2
	strb r0, [r5]
	ldr r0, _0808AAF8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808AAFC @ =sub_808AF74
	str r0, [r1, #8]
_0808AAA4:
	ldr r0, _0808AB00 @ =0x0000070E
	adds r2, r6, r0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	movs r1, #0xc8
	lsls r1, r1, #0x11
	cmp r0, r1
	ble _0808AABC
	movs r0, #0
	strh r0, [r2]
_0808AABC:
	ldr r1, _0808AB04 @ =0x0000070B
	adds r0, r6, r1
	ldrb r0, [r0]
	ldr r3, [sp]
	adds r0, r0, r3
	subs r0, #1
	ldrb r0, [r0]
	ldrh r2, [r2]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r7, #0
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x9e
	bl sub_808B350
	bl sub_808AB08
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAF4: .4byte 0x000006FC
_0808AAF8: .4byte gCurTask
_0808AAFC: .4byte sub_808AF74
_0808AB00: .4byte 0x0000070E
_0808AB04: .4byte 0x0000070B

	thumb_func_start sub_808AB08
sub_808AB08: @ 0x0808AB08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _0808ADAC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	adds r1, #0xc8
	adds r1, r0, r1
	str r1, [sp]
	ldr r2, _0808ADB0 @ =IWRAM_START + 0xF8
	adds r6, r0, r2
	ldr r3, _0808ADB4 @ =IWRAM_START + 0x30C
	adds r3, r3, r0
	mov sl, r3
	ldr r5, _0808ADB8 @ =IWRAM_START + 0x33C
	adds r4, r0, r5
	ldr r1, _0808ADBC @ =IWRAM_START + 0x2DC
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0808ADC0 @ =IWRAM_START + 0x2D8
	adds r1, r0, r2
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r3, _0808ADC4 @ =IWRAM_START + 0x188
	adds r3, r0, r3
	str r3, [sp, #8]
	ldr r5, _0808ADC8 @ =IWRAM_START + 0x1B8
	adds r5, r0, r5
	str r5, [sp, #0xc]
	ldr r1, _0808ADCC @ =IWRAM_START + 0x3CC
	adds r1, r0, r1
	str r1, [sp, #0x10]
	ldr r1, _0808ADD0 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	ldr r3, _0808ADD4 @ =gHBlankCallbacks
	ldr r2, _0808ADD8 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0808ADDC @ =sub_808DB2C
	str r1, [r0]
	ldr r2, _0808ADE0 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	movs r5, #0
	movs r2, #0x60
	mov sb, r2
	ldr r2, _0808ADE4 @ =gUnknown_080E0C30
_0808AB88:
	movs r0, #0x60
	strh r0, [r4, #0x18]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0808ADE8 @ =0x0000070C
	adds r1, r7, r3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0808ABC8
	cmp r0, #0
	ble _0808ABB0
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x60
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0808ABB0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808ABC8
	subs r0, r2, r0
	ldrb r0, [r0]
	mov r3, sb
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808ABC8:
	adds r0, r4, #0
	str r2, [sp, #0x20]
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r5, #0x80
	lsls r5, r5, #9
	adds r0, r0, r5
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x20]
	cmp r0, #1
	ble _0808AB88
	movs r5, #0
_0808ABE6:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0808ABE6
	mov r0, sl
	bl sub_80051E8
	ldr r0, [sp]
	bl sub_80051E8
	mov r0, r8
	bl sub_80051E8
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x10]
	mov r0, r8
	bl sub_80051E8
	mov r3, r8
	ldr r0, [r3, #0x10]
	ldr r1, _0808ADEC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	ldr r5, _0808ADF0 @ =0x00000709
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808AC38
	b _0808AE14
_0808AC38:
	movs r0, #0
	mov ip, r0
	mov sb, r0
	ldr r0, _0808ADF4 @ =0x04000062
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r0, r4
	lsrs r2, r0, #0xc
	adds r5, #0xa
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808AC68
	movs r1, #0x20
	movs r0, #0x20
	mov sb, r0
	subs r5, #1
	adds r0, r7, r5
	strb r1, [r0]
	strb r2, [r3]
	movs r0, #1
	mov ip, r0
_0808AC68:
	movs r2, #0
	ldr r1, _0808ADF8 @ =0x00000714
	adds r3, r7, r1
	ldrb r0, [r3]
	cmp r0, #0
	beq _0808AC92
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r5, _0808ADFC @ =0x00000712
	adds r1, r7, r5
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808AC92:
	ldr r0, _0808AE00 @ =0x04000072
	movs r1, #0
	ldrsh r0, [r0, r1]
	ands r0, r4
	lsrs r2, r0, #0xc
	ldr r5, _0808AE04 @ =0x00000715
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808ACC4
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0808ADFC @ =0x00000712
	adds r1, r7, r0
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808ACC4:
	ldr r0, _0808AE08 @ =0x04000078
	movs r1, #0
	ldrsh r0, [r0, r1]
	ands r0, r4
	lsrs r2, r0, #0xc
	ldr r5, _0808AE0C @ =0x00000716
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808ACF6
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0808ADFC @ =0x00000712
	adds r1, r7, r0
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808ACF6:
	ldr r1, _0808AE10 @ =gSoundInfo
	str r1, [sp, #0x14]
	movs r5, #0
	movs r2, #0xe7
	lsls r2, r2, #3
	adds r2, r7, r2
	str r2, [sp, #0x18]
	movs r3, #0xe3
	lsls r3, r3, #3
	adds r3, r7, r3
	str r3, [sp, #0x1c]
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r0, r0, r7
	mov r8, r0
	ldr r1, _0808ADFC @ =0x00000712
	adds r1, r1, r7
	mov sl, r1
_0808AD1A:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	ldr r3, [sp, #0x18]
	adds r6, r3, r2
	lsls r1, r1, #6
	ldr r0, [sp, #0x14]
	adds r0, #0x70
	adds r4, r0, r1
	ldr r1, [r6]
	ldr r0, [r4]
	cmp r1, r0
	beq _0808AD64
	subs r3, r1, r0
	ldr r0, [sp, #0x1c]
	adds r2, r0, r2
	ldr r0, [r2]
	subs r0, r3, r0
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bls _0808AD5E
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	movs r0, #0x20
	mov r1, sl
	strb r0, [r1]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808AD5E:
	str r3, [r2]
	ldr r0, [r4]
	str r0, [r6]
_0808AD64:
	lsls r0, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0808AD1A
	mov r3, ip
	cmp r3, #0
	beq _0808AD8E
	movs r5, #0xe2
	lsls r5, r5, #3
	adds r4, r7, r5
	mov r0, sb
	mov r1, ip
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
_0808AD8E:
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r1, r7, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc0
	ble _0808AE26
	movs r0, #0xc0
	strh r0, [r1]
	ldr r3, _0808ADFC @ =0x00000712
	adds r1, r7, r3
	movs r0, #4
	strb r0, [r1]
	b _0808AE26
	.align 2, 0
_0808ADAC: .4byte gCurTask
_0808ADB0: .4byte IWRAM_START + 0xF8
_0808ADB4: .4byte IWRAM_START + 0x30C
_0808ADB8: .4byte IWRAM_START + 0x33C
_0808ADBC: .4byte IWRAM_START + 0x2DC
_0808ADC0: .4byte IWRAM_START + 0x2D8
_0808ADC4: .4byte IWRAM_START + 0x188
_0808ADC8: .4byte IWRAM_START + 0x1B8
_0808ADCC: .4byte IWRAM_START + 0x3CC
_0808ADD0: .4byte gBgScrollRegs
_0808ADD4: .4byte gHBlankCallbacks
_0808ADD8: .4byte gNumHBlankCallbacks
_0808ADDC: .4byte sub_808DB2C
_0808ADE0: .4byte gFlags
_0808ADE4: .4byte gUnknown_080E0C30
_0808ADE8: .4byte 0x0000070C
_0808ADEC: .4byte 0xFFFFFBFF
_0808ADF0: .4byte 0x00000709
_0808ADF4: .4byte 0x04000062
_0808ADF8: .4byte 0x00000714
_0808ADFC: .4byte 0x00000712
_0808AE00: .4byte 0x04000072
_0808AE04: .4byte 0x00000715
_0808AE08: .4byte 0x04000078
_0808AE0C: .4byte 0x00000716
_0808AE10: .4byte gSoundInfo
_0808AE14:
	movs r5, #0xe2
	lsls r5, r5, #3
	adds r1, r7, r5
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808AF64 @ =0x00000712
	adds r0, r7, r1
	strb r2, [r0]
_0808AE26:
	movs r5, #0
	ldr r6, _0808AF68 @ =0x000003CA
_0808AE2A:
	ldr r2, [sp, #4]
	ldrh r0, [r2, #0xa]
	cmp r0, r6
	beq _0808AE58
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r3, [sp, #0x10]
	adds r1, r1, r3
	lsls r0, r0, #8
	strh r0, [r1]
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r2, r7, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0808AE58:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	ldr r5, [sp, #0xc]
	adds r0, r5, r0
	lsls r1, r1, #2
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	bl sub_8004860
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808AE2A
	movs r3, #0xe2
	lsls r3, r3, #3
	adds r4, r7, r3
	ldr r2, _0808AF6C @ =gSineTable
	ldr r5, _0808AF64 @ =0x00000712
	adds r3, r7, r5
	ldrb r1, [r3]
	lsls r1, r1, #2
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r4]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0808AEAC
	subs r0, #1
	strb r0, [r3]
_0808AEAC:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0808AEB8
	movs r0, #0
	strh r0, [r4]
_0808AEB8:
	movs r5, #0
_0808AEBA:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	bl sub_80051E8
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808AEBA
	ldr r0, [sp, #4]
	bl sub_80051E8
	ldr r3, _0808AF6C @ =gSineTable
	mov r8, r3
	movs r0, #0xe1
	lsls r0, r0, #3
	adds r5, r7, r0
	ldrb r1, [r5]
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #7
	adds r0, #0x5e
	ldr r1, [sp, #8]
	strh r0, [r1, #0x16]
	ldr r0, [sp, #8]
	bl sub_80051E8
	ldrb r0, [r5]
	ands r4, r0
	lsls r4, r4, #4
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #7
	movs r0, #0x3a
	subs r0, r0, r1
	ldr r2, [sp, #8]
	strh r0, [r2, #0x16]
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x10]
	ldr r0, [sp, #8]
	bl sub_80051E8
	ldr r3, [sp, #8]
	ldr r0, [r3, #0x10]
	ldr r1, _0808AF70 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF64: .4byte 0x00000712
_0808AF68: .4byte 0x000003CA
_0808AF6C: .4byte gSineTable
_0808AF70: .4byte 0xFFFFFBFF

	thumb_func_start sub_808AF74
sub_808AF74: @ 0x0808AF74
	push {r4, r5, r6, lr}
	ldr r0, _0808AFB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0808AFB4 @ =IWRAM_START + 0x278
	adds r2, r5, r0
	ldr r1, _0808AFB8 @ =gUnknown_030006FC
	adds r4, r5, r1
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	ldr r3, _0808AFBC @ =gUnknown_03000709
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808AFC4
	adds r0, r2, #0
	bl sub_8004558
	ldrb r0, [r4]
	cmp r0, #0x2c
	bls _0808AFDA
	ldr r1, _0808AFC0 @ =IWRAM_START+4
	adds r0, r5, r1
	bl sub_802D4CC
	b _0808AFDA
	.align 2, 0
_0808AFB0: .4byte gCurTask
_0808AFB4: .4byte IWRAM_START + 0x278
_0808AFB8: .4byte gUnknown_030006FC
_0808AFBC: .4byte gUnknown_03000709
_0808AFC0: .4byte IWRAM_START+4
_0808AFC4:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808AFD2
	adds r0, r2, #0
	bl sub_8004558
_0808AFD2:
	ldr r2, _0808AFF8 @ =IWRAM_START+4
	adds r0, r5, r2
	bl sub_802D4CC
_0808AFDA:
	ldr r3, _0808AFFC @ =0x000006FC
	adds r1, r6, r3
	ldrb r0, [r1]
	cmp r0, #0x3c
	bls _0808B01E
	ldr r2, _0808B000 @ =0x00000709
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808B00C
	ldr r0, _0808B004 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808B008 @ =sub_808B2C8
	b _0808B01C
	.align 2, 0
_0808AFF8: .4byte IWRAM_START+4
_0808AFFC: .4byte 0x000006FC
_0808B000: .4byte 0x00000709
_0808B004: .4byte gCurTask
_0808B008: .4byte sub_808B2C8
_0808B00C:
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	bl sub_808B030
	ldr r0, _0808B028 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808B02C @ =sub_808A720
_0808B01C:
	str r0, [r1, #8]
_0808B01E:
	bl sub_808AB08
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B028: .4byte gCurTask
_0808B02C: .4byte sub_808A720

	thumb_func_start sub_808B030
sub_808B030: @ 0x0808B030
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808B058 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	ldr r1, _0808B05C @ =IWRAM_START + 0x2D8
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r4, #5
	bls _0808B04E
	b _0808B178
_0808B04E:
	lsls r0, r4, #2
	ldr r1, _0808B060 @ =_0808B064
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B058: .4byte gCurTask
_0808B05C: .4byte IWRAM_START + 0x2D8
_0808B060: .4byte _0808B064
_0808B064: @ jump table
	.4byte _0808B07C @ case 0
	.4byte _0808B0A8 @ case 1
	.4byte _0808B0D4 @ case 2
	.4byte _0808B100 @ case 3
	.4byte _0808B12C @ case 4
	.4byte _0808B154 @ case 5
_0808B07C:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B0A0 @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B0A4 @ =0x000003CA
	b _0808B176
	.align 2, 0
_0808B0A0: .4byte 0x00000299
_0808B0A4: .4byte 0x000003CA
_0808B0A8:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B0CC @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B0D0 @ =0x000003CD
	b _0808B176
	.align 2, 0
_0808B0CC: .4byte 0x00000299
_0808B0D0: .4byte 0x000003CD
_0808B0D4:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	ldr r1, _0808B0FC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
	.align 2, 0
_0808B0FC: .4byte 0xFFFFFBFF
_0808B100:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	ldr r1, _0808B128 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
	.align 2, 0
_0808B128: .4byte 0xFFFFFBFF
_0808B12C:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
_0808B154:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B184 @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B188 @ =0x000003CB
_0808B176:
	strh r0, [r3, #0xa]
_0808B178:
	adds r0, r3, #0
	bl sub_8004558
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B184: .4byte 0x00000299
_0808B188: .4byte 0x000003CB

	thumb_func_start sub_808B18C
sub_808B18C: @ 0x0808B18C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0808B1B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r1, _0808B1B4 @ =IWRAM_START + 0x2D8
	adds r0, r5, r1
	ldr r3, [r0]
	ldr r1, _0808B1B8 @ =gUnknown_03000709
	adds r0, r5, r1
	ldrb r7, [r0]
	cmp r7, #0
	beq _0808B1BC
	cmp r7, #1
	beq _0808B1E4
	b _0808B2A0
	.align 2, 0
_0808B1B0: .4byte gCurTask
_0808B1B4: .4byte IWRAM_START + 0x2D8
_0808B1B8: .4byte gUnknown_03000709
_0808B1BC:
	ldrh r1, [r3, #0xa]
	ldr r0, _0808B1D8 @ =0x000003CB
	cmp r1, r0
	bne _0808B1DC
	adds r0, r3, #0
	bl sub_8004558
	cmp r0, #0
	bne _0808B2A0
	movs r0, #1
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B1D8: .4byte 0x000003CB
_0808B1DC:
	adds r0, r3, #0
	bl sub_8004558
	b _0808B2A0
_0808B1E4:
	ldr r0, _0808B21C @ =gUnknown_03000700
	adds r2, r5, r0
	adds r0, #4
	adds r1, r5, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	ldr r1, _0808B220 @ =gUnknown_030006FC
	adds r4, r5, r1
	strb r0, [r4]
	adds r0, r3, #0
	bl sub_8004558
	ldrb r0, [r4]
	cmp r0, #0x36
	bls _0808B228
	ldr r0, _0808B224 @ =gUnknown_0300070A
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808B228
	strb r7, [r1]
	movs r0, #3
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B21C: .4byte gUnknown_03000700
_0808B220: .4byte gUnknown_030006FC
_0808B224: .4byte gUnknown_0300070A
_0808B228:
	ldr r1, _0808B248 @ =0x000006FC
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0808B250
	ldr r0, _0808B24C @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808B250
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B248: .4byte 0x000006FC
_0808B24C: .4byte 0x0000070A
_0808B250:
	ldr r1, _0808B270 @ =0x000006FC
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x72
	bls _0808B278
	ldr r0, _0808B274 @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808B278
	movs r0, #3
	strb r0, [r1]
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B270: .4byte 0x000006FC
_0808B274: .4byte 0x0000070A
_0808B278:
	ldr r1, _0808B2A8 @ =0x000006FC
	adds r5, r6, r1
	ldrb r0, [r5]
	cmp r0, #0x77
	bls _0808B2A0
	ldr r0, _0808B2AC @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #3
	bne _0808B2A0
	movs r4, #0
	strb r4, [r1]
	movs r0, #2
	bl sub_808B030
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r6, r1
	str r4, [r0]
	strb r4, [r5]
_0808B2A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2A8: .4byte 0x000006FC
_0808B2AC: .4byte 0x0000070A

	thumb_func_start sub_808B2B0
sub_808B2B0: @ 0x0808B2B0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0808B2C4 @ =0x00000784
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0808B2C4: .4byte 0x00000784

	thumb_func_start sub_808B2C8
sub_808B2C8: @ 0x0808B2C8
	push {lr}
	ldr r1, _0808B2E4 @ =gProfileScreenNextVramAddress
	ldr r0, _0808B2E8 @ =0x06010000
	str r0, [r1]
	ldr r1, _0808B2EC @ =gProfileScreenSubMenuNextVramAddress
	movs r0, #0
	str r0, [r1]
	ldr r0, _0808B2F0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0808B2E4: .4byte gProfileScreenNextVramAddress
_0808B2E8: .4byte 0x06010000
_0808B2EC: .4byte gProfileScreenSubMenuNextVramAddress
_0808B2F0: .4byte gCurTask

	thumb_func_start sub_808B2F4
sub_808B2F4: @ 0x0808B2F4
	push {lr}
	sub sp, #0x18
	ldrh r0, [r0, #6]
	ldr r2, _0808B338 @ =gDispCnt
	ldr r3, _0808B33C @ =0x00001141
	adds r1, r3, #0
	strh r1, [r2]
	ldr r3, _0808B340 @ =gBgCntRegs
	movs r2, #0
	ldr r1, _0808B344 @ =0x00000703
	strh r1, [r3]
	ldr r1, _0808B348 @ =gBgScrollRegs
	strh r2, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	ldr r1, _0808B34C @ =IWRAM_START + 0x48
	adds r0, r0, r1
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0xa9
	bl sub_806B854
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0808B338: .4byte gDispCnt
_0808B33C: .4byte 0x00001141
_0808B340: .4byte gBgCntRegs
_0808B344: .4byte 0x00000703
_0808B348: .4byte gBgScrollRegs
_0808B34C: .4byte IWRAM_START + 0x48

	thumb_func_start sub_808B350
sub_808B350: @ 0x0808B350
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r0, _0808B394 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r7, #0
	ldr r2, _0808B398 @ =gUnknown_03000412
	adds r4, r0, r2
	lsrs r6, r1, #0x10
	ldr r1, _0808B39C @ =IWRAM_START + 0x3FC
	adds r5, r0, r1
_0808B370:
	strh r6, [r4]
	mov r2, r8
	strh r2, [r4, #2]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r6, #0xa
	adds r5, #0x30
	adds r7, #1
	cmp r7, #0xf
	bls _0808B370
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B394: .4byte gCurTask
_0808B398: .4byte gUnknown_03000412
_0808B39C: .4byte IWRAM_START + 0x3FC

	thumb_func_start sub_808B3A0
sub_808B3A0: @ 0x0808B3A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0808B3F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r6, #0
	ldr r1, _0808B3F4 @ =gUnknown_080E05E4
	mov r8, r1
	ldr r1, _0808B3F8 @ =gUnknown_0300041C
	adds r4, r0, r1
	subs r1, #0x20
	adds r5, r0, r1
_0808B3BE:
	lsls r0, r7, #4
	adds r0, r6, r0
	add r0, r8
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x20
	strb r0, [r4]
	movs r0, #0xff
	strb r0, [r4, #1]
	cmp r1, #0
	bne _0808B3D6
	strb r1, [r4]
_0808B3D6:
	adds r0, r5, #0
	bl sub_8004558
	adds r4, #0x30
	adds r5, #0x30
	adds r6, #1
	cmp r6, #0xf
	bls _0808B3BE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3F0: .4byte gCurTask
_0808B3F4: .4byte gUnknown_080E05E4
_0808B3F8: .4byte gUnknown_0300041C
