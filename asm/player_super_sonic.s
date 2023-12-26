.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
.align 2 , 0
    .global gAnims_SuperSonic_080D69C8
gAnims_SuperSonic_080D69C8:
    .4byte 0
    .2byte 475
    .byte   2, 0

    .4byte 0
    .2byte 475
    .byte   1, 0
    
    .4byte 0
    .2byte 475
    .byte   3, 0
    
    .4byte 0
    .2byte 475
    .byte   0, 0
    
    .4byte 0
    .2byte 475
    .byte   4, 0
    
    .4byte 0
    .2byte 475
    .byte   5, 0
    
    .4byte 0
    .2byte 475
    .byte  12, 0
    
    .4byte 0
    .2byte 475
    .byte  13, 0
    
    .4byte 0
    .2byte 475
    .byte  16, 0
    
    .4byte 0
    .2byte 475
    .byte  17, 0
    
    .4byte 0
    .2byte 475
    .byte   8, 0
    
    .4byte 0
    .2byte 475
    .byte   9, 0
    
    .4byte 0
    .2byte 475
    .byte  10, 0
    
    .4byte 0
    .2byte 475
    .byte  11, 0
    
    .4byte 0
    .2byte 475
    .byte   6, 0
    
    .4byte 0
    .2byte 475
    .byte   7, 0
    
    .4byte 0
    .2byte 475
    .byte  14, 0
    
    .4byte 0
    .2byte 475
    .byte  15, 0
    
    .4byte 0
    .2byte 475
    .byte  18, 0
    
    .4byte 0
    .2byte 475
    .byte  19, 0
    
    .4byte 0
    .2byte 476
    .byte   0, 0
    
    .4byte 0
    .2byte  29
    .byte   0, 0
    
    .4byte 0
    .2byte 475
    .byte   2, 0
    
.arm
.syntax unified
.text

.if 00
.endif

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
	ldr r0, _0802BEB8 @ =gStageTime
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
	ldr r0, _0802BEB8 @ =gStageTime
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
_0802BEB8: .4byte gStageTime
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
	bl UpdateSpriteAnimation
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
	bl DisplaySprite
	b _0802BF96
	.align 2, 0
_0802BF1C: .4byte gSineTable
_0802BF20: .4byte 0x000003FF
_0802BF24:
	adds r0, r5, #0
	bl DisplaySprite
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
	ldr r0, _0802BFA4 @ =gStageTime
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
	bl DisplaySprite
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
_0802BFA4: .4byte gStageTime

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
	ldr r1, _0802C0F4 @ =gAnims_SuperSonic_080D69C8
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
_0802C0F4: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802C15C @ =gAnims_SuperSonic_080D69C8
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
_0802C15C: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802C1B4 @ =gAnims_SuperSonic_080D69C8
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
_0802C1B4: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r2, _0802C2B4 @ =gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802C2B4 @ =gAnims_SuperSonic_080D69C8
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
_0802C2B4: .4byte gAnims_SuperSonic_080D69C8
_0802C2B8: .4byte 0x00000155
_0802C2BC: .4byte sub_802C358
_0802C2C0:
	movs r2, #0
	strh r6, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0802C34C @ =gAnims_SuperSonic_080D69C8
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
_0802C34C: .4byte gAnims_SuperSonic_080D69C8
_0802C350: .4byte 0x00000155
_0802C354: .4byte gSineTable

.if 0
.endif
