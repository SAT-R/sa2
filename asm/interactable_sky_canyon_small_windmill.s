.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill
initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill: @ 0x0807BB18
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807BBF4 @ =Task_Interactable_SkyCanyon_SmallSpinnyWindmill
	ldr r2, _0807BBF8 @ =0x00002010
	ldr r1, _0807BBFC @ =TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	mov r3, sb
	ldrb r1, [r3, #3]
	ldr r3, _0807BC00 @ =IWRAM_START + 0x3C
	adds r0, r5, r3
	movs r3, #0
	strb r1, [r0]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x44]
	movs r0, #0
	mov sl, r0
	strh r4, [r2, #4]
	strh r6, [r2, #6]
	mov r1, sb
	str r1, [r2]
	ldrb r0, [r1]
	strb r0, [r2, #8]
	mov r0, r8
	strb r0, [r2, #9]
	ldr r1, _0807BC04 @ =IWRAM_START + 0xC
	adds r4, r5, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r3, [r4, #8]
	strh r3, [r4, #0x14]
	strh r3, [r4, #0x1c]
	ldr r3, _0807BC08 @ =IWRAM_START + 0x2D
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807BC0C @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807BC10 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r3, sl
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x20
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807BC14 @ =0x00000249
	strh r0, [r4, #0xa]
	ldr r0, _0807BC18 @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	movs r0, #2
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sb
	strb r0, [r3]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF4: .4byte Task_Interactable_SkyCanyon_SmallSpinnyWindmill
_0807BBF8: .4byte 0x00002010
_0807BBFC: .4byte TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill
_0807BC00: .4byte IWRAM_START + 0x3C
_0807BC04: .4byte IWRAM_START + 0xC
_0807BC08: .4byte IWRAM_START + 0x2D
_0807BC0C: .4byte IWRAM_START + 0x2E
_0807BC10: .4byte IWRAM_START + 0x31
_0807BC14: .4byte 0x00000249
_0807BC18: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_807BC1C
sub_807BC1C: @ 0x0807BC1C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	bl sub_8029FF0
	ldr r2, _0807BC58 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x64
	movs r0, #4
	strh r0, [r2]
	movs r0, #0x6d
	bl m4aSongNumStart
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BCA0
	lsls r0, r0, #2
	ldr r1, _0807BC5C @ =_0807BC60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BC58: .4byte gPlayer
_0807BC5C: .4byte _0807BC60
_0807BC60: @ jump table
	.4byte _0807BC80 @ case 0
	.4byte _0807BC80 @ case 1
	.4byte _0807BC88 @ case 2
	.4byte _0807BC88 @ case 3
	.4byte _0807BC90 @ case 4
	.4byte _0807BC90 @ case 5
	.4byte _0807BC98 @ case 6
	.4byte _0807BC98 @ case 7
_0807BC80:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0xa0
	b _0807BC9E
_0807BC88:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0xe0
	b _0807BC9E
_0807BC90:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0x60
	b _0807BC9E
_0807BC98:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0x20
_0807BC9E:
	strb r0, [r1]
_0807BCA0:
	movs r0, #0x3e
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r3, _0807BD08 @ =gPlayer
	ldr r2, _0807BD0C @ =gSineTable
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r4, #0x40]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r3, #8]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r4, #0x44]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r3, #0xc]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BD50
	lsls r0, r0, #2
	ldr r1, _0807BD10 @ =_0807BD14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BD08: .4byte gPlayer
_0807BD0C: .4byte gSineTable
_0807BD10: .4byte _0807BD14
_0807BD14: @ jump table
	.4byte _0807BD34 @ case 0
	.4byte _0807BD44 @ case 1
	.4byte _0807BD34 @ case 2
	.4byte _0807BD44 @ case 3
	.4byte _0807BD34 @ case 4
	.4byte _0807BD44 @ case 5
	.4byte _0807BD34 @ case 6
	.4byte _0807BD44 @ case 7
_0807BD34:
	movs r0, #0
	ldr r1, _0807BD40 @ =0x00000249
	strh r1, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	b _0807BD4E
	.align 2, 0
_0807BD40: .4byte 0x00000249
_0807BD44:
	ldr r0, _0807BD70 @ =0x00000249
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
_0807BD4E:
	strb r0, [r1]
_0807BD50:
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_8004558
	ldr r0, _0807BD74 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807BD78 @ =sub_807C0B4
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD70: .4byte 0x00000249
_0807BD74: .4byte gCurTask
_0807BD78: .4byte sub_807C0B4

	thumb_func_start sub_807BD7C
sub_807BD7C: @ 0x0807BD7C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r1, _0807BDB4 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0807BE4E
	ldr r0, _0807BDB8 @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r1, #0x20]
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BE4E
	lsls r0, r0, #2
	ldr r1, _0807BDBC @ =_0807BDC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BDB4: .4byte gPlayer
_0807BDB8: .4byte 0xFFBFFFFF
_0807BDBC: .4byte _0807BDC0
_0807BDC0: @ jump table
	.4byte _0807BDF8 @ case 0
	.4byte _0807BDE0 @ case 1
	.4byte _0807BE38 @ case 2
	.4byte _0807BDF8 @ case 3
	.4byte _0807BE0C @ case 4
	.4byte _0807BE24 @ case 5
	.4byte _0807BE24 @ case 6
	.4byte _0807BE38 @ case 7
_0807BDE0:
	ldr r2, _0807BDF4 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0xf8
	lsls r0, r0, #8
	b _0807BE4A
	.align 2, 0
_0807BDF4: .4byte gPlayer
_0807BDF8:
	ldr r0, _0807BE08 @ =gPlayer
	movs r1, #0
	strh r1, [r0, #0x10]
	movs r1, #0xf8
	lsls r1, r1, #8
	strh r1, [r0, #0x12]
	b _0807BE4E
	.align 2, 0
_0807BE08: .4byte gPlayer
_0807BE0C:
	ldr r2, _0807BE20 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0xf8
	lsls r0, r0, #8
	b _0807BE4A
	.align 2, 0
_0807BE20: .4byte gPlayer
_0807BE24:
	ldr r0, _0807BE34 @ =gPlayer
	movs r1, #0
	strh r1, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #0x12]
	b _0807BE4E
	.align 2, 0
_0807BE34: .4byte gPlayer
_0807BE38:
	ldr r2, _0807BE64 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #4
_0807BE4A:
	strh r0, [r2, #0x10]
	strh r1, [r2, #0x12]
_0807BE4E:
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0807BE68 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807BE6C @ =sub_807C110
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE64: .4byte gPlayer
_0807BE68: .4byte gCurTask
_0807BE6C: .4byte sub_807C110

	thumb_func_start sub_807BE70
sub_807BE70: @ 0x0807BE70
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BEC0
	lsls r0, r0, #2
	ldr r1, _0807BE88 @ =_0807BE8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BE88: .4byte _0807BE8C
_0807BE8C: @ jump table
	.4byte _0807BEAC @ case 0
	.4byte _0807BEB6 @ case 1
	.4byte _0807BEAC @ case 2
	.4byte _0807BEB6 @ case 3
	.4byte _0807BEAC @ case 4
	.4byte _0807BEB6 @ case 5
	.4byte _0807BEAC @ case 6
	.4byte _0807BEB6 @ case 7
_0807BEAC:
	adds r1, r3, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	adds r0, #8
	b _0807BEBE
_0807BEB6:
	adds r1, r3, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	subs r0, #8
_0807BEBE:
	strb r0, [r1]
_0807BEC0:
	ldr r4, _0807BF2C @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	movs r1, #0x3f
	adds r1, r1, r3
	mov ip, r1
	cmp r0, #0
	bne _0807BF10
	ldr r2, _0807BF30 @ =gSineTable
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r3, #0x40]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r4, #8]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r3, #0x44]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0807BF10:
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x3e
	mov r3, ip
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807BF22
	movs r2, #1
_0807BF22:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807BF2C: .4byte gPlayer
_0807BF30: .4byte gSineTable

	thumb_func_start sub_807BF34
sub_807BF34: @ 0x0807BF34
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0807BFC4 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807BF46
	b _0807C05E
_0807BF46:
	ldr r2, [r5, #0x40]
	ldr r0, _0807BFC8 @ =gCamera
	ldr r1, [r0]
	subs r2, r2, r1
	ldr r3, [r5, #0x44]
	ldr r4, [r0, #4]
	subs r3, r3, r4
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	subs r1, r1, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	subs r2, r2, r7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	subs r0, r3, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r2, #0
	muls r1, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _0807C05E
	cmp r7, ip
	bgt _0807BFFE
	cmp r4, r3
	bgt _0807BFD0
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807BFB2
	rsbs r1, r1, #0
_0807BFB2:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807BFBC
	rsbs r0, r0, #0
_0807BFBC:
	cmp r1, r0
	bgt _0807BFCC
	movs r0, #2
	b _0807C060
	.align 2, 0
_0807BFC4: .4byte gPlayer
_0807BFC8: .4byte gCamera
_0807BFCC:
	movs r0, #1
	b _0807C060
_0807BFD0:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807BFE8
	rsbs r1, r1, #0
_0807BFE8:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807BFF2
	rsbs r0, r0, #0
_0807BFF2:
	cmp r1, r0
	bgt _0807BFFA
	movs r0, #5
	b _0807C060
_0807BFFA:
	movs r0, #6
	b _0807C060
_0807BFFE:
	cmp r4, r3
	bgt _0807C030
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807C01A
	rsbs r1, r1, #0
_0807C01A:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807C024
	rsbs r0, r0, #0
_0807C024:
	cmp r1, r0
	bgt _0807C02C
	movs r0, #3
	b _0807C060
_0807C02C:
	movs r0, #4
	b _0807C060
_0807C030:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807C048
	rsbs r1, r1, #0
_0807C048:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807C052
	rsbs r0, r0, #0
_0807C052:
	cmp r1, r0
	bgt _0807C05A
	movs r0, #8
	b _0807C060
_0807C05A:
	movs r0, #7
	b _0807C060
_0807C05E:
	movs r0, #0
_0807C060:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Task_Interactable_SkyCanyon_SmallSpinnyWindmill
Task_Interactable_SkyCanyon_SmallSpinnyWindmill: @ 0x0807C068
	push {r4, r5, lr}
	ldr r0, _0807C0A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_807BF34
	ldr r1, _0807C0A4 @ =IWRAM_START + 0x3D
	adds r4, r4, r1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C08E
	adds r0, r5, #0
	bl sub_807BC1C
_0807C08E:
	adds r0, r5, #0
	bl sub_807C20C
	cmp r0, #0
	beq _0807C0A8
	adds r0, r5, #0
	bl sub_807C25C
	b _0807C0AE
	.align 2, 0
_0807C0A0: .4byte gCurTask
_0807C0A4: .4byte IWRAM_START + 0x3D
_0807C0A8:
	adds r0, r5, #0
	bl sub_807C1C0
_0807C0AE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807C0B4
sub_807C0B4: @ 0x0807C0B4
	push {r4, r5, r6, lr}
	ldr r0, _0807C100 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	adds r0, #0xc
	adds r4, r5, r0
	adds r0, r6, #0
	bl sub_807BE70
	cmp r0, #0
	beq _0807C0D6
	adds r0, r6, #0
	bl sub_807BD7C
_0807C0D6:
	ldr r1, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0807C0F4
	ldr r0, _0807C104 @ =0xFFFFBFFF
	ands r1, r0
	str r1, [r4, #0x10]
	ldr r0, _0807C108 @ =0x0000FFFF
	strh r0, [r4, #0x1e]
	ldr r0, _0807C10C @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
_0807C0F4:
	adds r0, r6, #0
	bl sub_807C1C0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C100: .4byte gCurTask
_0807C104: .4byte 0xFFFFBFFF
_0807C108: .4byte 0x0000FFFF
_0807C10C: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_807C110
sub_807C110: @ 0x0807C110
	push {r4, lr}
	ldr r0, _0807C164 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0xc
	adds r2, r3, r0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0807C156
	ldr r0, _0807C168 @ =0xFFFFBFFF
	ands r1, r0
	str r1, [r2, #0x10]
	ldr r0, _0807C16C @ =0x0000FFFF
	strh r0, [r2, #0x1e]
	ldr r0, _0807C170 @ =IWRAM_START + 0x2D
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807C174 @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	ldrb r0, [r1]
	subs r0, #8
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C156
	adds r0, r4, #0
	bl sub_807C18C
_0807C156:
	adds r0, r4, #0
	bl sub_807C1C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C164: .4byte gCurTask
_0807C168: .4byte 0xFFFFBFFF
_0807C16C: .4byte 0x0000FFFF
_0807C170: .4byte IWRAM_START + 0x2D
_0807C174: .4byte IWRAM_START + 0x2E

	thumb_func_start TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill
TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill: @ 0x0807C178
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807C18C
sub_807C18C: @ 0x0807C18C
	push {lr}
	adds r3, r0, #0
	adds r0, #0xc
	ldr r1, _0807C1B4 @ =0x00000249
	strh r1, [r0, #0xa]
	adds r2, r3, #0
	adds r2, #0x2c
	movs r1, #2
	strb r1, [r2]
	adds r2, #2
	movs r1, #0x10
	strb r1, [r2]
	bl sub_8004558
	ldr r0, _0807C1B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C1BC @ =Task_Interactable_SkyCanyon_SmallSpinnyWindmill
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807C1B4: .4byte 0x00000249
_0807C1B8: .4byte gCurTask
_0807C1BC: .4byte Task_Interactable_SkyCanyon_SmallSpinnyWindmill

	thumb_func_start sub_807C1C0
sub_807C1C0: @ 0x0807C1C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r5, #0x40]
	ldr r2, _0807C204 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x44]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	ldr r1, _0807C208 @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C204: .4byte gCamera
_0807C208: .4byte 0xFFFFF3FF

	thumb_func_start sub_807C20C
sub_807C20C: @ 0x0807C20C
	push {lr}
	ldr r1, [r0, #0x40]
	ldr r3, _0807C250 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x44]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x8c
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _0807C24A
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C24A
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807C254
_0807C24A:
	movs r0, #1
	b _0807C256
	.align 2, 0
_0807C250: .4byte gCamera
_0807C254:
	movs r0, #0
_0807C256:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C25C
sub_807C25C: @ 0x0807C25C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807C270 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807C270: .4byte gCurTask
