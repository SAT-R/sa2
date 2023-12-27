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
	thumb_func_start sub_802BE1C
sub_802BE1C: @ 0x0802BE1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0     @ r6 = sonic
	ldr r2, [r6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802BE30
	b sub_802BE1C_return
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
	b sub_802BE1C_return
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
	b sub_802BE1C_return
_0802BE5A:
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r5, r6, r0     @ r5 = spr
	movs r1, #0xb6
	lsls r1, r1, #1
	adds r4, r6, r1     @ r4 = transform
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
	b sub_802BE1C_return
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
	beq sub_802BE1C_return
	movs r0, #0x86
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne sub_802BE1C_return
	movs r4, #0
	subs r0, #0xf0
	adds r0, r0, r6
	mov r8, r0
	ldr r7, _0802BFA0 @ =gCamera
_0802BF48: @ Display after-images
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
	ldrb r2, [r1]       @ r2 = sonic->unk128
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
sub_802BE1C_return:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BFA0: .4byte gCamera
_0802BFA4: .4byte gStageTime
.endif
