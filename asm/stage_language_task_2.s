.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .align 2 , 0
    .global gUnknown_080D5130
gUnknown_080D5130:
    .ascii "FLASH"
    .byte 0xC5, 0xB2, 0xC4
	.ascii ","
	.byte 0xBE, 0xB0, 0xCC, 0xDE, 0xC3, 0xDE, 0xB7, 0xC5, 0xB2, 0xC3, 0xDE, 0xBD

.text
.syntax unified
.arm

	thumb_func_start sub_800A43C
sub_800A43C: @ 0x0800A43C
	push {r4, lr}
	sub sp, #8
	ldr r1, _0800A4A0 @ =gDispCnt
	movs r2, #0x88
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0800A4A4 @ =gBgCntRegs
	movs r4, #0
	movs r3, #0
	ldr r0, _0800A4A8 @ =0x00001E01
	strh r0, [r1, #4]
	str r3, [sp, #4]
	ldr r1, _0800A4AC @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0800A4B0 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800A4B4 @ =gUnknown_03004D80
	strb r4, [r0, #2]
	ldr r1, _0800A4B8 @ =gUnknown_03002280
	strb r4, [r1, #8]
	strb r4, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x40
	strb r0, [r1, #0xb]
	ldr r0, _0800A4BC @ =sub_800A4CC
	movs r2, #0x80
	lsls r2, r2, #5
	str r3, [sp]
	movs r1, #0
	bl TaskCreate
	ldr r1, _0800A4C0 @ =gBgPalette
	ldr r0, _0800A4C4 @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _0800A4C8 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A4A0: .4byte gDispCnt
_0800A4A4: .4byte gBgCntRegs
_0800A4A8: .4byte 0x00001E01
_0800A4AC: .4byte 0x040000D4
_0800A4B0: .4byte 0x85000010
_0800A4B4: .4byte gUnknown_03004D80
_0800A4B8: .4byte gUnknown_03002280
_0800A4BC: .4byte sub_800A4CC
_0800A4C0: .4byte gBgPalette
_0800A4C4: .4byte 0x00007FFF
_0800A4C8: .4byte gFlags

	thumb_func_start sub_800A4CC
sub_800A4CC: @ 0x0800A4CC
	push {lr}
	sub sp, #0xc
	ldr r0, _0800A500 @ =0x06000020
	ldr r1, _0800A504 @ =Tileset_Language
	movs r2, #2
	str r2, [sp]
	ldr r2, _0800A508 @ =gUnknown_080D5130
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0xa
	bl sub_8004274
	ldr r0, _0800A50C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800A4F8
	bl sub_800A510
_0800A4F8:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0800A500: .4byte 0x06000020
_0800A504: .4byte Tileset_Language
_0800A508: .4byte gUnknown_080D5130
_0800A50C: .4byte gPressedKeys

	thumb_func_start sub_800A510
sub_800A510: @ 0x0800A510
	push {lr}
	ldr r1, _0800A538 @ =gUnknown_03004D80
	movs r0, #0
	strb r0, [r1, #2]
	ldr r1, _0800A53C @ =gUnknown_03002280
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	strb r0, [r1, #0xb]
	ldr r0, _0800A540 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl CreateTitleScreen
	pop {r0}
	bx r0
	.align 2, 0
_0800A538: .4byte gUnknown_03004D80
_0800A53C: .4byte gUnknown_03002280
_0800A540: .4byte gCurTask
