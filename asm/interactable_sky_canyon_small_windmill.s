.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
