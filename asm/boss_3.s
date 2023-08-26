.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

	.global gUnknown_080D7BB0
gUnknown_080D7BB0:
    .incbin "baserom.gba", 0x000D7BB0, 0x18

    .global gUnknown_080D7BC8
gUnknown_080D7BC8:
    .incbin "baserom.gba", 0x000D7BC8, 0x10

    .global gUnknown_080D7BD8
gUnknown_080D7BD8:
    .incbin "baserom.gba", 0x000D7BD8, 0x4

    .global gUnknown_080D7BDC
gUnknown_080D7BDC:
    .incbin "baserom.gba", 0x000D7BDC, 0x6

    .global gUnknown_080D7BE2
gUnknown_080D7BE2:
    .incbin "baserom.gba", 0x000D7BE2, 0x296

    .global gUnknown_080D7E78
gUnknown_080D7E78:
    .incbin "baserom.gba", 0x000D7E78, 0x5C

    .global gUnknown_080D7ED4
gUnknown_080D7ED4:
    .incbin "baserom.gba", 0x000D7ED4, 0x3C

    .global gUnknown_080D7F10
gUnknown_080D7F10:
    .incbin "baserom.gba", 0x000D7F10, 0x4

    .global gUnknown_080D7F14
gUnknown_080D7F14:
    .incbin "baserom.gba", 0x000D7F14, 0x20

    .global gUnknown_080D7F34
gUnknown_080D7F34:
    .incbin "baserom.gba", 0x000D7F34, 0x20

.text
.syntax unified
.arm

	thumb_func_start CreateEggTotem
CreateEggTotem: @ 0x0803EC98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	ldr r2, _0803ECFC @ =gPlayer
	movs r0, #0
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _0803ED00 @ =gPseudoRandom
	ldr r0, _0803ED04 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803ED08 @ =Task_EggTotemMain
	movs r1, #0xe7
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0803ED0C @ =TaskDestructor_EggTotemMain
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0803ED10 @ =gDifficultyLevel
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803ED1C
	ldr r0, _0803ED14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803ED1C
	ldr r0, _0803ED18 @ =IWRAM_START + 0x32
	adds r1, r1, r0
	movs r0, #6
	b _0803ED22
	.align 2, 0
_0803ECFC: .4byte gPlayer
_0803ED00: .4byte gPseudoRandom
_0803ED04: .4byte gUnknown_03005590
_0803ED08: .4byte Task_EggTotemMain
_0803ED0C: .4byte TaskDestructor_EggTotemMain
_0803ED10: .4byte gDifficultyLevel
_0803ED14: .4byte gGameMode
_0803ED18: .4byte IWRAM_START + 0x32
_0803ED1C:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #8
_0803ED22:
	strb r0, [r1]
	ldr r0, _0803EE80 @ =gCurrentLevel
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r0
	cmp r1, #0x1c
	beq _0803ED32
	b _0803EEB0
_0803ED32:
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	beq _0803ED48
	b _0803EEB0
_0803ED48:
	ldr r0, _0803EE84 @ =0x00359200
	str r0, [r6]
	movs r1, #0xaa
	lsls r1, r1, #8
	str r1, [r6, #4]
	movs r5, #0
	movs r2, #0x3c
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x40
	adds r3, r3, r6
	mov r8, r3
	adds r7, r6, #0
	adds r7, #0x33
	str r7, [sp, #0x3c]
	adds r2, r6, #0
	adds r2, #0x34
	str r2, [sp, #0x40]
	adds r3, r6, #0
	adds r3, #0x35
	str r3, [sp, #0x44]
	adds r7, #3
	str r7, [sp, #0x48]
	movs r2, #0xb4
	adds r2, r2, r6
	mov ip, r2
	adds r3, #0x8b
	str r3, [sp, #8]
	adds r7, #0xaa
	str r7, [sp, #0xc]
	adds r2, r6, #0
	adds r2, #0xe1
	str r2, [sp, #0x10]
	adds r3, #0x22
	str r3, [sp, #0x14]
	adds r7, #5
	str r7, [sp, #0x18]
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r2, r6, r2
	str r2, [sp, #0x2c]
	ldr r3, _0803EE88 @ =0x00000389
	adds r3, r6, r3
	str r3, [sp, #0x30]
	ldr r7, _0803EE8C @ =0x0000038A
	adds r7, r6, r7
	str r7, [sp, #0x34]
	ldr r2, _0803EE90 @ =0x0000038D
	adds r2, r6, r2
	str r2, [sp, #0x38]
	movs r3, #0xd6
	lsls r3, r3, #2
	adds r3, r6, r3
	str r3, [sp, #0x1c]
	ldr r7, _0803EE94 @ =0x00000359
	adds r7, r6, r7
	str r7, [sp, #0x20]
	ldr r2, _0803EE98 @ =0x0000035A
	adds r2, r6, r2
	str r2, [sp, #0x24]
	ldr r3, _0803EE9C @ =0x0000035D
	adds r3, r6, r3
	str r3, [sp, #0x28]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r7, r6, r7
	str r7, [sp, #0x4c]
	ldr r2, _0803EEA0 @ =0x000002C9
	adds r2, r6, r2
	str r2, [sp, #0x50]
	ldr r3, _0803EEA4 @ =0x000002CA
	adds r3, r6, r3
	str r3, [sp, #0x54]
	ldr r7, _0803EEA8 @ =0x000002CD
	adds r7, r6, r7
	str r7, [sp, #0x58]
	adds r3, r6, #0
	adds r3, #0xc
	adds r7, r0, #0
	adds r2, r6, #0
	adds r2, #0x10
	adds r4, r1, #0
_0803EDEC:
	lsls r1, r5, #3
	adds r0, r3, r1
	str r7, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EDEC
	movs r5, #0
	movs r3, #0
	movs r4, #0
_0803EE06:
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	mov r0, sb
	adds r2, r0, r1
	ldr r0, _0803EE84 @ =0x00359200
	str r0, [r2]
	mov r7, r8
	adds r2, r7, r1
	lsls r0, r5, #1
	ldr r7, _0803EEAC @ =gUnknown_080D7BE2
	adds r0, r0, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r7, #0xaa
	lsls r7, r7, #8
	adds r0, r0, r7
	str r0, [r2]
	adds r2, r6, r1
	adds r0, r2, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x4e
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #5
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _0803EE64
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
_0803EE64:
	adds r0, r2, #0
	adds r0, #0x53
	strb r3, [r0]
	subs r0, #2
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EE06
	b _0803F038
	.align 2, 0
_0803EE80: .4byte gCurrentLevel
_0803EE84: .4byte 0x00359200
_0803EE88: .4byte 0x00000389
_0803EE8C: .4byte 0x0000038A
_0803EE90: .4byte 0x0000038D
_0803EE94: .4byte 0x00000359
_0803EE98: .4byte 0x0000035A
_0803EE9C: .4byte 0x0000035D
_0803EEA0: .4byte 0x000002C9
_0803EEA4: .4byte 0x000002CA
_0803EEA8: .4byte 0x000002CD
_0803EEAC: .4byte gUnknown_080D7BE2
_0803EEB0:
	movs r0, #0xaa
	lsls r0, r0, #0xa
	str r0, [r6]
	movs r1, #0xaa
	lsls r1, r1, #8
	str r1, [r6, #4]
	movs r5, #0
	movs r2, #0x3c
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x40
	adds r3, r3, r6
	mov r8, r3
	adds r7, r6, #0
	adds r7, #0x33
	str r7, [sp, #0x3c]
	adds r2, r6, #0
	adds r2, #0x34
	str r2, [sp, #0x40]
	adds r3, r6, #0
	adds r3, #0x35
	str r3, [sp, #0x44]
	adds r7, #3
	str r7, [sp, #0x48]
	movs r2, #0xb4
	adds r2, r2, r6
	mov ip, r2
	adds r3, #0x8b
	str r3, [sp, #8]
	adds r7, #0xaa
	str r7, [sp, #0xc]
	adds r2, r6, #0
	adds r2, #0xe1
	str r2, [sp, #0x10]
	adds r3, #0x22
	str r3, [sp, #0x14]
	adds r7, #5
	str r7, [sp, #0x18]
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r2, r6, r2
	str r2, [sp, #0x2c]
	ldr r3, _0803EFDC @ =0x00000389
	adds r3, r6, r3
	str r3, [sp, #0x30]
	ldr r7, _0803EFE0 @ =0x0000038A
	adds r7, r6, r7
	str r7, [sp, #0x34]
	ldr r2, _0803EFE4 @ =0x0000038D
	adds r2, r6, r2
	str r2, [sp, #0x38]
	movs r3, #0xd6
	lsls r3, r3, #2
	adds r3, r6, r3
	str r3, [sp, #0x1c]
	ldr r7, _0803EFE8 @ =0x00000359
	adds r7, r6, r7
	str r7, [sp, #0x20]
	ldr r2, _0803EFEC @ =0x0000035A
	adds r2, r6, r2
	str r2, [sp, #0x24]
	ldr r3, _0803EFF0 @ =0x0000035D
	adds r3, r6, r3
	str r3, [sp, #0x28]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r7, r6, r7
	str r7, [sp, #0x4c]
	ldr r2, _0803EFF4 @ =0x000002C9
	adds r2, r6, r2
	str r2, [sp, #0x50]
	ldr r3, _0803EFF8 @ =0x000002CA
	adds r3, r6, r3
	str r3, [sp, #0x54]
	ldr r7, _0803EFFC @ =0x000002CD
	adds r7, r6, r7
	str r7, [sp, #0x58]
	adds r3, r6, #0
	adds r3, #0xc
	adds r7, r0, #0
	adds r2, r6, #0
	adds r2, #0x10
	adds r4, r1, #0
_0803EF56:
	lsls r1, r5, #3
	adds r0, r3, r1
	str r7, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EF56
	movs r5, #0
	movs r4, #0
	ldr r0, _0803F000 @ =gGameMode
	mov sl, r0
_0803EF72:
	lsls r3, r5, #3
	subs r2, r3, r5
	lsls r2, r2, #2
	mov r7, sb
	adds r1, r7, r2
	movs r0, #0xaa
	lsls r0, r0, #0xa
	str r0, [r1]
	mov r0, r8
	adds r1, r0, r2
	lsls r0, r5, #1
	ldr r7, _0803F004 @ =gUnknown_080D7BE2
	adds r0, r0, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r7, #0xaa
	lsls r7, r7, #8
	adds r0, r0, r7
	str r0, [r1]
	adds r2, r6, r2
	adds r0, r2, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x4e
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #5
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r7, _0803F008 @ =gDifficultyLevel
	ldrb r0, [r7]
	cmp r0, #0
	beq _0803F00C
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #2
	beq _0803F00C
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
	b _0803F018
	.align 2, 0
_0803EFDC: .4byte 0x00000389
_0803EFE0: .4byte 0x0000038A
_0803EFE4: .4byte 0x0000038D
_0803EFE8: .4byte 0x00000359
_0803EFEC: .4byte 0x0000035A
_0803EFF0: .4byte 0x0000035D
_0803EFF4: .4byte 0x000002C9
_0803EFF8: .4byte 0x000002CA
_0803EFFC: .4byte 0x000002CD
_0803F000: .4byte gGameMode
_0803F004: .4byte gUnknown_080D7BE2
_0803F008: .4byte gDifficultyLevel
_0803F00C:
	subs r0, r3, r5
	lsls r0, r0, #2
	adds r0, r6, r0
	adds r0, #0x50
	movs r1, #3
	strb r1, [r0]
_0803F018:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r6, r0
	adds r1, r0, #0
	adds r1, #0x53
	strb r4, [r1]
	subs r1, #2
	strb r4, [r1]
	adds r0, #0x52
	strb r4, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EF72
_0803F038:
	movs r5, #0
	movs r4, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r6, #8]
	strh r4, [r6, #0xa]
	movs r0, #0xf0
	ldr r2, [sp, #0x3c]
	strb r0, [r2]
	strh r4, [r6, #0x30]
	ldr r3, [sp, #0x40]
	strb r5, [r3]
	ldr r7, [sp, #0x44]
	strb r5, [r7]
	ldr r0, [sp, #0x48]
	strb r5, [r0]
	movs r0, #0x78
	mov r1, ip
	str r0, [r1]
	movs r0, #8
	bl VramMalloc
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	str r0, [r1]
	ldr r7, [sp, #8]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x78
	bl VramMalloc
	str r0, [r7, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r3, r3, r0
	mov ip, r3
	ldr r1, _0803F37C @ =0x0000028B
	strh r1, [r7, #0xa]
	ldr r1, [sp, #0xc]
	strb r5, [r1]
	movs r2, #0xb8
	lsls r2, r2, #3
	mov r8, r2
	mov r3, r8
	strh r3, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r1, #0xff
	ldr r2, [sp, #0x10]
	strb r1, [r2]
	movs r3, #0x10
	mov sb, r3
	mov r2, sb
	ldr r1, [sp, #0x14]
	strb r2, [r1]
	ldr r3, [sp, #0x18]
	strb r5, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r3, #0xda
	lsls r3, r3, #2
	adds r7, r6, r3
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	mov r3, ip
	str r3, [r7, #4]
	movs r3, #0x88
	lsls r3, r3, #4
	adds r3, r3, r0
	mov ip, r3
	ldr r0, _0803F380 @ =0x0000028A
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x2c]
	strb r5, [r0]
	mov r3, r8
	strh r3, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov sl, r2
	mov r3, sl
	ldr r0, [sp, #0x30]
	strb r3, [r0]
	mov r3, sb
	ldr r0, [sp, #0x34]
	strb r3, [r0]
	ldr r0, [sp, #0x38]
	strb r5, [r0]
	str r2, [r7, #0x28]
	str r1, [r7, #0x10]
	movs r3, #0xce
	lsls r3, r3, #2
	adds r7, r6, r3
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	mov r0, ip
	str r0, [r7, #4]
	movs r0, #0xa5
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r3, [sp, #0x1c]
	strb r5, [r3]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r2, #0
	ldr r3, [sp, #0x20]
	strb r0, [r3]
	mov r3, sb
	ldr r0, [sp, #0x24]
	strb r3, [r0]
	ldr r0, [sp, #0x28]
	strb r5, [r0]
	str r2, [r7, #0x28]
	str r1, [r7, #0x10]
	movs r5, #0
	movs r1, #0
	mov r8, r1
	movs r2, #0
_0803F136:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0xf8
	adds r7, r6, r0
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	ldr r0, _0803F384 @ =gUnknown_080D7BB0
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _0803F388 @ =gUnknown_080D7BD8
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #6
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x5c]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	mov r3, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803F136
	movs r5, #0
	movs r2, #0
	movs r4, #0
	ldr r7, _0803F38C @ =0x0000028F
	mov r8, r7
_0803F1A8:
	lsls r0, r5, #6
	movs r1, #0xc4
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r7, r6, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x1e
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	mov r3, r8
	strh r3, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	ldr r2, [sp, #0x5c]
	strb r2, [r0]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803F1A8
	movs r5, #0
	movs r2, #0
_0803F206:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r7, #0x92
	lsls r7, r7, #2
	adds r0, r0, r7
	adds r7, r6, r0
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	ldr r0, _0803F390 @ =gUnknown_080D7BC8
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x5c]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	str r1, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _0803F206
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r7, r6, r2
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0803F394 @ =0x00000275
	strh r0, [r7, #0xa]
	ldr r3, [sp, #0x4c]
	strb r5, [r3]
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x50]
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x10
	ldr r3, [sp, #0x54]
	strb r0, [r3]
	ldr r1, [sp, #0x58]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	mov r3, sb
	str r3, [r7, #0x10]
	ldr r2, _0803F398 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _0803F3BC
	ldr r0, _0803F39C @ =gSelectedCharacter
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	bne _0803F3BC
	ldr r0, _0803F3A0 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0803F3BC
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r7, r6, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x1e
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xde
	strh r0, [r7, #0xa]
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r5, [r0]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, _0803F3A4 @ =0x000002F9
	adds r1, r6, r2
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803F3A8 @ =0x000002FA
	adds r0, r6, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r3, _0803F3AC @ =0x000002FD
	adds r0, r6, r3
	strb r5, [r0]
	mov r0, sl
	str r0, [r7, #0x28]
	mov r1, sb
	str r1, [r7, #0x10]
	movs r2, #0xc2
	lsls r2, r2, #2
	adds r7, r6, r2
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xa4
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	movs r3, #0xca
	lsls r3, r3, #2
	adds r0, r6, r3
	strb r5, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, _0803F3B0 @ =0x00000329
	adds r1, r6, r2
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803F3B4 @ =0x0000032A
	adds r0, r6, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r3, _0803F3B8 @ =0x0000032D
	adds r0, r6, r3
	strb r5, [r0]
	mov r0, sl
	str r0, [r7, #0x28]
	mov r1, sb
	str r1, [r7, #0x10]
	b _0803F3CE
	.align 2, 0
_0803F37C: .4byte 0x0000028B
_0803F380: .4byte 0x0000028A
_0803F384: .4byte gUnknown_080D7BB0
_0803F388: .4byte gUnknown_080D7BD8
_0803F38C: .4byte 0x0000028F
_0803F390: .4byte gUnknown_080D7BC8
_0803F394: .4byte 0x00000275
_0803F398: .4byte gCurrentLevel
_0803F39C: .4byte gSelectedCharacter
_0803F3A0: .4byte gLoadedSaveGame
_0803F3A4: .4byte 0x000002F9
_0803F3A8: .4byte 0x000002FA
_0803F3AC: .4byte 0x000002FD
_0803F3B0: .4byte 0x00000329
_0803F3B4: .4byte 0x0000032A
_0803F3B8: .4byte 0x0000032D
_0803F3BC:
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r6, r2
	movs r1, #0
	str r1, [r0]
	movs r3, #0xc3
	lsls r3, r3, #2
	adds r0, r6, r3
	str r1, [r0]
_0803F3CE:
	ldr r0, _0803F3E4 @ =gActiveBossTask
	ldr r7, [sp, #4]
	str r7, [r0]
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F3E4: .4byte gActiveBossTask

	thumb_func_start sub_803F3E8
sub_803F3E8: @ 0x0803F3E8
	push {r4, r5, lr}
	ldr r0, _0803F408 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x33
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F40C
	subs r0, #1
	strb r0, [r1]
	b _0803F416
	.align 2, 0
_0803F408: .4byte gCurTask
_0803F40C:
	movs r0, #0x50
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_804063C
_0803F416:
	adds r0, r4, #0
	bl sub_803FB88
	adds r0, r4, #0
	bl sub_80407A4
	adds r0, r4, #0
	bl sub_8041264
	adds r0, r4, #0
	bl sub_80408C4
	adds r0, r4, #0
	bl sub_8040A00
	adds r0, r4, #0
	bl sub_803F5E0
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F698
	adds r0, r4, #0
	bl sub_8040F14
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r5, [r0]
	cmp r5, #0
	bne _0803F4A4
	bl sub_802A018
	ldr r2, _0803F4AC @ =gPlayer
	ldr r0, [r2, #0x3c]
	cmp r0, #0
	bne _0803F46C
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0803F47C
_0803F46C:
	str r5, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
_0803F47C:
	adds r0, r4, #0
	bl sub_803F4B8
	adds r0, r4, #0
	adds r0, #0x37
	movs r1, #0
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0x38
	movs r0, #5
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x39
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0803F4B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803F4B4 @ =Task_8041138
	str r0, [r1, #8]
_0803F4A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F4AC: .4byte gPlayer
_0803F4B0: .4byte gCurTask
_0803F4B4: .4byte Task_8041138

	thumb_func_start sub_803F4B8
sub_803F4B8: @ 0x0803F4B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	ldr r4, _0803F5C8 @ =gUnknown_080D7BDC
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, ip
	ldr r5, [r2]
	adds r0, r5, r0
	str r0, [r2, #0xc]
	ldr r2, [r2, #4]
	ldr r3, _0803F5CC @ =0xFFFFF400
	adds r6, r2, r3
	mov r7, ip
	str r6, [r7, #0x10]
	movs r0, #0
	mov r8, r0
	movs r3, #0xa0
	lsls r3, r3, #3
	strh r3, [r7, #0x24]
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r7, #0x26]
	movs r7, #2
	ldrsh r0, [r4, r7]
	adds r0, r5, r0
	mov r7, ip
	str r0, [r7, #0x14]
	str r6, [r7, #0x18]
	strh r3, [r7, #0x28]
	strh r1, [r7, #0x2a]
	movs r6, #4
	ldrsh r0, [r4, r6]
	adds r0, r5, r0
	str r0, [r7, #0x1c]
	ldr r7, _0803F5D0 @ =0xFFFFFA00
	adds r2, r2, r7
	mov r0, ip
	str r2, [r0, #0x20]
	strh r3, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, #0x9c
	str r5, [r0]
	mov r1, ip
	adds r1, #0xa0
	mov r2, ip
	ldr r0, [r2, #4]
	str r0, [r1]
	mov r0, ip
	adds r0, #0xa4
	strh r3, [r0]
	adds r1, #6
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	subs r1, #0x16
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	mov r0, ip
	adds r0, #0x98
	strh r3, [r0]
	adds r0, #2
	movs r2, #0xff
	lsls r2, r2, #8
	strh r2, [r0]
	adds r1, #0x14
	mov r4, ip
	ldr r0, [r4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r4, #4]
	ldr r6, _0803F5D4 @ =0xFFFFE600
	adds r0, r0, r6
	str r0, [r1]
	mov r0, ip
	adds r0, #0xb0
	strh r3, [r0]
	adds r0, #2
	mov r7, r8
	strh r7, [r0]
	movs r4, #0
_0803F562:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x3c
	add r0, ip
	strh r3, [r0, #8]
	strh r2, [r0, #0xa]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #1
	strb r1, [r0, #0x18]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803F562
	movs r0, #0xb7
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	cmp r0, #0
	beq _0803F5BC
	movs r2, #0xb6
	lsls r2, r2, #2
	add r2, ip
	mov r1, ip
	adds r1, #0xb8
	mov r3, ip
	ldr r0, [r3]
	ldr r4, _0803F5D8 @ =0xFFFFD800
	adds r0, r0, r4
	str r0, [r1]
	adds r1, #4
	ldr r0, [r3, #4]
	ldr r6, _0803F5DC @ =0xFFFF9E00
	adds r0, r0, r6
	str r0, [r1]
	movs r0, #0xde
	strh r0, [r2, #0xa]
	movs r1, #0xbe
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	strb r0, [r1]
_0803F5BC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F5C8: .4byte gUnknown_080D7BDC
_0803F5CC: .4byte 0xFFFFF400
_0803F5D0: .4byte 0xFFFFFA00
_0803F5D4: .4byte 0xFFFFE600
_0803F5D8: .4byte 0xFFFFD800
_0803F5DC: .4byte 0xFFFF9E00

	thumb_func_start sub_803F5E0
sub_803F5E0: @ 0x0803F5E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc0
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r8, r0
	ldr r0, [r4, #4]
	asrs r7, r0, #8
	ldr r1, _0803F634 @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r6, _0803F638 @ =gPlayer
	str r6, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	str r6, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0803F63C
	adds r0, r4, #0
	bl sub_8040D74
	b _0803F654
	.align 2, 0
_0803F634: .4byte gCamera
_0803F638: .4byte gPlayer
_0803F63C:
	str r6, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _0803F654
	adds r0, r4, #0
	bl sub_80412B4
_0803F654:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, _0803F690 @ =0xFFFFB000
	adds r1, r1, r2
	bl sub_80122DC
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F684
	ldr r0, _0803F694 @ =gPlayer
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _0803F684
	adds r0, r4, #0
	bl sub_8040D74
_0803F684:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F690: .4byte 0xFFFFB000
_0803F694: .4byte gPlayer

	thumb_func_start sub_803F698
sub_803F698: @ 0x0803F698
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0xc0
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r4, _0803F7B8 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0x52
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	movs r7, #0
_0803F6F0:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r0, #0xf8
	adds r5, r6, r0
	lsls r2, r7, #3
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	subs r0, #0xe
	strh r0, [r5, #0x18]
	cmp r7, #2
	bne _0803F728
	adds r0, #6
	strh r0, [r5, #0x18]
_0803F728:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0803F6F0
	movs r7, #0
	ldr r1, _0803F7B8 @ =gCamera
	mov r8, r1
_0803F744:
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r4, r6, r0
	lsls r0, r7, #6
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r5, r6, r0
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, _0803F7BC @ =gSineTable
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	adds r0, #0x20
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	cmp r1, #0
	beq _0803F7FE
	ldrb r0, [r4, #0x14]
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r5, r6, r2
	cmp r0, #0
	beq _0803F7AA
	movs r0, #0x92
	lsls r0, r0, #2
	adds r5, r6, r0
_0803F7AA:
	cmp r1, #0
	ble _0803F7C4
	movs r3, #0
	ldr r0, [r5, #0x10]
	ldr r1, _0803F7C0 @ =0xFFFFF7FF
	ands r0, r1
	b _0803F7CE
	.align 2, 0
_0803F7B8: .4byte gCamera
_0803F7BC: .4byte gSineTable
_0803F7C0: .4byte 0xFFFFF7FF
_0803F7C4:
	movs r3, #0xff
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
_0803F7CE:
	str r0, [r5, #0x10]
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	adds r2, r2, r1
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
_0803F7FE:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0803F744
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803F868
	movs r2, #0xc2
	lsls r2, r2, #2
	adds r5, r6, r2
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r4, _0803F874 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	subs r0, #0x10
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	subs r0, #0x28
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0x62
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
_0803F868:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F874: .4byte gCamera

	thumb_func_start sub_803F878
sub_803F878: @ 0x0803F878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r7, _0803FA7C @ =gCamera
_0803F888:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xf8
	adds r5, r6, r0
	lsls r2, r4, #3
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803F888
	movs r0, #0
	mov sl, r0
	adds r4, r6, #0
	adds r4, #0x37
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803F914
	movs r1, #0xce
	lsls r1, r1, #2
	adds r5, r6, r1
	adds r0, r6, #0
	adds r0, #0xa8
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803FA7C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xac
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _0803F90E
	movs r2, #1
	mov sl, r2
	mov r3, sl
	strb r3, [r4]
_0803F90E:
	adds r0, r5, #0
	bl sub_80051E8
_0803F914:
	movs r0, #0xda
	lsls r0, r0, #2
	adds r5, r6, r0
	adds r0, r6, #0
	adds r0, #0x9c
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, _0803FA7C @ =gCamera
	mov r8, r1
	ldr r1, [r1]
	subs r0, r0, r1
	movs r4, #0
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r0, [r0]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, r6, #0
	adds r5, #0xc0
	ldr r0, _0803FA80 @ =0x00000289
	strh r0, [r5, #0xa]
	adds r0, r6, #0
	adds r0, #0xe0
	strb r4, [r0]
	adds r1, r6, #0
	adds r1, #0xe1
	movs r0, #0xff
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x90
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r7, r6, #0
	adds r7, #0x94
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x3a
	adds r0, r0, r6
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F9F4
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r5, r6, r1
	ldr r1, [r4]
	asrs r1, r1, #8
	mov r2, r8
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r0, r0, r2
	subs r0, #0x51
	strh r0, [r5, #0x18]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x31
	bgt _0803F9E8
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3]
	subs r0, r0, r1
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r2, [r3, #4]
	subs r1, r1, r2
	subs r1, #0x4f
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	bl CreateEggmobileEscapeSequence
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
_0803F9E8:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
_0803F9F4:
	movs r4, #0
	ldr r7, _0803FA7C @ =gCamera
_0803F9F8:
	lsls r2, r4, #3
	subs r2, r2, r4
	lsls r2, r2, #2
	adds r2, #0x3c
	adds r2, r6, r2
	lsls r0, r4, #6
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r0, r0, r3
	adds r5, r6, r0
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803F9F8
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803FA6C
	movs r2, #0xb6
	lsls r2, r2, #2
	adds r5, r6, r2
	adds r0, r6, #0
	adds r0, #0xb8
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803FA7C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xbc
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl sub_80051E8
_0803FA6C:
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FA7C: .4byte gCamera
_0803FA80: .4byte 0x00000289

	thumb_func_start sub_803FA84
sub_803FA84: @ 0x0803FA84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0803FB7C @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r3]
	adds r0, r0, r5
	str r0, [r3]
	ldr r0, [r3, #4]
	adds r0, r0, r6
	str r0, [r3, #4]
	movs r4, #0
	ldr r0, _0803FB80 @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov ip, r0
	ldr r0, _0803FB84 @ =IWRAM_START + 0x10
	adds r7, r1, r0
_0803FAB8:
	lsls r1, r4, #3
	mov r0, ip
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803FAB8
	movs r4, #0
	movs r1, #0x9c
	adds r1, r1, r3
	mov ip, r1
	movs r0, #0xa0
	adds r0, r0, r3
	mov r8, r0
	movs r1, #0x90
	adds r1, r1, r3
	mov sb, r1
	movs r0, #0x94
	adds r0, r0, r3
	mov sl, r0
	adds r1, r3, #0
	adds r1, #0xa8
	str r1, [sp, #4]
	adds r0, r3, #0
	adds r0, #0xac
	str r0, [sp, #8]
	adds r1, #0x10
	str r1, [sp, #0xc]
	adds r0, #0x10
	str r0, [sp]
	adds r7, r3, #0
	adds r7, #0x3c
	adds r3, #0x40
_0803FB0A:
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803FB0A
	mov r1, ip
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r1, [sp, #4]
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, [sp, #8]
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r1, [sp, #0xc]
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, [sp]
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FB7C: .4byte gActiveBossTask
_0803FB80: .4byte IWRAM_START + 0xC
_0803FB84: .4byte IWRAM_START + 0x10

	thumb_func_start sub_803FB88
sub_803FB88: @ 0x0803FB88
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_804124C
	movs r7, #0
	movs r6, #0
_0803FB96:
	lsls r2, r6, #3
	adds r0, r5, #0
	adds r0, #0xc
	adds r3, r0, r2
	ldr r1, _0803FC08 @ =gUnknown_080D7BDC
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r3]
	cmp r6, #0
	bne _0803FBB8
	ldr r0, [r5, #0x10]
	adds r0, #6
	str r0, [r5, #0x10]
_0803FBB8:
	adds r4, r5, #0
	adds r4, #0x10
	adds r4, r4, r2
	ldr r1, [r4]
	adds r7, r7, r1
	asrs r0, r1, #8
	subs r0, #1
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _0803FC0C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r0, #1
	lsls r0, r0, #8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0803FB96
	adds r0, r7, #0
	movs r1, #3
	bl Div
	ldr r2, _0803FC10 @ =0xFFFFFE00
	adds r1, r0, r2
	ldr r0, [r5, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
	str r1, [r5, #4]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FC08: .4byte gUnknown_080D7BDC
_0803FC0C: .4byte sub_801EC3C
_0803FC10: .4byte 0xFFFFFE00

	thumb_func_start sub_803FC14
sub_803FC14: @ 0x0803FC14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sb, r0
	movs r3, #0
	mov r5, sb
	adds r5, #0xc
	mov r4, sb
	adds r4, #0x24
_0803FC2C:
	lsls r1, r3, #3
	adds r1, r5, r1
	lsls r0, r3, #2
	adds r0, r4, r0
	movs r6, #0
	ldrsh r2, [r0, r6]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _0803FC2C
	movs r0, #0x9c
	add r0, sb
	mov sl, r0
	mov r0, sb
	adds r0, #0xa4
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	mov r6, sb
	adds r6, #0x90
	mov r0, sb
	adds r0, #0x98
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	ldr r3, _0803FDCC @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #0xe
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0803FD04
	ldr r0, _0803FDD0 @ =gPseudoRandom
	mov r8, r0
	ldr r0, [r0]
	ldr r5, _0803FDD4 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0803FDD8 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r3, _0803FDDC @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sb
	adds r0, #0x94
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x4b
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0803FDE0 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0803FDE4 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _0803FDE8 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	mov r1, sb
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_0803FD04:
	ldr r3, _0803FDCC @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #0xd
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0803FD9A
	ldr r6, _0803FDD0 @ =gPseudoRandom
	mov r8, r6
	ldr r0, [r6]
	ldr r5, _0803FDD4 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0803FDD8 @ =0x3C6EF35F
	adds r2, r2, r4
	mov r0, sl
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r3, _0803FDDC @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sb
	adds r0, #0xa0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x10
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0803FDE0 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0803FDE4 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _0803FDE8 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	mov r1, sb
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_0803FD9A:
	mov r2, sb
	adds r2, #0xa8
	mov r0, sb
	adds r0, #0xb0
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
_0803FDAE:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r6, sb
	adds r4, r6, r0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _0803FDEC
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	strh r0, [r4, #0xa]
	adds r3, #1
	str r3, [sp, #0x28]
	b _0803FEA8
	.align 2, 0
_0803FDCC: .4byte gUnknown_03005590
_0803FDD0: .4byte gPseudoRandom
_0803FDD4: .4byte 0x00196225
_0803FDD8: .4byte 0x3C6EF35F
_0803FDDC: .4byte gCamera
_0803FDE0: .4byte 0x000001FF
_0803FDE4: .4byte 0x06012980
_0803FDE8: .4byte 0x0000026B
_0803FDEC:
	subs r0, #1
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	adds r3, #1
	str r3, [sp, #0x28]
	cmp r0, #0
	bne _0803FEA8
	movs r3, #0
	mov r0, sb
	adds r0, #0x39
	str r0, [sp, #0x24]
	ldr r1, _0803FF20 @ =gPseudoRandom
	mov sl, r1
	ldr r7, _0803FF24 @ =0x00196225
	ldr r6, _0803FF28 @ =0x3C6EF35F
	movs r2, #0x3f
	mov r8, r2
	add r5, sp, #4
_0803FE10:
	mov r1, sl
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _0803FF2C @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _0803FF2C @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #7
	ands r0, r2
	add r0, ip
	subs r1, r0, #3
	str r1, [sp, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x1c]
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r7, r1
	adds r1, r1, r6
	mov r2, sl
	str r1, [r2]
	ldr r0, _0803FF30 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _0803FF34 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803FF38 @ =0x0000026B
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r1, #0
	str r1, [sp, #8]
	add r0, sp, #4
	ldr r1, [sp, #0x24]
	str r3, [sp, #0x2c]
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, [sp, #0x2c]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803FE10
_0803FEA8:
	movs r2, #8
	ldrsh r0, [r4, r2]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	movs r3, #0xa
	ldrsh r2, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #3
	asrs r1, r1, #8
	ldr r2, _0803FF3C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0803FF02
	lsls r1, r0, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r6, #0xa
	ldrsh r1, [r4, r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _0803FF02
	ldr r3, _0803FF40 @ =0xFFFFFF00
	adds r0, r1, r3
	strh r0, [r4, #8]
_0803FF02:
	ldr r6, [sp, #0x28]
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bhi _0803FF0E
	b _0803FDAE
_0803FF0E:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF20: .4byte gPseudoRandom
_0803FF24: .4byte 0x00196225
_0803FF28: .4byte 0x3C6EF35F
_0803FF2C: .4byte gCamera
_0803FF30: .4byte 0x000001FF
_0803FF34: .4byte 0x06012980
_0803FF38: .4byte 0x0000026B
_0803FF3C: .4byte sub_801EC3C
_0803FF40: .4byte 0xFFFFFF00

	thumb_func_start sub_803FF44
sub_803FF44: @ 0x0803FF44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x5c
	str r0, [sp, #0x24]
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FF5C
	b _080401C0
_0803FF5C:
	movs r6, #0
	ldr r0, [sp, #0x24]
	adds r0, #0x26
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x24]
	adds r1, #0xc
	str r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	adds r2, #0x24
	str r2, [sp, #0x34]
	ldr r3, [sp, #0x24]
	adds r3, #0x10
	str r3, [sp, #0x2c]
	ldr r7, [sp, #0x24]
	adds r7, #0xa6
	mov sl, r7
	ldr r0, [sp, #0x24]
	adds r0, #0x9c
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	adds r1, #0xa4
	str r1, [sp, #0x50]
	ldr r2, [sp, #0x24]
	adds r2, #0xa0
	mov sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #0x90
	str r3, [sp, #0x40]
	ldr r7, [sp, #0x24]
	adds r7, #0x94
	str r7, [sp, #0x44]
_0803FF9A:
	lsls r0, r6, #2
	mov r8, r0
	ldr r5, [sp, #0x38]
	add r5, r8
	ldrh r0, [r5]
	adds r0, #0x20
	strh r0, [r5]
	lsls r2, r6, #3
	ldr r1, [sp, #0x28]
	adds r3, r1, r2
	ldr r7, [sp, #0x34]
	add r7, r8
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r1, [sp, #0x2c]
	adds r4, r1, r2
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	ldr r1, _080400AC @ =gUnknown_080D7F10
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	subs r0, #1
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _080400B0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _0804002E
	lsls r1, r2, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080400B4 @ =0xFFFFFF00
	cmp r0, r1
	ble _0804001A
	movs r2, #0
	strh r2, [r5]
_0804001A:
	ldrh r1, [r7]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _0804002E
	adds r0, r1, #0
	subs r0, #0x20
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r7]
_0804002E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0803FF9A
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x20
	strh r0, [r2]
	ldr r3, [sp, #0x50]
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r2, [sp, #0x4c]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r3, sl
	movs r7, #0
	ldrsh r1, [r3, r7]
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	asrs r0, r0, #8
	subs r0, #8
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _080400B0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _080400E2
	lsls r1, r2, #8
	mov r7, sb
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	mov r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	mov r3, sl
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, _080400B4 @ =0xFFFFFF00
	cmp r1, r0
	ble _080400B8
	movs r0, #0
	strh r0, [r3]
	b _080400D0
	.align 2, 0
_080400AC: .4byte gUnknown_080D7F10
_080400B0: .4byte sub_801EC3C
_080400B4: .4byte 0xFFFFFF00
_080400B8:
	ldr r0, _0804019C @ =0xFFFFFE90
	cmp r1, r0
	bge _080400D0
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x80
	movs r3, #0x14
	bl CreateScreenShake
_080400D0:
	ldr r7, [sp, #0x50]
	ldrh r1, [r7]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	ble _080400E2
	adds r0, r1, #0
	subs r0, #0x30
	strh r0, [r7]
_080400E2:
	ldr r3, [sp, #0x4c]
	ldr r0, [r3]
	ldr r7, [sp, #0x40]
	str r0, [r7]
	mov r1, sb
	ldr r0, [r1]
	movs r2, #0xc8
	lsls r2, r2, #6
	adds r0, r0, r2
	ldr r3, [sp, #0x44]
	str r0, [r3]
	ldr r0, _080401A0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #6
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	beq _0804010A
	b _0804049E
_0804010A:
	ldr r0, _080401A4 @ =gPseudoRandom
	mov r8, r0
	ldr r0, [r0]
	ldr r6, _080401A8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r5, _080401AC @ =0x3C6EF35F
	adds r2, r2, r5
	mov r1, r8
	str r2, [r1]
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r4, _080401B0 @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0x3f
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r5
	mov r0, r8
	str r2, [r0]
	mov r0, sb
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x2d
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r4, r0, #0
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r3
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	adds r3, r4, #0
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	mov r2, r8
	str r1, [r2]
	ldr r0, _080401B4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080401B8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080401BC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
	b _0804049E
	.align 2, 0
_0804019C: .4byte 0xFFFFFE90
_080401A0: .4byte gUnknown_03005590
_080401A4: .4byte gPseudoRandom
_080401A8: .4byte 0x00196225
_080401AC: .4byte 0x3C6EF35F
_080401B0: .4byte gCamera
_080401B4: .4byte 0x000001FF
_080401B8: .4byte 0x06012980
_080401BC: .4byte 0x0000026B
_080401C0:
	movs r6, #0
	ldr r3, _080404C0 @ =sub_801EC3C
	mov r8, r3
	ldr r7, [sp, #0x24]
	adds r7, #0x9c
	str r7, [sp, #0x4c]
	ldr r0, [sp, #0x24]
	adds r0, #0xa4
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x24]
	adds r1, #0x90
	str r1, [sp, #0x40]
	ldr r2, [sp, #0x24]
	adds r2, #0x94
	str r2, [sp, #0x44]
	ldr r3, [sp, #0x24]
	adds r3, #0x9a
	str r3, [sp, #0x48]
	ldr r5, [sp, #0x24]
	adds r5, #0x98
	ldr r4, [sp, #0x24]
	adds r4, #0xc
	ldr r3, [sp, #0x24]
	adds r3, #0x24
_080401F0:
	lsls r1, r6, #3
	adds r1, r4, r1
	lsls r0, r6, #2
	adds r0, r3, r0
	movs r7, #0
	ldrsh r2, [r0, r7]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080401F0
	ldr r0, [sp, #0x50]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x4c]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r7, [sp, #0x48]
	ldrh r0, [r7]
	adds r0, #0x20
	strh r0, [r7]
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r2, [sp, #0x40]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
	ldrsh r1, [r7, r3]
	ldr r7, [sp, #0x44]
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	asrs r0, r0, #8
	subs r0, #0x32
	ldr r1, [r2]
	asrs r1, r1, #8
	mov r2, r8
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	blt _08040256
	b _08040360
_08040256:
	ldr r1, [sp, #0x24]
	adds r1, #0x38
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	str r1, [sp, #0x3c]
	lsls r2, r2, #8
	str r2, [sp, #0x30]
	cmp r0, #0
	bne _08040324
	movs r3, #0
	ldr r7, [sp, #0x24]
	adds r7, #0xa0
	mov sb, r7
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	mov sl, r0
	ldr r7, _080404C4 @ =gPseudoRandom
	ldr r6, _080404C8 @ =0x00196225
	ldr r5, _080404CC @ =0x3C6EF35F
	add r4, sp, #4
	mov r8, r3
_08040284:
	ldr r0, [r7]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r5
	str r2, [r7]
	ldr r0, [sp, #0x4c]
	ldr r1, [r0]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080404D0 @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	movs r1, #0x3f
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r5
	str r2, [r7]
	mov r0, sb
	ldr r1, [r0]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080404D0 @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	movs r1, #0x3f
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x2d
	str r1, [sp, #0x1c]
	mov r0, r8
	strh r0, [r4, #0x1c]
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	str r1, [r7]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xc0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r4, #8]
	mov r1, r8
	strh r1, [r4, #0xa]
	mov r2, r8
	str r2, [sp, #8]
	add r0, sp, #4
	mov r1, sl
	str r3, [sp, #0x58]
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, [sp, #0x58]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bls _08040284
_08040324:
	ldr r3, [sp, #0x3c]
	ldrb r0, [r3]
	cmp r0, #2
	bls _0804033E
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x80
	movs r3, #0x14
	bl CreateScreenShake
_0804033E:
	ldr r7, [sp, #0x44]
	ldr r0, [r7]
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	str r0, [r7]
	ldr r2, [sp, #0x48]
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	ldr r7, [sp, #0x48]
	strh r0, [r7]
_08040360:
	ldr r0, _080404E0 @ =gUnknown_03005590
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0xe
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08040400
	ldr r6, _080404C4 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r5, _080404C8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _080404CC @ =0x3C6EF35F
	adds r2, r2, r4
	str r2, [r6]
	ldr r3, [sp, #0x40]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r3, _080404D0 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0x3f
	mov r8, r0
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, sl
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	str r2, [r6]
	ldr r0, [sp, #0x44]
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x4b
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	str r1, [r6]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_08040400:
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0xd
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0804049E
	ldr r6, _080404C4 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r5, _080404C8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _080404CC @ =0x3C6EF35F
	adds r2, r2, r4
	str r2, [r6]
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r3, _080404D0 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov sb, r1
	movs r0, #0x3f
	mov r8, r0
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, sb
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	ldr r0, [sp, #0x24]
	adds r0, #0xa0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x10
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	str r1, [r6]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_0804049E:
	movs r6, #0
_080404A0:
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x3c
	ldr r1, [sp, #0x24]
	adds r4, r1, r0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080404E4
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	strh r0, [r4, #0xa]
	adds r6, #1
	str r6, [sp, #0x54]
	b _080405A0
	.align 2, 0
_080404C0: .4byte sub_801EC3C
_080404C4: .4byte gPseudoRandom
_080404C8: .4byte 0x00196225
_080404CC: .4byte 0x3C6EF35F
_080404D0: .4byte gCamera
_080404D4: .4byte 0x000001FF
_080404D8: .4byte 0x06012980
_080404DC: .4byte 0x0000026B
_080404E0: .4byte gUnknown_03005590
_080404E4:
	subs r0, #1
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	adds r6, #1
	str r6, [sp, #0x54]
	cmp r0, #0
	bne _080405A0
	movs r3, #0
	ldr r2, [sp, #0x24]
	adds r2, #0x39
	mov sl, r2
	ldr r7, _08040618 @ =gPseudoRandom
	mov sb, r7
	ldr r7, _0804061C @ =0x00196225
	ldr r6, _08040620 @ =0x3C6EF35F
	movs r0, #0x3f
	mov r8, r0
	add r5, sp, #4
_08040508:
	mov r1, sb
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _08040624 @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _08040624 @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #7
	ands r0, r2
	add r0, ip
	subs r1, r0, #3
	str r1, [sp, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x1c]
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r7, r1
	adds r1, r1, r6
	mov r2, sb
	str r1, [r2]
	ldr r0, _08040628 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _0804062C @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _08040630 @ =0x0000026B
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r1, #0
	str r1, [sp, #8]
	add r0, sp, #4
	mov r1, sl
	str r3, [sp, #0x58]
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, [sp, #0x58]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08040508
_080405A0:
	movs r2, #8
	ldrsh r0, [r4, r2]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	movs r3, #0xa
	ldrsh r2, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #4
	asrs r1, r1, #8
	ldr r2, _08040634 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _080405FC
	lsls r1, r2, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r7, #0xa
	ldrsh r1, [r4, r7]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080405FC
	ldr r3, _08040638 @ =0xFFFFFF00
	adds r0, r1, r3
	strh r0, [r4, #8]
_080405FC:
	ldr r7, [sp, #0x54]
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bhi _08040608
	b _080404A0
_08040608:
	add sp, #0x5c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040618: .4byte gPseudoRandom
_0804061C: .4byte 0x00196225
_08040620: .4byte 0x3C6EF35F
_08040624: .4byte gCamera
_08040628: .4byte 0x000001FF
_0804062C: .4byte 0x06012980
_08040630: .4byte 0x0000026B
_08040634: .4byte sub_801EC3C
_08040638: .4byte 0xFFFFFF00

	thumb_func_start sub_804063C
sub_804063C: @ 0x0804063C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r6, _080406C0 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r1, _080406C4 @ =0x00196225
	mov sb, r1
	mov r4, sb
	muls r4, r0, r4
	adds r0, r4, #0
	ldr r1, _080406C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl Mod
	lsls r0, r0, #0x18
	ldr r1, _080406CC @ =gUnknown_03005590
	ldr r4, [r1]
	movs r1, #3
	ands r4, r1
	lsrs r7, r0, #0x18
	asrs r5, r0, #0x18
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, r8
	adds r3, r1, r0
	ldrb r0, [r3, #0x13]
	cmp r0, #0
	beq _08040686
	b _0804078A
_08040686:
	movs r0, #0xf6
	bl m4aSongNumStart
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r5, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r6]
	mov r4, sb
	muls r4, r0, r4
	adds r0, r4, #0
	ldr r1, _080406C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080406F8
	cmp r5, #0
	bne _080406D0
	mov r0, r8
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406D0
	movs r2, #0xc
	b _080406F8
	.align 2, 0
_080406C0: .4byte gPseudoRandom
_080406C4: .4byte 0x00196225
_080406C8: .4byte 0x3C6EF35F
_080406CC: .4byte gUnknown_03005590
_080406D0:
	lsls r0, r7, #0x18
	asrs r1, r0, #0x18
	adds r3, r0, #0
	cmp r1, #1
	bne _080406E8
	mov r0, r8
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406E8
	movs r2, #0xd
	b _080406F8
_080406E8:
	cmp r3, #0
	bne _080406F8
	mov r0, r8
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406F8
	movs r2, #0xe
_080406F8:
	ldr r0, _08040798 @ =gUnknown_080D7ED4
	lsls r1, r2, #0x18
	asrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r5, [r1]
	ldrb r6, [r5]
	adds r5, #1
	lsls r0, r6, #0x18
	movs r4, #0xff
	lsls r4, r4, #0x18
	adds r0, r0, r4
	lsrs r6, r0, #0x18
	cmp r0, #0
	blt _0804078A
	ldr r0, _0804079C @ =gUnknown_080D7E78
	mov sb, r0
	ldr r1, _080407A0 @ =gSineTable
	mov ip, r1
_0804071C:
	ldrb r7, [r5]
	adds r5, #1
	ldrb r4, [r5]
	adds r5, #1
	lsls r0, r4, #0x18
	asrs r0, r0, #0x16
	add r0, sb
	ldr r2, [r0]
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, r8
	adds r3, r1, r0
	movs r0, #1
	strb r0, [r3, #0x13]
	strb r4, [r3, #0x12]
	ldrh r0, [r2, #2]
	strh r0, [r3, #0x10]
	adds r2, #8
	ldrh r0, [r2]
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #0x10]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r2, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3, #8]
	ldrh r0, [r3, #0x10]
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r2, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3, #0xa]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r3, #0xc]
	lsls r0, r6, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r6, r0, #0x18
	cmp r0, #0
	bge _0804071C
_0804078A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040798: .4byte gUnknown_080D7ED4
_0804079C: .4byte gUnknown_080D7E78
_080407A0: .4byte gSineTable

	thumb_func_start sub_80407A4
sub_80407A4: @ 0x080407A4
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	movs r5, #0
	ldr r6, _0804082C @ =gSineTable
_080407AC:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, ip
	adds r2, r1, r0
	ldrb r4, [r2, #0x13]
	cmp r4, #0
	beq _080408AE
	ldr r1, _08040830 @ =gUnknown_080D7E78
	ldrb r0, [r2, #0x12]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrb r0, [r2, #0x13]
	lsls r0, r0, #3
	adds r3, r3, r0
	ldrh r0, [r2, #0xe]
	subs r0, #1
	movs r1, #0
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040838
	ldrh r0, [r3, #2]
	ldrh r4, [r2, #0x10]
	adds r0, r0, r4
	ldr r7, _08040834 @ =0x000003FF
	adds r4, r7, #0
	ands r0, r4
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #0xa]
	ldr r0, [r3]
	cmp r0, #0x20
	bne _0804088C
	ldrh r0, [r3, #4]
	cmp r0, #0
	bne _0804088C
	ldrh r0, [r2, #0xc]
	adds r0, #0x10
	ands r0, r4
	strh r0, [r2, #0xc]
	b _0804088C
	.align 2, 0
_0804082C: .4byte gSineTable
_08040830: .4byte gUnknown_080D7E78
_08040834: .4byte 0x000003FF
_08040838:
	adds r3, #8
	ldrh r0, [r3]
	cmp r0, #0
	bne _0804084C
	strh r0, [r2, #0xe]
	strb r1, [r2, #0x13]
	strb r1, [r2, #0x12]
	strh r0, [r2, #0x10]
	strh r0, [r2, #8]
	b _0804088A
_0804084C:
	adds r0, r4, #1
	strb r0, [r2, #0x13]
	ldrh r0, [r3]
	strh r0, [r2, #0xe]
	ldrh r0, [r3, #2]
	ldrh r1, [r2, #0x10]
	adds r0, r0, r1
	ldr r4, _080408C0 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x10]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
_0804088A:
	strh r0, [r2, #0xa]
_0804088C:
	ldr r0, [r2]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	str r0, [r2]
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	mov r7, ip
	movs r3, #0x30
	ldrsh r0, [r7, r3]
	subs r1, r1, r0
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_080408AE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bhi _080408BA
	b _080407AC
_080408BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080408C0: .4byte 0x000003FF

	thumb_func_start sub_80408C4
sub_80408C4: @ 0x080408C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
_080408CA:
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r4, r6, r0
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	bne _080408DC
	b _080409EC
_080408DC:
	ldr r1, _08040914 @ =gUnknown_080D7E78
	ldrb r0, [r4, #0x12]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0x3c
	beq _080408F4
	b _080409EC
_080408F4:
	ldrh r2, [r1, #4]
	cmp r2, #0
	bne _080409EC
	ldrh r0, [r4, #0xe]
	adds r3, r0, #0
	cmp r3, #0x3c
	bne _08040926
	ldr r0, _08040918 @ =gPlayer
	ldr r1, [r0, #0xc]
	ldr r0, [r4, #4]
	cmp r1, r0
	bge _0804091C
	movs r0, #1
	strb r0, [r4, #0x15]
	b _0804091E
	.align 2, 0
_08040914: .4byte gUnknown_080D7E78
_08040918: .4byte gPlayer
_0804091C:
	strb r2, [r4, #0x15]
_0804091E:
	ldrb r1, [r4, #0x16]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r4, #0x16]
_08040926:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x2f
	bls _08040940
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _0804093A
	ldrb r0, [r4, #0x17]
	subs r0, #1
	b _080409BE
_0804093A:
	ldrb r0, [r4, #0x17]
	adds r0, #1
	b _080409BE
_08040940:
	cmp r0, #0x1e
	bne _080409A0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	beq _080409A0
	ldrb r1, [r4, #0x16]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804098A
	ldr r2, _08040994 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08040998 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804099C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0804098A
	ldr r1, [r4]
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r0, r0, #8
	ldr r2, [r4, #4]
	adds r2, r2, r0
	ldrb r3, [r4, #0x15]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #8
	subs r2, r2, r0
	adds r0, r6, #0
	movs r3, #0x80
	lsls r3, r3, #2
	bl sub_80412F0
_0804098A:
	ldrb r1, [r4, #0x16]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #0x16]
	b _080409C0
	.align 2, 0
_08040994: .4byte gPseudoRandom
_08040998: .4byte 0x00196225
_0804099C: .4byte 0x3C6EF35F
_080409A0:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x11
	bhi _080409C0
	ldrb r1, [r4, #0x17]
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080409EC
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _080409BC
	adds r0, r1, #1
	b _080409BE
_080409BC:
	subs r0, r1, #1
_080409BE:
	strb r0, [r4, #0x17]
_080409C0:
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080409EC
	adds r5, r6, #0
	adds r5, #0x36
	ldrb r0, [r5]
	cmp r0, #0
	bne _080409EC
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8040B30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080409EC
	ldrb r0, [r4, #0x16]
	movs r1, #0x7f
	ands r1, r0
	strb r1, [r4, #0x16]
	movs r0, #0x1e
	strb r0, [r5]
_080409EC:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bhi _080409F8
	b _080408CA
_080409F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8040A00
sub_8040A00: @ 0x08040A00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040A18
	b _08040B16
_08040A18:
	movs r0, #0
	mov r8, r0
	ldr r1, _08040AD8 @ =gPlayer
	mov sb, r1
_08040A20:
	mov r3, r8
	lsls r0, r3, #6
	movs r1, #0xc4
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r3, sl
	adds r6, r3, r0
	mov r1, r8
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r4, r3, r0
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r3, sb
	str r3, [sp]
	adds r0, r6, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #0
	bne _08040B08
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r0, sb
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #2
	bl sub_800CA20
	cmp r0, #0
	bne _08040B08
	mov r3, sb
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r1, r0
	movs r7, #0
	cmp r1, #0
	beq _08040A80
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _08040A80
	movs r7, #1
_08040A80:
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r5, _08040AD8 @ =gPlayer
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08040AE0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _08040AE0
	ldr r0, [r5, #8]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r4, r3]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	adds r1, r1, r0
	str r1, [r5, #0xc]
	cmp r7, #0
	bne _08040B08
	ldr r1, _08040ADC @ =0xFFFFFB00
	adds r0, r1, #0
	ldrh r3, [r5, #0x10]
	adds r0, r0, r3
	strh r0, [r5, #0x10]
	b _08040B08
	.align 2, 0
_08040AD8: .4byte gPlayer
_08040ADC: .4byte 0xFFFFFB00
_08040AE0:
	cmp r7, #0
	beq _08040B08
	ldr r2, _08040B28 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0x20]
	movs r0, #0
	str r0, [r2, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08040B08
	ldr r0, _08040B2C @ =0xFFFFFEFF
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08040B08:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _08040A20
_08040B16:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040B28: .4byte gPlayer
_08040B2C: .4byte 0xFFFFFEFF

	thumb_func_start sub_8040B30
sub_8040B30: @ 0x08040B30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r6, #0
	cmp r1, #3
	bhi _08040B62
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r7, r2, r0
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	beq _08040B62
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040B66
_08040B62:
	movs r0, #0
	b _08040D62
_08040B66:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r0, r2
	mov sb, r0
	ldr r2, [r7]
	lsls r2, r2, #8
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r0, r2, #0x10
	str r0, [sp, #0x44]
	asrs r4, r2, #0x10
	lsrs r2, r1, #0x10
	mov sl, r2
	asrs r5, r1, #0x10
	ldr r0, _08040C38 @ =gPlayer
	str r0, [sp]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08040C64
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	movs r1, #0xff
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040C5C
	ldr r1, _08040C3C @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	str r0, [sp, #0x1c]
	add r0, sp, #4
	strh r6, [r0, #0x1c]
	adds r1, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08040C40 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _08040C44 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r6, [r0, #0xa]
	str r6, [sp, #8]
	adds r1, r7, #0
	adds r1, #0x16
	bl CreateBossParticleWithExplosionUpdate
	ldr r1, _08040C48 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040C4C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040C2E
	ldr r0, _08040C50 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040C2E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040C54 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040C26
	mov r0, r8
_08040C26:
	strb r0, [r1]
	ldr r1, _08040C58 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08040C2E:
	movs r0, #0x90
	bl m4aSongNumStart
	b _08040C62
	.align 2, 0
_08040C38: .4byte gPlayer
_08040C3C: .4byte gCamera
_08040C40: .4byte 0x06012980
_08040C44: .4byte 0x0000026B
_08040C48: .4byte gLevelScore
_08040C4C: .4byte 0x0000C350
_08040C50: .4byte gGameMode
_08040C54: .4byte gNumLives
_08040C58: .4byte gUnknown_030054A8
_08040C5C:
	movs r0, #0x8f
	bl m4aSongNumStart
_08040C62:
	movs r6, #1
_08040C64:
	ldr r1, [sp, #0x44]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #8
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r5, r1, #0x10
	lsls r1, r5, #8
	bl sub_80122DC
	ldr r0, _08040D30 @ =gPlayer
	str r0, [sp]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _08040D60
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	movs r1, #0xff
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08040D58
	add r0, sp, #0x24
	ldr r2, _08040D34 @ =gCamera
	ldr r1, [r2]
	subs r1, r4, r1
	str r1, [r0, #0x14]
	ldr r1, [r2, #4]
	subs r1, r5, r1
	str r1, [r0, #0x18]
	strh r3, [r0, #0x1c]
	movs r1, #0xf0
	lsls r1, r1, #2
	strh r1, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #3
	strh r1, [r0, #0xe]
	ldr r1, _08040D38 @ =0x06012980
	str r1, [sp, #0x24]
	ldr r1, _08040D3C @ =0x0000026B
	strh r1, [r0, #8]
	strh r3, [r0, #0xa]
	str r3, [r0, #4]
	adds r1, r7, #0
	adds r1, #0x16
	bl CreateBossParticleWithExplosionUpdate
	ldr r1, _08040D40 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040D44 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040D1A
	ldr r0, _08040D48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040D1A
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040D4C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040D12
	mov r0, r8
_08040D12:
	strb r0, [r1]
	ldr r1, _08040D50 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08040D1A:
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r0, _08040D30 @ =gPlayer
	bl sub_800CB18
	ldr r0, _08040D54 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
	b _08040D5E
	.align 2, 0
_08040D30: .4byte gPlayer
_08040D34: .4byte gCamera
_08040D38: .4byte 0x06012980
_08040D3C: .4byte 0x0000026B
_08040D40: .4byte gLevelScore
_08040D44: .4byte 0x0000C350
_08040D48: .4byte gGameMode
_08040D4C: .4byte gNumLives
_08040D50: .4byte gUnknown_030054A8
_08040D54: .4byte gUnknown_03005498
_08040D58:
	movs r0, #0x8f
	bl m4aSongNumStart
_08040D5E:
	movs r6, #1
_08040D60:
	adds r0, r6, #0
_08040D62:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8040D74
sub_8040D74: @ 0x08040D74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r7, r4, r0
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040E62
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	beq _08040E48
	subs r0, r1, #1
	mov r1, r8
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08040DAE
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08040DB4
_08040DAE:
	movs r0, #0xeb
	bl m4aSongNumStart
_08040DB4:
	adds r0, r4, #0
	adds r0, #0x35
	movs r1, #0x1e
	strb r1, [r0]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08040E34
	ldr r0, _08040E1C @ =0x00000275
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08040E20 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040E24 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040E40
	ldr r0, _08040E28 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040E40
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040E2C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040E12
	movs r0, #0xff
_08040E12:
	strb r0, [r1]
	ldr r1, _08040E30 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _08040E40
	.align 2, 0
_08040E1C: .4byte 0x00000275
_08040E20: .4byte gLevelScore
_08040E24: .4byte 0x0000C350
_08040E28: .4byte gGameMode
_08040E2C: .4byte gNumLives
_08040E30: .4byte gUnknown_030054A8
_08040E34:
	ldr r0, _08040E6C @ =0x00000275
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_08040E40:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08040E48:
	ldr r0, _08040E70 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08040E62
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #4
	bne _08040E62
	ldr r1, _08040E74 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08040E62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040E6C: .4byte 0x00000275
_08040E70: .4byte gCurrentLevel
_08040E74: .4byte gUnknown_030054A8

	thumb_func_start sub_8040E78
sub_8040E78: @ 0x08040E78
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r4, r3, r0
	adds r2, r3, #0
	adds r2, #0x35
	ldrb r0, [r2]
	cmp r0, #0
	beq _08040ED8
	adds r1, r3, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040F06
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040EBC
	ldr r0, _08040EB8 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r2, #0xb2
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _08040EC8
	.align 2, 0
_08040EB8: .4byte 0x00000275
_08040EBC:
	movs r0, #0
	ldr r1, _08040ED4 @ =0x00000275
	strh r1, [r4, #0xa]
	movs r2, #0xb2
	lsls r2, r2, #2
	adds r1, r3, r2
_08040EC8:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _08040F04
	.align 2, 0
_08040ED4: .4byte 0x00000275
_08040ED8:
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040F06
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040F06
	movs r1, #0
	ldr r0, _08040F0C @ =0x00000275
	strh r0, [r4, #0xa]
	movs r4, #0xb2
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _08040F10 @ =0x000002C9
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_08040F04:
	strb r0, [r1]
_08040F06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040F0C: .4byte 0x00000275
_08040F10: .4byte 0x000002C9

	thumb_func_start sub_8040F14
sub_8040F14: @ 0x08040F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040F70
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x36
	ldr r0, _08040F60 @ =gFlags
	mov r8, r0
	ldr r1, _08040F64 @ =gObjPalette
	mov ip, r1
	ldr r7, _08040F68 @ =gUnknown_080D7F14
	ldr r6, _08040F6C @ =gUnknown_03005590
	movs r5, #2
_08040F38:
	adds r2, r3, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r3, #1
	ldr r0, [r6]
	ands r0, r5
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040F38
	b _08040F98
	.align 2, 0
_08040F60: .4byte gFlags
_08040F64: .4byte gObjPalette
_08040F68: .4byte gUnknown_080D7F14
_08040F6C: .4byte gUnknown_03005590
_08040F70:
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x36
	ldr r0, _08040FD4 @ =gFlags
	mov r8, r0
	ldr r5, _08040FD8 @ =gObjPalette
	ldr r2, _08040FDC @ =gUnknown_080D7F34
_08040F7E:
	adds r1, r3, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040F7E
_08040F98:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08040FE8
	subs r0, #1
	strb r0, [r4]
	movs r3, #0
	ldr r7, _08040FD8 @ =gObjPalette
	ldr r6, _08040FE0 @ =gUnknown_080D7F14
	ldr r5, _08040FE4 @ =gUnknown_03005590
	movs r4, #2
_08040FAC:
	adds r2, r3, #0
	adds r2, #0xb0
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r1, r3, #1
	ldr r0, [r5]
	ands r0, r4
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040FAC
	b _08041008
	.align 2, 0
_08040FD4: .4byte gFlags
_08040FD8: .4byte gObjPalette
_08040FDC: .4byte gUnknown_080D7F34
_08040FE0: .4byte gUnknown_080D7F14
_08040FE4: .4byte gUnknown_03005590
_08040FE8:
	movs r3, #0
	ldr r4, _08041020 @ =gObjPalette
	ldr r2, _08041024 @ =gUnknown_080D7F34
_08040FEE:
	adds r1, r3, #0
	adds r1, #0xb0
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040FEE
_08041008:
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041020: .4byte gObjPalette
_08041024: .4byte gUnknown_080D7F34

	thumb_func_start TaskDestructor_EggTotemMain
TaskDestructor_EggTotemMain: @ 0x08041028
	push {r4, r5, r6, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _080410D4 @ =IWRAM_START + 0xC4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	movs r5, #0
	ldr r0, _080410D8 @ =IWRAM_START + 0xFC
	adds r4, r4, r0
_08041042:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041042
	movs r5, #0
	movs r1, #0xc6
	lsls r1, r1, #1
	adds r4, r6, r1
_08041062:
	lsls r0, r5, #6
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041062
	movs r1, #0x93
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xe6
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc3
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080410B6
	bl VramFree
_080410B6:
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080410C6
	bl VramFree
_080410C6:
	ldr r1, _080410DC @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080410D4: .4byte IWRAM_START + 0xC4
_080410D8: .4byte IWRAM_START + 0xFC
_080410DC: .4byte gActiveBossTask

	thumb_func_start Task_EggTotemMain
Task_EggTotemMain: @ 0x080410E0
	push {r4, r5, r6, lr}
	ldr r6, _0804112C @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0xf4
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [r4]
	adds r0, r4, #0
	bl sub_803FB88
	adds r0, r4, #0
	bl sub_8041264
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F698
	ldr r0, _08041130 @ =IWRAM_START + 0xB4
	adds r5, r5, r0
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
	cmp r0, #0
	bne _08041124
	ldr r1, [r6]
	ldr r0, _08041134 @ =sub_803F3E8
	str r0, [r1, #8]
_08041124:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804112C: .4byte gCurTask
_08041130: .4byte IWRAM_START + 0xB4
_08041134: .4byte sub_803F3E8

	thumb_func_start Task_8041138
Task_8041138: @ 0x08041138
	push {r4, r5, lr}
	ldr r0, _080411AC @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r0, _080411B0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0804115A
	movs r0, #0x90
	bl m4aSongNumStart
_0804115A:
	ldr r1, _080411B4 @ =IWRAM_START + 0x2DC
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08041184
	ldr r2, _080411B8 @ =IWRAM_START + 0xB8
	adds r0, r4, r2
	ldr r1, [r0]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r1, r3
	str r1, [r0]
	ldr r0, _080411BC @ =IWRAM_START + 0xBC
	adds r2, r4, r0
	ldr r1, [r2]
	ldr r0, _080411C0 @ =0xFFFFD000
	cmp r1, r0
	ble _08041184
	ldr r3, _080411C4 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_08041184:
	adds r0, r5, #0
	bl sub_803FC14
	adds r0, r5, #0
	bl sub_8040E78
	adds r0, r5, #0
	bl sub_803F878
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080411A4
	ldr r0, _080411AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080411C8 @ =sub_80411CC
	str r0, [r1, #8]
_080411A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080411AC: .4byte gCurTask
_080411B0: .4byte gUnknown_03005590
_080411B4: .4byte IWRAM_START + 0x2DC
_080411B8: .4byte IWRAM_START + 0xB8
_080411BC: .4byte IWRAM_START + 0xBC
_080411C0: .4byte 0xFFFFD000
_080411C4: .4byte 0xFFFFFD00
_080411C8: .4byte sub_80411CC

	thumb_func_start sub_80411CC
sub_80411CC: @ 0x080411CC
	push {r4, r5, r6, lr}
	ldr r6, _08041228 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0804122C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _080411EE
	movs r0, #0x90
	bl m4aSongNumStart
_080411EE:
	adds r0, r4, #0
	bl sub_803FF44
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F878
	ldr r1, _08041230 @ =IWRAM_START + 0xD6
	adds r0, r5, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xc8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08041220
	adds r0, #0xa0
	movs r1, #0x96
	movs r2, #2
	bl sub_802EF68
	ldr r1, [r6]
	ldr r0, _08041234 @ =sub_8041238
	str r0, [r1, #8]
_08041220:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041228: .4byte gCurTask
_0804122C: .4byte gUnknown_03005590
_08041230: .4byte IWRAM_START + 0xD6
_08041234: .4byte sub_8041238

	thumb_func_start sub_8041238
sub_8041238: @ 0x08041238
	push {lr}
	ldr r0, _08041248 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08041248: .4byte gCurTask

	thumb_func_start sub_804124C
sub_804124C: @ 0x0804124C
	movs r1, #8
	ldrsh r2, [r0, r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	movs r1, #0xa
	ldrsh r2, [r0, r1]
	ldr r1, [r0, #4]
	adds r1, r1, r2
	str r1, [r0, #4]
	bx lr
	.align 2, 0

	thumb_func_start sub_8041264
sub_8041264: @ 0x08041264
	push {r4, r5, lr}
	mov ip, r0
	movs r4, #0
	ldr r5, _080412B0 @ =gUnknown_080D7BE2
_0804126C:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r3, r0, #2
	mov r1, ip
	adds r0, r1, r3
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804129E
	mov r0, ip
	adds r0, #0x3c
	adds r0, r0, r3
	ldr r1, [r1]
	str r1, [r0]
	mov r2, ip
	adds r2, #0x40
	adds r2, r2, r3
	lsls r0, r4, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r3, ip
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r2]
_0804129E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804126C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080412B0: .4byte gUnknown_080D7BE2

	thumb_func_start sub_80412B4
sub_80412B4: @ 0x080412B4
	push {lr}
	adds r2, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r3, r2, r0
	adds r0, r2, #0
	adds r0, #0x34
	movs r1, #0x1e
	strb r1, [r0]
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080412E2
	ldr r0, _080412E8 @ =0x00000275
	strh r0, [r3, #0xa]
	adds r0, #0x53
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080412EC @ =0x000002C9
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_080412E2:
	pop {r0}
	bx r0
	.align 2, 0
_080412E8: .4byte 0x00000275
_080412EC: .4byte 0x000002C9

	thumb_func_start sub_80412F0
sub_80412F0: @ 0x080412F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _080413FC @ =sub_8041420
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r7, #0
	str r7, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r1, _08041400 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	subs r0, r6, r0
	str r0, [r4]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, r8
	subs r0, r1, r0
	str r0, [r4, #4]
	ldr r1, _08041404 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r2, r8
	asrs r2, r2, #8
	mov r8, r2
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	asrs r6, r6, #8
	str r6, [sp, #4]
	subs r1, r1, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08041408 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r6, #0
	ldrsh r1, [r1, r6]
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	asrs r1, r1, #0xe
	movs r3, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	adds r1, r1, r6
	strh r1, [r4, #8]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0xa]
	mov r6, sl
	str r6, [r4, #0xc]
	ldr r0, _0804140C @ =IWRAM_START + 0x10
	adds r1, r5, r0
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r1, #0x16]
	mov r6, r8
	strh r6, [r1, #0x18]
	movs r0, #0xe6
	lsls r0, r0, #2
	add sl, r0
	mov r2, sl
	ldr r0, [r2]
	str r0, [r1, #4]
	ldr r0, _08041410 @ =0x00000292
	strh r0, [r1, #0xa]
	ldr r6, _08041414 @ =IWRAM_START + 0x30
	adds r0, r5, r6
	strb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r7, [r1, #8]
	strh r7, [r1, #0x14]
	strh r7, [r1, #0x1c]
	ldr r0, _08041418 @ =IWRAM_START + 0x31
	adds r2, r5, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r6, #2
	adds r2, r5, r6
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0804141C @ =IWRAM_START + 0x35
	adds r5, r5, r0
	strb r3, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080413FC: .4byte sub_8041420
_08041400: .4byte gCamera
_08041404: .4byte gPlayer
_08041408: .4byte gSineTable
_0804140C: .4byte IWRAM_START + 0x10
_08041410: .4byte 0x00000292
_08041414: .4byte IWRAM_START + 0x30
_08041418: .4byte IWRAM_START + 0x31
_0804141C: .4byte IWRAM_START + 0x35

	thumb_func_start sub_8041420
sub_8041420: @ 0x08041420
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08041458 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x10
	adds r6, r1, r0
	ldr r2, _0804145C @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov ip, r2
	cmp r1, #0
	beq _08041464
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r7, _08041460 @ =0xFFFFFB00
	adds r0, r0, r7
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08041480
	.align 2, 0
_08041458: .4byte gCurTask
_0804145C: .4byte gPlayer
_08041460: .4byte 0xFFFFFB00
_08041464:
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r2, _080414E8 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r7, #0xa
	ldrsh r1, [r4, r7]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_08041480:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	strh r1, [r6, #0x18]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r2, r5
	bge _080414A6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	blt _080414E0
_080414A6:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r2, r0
	ble _080414B6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414B6:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, r5
	bge _080414C6
	movs r5, #0xa
	ldrsh r0, [r4, r5]
	cmp r0, #0
	blt _080414E0
_080414C6:
	cmp r1, #0xc0
	ble _080414D2
	movs r7, #0xa
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414D2:
	ldr r0, _080414EC @ =0xFFFFFE00
	cmp r2, r0
	blt _080414E0
	movs r0, #0xbc
	lsls r0, r0, #2
	cmp r2, r0
	ble _080414F0
_080414E0:
	ldr r0, [r3]
	bl TaskDestroy
	b _08041558
	.align 2, 0
_080414E8: .4byte gCamera
_080414EC: .4byte 0xFFFFFE00
_080414F0:
	ldr r0, [r4, #0xc]
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804154C
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r3, _08041560 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	mov r0, ip
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r5, r0, #0
	cmp r5, #1
	bne _0804154C
	ldr r3, [r4, #0xc]
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804154C
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r2, r3, r1
	adds r1, r3, #0
	adds r1, #0x34
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08041564 @ =0x00000275
	strh r0, [r2, #0xa]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r0, r3, r7
	strb r5, [r0]
	ldr r0, _08041568 @ =0x000002C9
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
_0804154C:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl sub_80051E8
_08041558:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041560: .4byte gCamera
_08041564: .4byte 0x00000275
_08041568: .4byte 0x000002C9
