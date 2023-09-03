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
	ldr r0, _0802B7E0 @ =gCourseTime
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
	ldr r2, _0802B810 @ =gAnims_SuperSonic_080D69C8
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
_0802B7E0: .4byte gCourseTime
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
_0802B810: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r3, _0802B890 @ =gAnims_SuperSonic_080D69C8
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
_0802B890: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r0, _0802B948 @ =gCourseTime
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
	ldr r1, _0802B95C @ =gAnims_SuperSonic_080D69C8
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
_0802B948: .4byte gCourseTime
_0802B94C: .4byte 0x00008C9F
_0802B950: .4byte gLoadedSaveGame
_0802B954: .4byte gPlayer
_0802B958: .4byte sub_802C8EC
_0802B95C: .4byte gAnims_SuperSonic_080D69C8
_0802B960: .4byte 0x00000155
_0802B964:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802BA0E
	ldr r0, _0802B9F4 @ =gStageTime
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
	ldr r1, _0802BA04 @ =gAnims_SuperSonic_080D69C8
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
_0802B9F4: .4byte gStageTime
_0802B9F8: .4byte gRingCount
_0802B9FC: .4byte gPlayer
_0802BA00: .4byte sub_802C8EC
_0802BA04: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802BA84 @ =gAnims_SuperSonic_080D69C8
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
_0802BA84: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r2, _0802BB38 @ =gAnims_SuperSonic_080D69C8
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
_0802BB38: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802BBFC @ =gAnims_SuperSonic_080D69C8
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
_0802BBFC: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r0, _0802BCA8 @ =gCourseTime
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
_0802BCA8: .4byte gCourseTime
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
	ldr r1, _0802C414 @ =gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802C414 @ =gAnims_SuperSonic_080D69C8
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
_0802C414: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802C550 @ =gAnims_SuperSonic_080D69C8
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
_0802C550: .4byte gAnims_SuperSonic_080D69C8
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
	ldr r1, _0802C5F0 @ =gAnims_SuperSonic_080D69C8
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
_0802C5F0: .4byte gAnims_SuperSonic_080D69C8
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
