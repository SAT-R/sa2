.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

 	.global gUnknown_080D88F0
gUnknown_080D88F0:
    .incbin "baserom.gba", 0x000D88F0, 0x28

    .global gUnknown_080D8918
gUnknown_080D8918:
    .incbin "baserom.gba", 0x000D8918, 0x8D

    .global gUnknown_080D89A5
gUnknown_080D89A5:
    .incbin "baserom.gba", 0x000D89A5, 0x7

    .global gUnknown_080D89AC
gUnknown_080D89AC:
    .incbin "baserom.gba", 0x000D89AC, 0x1C

    .global gUnknown_080D89C8
gUnknown_080D89C8:
    .incbin "baserom.gba", 0x000D89C8, 0x54

    .global gUnknown_080D8A1C
gUnknown_080D8A1C:
    .incbin "baserom.gba", 0x000D8A1C, 0x18

    .global gUnknown_080D8A34
gUnknown_080D8A34:
    .incbin "baserom.gba", 0x000D8A34, 0x18

    .global gUnknown_080D8A4C
gUnknown_080D8A4C:
    .incbin "baserom.gba", 0x000D8A4C, 0x18

    .global gUnknown_080D8A64
gUnknown_080D8A64:
    .incbin "baserom.gba", 0x000D8A64, 0x18

    .global gUnknown_080D8A7C
gUnknown_080D8A7C:
    .incbin "baserom.gba", 0x000D8A7C, 0x18

    .global gUnknown_080D8A94
gUnknown_080D8A94:
    .incbin "baserom.gba", 0x000D8A94, 0x18

    .global gUnknown_080D8AAC
gUnknown_080D8AAC:
    .incbin "baserom.gba", 0x000D8AAC, 0x18

    .global gUnknown_080D8AC4
gUnknown_080D8AC4:
    .incbin "baserom.gba", 0x000D8AC4, 0x18

    .global gUnknown_080D8ADC
gUnknown_080D8ADC:
    .incbin "baserom.gba", 0x000D8ADC, 0x18

    .global gUnknown_080D8AF4
gUnknown_080D8AF4:
    .incbin "baserom.gba", 0x000D8AF4, 0x158

    .global gUnknown_080D8C4C
gUnknown_080D8C4C:
    .incbin "baserom.gba", 0x000D8C4C, 0x18

    .global gUnknown_080D8C64
gUnknown_080D8C64:
    .incbin "baserom.gba", 0x000D8C64, 0x18

    .global gUnknown_080D8C7C
gUnknown_080D8C7C:
    .incbin "baserom.gba", 0x000D8C7C, 0x18

    .global gUnknown_080D8C94
gUnknown_080D8C94:
    .incbin "baserom.gba", 0x000D8C94, 0xD8

    .global gUnknown_080D8D6C
gUnknown_080D8D6C:
    .incbin "baserom.gba", 0x000D8D6C, 0x60

    .global gUnknown_080D8DCC
gUnknown_080D8DCC:
    .incbin "baserom.gba", 0x000D8DCC, 0x48

    .global gUnknown_080D8E14
gUnknown_080D8E14:
    .incbin "baserom.gba", 0x000D8E14, 0xC

    .global gUnknown_080D8E20
gUnknown_080D8E20:
    .incbin "baserom.gba", 0x000D8E20, 0x2

    .global gUnknown_080D8E22
gUnknown_080D8E22:
    .incbin "baserom.gba", 0x000D8E22, 0xBE

    .global gUnknown_080D8EE0
gUnknown_080D8EE0:
    .incbin "baserom.gba", 0x000D8EE0, 0x10

    .global gUnknown_080D8EF0
gUnknown_080D8EF0:
    .incbin "baserom.gba", 0x000D8EF0, 0x20

    .global gUnknown_080D8F10
gUnknown_080D8F10:
    .incbin "baserom.gba", 0x000D8F10, 0x20

.text
.syntax unified
.arm

@; CreateTrueArea53IntroBoss - Used when Vanilla gets captured
	thumb_func_start SetupEggmanKidnapsVanillaTask
SetupEggmanKidnapsVanillaTask: @ 0x0804CD50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0804CE7C @ =Task_EggmanKidnapsVanilla
	movs r1, #0x94
	lsls r1, r1, #4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0804CE80 @ =TaskDestructor_TrueArea53BossGfx
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r4, _0804CE84 @ =gActiveBossTask
	str r0, [r4]
	bl CreateTrueArea53Boss
	ldr r0, [r4]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, _0804CE88 @ =IWRAM_START + 0x1C
	adds r3, r2, r0
	ldr r7, _0804CE8C @ =IWRAM_START + 0x48
	adds r4, r2, r7
	movs r0, #0x8c
	lsls r0, r0, #2
	strh r0, [r1, #0x12]
	ldr r0, [r4, #0x30]
	ldr r1, _0804CE90 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r1, _0804CE94 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x30]
	str r0, [r4]
	ldr r0, [r1, #0x34]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #0x38]
	strh r0, [r4, #0x2e]
	movs r0, #0xa5
	lsls r0, r0, #9
	str r0, [r3, #0x24]
	movs r0, #0xb4
	lsls r0, r0, #7
	str r0, [r3, #0x28]
	ldr r0, _0804CE98 @ =gUnknown_080D8DCC
	ldrh r0, [r0, #0x38]
	strh r0, [r3, #0x14]
	movs r3, #0
	ldr r0, _0804CE9C @ =IWRAM_START + 0x20
	adds r6, r2, r0
	ldr r1, _0804CEA0 @ =gUnknown_080D8C7C
	mov ip, r1
	subs r7, #0x20
	adds r5, r2, r7
	ldr r0, _0804CEA4 @ =gUnknown_080D8C94
	mov r8, r0
_0804CDCA:
	lsls r1, r3, #1
	adds r2, r6, r1
	mov r7, ip
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r5, r1
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0804CDCA
	ldr r0, [r4, #0x30]
	ldr r1, _0804CE90 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r0, _0804CE94 @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x3c]
	str r1, [r4]
	ldr r1, [r0, #0x40]
	str r1, [r4, #0x34]
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	movs r3, #0
	adds r0, r4, #4
	mov ip, r0
	adds r1, r4, #0
	adds r1, #0xc
	str r1, [sp, #4]
	adds r6, r4, #0
	adds r6, #0x14
	ldr r7, _0804CEA8 @ =gUnknown_080D8AC4
	mov sl, r7
	adds r5, r4, #0
	adds r5, #0x1c
	ldr r0, _0804CEAC @ =gUnknown_080D8ADC
	mov sb, r0
	adds r4, #0x24
	ldr r1, _0804CEB0 @ =gUnknown_080D8AF4
	mov r8, r1
_0804CE24:
	lsls r1, r3, #1
	mov r7, ip
	adds r2, r7, r1
	ldr r7, _0804CEB4 @ =gUnknown_080D8A94
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, [sp, #4]
	adds r2, r0, r1
	ldr r7, _0804CEB8 @ =gUnknown_080D8AAC
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r6, r1
	mov r7, sl
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r5, r1
	mov r7, sb
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r4, r1
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0804CE24
	ldr r1, _0804CEBC @ =0x00001341
	adds r0, r1, #0
	ldr r7, _0804CEC0 @ =gDispCnt
	strh r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE7C: .4byte Task_EggmanKidnapsVanilla
_0804CE80: .4byte TaskDestructor_TrueArea53BossGfx
_0804CE84: .4byte gActiveBossTask
_0804CE88: .4byte IWRAM_START + 0x1C
_0804CE8C: .4byte IWRAM_START + 0x48
_0804CE90: .4byte 0x00000FFF
_0804CE94: .4byte gUnknown_080D8D6C
_0804CE98: .4byte gUnknown_080D8DCC
_0804CE9C: .4byte IWRAM_START + 0x20
_0804CEA0: .4byte gUnknown_080D8C7C
_0804CEA4: .4byte gUnknown_080D8C94
_0804CEA8: .4byte gUnknown_080D8AC4
_0804CEAC: .4byte gUnknown_080D8ADC
_0804CEB0: .4byte gUnknown_080D8AF4
_0804CEB4: .4byte gUnknown_080D8A94
_0804CEB8: .4byte gUnknown_080D8AAC
_0804CEBC: .4byte 0x00001341
_0804CEC0: .4byte gDispCnt

	thumb_func_start CreateTrueArea53Boss
CreateTrueArea53Boss: @ 0x0804CEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc8
	ldr r2, _0804D2A8 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	ldr r4, _0804D2AC @ =gActiveBossTask
	ldr r0, [r4]
	cmp r0, #0
	bne _0804CEF8
	ldr r0, _0804D2B0 @ =sub_804D7A0
	movs r1, #0x94
	lsls r1, r1, #4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0804D2B4 @ =TaskDestructor_TrueArea53BossGfx
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
_0804CEF8:
	ldr r0, [r4]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	str r0, [sp, #4]
	ldr r0, _0804D2B8 @ =IWRAM_START + 0x1C
	adds r2, r4, r0
	ldr r1, _0804D2BC @ =IWRAM_START + 0x48
	adds r6, r4, r1
	ldr r5, _0804D2C0 @ =IWRAM_START + 0x98
	adds r5, r4, r5
	str r5, [sp, #8]
	ldr r7, _0804D2C4 @ =IWRAM_START + 0x558
	adds r7, r7, r4
	mov r8, r7
	ldr r0, _0804D2C8 @ =IWRAM_START + 0x594
	adds r7, r4, r0
	ldr r1, _0804D2CC @ =IWRAM_START + 0x654
	adds r1, r4, r1
	str r1, [sp, #0xc]
	movs r3, #0
	movs r0, #0xc
	ldr r5, [sp, #4]
	strb r0, [r5, #0xc]
	strb r3, [r5, #0xd]
	movs r1, #0
	movs r0, #1
	mov sb, r0
	mov r0, sb
	strh r0, [r5, #0x10]
	movs r0, #0x50
	strh r0, [r5, #0x12]
	strb r1, [r5, #0xe]
	strb r1, [r5, #0xf]
	str r3, [r5, #0x14]
	str r3, [r5, #0x18]
	strh r3, [r5]
	strh r3, [r5, #4]
	mov r0, sb
	strh r0, [r5, #2]
	movs r0, #0x14
	strh r0, [r5, #6]
	movs r0, #0xbf
	strh r0, [r5, #8]
	strh r3, [r5, #0xa]
	ldr r0, _0804D2D0 @ =sub_8050DC8
	mov r5, r8
	str r0, [r5]
	movs r0, #0xc8
	strh r0, [r5, #6]
	strb r1, [r5, #4]
	ldr r0, [r2, #0x18]
	ldr r1, _0804D2D4 @ =0x00000FFF
	ands r0, r1
	str r0, [r2, #0x18]
	ldr r1, _0804D2D8 @ =gUnknown_080D8DCC
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, #4]
	str r0, [r2, #0x1c]
	ldrh r1, [r1, #8]
	strh r1, [r2, #0x16]
	ldr r0, _0804D2DC @ =0x0004F300
	str r0, [r2, #0x24]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [r2, #0x28]
	strh r3, [r2, #0x20]
	strh r3, [r2, #0x22]
	strh r1, [r2, #0x14]
	str r3, [r2, #0x18]
	movs r0, #0
	mov ip, r0
	ldr r3, _0804D2E0 @ =gUnknown_080D8D6C
	ldr r2, _0804D2E4 @ =gUnknown_080D8C64
	ldr r1, _0804D2E8 @ =gUnknown_080D8C4C
	ldr r5, _0804D2EC @ =IWRAM_START + 0x20
	adds r4, r4, r5
_0804CF96:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r2]
	strh r0, [r4, #8]
	adds r2, #2
	adds r1, #2
	adds r4, #2
	movs r0, #1
	add ip, r0
	mov r5, ip
	cmp r5, #3
	bls _0804CF96
	ldr r0, [r6, #0x30]
	ldr r1, _0804D2D4 @ =0x00000FFF
	ands r0, r1
	str r0, [r6, #0x30]
	ldr r0, [r3, #0xc]
	str r0, [r6]
	ldr r0, [r3, #0x10]
	str r0, [r6, #0x34]
	ldrh r0, [r3, #0x14]
	movs r1, #0
	strh r0, [r6, #0x2e]
	adds r2, r6, #0
	adds r2, #0x4c
	movs r0, #1
	strb r0, [r2]
	strh r1, [r6, #0x38]
	str r1, [r6, #0x44]
	str r1, [r6, #0x48]
	ldrh r0, [r3, #8]
	strh r0, [r6, #0x2c]
	str r1, [r6, #0x30]
	mov ip, r1
	adds r0, r6, #4
	mov sl, r0
	movs r1, #0xc
	adds r1, r1, r6
	mov sb, r1
	adds r5, r6, #0
	adds r5, #0x14
	adds r3, r6, #0
	adds r3, #0x1c
	adds r4, r6, #0
	adds r4, #0x24
	adds r2, r7, #4
	str r2, [sp, #0x1c]
	adds r6, r7, #0
	adds r6, #0xe
	str r6, [sp, #0x34]
	adds r0, r7, #0
	adds r0, #0x18
	str r0, [sp, #0x3c]
	adds r1, r7, #0
	adds r1, #0x1a
	str r1, [sp, #0x40]
	adds r2, #0x3c
	str r2, [sp, #0x60]
	adds r6, #0x36
	str r6, [sp, #0xc0]
	ldr r0, [sp, #0xc]
	adds r0, #0xe
	str r0, [sp, #0x38]
	ldr r1, [sp, #0xc]
	adds r1, #0x1e
	str r1, [sp, #0x44]
	ldr r2, [sp, #0xc]
	adds r2, #0x2e
	str r2, [sp, #0x54]
	ldr r6, [sp, #0xc]
	adds r6, #0x30
	str r6, [sp, #0x5c]
	ldr r0, [sp, #0xc]
	adds r0, #0x70
	str r0, [sp, #0x74]
	ldr r1, [sp, #0xc]
	adds r1, #0x74
	str r1, [sp, #0x78]
	ldr r6, _0804D2F0 @ =0x000007D4
	ldr r2, [sp, #4]
	adds r6, r2, r6
	str r6, [sp, #0x7c]
	ldr r0, _0804D2F4 @ =0x000007D5
	adds r0, r2, r0
	str r0, [sp, #0x80]
	ldr r1, _0804D2F8 @ =0x000007D6
	adds r1, r2, r1
	str r1, [sp, #0x88]
	ldr r6, _0804D2FC @ =0x000007D9
	adds r6, r2, r6
	str r6, [sp, #0x8c]
	mov r0, r8
	adds r0, #0xc
	str r0, [sp, #0x2c]
	mov r1, r8
	adds r1, #0x2c
	str r1, [sp, #0x48]
	mov r2, r8
	adds r2, #0x2d
	str r2, [sp, #0x4c]
	mov r6, r8
	adds r6, #0x2e
	str r6, [sp, #0x50]
	adds r0, #0x25
	str r0, [sp, #0x58]
	adds r1, r7, #0
	adds r1, #0x90
	str r1, [sp, #0x84]
	adds r2, r7, #0
	adds r2, #0xb0
	str r2, [sp, #0x90]
	adds r6, r7, #0
	adds r6, #0xb1
	str r6, [sp, #0x94]
	adds r0, r7, #0
	adds r0, #0xb2
	str r0, [sp, #0x98]
	adds r1, #0x25
	str r1, [sp, #0x9c]
	ldr r2, [sp, #0xc]
	adds r2, #0xf0
	str r2, [sp, #0xa0]
	movs r0, #0x88
	lsls r0, r0, #1
	ldr r6, [sp, #0xc]
	adds r0, r6, r0
	str r0, [sp, #0x20]
	ldr r1, _0804D300 @ =0x00000111
	adds r1, r6, r1
	str r1, [sp, #0x24]
	movs r2, #0x89
	lsls r2, r2, #1
	adds r2, r6, r2
	str r2, [sp, #0x28]
	ldr r0, _0804D304 @ =0x00000115
	adds r0, r6, r0
	str r0, [sp, #0x30]
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r1, r6, r1
	str r1, [sp, #0x64]
	ldr r2, _0804D308 @ =0x00000149
	adds r2, r6, r2
	str r2, [sp, #0x68]
	movs r0, #0xa5
	lsls r0, r0, #1
	adds r0, r6, r0
	str r0, [sp, #0x6c]
	ldr r1, _0804D30C @ =0x0000014D
	adds r1, r6, r1
	str r1, [sp, #0x70]
_0804D0C4:
	mov r2, ip
	lsls r1, r2, #1
	mov r6, sl
	adds r2, r6, r1
	ldr r6, _0804D310 @ =gUnknown_080D8A1C
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	mov r0, sb
	adds r2, r0, r1
	ldr r6, _0804D314 @ =gUnknown_080D8A34
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r5, r1
	ldr r6, _0804D318 @ =gUnknown_080D8A4C
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r3, r1
	ldr r6, _0804D31C @ =gUnknown_080D8A64
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r4, r1
	ldr r0, _0804D320 @ =gUnknown_080D8A7C
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #3
	bls _0804D0C4
	ldr r5, _0804D324 @ =sub_804DFB0
	str r5, [r7]
	movs r6, #0
	mov sb, r6
	ldr r5, [sp, #0x1c]
	movs r2, #0
	ldr r4, [sp, #0x34]
	ldr r3, [sp, #0x3c]
_0804D118:
	mov r7, sb
	adds r0, r5, r7
	strb r2, [r0]
	adds r0, r4, r7
	strb r2, [r0]
	lsls r0, r7, #2
	strh r2, [r3]
	ldr r1, [sp, #0x40]
	adds r0, r1, r0
	strh r2, [r0]
	lsls r1, r7, #3
	ldr r6, [sp, #0x60]
	adds r0, r6, r1
	str r2, [r0]
	ldr r7, [sp, #0xc0]
	adds r1, r7, r1
	str r2, [r1]
	adds r3, #4
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #9
	bls _0804D118
	ldr r2, _0804D328 @ =sub_804FF9C
	ldr r5, [sp, #0xc]
	str r2, [r5]
	ldr r6, _0804D32C @ =sub_804F768
	str r6, [r5, #4]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #8]
	adds r0, #0xd4
	strh r0, [r5, #0xa]
	movs r7, #0
	mov sb, r7
	ldr r5, [sp, #0x38]
	movs r2, #0
	ldr r4, [sp, #0x44]
	ldr r3, [sp, #0x54]
_0804D166:
	mov r1, sb
	adds r0, r5, r1
	strb r2, [r0]
	adds r0, r4, r1
	strb r2, [r0]
	lsls r0, r1, #2
	strh r2, [r3]
	ldr r6, [sp, #0x5c]
	adds r0, r6, r0
	strh r2, [r0]
	lsls r1, r1, #3
	ldr r7, [sp, #0x74]
	adds r0, r7, r1
	str r2, [r0]
	ldr r0, [sp, #0x78]
	adds r1, r0, r1
	str r2, [r1]
	adds r3, #4
	movs r1, #1
	add sb, r1
	mov r6, sb
	cmp r6, #0xf
	bls _0804D166
	ldr r7, _0804D330 @ =sub_804E66C
	ldr r0, [sp, #8]
	str r7, [r0]
	movs r0, #0
	movs r1, #0x96
	lsls r1, r1, #1
	ldr r2, [sp, #8]
	strh r1, [r2, #4]
	adds r1, #0xd4
	strh r1, [r2, #6]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	movs r0, #0x20
	bl VramMalloc
	str r0, [sp, #0x10]
	movs r5, #0
	mov sb, r5
	movs r4, #0
	ldr r6, [sp, #8]
	adds r6, #0x8c
	str r6, [sp, #0xa4]
	ldr r7, [sp, #8]
	adds r7, #0x88
	str r7, [sp, #0xa8]
	ldr r0, [sp, #8]
	adds r0, #0x74
	str r0, [sp, #0xac]
	ldr r1, [sp, #8]
	adds r1, #0x72
	str r1, [sp, #0xb0]
	ldr r2, [sp, #8]
	adds r2, #0x6c
	str r2, [sp, #0xb4]
	ldr r5, [sp, #8]
	adds r5, #0x68
	str r5, [sp, #0xb8]
	ldr r6, [sp, #8]
	adds r6, #0x51
	mov sl, r6
	ldr r7, [sp, #8]
	adds r7, #0x14
	mov r8, r7
	ldr r0, [sp, #8]
	adds r0, #0x10
	str r0, [sp, #0xbc]
_0804D1F0:
	ldr r7, [sp, #0xbc]
	adds r7, #0x20
	mov r1, r8
	strb r4, [r1]
	strh r4, [r1, #6]
	strh r4, [r1, #0xa]
	strh r4, [r1, #0xc]
	str r4, [r1, #0x10]
	str r4, [r1, #0x14]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0804D334 @ =gUnknown_080D8918
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xff
	mov r2, sl
	strb r0, [r2]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	strb r0, [r2, #1]
	movs r0, #6
	strb r0, [r2, #4]
	subs r0, #7
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	ldr r0, _0804D338 @ =sub_804DD9C
	mov r5, r8
	str r0, [r5, #0x54]
	movs r6, #0
	mov ip, r6
	ldr r1, [sp, #0xb8]
	adds r1, #0x50
	ldr r7, [sp, #0xb8]
	adds r7, #0x48
	str r7, [sp, #0xc4]
	ldr r6, [sp, #0xa4]
	ldr r5, [sp, #0xa8]
	ldr r3, [sp, #0xac]
	ldr r2, [sp, #0xb0]
_0804D25C:
	ldr r0, [sp, #0xb4]
	add r0, ip
	strb r4, [r0]
	strh r4, [r2]
	strh r4, [r3]
	str r4, [r5]
	str r4, [r6]
	strh r4, [r1, #0xe]
	strh r4, [r1, #0x10]
	ldr r0, [sp, #0x10]
	ldr r7, [sp, #0xc4]
	str r0, [r7, #4]
	ldr r0, _0804D33C @ =0x000002CA
	strh r0, [r1, #2]
	strb r4, [r1, #0x18]
	movs r0, #1
	rsbs r0, r0, #0
	mov r7, sp
	strb r0, [r7, #0x14]
	movs r0, #0xff
	strb r0, [r1, #0x19]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r4, [r1]
	strh r4, [r1, #0xc]
	strh r4, [r1, #0x14]
	movs r7, #0x10
	strb r7, [r1, #0x1a]
	movs r0, #6
	strb r0, [r1, #0x1d]
	subs r0, #7
	str r0, [r1, #0x20]
	movs r7, #0x80
	lsls r7, r7, #6
	str r7, [r1, #8]
	b _0804D340
	.align 2, 0
_0804D2A8: .4byte gUnknown_03005424
_0804D2AC: .4byte gActiveBossTask
_0804D2B0: .4byte sub_804D7A0
_0804D2B4: .4byte TaskDestructor_TrueArea53BossGfx
_0804D2B8: .4byte IWRAM_START + 0x1C
_0804D2BC: .4byte IWRAM_START + 0x48
_0804D2C0: .4byte IWRAM_START + 0x98
_0804D2C4: .4byte IWRAM_START + 0x558
_0804D2C8: .4byte IWRAM_START + 0x594
_0804D2CC: .4byte IWRAM_START + 0x654
_0804D2D0: .4byte sub_8050DC8
_0804D2D4: .4byte 0x00000FFF
_0804D2D8: .4byte gUnknown_080D8DCC
_0804D2DC: .4byte 0x0004F300
_0804D2E0: .4byte gUnknown_080D8D6C
_0804D2E4: .4byte gUnknown_080D8C64
_0804D2E8: .4byte gUnknown_080D8C4C
_0804D2EC: .4byte IWRAM_START + 0x20
_0804D2F0: .4byte 0x000007D4
_0804D2F4: .4byte 0x000007D5
_0804D2F8: .4byte 0x000007D6
_0804D2FC: .4byte 0x000007D9
_0804D300: .4byte 0x00000111
_0804D304: .4byte 0x00000115
_0804D308: .4byte 0x00000149
_0804D30C: .4byte 0x0000014D
_0804D310: .4byte gUnknown_080D8A1C
_0804D314: .4byte gUnknown_080D8A34
_0804D318: .4byte gUnknown_080D8A4C
_0804D31C: .4byte gUnknown_080D8A64
_0804D320: .4byte gUnknown_080D8A7C
_0804D324: .4byte sub_804DFB0
_0804D328: .4byte sub_804FF9C
_0804D32C: .4byte sub_804F768
_0804D330: .4byte sub_804E66C
_0804D334: .4byte gUnknown_080D8918
_0804D338: .4byte sub_804DD9C
_0804D33C: .4byte 0x000002CA
_0804D340:
	adds r1, #0x30
	ldr r0, [sp, #0xc4]
	adds r0, #0x30
	str r0, [sp, #0xc4]
	adds r6, #8
	adds r5, #8
	adds r3, #4
	adds r2, #4
	movs r7, #1
	add ip, r7
	mov r0, ip
	cmp r0, #4
	bhi _0804D35C
	b _0804D25C
_0804D35C:
	ldr r1, [sp, #0xa4]
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [sp, #0xa4]
	ldr r5, [sp, #0xa8]
	adds r5, r5, r2
	str r5, [sp, #0xa8]
	ldr r6, [sp, #0xac]
	adds r6, r6, r2
	str r6, [sp, #0xac]
	ldr r7, [sp, #0xb0]
	adds r7, r7, r2
	str r7, [sp, #0xb0]
	ldr r0, [sp, #0xb4]
	adds r0, r0, r2
	str r0, [sp, #0xb4]
	ldr r1, [sp, #0xb8]
	adds r1, r1, r2
	str r1, [sp, #0xb8]
	add sl, r2
	add r8, r2
	ldr r5, [sp, #0xbc]
	adds r5, r5, r2
	str r5, [sp, #0xbc]
	movs r6, #1
	add sb, r6
	mov r7, sb
	cmp r7, #2
	bhi _0804D39A
	b _0804D1F0
_0804D39A:
	ldr r0, [sp, #4]
	ldr r1, _0804D57C @ =0x000007B4
	adds r7, r0, r1
	movs r6, #0
	movs r5, #0
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	ldr r4, _0804D580 @ =gUnknown_080D88F0
	ldr r0, [r4, #0x20]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #0x24]
	strh r0, [r7, #0xa]
	adds r4, #0x26
	ldrb r0, [r4]
	ldr r2, [sp, #0x7c]
	strb r0, [r2]
	ldr r1, [sp, #0x80]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x14]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	movs r0, #0x10
	ldr r5, [sp, #0x88]
	strb r0, [r5]
	ldr r1, [sp, #0x8c]
	strb r6, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r5, #0x80
	lsls r5, r5, #6
	str r5, [r7, #0x10]
	movs r6, #0
	mov sb, r6
	movs r7, #0
	mov r8, r7
	ldr r0, [sp, #4]
	movs r1, #0xff
	lsls r1, r1, #3
	adds r5, r0, r1
	movs r2, #0xfe
	lsls r2, r2, #3
	adds r7, r0, r2
_0804D402:
	strh r6, [r5, #0xe]
	strh r6, [r5, #0x10]
	ldr r0, _0804D580 @ =gUnknown_080D88F0
	mov r1, sb
	lsls r4, r1, #3
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r5, #2]
	ldrb r0, [r4, #6]
	strb r0, [r5, #0x18]
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, sp
	strb r0, [r2, #0x18]
	movs r0, #0xff
	strb r0, [r5, #0x19]
	mov r0, sb
	adds r0, #0x14
	lsls r0, r0, #6
	strh r0, [r5, #0x12]
	strh r6, [r5]
	strh r6, [r5, #0xc]
	strh r6, [r5, #0x14]
	movs r1, #0x10
	strb r1, [r5, #0x1a]
	mov r2, r8
	strb r2, [r5, #0x1d]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	str r0, [r5, #0x20]
	movs r0, #0x84
	lsls r0, r0, #6
	str r0, [r5, #8]
	adds r5, #0x44
	adds r7, #0x44
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #3
	bls _0804D402
	movs r4, #0
	ldr r7, [sp, #0x2c]
	movs r5, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D584 @ =0x000002CE
	strh r0, [r7, #0xa]
	ldr r6, [sp, #0x48]
	strb r5, [r6]
	ldr r1, [sp, #0x4c]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	ldr r6, [sp, #0x50]
	strb r0, [r6]
	ldr r1, [sp, #0x58]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	ldr r7, [sp, #0x84]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D588 @ =0x00000467
	strh r0, [r7, #0xa]
	movs r0, #8
	ldr r6, [sp, #0x90]
	strb r0, [r6]
	ldr r1, [sp, #0x94]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	ldr r6, [sp, #0x98]
	strb r0, [r6]
	ldr r1, [sp, #0x9c]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #5
	str r6, [r7, #0x10]
	ldr r7, [sp, #0xa0]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D58C @ =0x000002CD
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x20]
	strb r5, [r0]
	ldr r1, [sp, #0x24]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #1
	mov r8, r0
	mov r1, r8
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	ldr r2, [sp, #0x28]
	strb r0, [r2]
	ldr r1, [sp, #0x30]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	str r6, [r7, #0x10]
	ldr r0, [sp, #0xc]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r7, r0, r1
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D590 @ =0x000002CF
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x64]
	strb r5, [r2]
	ldr r1, [sp, #0x68]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r2, #0x10
	ldr r1, [sp, #0x6c]
	strb r2, [r1]
	ldr r0, [sp, #0x70]
	strb r5, [r0]
	mov r1, sl
	str r1, [r7, #0x28]
	str r6, [r7, #0x10]
	add sp, #0xc8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D57C: .4byte 0x000007B4
_0804D580: .4byte gUnknown_080D88F0
_0804D584: .4byte 0x000002CE
_0804D588: .4byte 0x00000467
_0804D58C: .4byte 0x000002CD
_0804D590: .4byte 0x000002CF

	thumb_func_start sub_804D594
sub_804D594: @ 0x0804D594
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0804D694 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _0804D684
	ldrh r2, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r2, r3
	ldr r0, _0804D698 @ =IWRAM_START + 0x1C
	adds r1, r2, r0
	adds r0, #0x7c
	adds r0, r0, r2
	mov sb, r0
	ldr r0, [r1, #0x24]
	adds r0, r0, r7
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x28]
	adds r0, r0, r6
	str r0, [r1, #0x28]
	ldr r0, [r3, #0x14]
	adds r0, r0, r7
	str r0, [r3, #0x14]
	ldr r0, [r3, #0x18]
	adds r0, r0, r6
	str r0, [r3, #0x18]
	movs r4, #0
	ldr r0, _0804D69C @ =IWRAM_START + 0x5D4
	adds r0, r2, r0
	str r0, [sp, #4]
	ldr r0, _0804D6A0 @ =IWRAM_START + 0x5D8
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _0804D6A4 @ =IWRAM_START + 0x6C4
	adds r0, r2, r0
	str r0, [sp, #8]
	ldr r0, _0804D6A8 @ =IWRAM_START + 0x6C8
	adds r0, r2, r0
	str r0, [sp]
	asrs r0, r7, #8
	mov r8, r0
	asrs r0, r6, #8
	mov ip, r0
_0804D5F8:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, #0x10
	add r1, sb
	ldr r0, [r1, #0x14]
	adds r0, r0, r7
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x18]
	adds r0, r0, r6
	str r0, [r1, #0x18]
	movs r5, #0
	lsls r2, r4, #3
	adds r0, r1, #0
	adds r0, #0x78
	adds r3, r0, r2
	adds r1, #0x7c
	adds r1, r1, r2
_0804D620:
	ldr r0, [r3]
	add r0, r8
	str r0, [r3]
	ldr r0, [r1]
	add r0, ip
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _0804D620
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804D5F8
	movs r4, #0
	ldr r5, [sp, #4]
	mov r3, sl
_0804D646:
	lsls r1, r4, #3
	adds r2, r5, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0804D646
	movs r4, #0
	ldr r5, [sp, #8]
	ldr r3, [sp]
_0804D668:
	lsls r1, r4, #3
	adds r2, r5, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0804D668
_0804D684:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D694: .4byte gActiveBossTask
_0804D698: .4byte IWRAM_START + 0x1C
_0804D69C: .4byte IWRAM_START + 0x5D4
_0804D6A0: .4byte IWRAM_START + 0x5D8
_0804D6A4: .4byte IWRAM_START + 0x6C4
_0804D6A8: .4byte IWRAM_START + 0x6C8

	thumb_func_start Task_EggmanKidnapsVanilla
Task_EggmanKidnapsVanilla: @ 0x0804D6AC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0804D6F0 @ =gCurTask
	ldr r7, [r0]
	ldrh r0, [r7, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x1c
	adds r5, r0, r1
	adds r1, #0x2c
	adds r6, r0, r1
	ldr r1, _0804D6F4 @ =IWRAM_START + 0x558
	adds r3, r0, r1
	ldr r2, _0804D6F8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804D6FC @ =0x00009FFF
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x12]
	subs r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804D704
	ldr r0, _0804D700 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	adds r0, r7, #0
	bl TaskDestroy
	b _0804D770
	.align 2, 0
_0804D6F0: .4byte gCurTask
_0804D6F4: .4byte IWRAM_START + 0x558
_0804D6F8: .4byte gDispCnt
_0804D6FC: .4byte 0x00009FFF
_0804D700: .4byte gFlags
_0804D704:
	ldr r1, [r3]
	adds r0, r3, #0
	bl _call_via_r1
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	ldr r1, [r6]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_80505B8
	ldr r1, _0804D778 @ =gWinRegs
	ldr r0, _0804D77C @ =0x00002735
	strh r0, [r1, #0xa]
	ldr r2, _0804D780 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0804D784 @ =gUnknown_03002878
	ldr r0, _0804D788 @ =0x04000016
	str r0, [r1]
	ldr r1, _0804D78C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0804D790 @ =gUnknown_03001884
	ldr r3, [r0]
	movs r2, #0
	ldr r6, _0804D794 @ =gSineTable
	ldr r5, _0804D798 @ =gUnknown_03005590
	ldr r4, _0804D79C @ =0x000003FF
_0804D74A:
	ldr r1, [r5]
	adds r1, r2, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	adds r0, #0x2c
	strh r0, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9e
	bls _0804D74A
_0804D770:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D778: .4byte gWinRegs
_0804D77C: .4byte 0x00002735
_0804D780: .4byte gFlags
_0804D784: .4byte gUnknown_03002878
_0804D788: .4byte 0x04000016
_0804D78C: .4byte gUnknown_03002A80
_0804D790: .4byte gUnknown_03001884
_0804D794: .4byte gSineTable
_0804D798: .4byte gUnknown_03005590
_0804D79C: .4byte 0x000003FF

	thumb_func_start sub_804D7A0
sub_804D7A0: @ 0x0804D7A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0804D858 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r5, #0xc0
	lsls r5, r5, #0x12
	add r5, r8
	ldr r4, _0804D85C @ =IWRAM_START + 0x1C
	add r4, r8
	ldr r6, _0804D860 @ =IWRAM_START + 0x48
	add r6, r8
	ldr r0, _0804D864 @ =IWRAM_START + 0x98
	add r0, r8
	ldr r3, _0804D868 @ =gUnknown_03005424
	ldrh r1, [r3]
	movs r2, #0x20
	orrs r1, r2
	strh r1, [r3]
	ldr r3, _0804D86C @ =gDispCnt
	ldrh r2, [r3]
	ldr r1, _0804D870 @ =0x00009FFF
	ands r1, r2
	strh r1, [r3]
	ldr r1, [r4, #0x24]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r4, #0x24]
	ldrh r2, [r6, #0x3a]
	movs r7, #0
	strh r2, [r0, #6]
	ldr r1, [r6, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	movs r3, #0xd7
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r3, #0xa3
	adds r1, r3, #0
	ands r2, r1
	strh r2, [r0, #6]
	movs r1, #0x20
	ldrsh r2, [r4, r1]
	lsls r2, r2, #8
	ldr r1, [r4, #0x24]
	adds r1, r1, r2
	str r1, [r0, #8]
	movs r3, #0x22
	ldrsh r2, [r4, r3]
	lsls r2, r2, #8
	ldr r1, [r4, #0x28]
	adds r1, r1, r2
	str r1, [r0, #0xc]
	ldr r1, [r0]
	bl _call_via_r1
	ldr r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r1, [r6]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl sub_80501D4
	adds r0, r5, #0
	bl sub_8050958
	ldr r0, [r4, #0x24]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #0x24]
	ldrh r0, [r5, #0x12]
	subs r1, r0, #1
	strh r1, [r5, #0x12]
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _0804D878
	mov r2, sb
	ldr r1, [r2]
	ldr r0, _0804D874 @ =sub_804D9DC
	str r0, [r1, #8]
	b _0804D8C0
	.align 2, 0
_0804D858: .4byte gCurTask
_0804D85C: .4byte IWRAM_START + 0x1C
_0804D860: .4byte IWRAM_START + 0x48
_0804D864: .4byte IWRAM_START + 0x98
_0804D868: .4byte gUnknown_03005424
_0804D86C: .4byte gDispCnt
_0804D870: .4byte 0x00009FFF
_0804D874: .4byte sub_804D9DC
_0804D878:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4f
	bne _0804D8C0
	ldr r0, _0804D8CC @ =IWRAM_START + 0x900
	add r0, r8
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _0804D8D0 @ =0x0600E000
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	movs r1, #0xbc
	lsls r1, r1, #1
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	movs r1, #0x20
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r2, _0804D8D4 @ =IWRAM_START + 0x92A
	add r2, r8
	movs r1, #0
	strb r1, [r2]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0804D8D8 @ =gBgCntRegs
	ldr r0, _0804D8DC @ =0x00001C02
	strh r0, [r1, #2]
_0804D8C0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D8CC: .4byte IWRAM_START + 0x900
_0804D8D0: .4byte 0x0600E000
_0804D8D4: .4byte IWRAM_START + 0x92A
_0804D8D8: .4byte gBgCntRegs
_0804D8DC: .4byte 0x00001C02

	thumb_func_start sub_804D8E0
sub_804D8E0: @ 0x0804D8E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp]
	adds r7, r5, #0
	adds r7, #0x98
	movs r1, #0xab
	lsls r1, r1, #3
	adds r1, r5, r1
	str r1, [sp, #4]
	ldr r2, _0804D9C4 @ =0x00000654
	adds r2, r2, r5
	mov sb, r2
	bl sub_802C6E4
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0804D91A
	bl sub_802BA8C
_0804D91A:
	movs r4, #0
	ldr r0, _0804D9C8 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r0, _0804D9CC @ =gUnknown_080D8918
	mov ip, r0
	movs r1, #0x86
	add r1, ip
	mov sl, r1
_0804D92C:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	adds r2, r7, r0
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r1, [r2, #4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r0, [r2]
	cmp r0, r8
	beq _0804D970
	mov r0, ip
	adds r0, #0x84
	ldrh r0, [r0]
	strh r0, [r3, #0xa]
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r3, #0x10]
	movs r0, #0x10
	strh r0, [r2, #8]
_0804D970:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804D92C
	ldr r1, _0804D9D0 @ =sub_804E66C
	str r1, [r7]
	ldr r2, _0804D9D4 @ =sub_804FF9C
	mov r0, sb
	str r2, [r0]
	movs r1, #0
	movs r0, #0x96
	lsls r0, r0, #1
	mov r2, sb
	strh r0, [r2, #8]
	ldr r0, _0804D9D8 @ =sub_8050DC8
	ldr r2, [sp, #4]
	str r0, [r2]
	ldr r0, [sp]
	strh r1, [r0, #0x2c]
	strh r1, [r6, #0x14]
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	lsls r1, r1, #8
	ldr r0, [r6, #0x24]
	adds r0, r0, r1
	str r0, [r5, #0x14]
	movs r0, #0x22
	ldrsh r1, [r6, r0]
	lsls r1, r1, #8
	ldr r0, [r6, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0x18]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D9C4: .4byte 0x00000654
_0804D9C8: .4byte gUnknown_080D8E14
_0804D9CC: .4byte gUnknown_080D8918
_0804D9D0: .4byte sub_804E66C
_0804D9D4: .4byte sub_804FF9C
_0804D9D8: .4byte sub_8050DC8

	thumb_func_start sub_804D9DC
sub_804D9DC: @ 0x0804D9DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0804DAA4 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	ldr r2, _0804DAA8 @ =IWRAM_START + 0x1C
	adds r4, r0, r2
	adds r1, #0x48
	adds r7, r0, r1
	adds r2, #0x7c
	adds r5, r0, r2
	ldr r1, _0804DAAC @ =IWRAM_START + 0x558
	adds r1, r1, r0
	mov sb, r1
	ldr r2, _0804DAB0 @ =IWRAM_START + 0x594
	adds r2, r2, r0
	mov sl, r2
	ldr r1, _0804DAB4 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0804DAB8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804DABC @ =0x00009FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x24]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r4, #0x24]
	ldrh r1, [r7, #0x3a]
	strh r1, [r5, #6]
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r2, _0804DAC0 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	strh r1, [r5, #6]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	ldr r0, [r4, #0x24]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	lsls r1, r1, #8
	ldr r0, [r4, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	bne _0804DAE0
	ldr r0, _0804DAC4 @ =gMPlayInfo_SE1
	bl MPlayStop
	ldr r0, _0804DAC8 @ =gMPlayInfo_SE2
	bl MPlayStop
	ldr r0, _0804DACC @ =gMPlayInfo_SE3
	bl MPlayStop
	ldr r2, _0804DAD0 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x23
	orrs r0, r1
	strh r0, [r2]
	bl sub_802B81C
	adds r0, r6, #0
	bl sub_804D8E0
	adds r0, r6, #0
	bl sub_80501D4
	adds r0, r6, #0
	bl sub_8050958
	ldr r0, _0804DAD4 @ =sub_8050DC4
	str r0, [r5]
	ldr r0, _0804DAD8 @ =sub_8050DF8
	mov r1, r8
	str r0, [r1]
	movs r0, #0x78
	strh r0, [r6, #0x12]
	ldr r2, _0804DAA4 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _0804DADC @ =sub_804DB34
	str r0, [r1, #8]
	b _0804DB24
	.align 2, 0
_0804DAA4: .4byte gCurTask
_0804DAA8: .4byte IWRAM_START + 0x1C
_0804DAAC: .4byte IWRAM_START + 0x558
_0804DAB0: .4byte IWRAM_START + 0x594
_0804DAB4: .4byte IWRAM_START + 0x654
_0804DAB8: .4byte gDispCnt
_0804DABC: .4byte 0x00009FFF
_0804DAC0: .4byte 0x000003FF
_0804DAC4: .4byte gMPlayInfo_SE1
_0804DAC8: .4byte gMPlayInfo_SE2
_0804DACC: .4byte gMPlayInfo_SE3
_0804DAD0: .4byte gUnknown_03005424
_0804DAD4: .4byte sub_8050DC4
_0804DAD8: .4byte sub_8050DF8
_0804DADC: .4byte sub_804DB34
_0804DAE0:
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	mov r0, sb
	ldr r1, [r0]
	bl _call_via_r1
	mov r2, sl
	ldr r1, [r2]
	mov r0, sl
	bl _call_via_r1
	mov r0, r8
	ldr r1, [r0]
	bl _call_via_r1
	ldr r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r1, [r7]
	adds r0, r7, #0
	bl _call_via_r1
	adds r0, r6, #0
	bl sub_804ECC4
	adds r0, r6, #0
	bl sub_80501D4
	adds r0, r6, #0
	bl sub_8050958
_0804DB24:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804DB34
sub_804DB34: @ 0x0804DB34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0804DC08 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r5, r0
	ldr r1, _0804DC0C @ =IWRAM_START + 0x1C
	adds r4, r5, r1
	ldr r2, _0804DC10 @ =IWRAM_START + 0x98
	adds r0, r5, r2
	ldr r1, _0804DC14 @ =IWRAM_START + 0x594
	adds r6, r5, r1
	ldr r2, _0804DC18 @ =IWRAM_START + 0x654
	adds r2, r2, r5
	mov r8, r2
	ldr r3, _0804DC1C @ =gDispCnt
	ldrh r2, [r3]
	ldr r1, _0804DC20 @ =0x00009FFF
	ands r1, r2
	strh r1, [r3]
	ldr r1, [r4, #0x24]
	movs r2, #0x98
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r4, #0x24]
	ldr r1, [r4, #0x28]
	adds r1, #0x40
	str r1, [r4, #0x28]
	ldr r1, [r0]
	bl _call_via_r1
	ldr r1, [r6]
	adds r0, r6, #0
	bl _call_via_r1
	mov r0, r8
	ldr r1, [r0]
	bl _call_via_r1
	adds r0, r7, #0
	bl sub_80501D4
	adds r0, r7, #0
	bl sub_8050958
	adds r0, r7, #0
	bl sub_804DCF8
	ldr r1, _0804DC24 @ =gIntrTable + 4
	adds r5, r5, r1
	ldr r6, _0804DC28 @ =gCamera
	ldr r0, [r6]
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #8
	ldr r4, [r6, #4]
	adds r4, #0x3c
	lsls r4, r4, #8
	ldr r1, [r7, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0x64
	bl Div
	ldr r1, [r7, #0x14]
	adds r1, r1, r0
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x18]
	subs r4, r4, r0
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r1, #0x64
	bl Div
	ldr r1, [r7, #0x18]
	adds r1, r1, r0
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x14]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #0x18]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x12]
	cmp r0, #0
	beq _0804DC2C
	subs r0, #1
	strh r0, [r7, #0x12]
	b _0804DC4C
	.align 2, 0
_0804DC08: .4byte gCurTask
_0804DC0C: .4byte IWRAM_START + 0x1C
_0804DC10: .4byte IWRAM_START + 0x98
_0804DC14: .4byte IWRAM_START + 0x594
_0804DC18: .4byte IWRAM_START + 0x654
_0804DC1C: .4byte gDispCnt
_0804DC20: .4byte 0x00009FFF
_0804DC24: .4byte gIntrTable + 4
_0804DC28: .4byte gCamera
_0804DC2C:
	adds r0, r7, #0
	bl NextTransitionFrame
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0804DC4C
	movs r0, #2
	strh r0, [r7, #0x12]
	ldr r1, _0804DC58 @ =gBldRegs
	movs r0, #0x10
	strh r0, [r1, #4]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0804DC5C @ =Task_804DC60
	str r0, [r1, #8]
_0804DC4C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC58: .4byte gBldRegs
_0804DC5C: .4byte Task_804DC60

	thumb_func_start Task_804DC60
Task_804DC60: @ 0x0804DC60
	push {lr}
	ldr r0, _0804DCC4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1, #0x12]
	subs r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804DCC0
	ldr r1, _0804DCC8 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0804DCCC @ =gUnknown_03002AE4
	ldr r0, _0804DCD0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0804DCD4 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0804DCD8 @ =gVramGraphicsCopyCursor
	ldr r0, _0804DCDC @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _0804DCE0 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bl CreateStageUI
	ldr r0, _0804DCE4 @ =gCourseTime
	ldr r0, [r0]
	ldr r1, _0804DCE8 @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0804DCEC @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
	ldr r1, _0804DCF0 @ =gBldRegs
	ldr r0, _0804DCF4 @ =0x00003FBF
	strh r0, [r1]
_0804DCC0:
	pop {r0}
	bx r0
	.align 2, 0
_0804DCC4: .4byte gCurTask
_0804DCC8: .4byte 0x0000FFFF
_0804DCCC: .4byte gUnknown_03002AE4
_0804DCD0: .4byte gUnknown_0300287C
_0804DCD4: .4byte gUnknown_03005390
_0804DCD8: .4byte gVramGraphicsCopyCursor
_0804DCDC: .4byte gVramGraphicsCopyQueueIndex
_0804DCE0: .4byte gUnknown_03005424
_0804DCE4: .4byte gCourseTime
_0804DCE8: .4byte gRingCount
_0804DCEC: .4byte gUnknown_030054F4
_0804DCF0: .4byte gBldRegs
_0804DCF4: .4byte 0x00003FBF

	thumb_func_start sub_804DCF8
sub_804DCF8: @ 0x0804DCF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	ldr r4, _0804DD80 @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0804DD12
	movs r0, #0x90
	bl m4aSongNumStart
_0804DD12:
	ldr r6, [r4]
	movs r0, #3
	ands r6, r0
	cmp r6, #0
	bne _0804DD76
	ldr r5, _0804DD84 @ =gPseudoRandom
	ldr r0, [r5]
	ldr r3, _0804DD88 @ =0x00196225
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r2, _0804DD8C @ =0x3C6EF35F
	adds r1, r1, r2
	movs r4, #0x7f
	adds r0, r1, #0
	ands r0, r4
	adds r0, #0x40
	str r0, [sp, #0x14]
	muls r1, r3, r1
	adds r1, r1, r2
	adds r0, r1, #0
	ands r0, r4
	adds r0, #0x10
	str r0, [sp, #0x18]
	mov r0, sp
	strh r6, [r0, #0x1c]
	mov r4, sp
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, r0, r2
	str r0, [r5]
	ldr r1, _0804DD90 @ =0x000003FF
	ands r0, r1
	strh r0, [r4, #0xc]
	mov r1, sp
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	ldr r0, _0804DD94 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804DD98 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r6, [r0, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	adds r1, r7, #0
	adds r1, #0xe
	mov r0, sp
	bl CreateBossParticleWithExplosionUpdate
_0804DD76:
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DD80: .4byte gUnknown_03005590
_0804DD84: .4byte gPseudoRandom
_0804DD88: .4byte 0x00196225
_0804DD8C: .4byte 0x3C6EF35F
_0804DD90: .4byte 0x000003FF
_0804DD94: .4byte 0x06012980
_0804DD98: .4byte 0x0000026B

	thumb_func_start sub_804DD9C
sub_804DD9C: @ 0x0804DD9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r2, _0804DE58 @ =gCamera
	mov sl, r2
_0804DDB0:
	adds r0, r7, #4
	mov r5, sb
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804DE3A
	lsls r4, r5, #1
	add r4, sb
	lsls r4, r4, #4
	adds r4, #0x48
	adds r4, r7, r4
	subs r0, #1
	strb r0, [r1]
	lsls r2, r5, #3
	adds r6, r7, #0
	adds r6, #0x20
	adds r6, r6, r2
	ldr r1, [r6]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r6]
	lsls r5, r5, #2
	mov r8, r5
	adds r3, r7, #0
	adds r3, #0xa
	add r3, r8
	movs r5, #0
	ldrsh r0, [r3, r5]
	adds r1, r1, r0
	str r1, [r6]
	adds r5, r7, #0
	adds r5, #0x24
	adds r5, r5, r2
	adds r2, r7, #0
	adds r2, #0xc
	add r2, r8
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	ldrh r1, [r3]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	strh r1, [r3]
	ldrh r1, [r2]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	strh r1, [r2]
	ldr r0, [r6]
	asrs r0, r0, #8
	mov r2, sl
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_0804DE3A:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #4
	bls _0804DDB0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DE58: .4byte gCamera

	thumb_func_start sub_804DE5C
sub_804DE5C: @ 0x0804DE5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	mov ip, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r4, #0
	ldr r1, _0804DED4 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r5, r0, r1
	lsls r3, r3, #1
	adds r6, r3, r1
_0804DE7E:
	mov r0, ip
	adds r0, #4
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804DED8
	lsls r2, r4, #2
	mov r1, ip
	adds r1, #0xa
	adds r1, r1, r2
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	rsbs r0, r0, #0
	strh r0, [r1]
	mov r1, ip
	adds r1, #0xc
	adds r1, r1, r2
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	rsbs r0, r0, #0
	strh r0, [r1]
	lsls r1, r4, #3
	mov r0, ip
	adds r0, #0x20
	adds r0, r0, r1
	str r7, [r0]
	mov r0, ip
	adds r0, #0x24
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	movs r0, #0x10
	strb r0, [r3]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, ip
	adds r0, #0x69
	movs r1, #0xff
	strb r1, [r0]
	b _0804DEE2
	.align 2, 0
_0804DED4: .4byte gSineTable
_0804DED8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0804DE7E
_0804DEE2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_804DEEC
sub_804DEEC: @ 0x0804DEEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	str r1, [sp]
	ldr r0, _0804DF7C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804DF80 @ =IWRAM_START + 0x594
	adds r1, r1, r0
	mov ip, r1
	movs r4, #0
	ldr r5, _0804DF84 @ =gPseudoRandom
	ldr r6, _0804DF88 @ =0x00196225
	movs r2, #0xff
	mov r8, r2
	ldr r7, _0804DF8C @ =0xFFFFFE00
	mov sb, r7
_0804DF16:
	mov r0, ip
	adds r0, #4
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DF94
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0xe
	adds r0, r0, r4
	movs r1, #0x3c
	strb r1, [r0]
	lsls r3, r4, #2
	mov r2, ip
	adds r2, #0x18
	adds r2, r2, r3
	ldr r0, [r5]
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r0, _0804DF90 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r5]
	adds r0, r1, #0
	mov r7, r8
	ands r0, r7
	add r0, sb
	strh r0, [r2]
	mov r2, ip
	adds r2, #0x1a
	adds r2, r2, r3
	adds r0, r1, #0
	muls r0, r6, r0
	ldr r1, _0804DF90 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r5]
	ands r0, r7
	add r0, sb
	strh r0, [r2]
	lsls r1, r4, #3
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r1
	mov r2, sl
	str r2, [r0]
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r1
	ldr r7, [sp]
	str r7, [r0]
	b _0804DF9E
	.align 2, 0
_0804DF7C: .4byte gCurTask
_0804DF80: .4byte IWRAM_START + 0x594
_0804DF84: .4byte gPseudoRandom
_0804DF88: .4byte 0x00196225
_0804DF8C: .4byte 0xFFFFFE00
_0804DF90: .4byte 0x3C6EF35F
_0804DF94:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0804DF16
_0804DF9E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804DFB0
sub_804DFB0: @ 0x0804DFB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x90
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r1, _0804E074 @ =gCamera
	mov sl, r1
_0804DFCA:
	adds r0, r6, #4
	mov r3, r8
	adds r2, r0, r3
	ldrb r0, [r2]
	cmp r0, #0
	beq _0804E058
	adds r1, r6, #0
	adds r1, #0xe
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0804DFEC
	strb r0, [r2]
_0804DFEC:
	mov r0, r8
	lsls r2, r0, #2
	adds r4, r6, #0
	adds r4, #0x1a
	adds r4, r4, r2
	ldrh r0, [r4]
	adds r0, #0x20
	strh r0, [r4]
	mov r1, r8
	lsls r5, r1, #3
	adds r3, r6, #0
	adds r3, #0x40
	adds r3, r3, r5
	ldr r1, [r3]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x18
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	str r1, [r3]
	adds r2, r6, #0
	adds r2, #0x44
	adds r2, r2, r5
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	asrs r0, r0, #8
	mov r3, sl
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	mov r0, sb
	cmp r0, #0
	bne _0804E052
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	movs r1, #1
	mov sb, r1
_0804E052:
	adds r0, r7, #0
	bl DisplaySprite
_0804E058:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #9
	bls _0804DFCA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E074: .4byte gCamera

	thumb_func_start sub_804E078
sub_804E078: @ 0x0804E078
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804E0B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x1c
	adds r6, r1, r0
	adds r0, r5, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804E112
	ldrb r0, [r4, #0xc]
	cmp r0, #4
	bls _0804E0C4
	ldr r0, [r5, #0x30]
	ldr r1, _0804E0BC @ =0x00000FFF
	ands r0, r1
	str r0, [r5, #0x30]
	ldr r1, _0804E0C0 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x30]
	str r0, [r5]
	ldr r0, [r1, #0x34]
	str r0, [r5, #0x34]
	ldrh r0, [r1, #0x38]
	strh r0, [r5, #0x2e]
	b _0804E112
	.align 2, 0
_0804E0B8: .4byte gCurTask
_0804E0BC: .4byte 0x00000FFF
_0804E0C0: .4byte gUnknown_080D8D6C
_0804E0C4:
	ldr r0, _0804E134 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	bl Mod
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r5, #0x30]
	ldr r2, _0804E138 @ =0x00000FFF
	ands r1, r2
	str r1, [r5, #0x30]
	ldr r3, _0804E13C @ =gUnknown_080D8D6C
	ldr r1, [r3, #0x18]
	str r1, [r5]
	ldr r1, [r3, #0x1c]
	str r1, [r5, #0x34]
	ldrh r1, [r3, #0x20]
	strh r1, [r5, #0x2e]
	ldr r1, [r6, #0x18]
	ands r1, r2
	str r1, [r6, #0x18]
	ldr r2, _0804E140 @ =gUnknown_080D8DCC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r2
	ldr r0, [r4]
	str r0, [r6]
	adds r0, r2, #4
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r6, #0x1c]
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x16]
	ldrh r0, [r3, #8]
	strh r0, [r5, #0x2c]
	ldrh r0, [r2, #8]
	strh r0, [r6, #0x14]
_0804E112:
	movs r0, #0
	str r0, [r5, #0x44]
	str r0, [r5, #0x48]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0804E14A
	movs r1, #0
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0804E144
	ldrh r0, [r5, #0x38]
	subs r0, #1
	b _0804E148
	.align 2, 0
_0804E134: .4byte gUnknown_03005590
_0804E138: .4byte 0x00000FFF
_0804E13C: .4byte gUnknown_080D8D6C
_0804E140: .4byte gUnknown_080D8DCC
_0804E144:
	ldrh r0, [r5, #0x38]
	adds r0, #1
_0804E148:
	strh r0, [r5, #0x38]
_0804E14A:
	ldrh r1, [r5, #0x38]
	ldr r0, _0804E158 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E158: .4byte 0x000003FF

	thumb_func_start sub_804E15C
sub_804E15C: @ 0x0804E15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	ldr r0, _0804E1B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804E1BC @ =IWRAM_START + 0x558
	adds r1, r0, r1
	str r1, [sp, #0x10]
	ldr r2, _0804E1C0 @ =IWRAM_START + 0x1C
	adds r4, r0, r2
	adds r0, r7, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804E1DC
	ldr r0, [r7, #0x30]
	ldr r1, _0804E1C4 @ =0x00000FFF
	ands r0, r1
	str r0, [r7, #0x30]
	ldr r1, _0804E1C8 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r7]
	ldr r0, [r1, #4]
	str r0, [r7, #0x34]
	ldrh r0, [r1, #8]
	movs r2, #0
	strh r0, [r7, #0x2e]
	ldr r3, _0804E1CC @ =gDispCnt
	ldrh r1, [r3]
	ldr r0, _0804E1D0 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _0804E1D4 @ =gWinRegs
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r0, _0804E1D8 @ =gBldRegs
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	b _0804E4B2
	.align 2, 0
_0804E1B8: .4byte gCurTask
_0804E1BC: .4byte IWRAM_START + 0x558
_0804E1C0: .4byte IWRAM_START + 0x1C
_0804E1C4: .4byte 0x00000FFF
_0804E1C8: .4byte gUnknown_080D8D6C
_0804E1CC: .4byte gDispCnt
_0804E1D0: .4byte 0x0000DFFF
_0804E1D4: .4byte gWinRegs
_0804E1D8: .4byte gBldRegs
_0804E1DC:
	ldr r0, [r7, #0x30]
	lsrs r0, r0, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #2
	bhi _0804E1EC
	b _0804E4B2
_0804E1EC:
	movs r3, #0x20
	ldrsh r0, [r4, r3]
	lsls r0, r0, #8
	ldr r1, [r4, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r6, #0x22
	ldrsh r0, [r4, r6]
	lsls r0, r0, #8
	ldr r1, [r4, #0x28]
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	ldrh r1, [r7, #0x3a]
	adds r5, r0, r1
	ldr r2, _0804E3F8 @ =0x000003FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _0804E3FC @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]
	ldr r4, _0804E400 @ =gUnknown_080D89A5
	ldrb r1, [r4]
	muls r0, r1, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r5, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r1, r0
	asrs r0, r0, #6
	add r8, r0
	adds r5, #0x8c
	ldr r0, _0804E404 @ =0xFFFFFF00
	adds r1, r5, r0
	ldr r0, _0804E3F8 @ =0x000003FF
	ands r1, r0
	adds r2, r1, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r6, #0
	ldrsh r0, [r2, r6]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r0, r0, #2
	add r8, r0
	movs r0, #0
	mov sl, r4
	adds r3, r7, #0
	adds r3, #0x3a
	str r3, [sp, #0x1c]
	adds r4, r7, #0
	adds r4, #0x42
	str r4, [sp, #0x20]
	mov r6, sp
	adds r6, #0xc
	str r6, [sp, #0x18]
	ldr r1, _0804E3FC @ =gSineTable
	mov ip, r1
_0804E278:
	adds r3, r0, #1
	lsls r0, r3, #1
	ldr r2, [sp, #0x1c]
	adds r0, r2, r0
	ldrh r0, [r0]
	adds r5, r5, r0
	ldr r4, _0804E3F8 @ =0x000003FF
	ands r5, r4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r5, r6
	lsls r6, r0, #1
	mov r1, ip
	adds r0, r6, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r4, sl
	adds r0, r3, r4
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r4, r5, #1
	mov r1, ip
	adds r0, r4, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #6
	add r8, r0
	lsls r3, r3, #0x18
	lsrs r0, r3, #0x18
	cmp r0, #2
	bls _0804E278
	ldr r2, _0804E3FC @ =gSineTable
	adds r0, r6, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	mov r6, sl
	ldrb r1, [r6, #4]
	muls r0, r1, r0
	asrs r0, r0, #6
	add sb, r0
	adds r0, r4, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #6
	add r8, r0
	ldr r3, [sp, #0x20]
	ldrh r0, [r3]
	adds r5, r5, r0
	ldr r4, _0804E3F8 @ =0x000003FF
	ands r5, r4
	ldr r6, [sp, #0x14]
	cmp r6, #5
	bhi _0804E2EE
	b _0804E43C
_0804E2EE:
	ldr r0, _0804E408 @ =gMPlayTable
	ldr r1, [r0, #0x18]
	ldr r0, _0804E40C @ =gSongTable
	ldr r2, _0804E410 @ =0x00000868
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _0804E30A
	cmp r6, #6
	bne _0804E30A
	ldr r0, _0804E414 @ =0x0000010D
	bl m4aSongNumStart
_0804E30A:
	add r0, sp, #8
	ldr r1, [sp, #0x18]
	bl sub_802C668
	ldrh r0, [r7, #0x38]
	adds r6, r5, r0
	ldr r3, _0804E3F8 @ =0x000003FF
	adds r0, r3, #0
	ands r6, r0
	ldr r0, [sp, #0xc]
	mov r4, r8
	subs r0, r0, r4
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp, #8]
	mov r2, sb
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x10
	cmp r6, r0
	bge _0804E350
	subs r0, #0x20
	cmp r6, r0
	ble _0804E350
	bl sub_802BB54
	ldr r0, _0804E418 @ =sub_804F1EC
	ldr r3, [sp, #0x10]
	str r0, [r3]
_0804E350:
	ldr r2, _0804E41C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0804E420 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	movs r0, #0x3f
	strh r0, [r1, #8]
	movs r0, #0x15
	strh r0, [r1, #0xa]
	ldr r1, _0804E424 @ =gBldRegs
	ldr r0, _0804E428 @ =0x00003FBF
	strh r0, [r1]
	movs r5, #8
	strh r5, [r1, #2]
	strh r5, [r1, #4]
	ldr r2, _0804E42C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804E430 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804E434 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #8
	bl Mod
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bge _0804E39A
	rsbs r4, r4, #0
_0804E39A:
	ldr r3, _0804E3FC @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _0804E400 @ =gUnknown_080D89A5
	ldrb r2, [r0, #5]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r6, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add r8, r0
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x1a
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r4, sb
	asrs r3, r4, #8
	ldr r2, _0804E438 @ =gCamera
	ldr r0, [r2]
	subs r3, r3, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r4, r8
	asrs r0, r4, #8
	ldr r2, [r2, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r2, #0x10
	bl sub_802E784
	b _0804E4B2
	.align 2, 0
_0804E3F8: .4byte 0x000003FF
_0804E3FC: .4byte gSineTable
_0804E400: .4byte gUnknown_080D89A5
_0804E404: .4byte 0xFFFFFF00
_0804E408: .4byte gMPlayTable
_0804E40C: .4byte gSongTable
_0804E410: .4byte 0x00000868
_0804E414: .4byte 0x0000010D
_0804E418: .4byte sub_804F1EC
_0804E41C: .4byte gDispCnt
_0804E420: .4byte gWinRegs
_0804E424: .4byte gBldRegs
_0804E428: .4byte 0x00003FBF
_0804E42C: .4byte gPseudoRandom
_0804E430: .4byte 0x00196225
_0804E434: .4byte 0x3C6EF35F
_0804E438: .4byte gCamera
_0804E43C:
	movs r0, #8
	add r1, sp, #8
	ldr r2, [sp, #0x18]
	bl sub_802C704
	ldr r0, [sp, #0xc]
	mov r6, r8
	subs r0, r0, r6
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp, #8]
	mov r2, sb
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r7, #0x38]
	adds r0, r5, r0
	ldr r3, _0804E490 @ =0x000003FF
	ands r0, r3
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0804E498
	ldrh r1, [r7, #0x38]
	adds r2, r1, #0
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r2, r0
	bls _0804E494
	movs r0, #0xe0
	lsls r0, r0, #2
	cmp r2, r0
	bls _0804E4AA
	subs r0, r1, #4
	b _0804E4A8
	.align 2, 0
_0804E490: .4byte 0x000003FF
_0804E494:
	subs r0, r1, #4
	b _0804E4A8
_0804E498:
	ldrh r1, [r7, #0x38]
	adds r2, r1, #0
	ldr r0, _0804E4C4 @ =0x000001FF
	cmp r2, r0
	bhi _0804E4A6
	cmp r2, #0x7f
	bhi _0804E4AA
_0804E4A6:
	adds r0, r1, #4
_0804E4A8:
	strh r0, [r7, #0x38]
_0804E4AA:
	ldrh r1, [r7, #0x38]
	ldr r0, _0804E4C8 @ =0x000003FF
	ands r0, r1
	strh r0, [r7, #0x38]
_0804E4B2:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E4C4: .4byte 0x000001FF
_0804E4C8: .4byte 0x000003FF

	thumb_func_start sub_804E4CC
sub_804E4CC: @ 0x0804E4CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl sub_8050030
	ldr r0, [r4, #0x30]
	ldr r6, _0804E504 @ =0x00000FFF
	adds r1, r0, #0
	ands r1, r6
	adds r3, r1, #0
	adds r5, r3, #0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	cmp r0, #4
	bne _0804E50C
	str r1, [r4, #0x30]
	ldr r1, _0804E508 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r4]
	ldr r0, [r1, #4]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	b _0804E64A
	.align 2, 0
_0804E504: .4byte 0x00000FFF
_0804E508: .4byte gUnknown_080D8D6C
_0804E50C:
	cmp r0, #3
	bne _0804E5B0
	ldr r2, _0804E598 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804E59C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	adds r6, r3, #0
	movs r5, #0
	adds r4, #0x4c
	mov r8, r4
	ldr r0, _0804E5A0 @ =gUnknown_080D8E20
	mov ip, r0
	movs r7, #0x1f
	movs r1, #0x92
	add r1, ip
	mov sl, r1
	ldr r2, _0804E5A4 @ =gObjPalette
	mov sb, r2
_0804E532:
	lsls r4, r5, #1
	adds r1, r4, r5
	mov r0, ip
	adds r0, #0x90
	adds r0, r1, r0
	ldrb r3, [r0]
	muls r3, r6, r3
	asrs r3, r3, #0xc
	ands r3, r7
	mov r0, ip
	adds r0, #0x91
	adds r0, r1, r0
	ldrb r2, [r0]
	muls r2, r6, r2
	asrs r2, r2, #0xc
	ands r2, r7
	add r1, sl
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #0xc
	ands r0, r7
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r3
	strh r0, [r1]
	ldr r3, _0804E5A8 @ =gBgPalette
	adds r4, r4, r3
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804E532
	ldr r1, _0804E5AC @ =gFlags
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	ldr r2, _0804E5AC @ =gFlags
	str r0, [r2]
	movs r0, #0
	mov r3, r8
	strb r0, [r3]
	b _0804E64A
	.align 2, 0
_0804E598: .4byte gDispCnt
_0804E59C: .4byte 0x0000FDFF
_0804E5A0: .4byte gUnknown_080D8E20
_0804E5A4: .4byte gObjPalette
_0804E5A8: .4byte gBgPalette
_0804E5AC: .4byte gFlags
_0804E5B0:
	cmp r2, #2
	bne _0804E64A
	movs r0, #0xe0
	lsls r0, r0, #4
	cmp r5, r0
	bls _0804E64A
	ldr r2, _0804E658 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	subs r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r0, _0804E65C @ =gUnknown_080D8E20
	mov r8, r0
	movs r4, #0x1f
	ldr r1, _0804E660 @ =gBgPalette
	mov sl, r1
_0804E5DC:
	movs r5, #0
	lsls r0, r2, #1
	lsls r1, r2, #4
	adds r3, r2, #1
	mov sb, r3
	adds r0, r0, r2
	lsls r0, r0, #4
	mov ip, r0
	adds r7, r1, #0
	adds r7, #0x70
_0804E5F0:
	lsls r1, r5, #1
	adds r1, r1, r5
	add r1, ip
	mov r2, r8
	adds r0, r1, r2
	ldrb r3, [r0]
	muls r3, r6, r3
	asrs r3, r3, #9
	ands r3, r4
	mov r0, r8
	adds r0, #1
	adds r0, r1, r0
	ldrb r2, [r0]
	muls r2, r6, r2
	asrs r2, r2, #9
	ands r2, r4
	ldr r0, _0804E664 @ =gUnknown_080D8E22
	adds r1, r1, r0
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #9
	ands r0, r4
	adds r1, r5, r7
	lsls r1, r1, #1
	add r1, sl
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804E5F0
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _0804E5DC
	ldr r2, _0804E668 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
_0804E64A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E658: .4byte gDispCnt
_0804E65C: .4byte gUnknown_080D8E20
_0804E660: .4byte gBgPalette
_0804E664: .4byte gUnknown_080D8E22
_0804E668: .4byte gFlags

	thumb_func_start sub_804E66C
sub_804E66C: @ 0x0804E66C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #4]
	subs r0, #1
	strh r0, [r7, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804E68C
	ldr r0, _0804E738 @ =sub_804E74C
	str r0, [r7]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r7, #4]
_0804E68C:
	ldr r0, _0804E73C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #4
	bl Mod
	movs r1, #0
	mov sb, r1
	cmp r0, #0
	bne _0804E6A2
	movs r2, #1
	mov sb, r2
_0804E6A2:
	movs r5, #0
	ldr r0, _0804E740 @ =gSineTable
	mov r8, r0
_0804E6A8:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x10
	adds r4, r7, r0
	adds r6, r4, #0
	adds r6, #0x58
	ldr r1, [r4, #0x58]
	adds r0, r6, #0
	bl _call_via_r1
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E71C
	mov r1, sb
	cmp r1, #0
	beq _0804E714
	ldr r1, [r4]
	ldr r0, _0804E744 @ =sub_804EC6C
	cmp r1, r0
	beq _0804E714
	ldrh r3, [r4, #0xc]
	adds r3, #0x20
	ldr r2, _0804E748 @ =0x000003FF
	adds r0, r2, #0
	ands r3, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	ldr r0, [r4, #0x14]
	subs r0, r0, r1
	lsls r1, r3, #1
	add r1, r8
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r2, r1, #2
	adds r2, r2, r1
	asrs r2, r2, #5
	ldr r1, [r4, #0x18]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_804DE5C
_0804E714:
	ldr r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
_0804E71C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0804E6A8
	adds r0, r7, #0
	bl sub_804E8E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E738: .4byte sub_804E74C
_0804E73C: .4byte gUnknown_03005590
_0804E740: .4byte gSineTable
_0804E744: .4byte sub_804EC6C
_0804E748: .4byte 0x000003FF

	thumb_func_start sub_804E74C
sub_804E74C: @ 0x0804E74C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #4]
	subs r0, #1
	strh r0, [r7, #4]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	movs r4, #3
	cmp r1, #0
	bne _0804E778
	ldr r0, _0804E774 @ =sub_804E66C
	str r0, [r7]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r7, #4]
	b _0804E792
	.align 2, 0
_0804E774: .4byte sub_804E66C
_0804E778:
	movs r0, #0x87
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804E784
	movs r4, #0
	b _0804E792
_0804E784:
	cmp r1, #0xd2
	bne _0804E78C
	movs r4, #1
	b _0804E792
_0804E78C:
	cmp r2, #0x96
	bne _0804E792
	movs r4, #2
_0804E792:
	cmp r4, #2
	bhi _0804E836
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	adds r5, r7, r0
	ldr r0, _0804E8D4 @ =gUnknown_080D8E14
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #3
	strb r0, [r5, #4]
	movs r4, #0
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r5, #8]
	ldrh r1, [r7, #6]
	ldr r0, _0804E8D8 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0xa]
	ldr r1, _0804E8DC @ =gSineTable
	ldrh r0, [r7, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	strh r0, [r5, #0xe]
	ldrh r0, [r7, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	strh r0, [r5, #0x10]
	ldr r1, [r7, #8]
	str r1, [r5, #0x14]
	ldr r2, [r7, #0xc]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	movs r3, #0xd
	muls r0, r3, r0
	adds r1, r1, r0
	str r1, [r5, #0x14]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	muls r0, r3, r0
	adds r2, r2, r0
	str r2, [r5, #0x18]
	movs r0, #0x80
	str r0, [r5, #0x1c]
	strb r4, [r5, #6]
	movs r0, #5
	strb r0, [r5, #5]
	adds r2, r5, #0
	adds r2, #0x20
	ldr r1, _0804E8E0 @ =gUnknown_080D8918
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	adds r1, #4
	movs r0, #6
	strb r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804E836:
	ldr r0, _0804E8E4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #4
	bl Mod
	movs r2, #0
	mov sb, r2
	cmp r0, #0
	bne _0804E84C
	movs r3, #1
	mov sb, r3
_0804E84C:
	movs r4, #0
	ldr r0, _0804E8DC @ =gSineTable
	mov r8, r0
_0804E852:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	adds r5, r7, r0
	adds r6, r5, #0
	adds r6, #0x58
	ldr r1, [r5, #0x58]
	adds r0, r6, #0
	bl _call_via_r1
	ldrb r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E8B6
	mov r1, sb
	cmp r1, #0
	beq _0804E8AE
	ldrh r3, [r5, #0xa]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	ldr r0, [r5, #0x14]
	subs r0, r0, r1
	lsls r1, r3, #1
	add r1, r8
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r2, r1, #2
	adds r2, r2, r1
	asrs r2, r2, #5
	ldr r1, [r5, #0x18]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_804DE5C
_0804E8AE:
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
_0804E8B6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804E852
	adds r0, r7, #0
	bl sub_804E8E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E8D4: .4byte gUnknown_080D8E14
_0804E8D8: .4byte 0x000003FF
_0804E8DC: .4byte gSineTable
_0804E8E0: .4byte gUnknown_080D8918
_0804E8E4: .4byte gUnknown_03005590

	thumb_func_start sub_804E8E8
sub_804E8E8: @ 0x0804E8E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r5, #0
	ldr r6, _0804E968 @ =gCamera
_0804E8F4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x10
	mov r1, r8
	adds r2, r1, r0
	ldrb r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E952
	adds r4, r2, #0
	adds r4, #0x20
	ldrh r0, [r2, #0xc]
	adds r0, #0x20
	ldr r1, _0804E96C @ =0x000003FF
	ands r0, r1
	lsrs r1, r0, #6
	ldr r3, _0804E970 @ =gUnknown_080D8918
	ldrh r0, [r4, #0xa]
	ldrh r7, [r3, #4]
	cmp r0, r7
	bne _0804E932
	lsls r0, r1, #3
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_0804E932:
	ldr r0, [r2, #0x14]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r2, #0x18]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_0804E952:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0804E8F4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E968: .4byte gCamera
_0804E96C: .4byte 0x000003FF
_0804E970: .4byte gUnknown_080D8918

	thumb_func_start sub_804E974
sub_804E974: @ 0x0804E974
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x20
	movs r0, #0
	mov r8, r0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	ldr r0, [sp]
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [sp]
	ldrh r0, [r5, #8]
	subs r1, r0, #1
	strh r1, [r5, #8]
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _0804E9AC
	movs r2, #1
	mov r8, r2
	b _0804E9BC
_0804E9AC:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa9
	bhi _0804E9BC
	ldrb r1, [r5, #4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r5, #4]
_0804E9BC:
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x18]
	subs r0, r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	ldr r2, [r5, #0x14]
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	strh r1, [r5, #0xc]
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0804E9E6
	subs r0, #1
	strb r0, [r5, #5]
	b _0804EA00
_0804E9E6:
	ldrh r0, [r5, #0xa]
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0804E9FA
	ldrh r0, [r5, #0xa]
	subs r0, #5
	b _0804E9FE
_0804E9FA:
	ldrh r0, [r5, #0xa]
	adds r0, #5
_0804E9FE:
	strh r0, [r5, #0xa]
_0804EA00:
	ldrh r1, [r5, #0xa]
	ldr r0, _0804EAD8 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0xa]
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	movs r1, #0x28
	bl Div
	ldrh r1, [r5, #0xe]
	subs r1, r1, r0
	strh r1, [r5, #0xe]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	movs r1, #0x28
	bl Div
	ldrh r1, [r5, #0x10]
	subs r1, r1, r0
	strh r1, [r5, #0x10]
	ldr r7, _0804EADC @ =gSineTable
	ldrh r0, [r5, #0xa]
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r4, _0804EAE0 @ =0x00000352
	adds r1, r4, #0
	bl Div
	ldrh r1, [r5, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #0xe]
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	bl Div
	ldrh r1, [r5, #0x10]
	adds r1, r1, r0
	strh r1, [r5, #0x10]
	ldr r0, [r5, #0x14]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	str r0, [r5, #0x14]
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x18]
	adds r0, r0, r1
	str r0, [r5, #0x18]
	bl sub_802C6E4
	movs r1, #0x82
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0804EB50
	ldr r1, [r5, #0x14]
	asrs r1, r1, #8
	ldr r2, [r5, #0x18]
	asrs r2, r2, #8
	adds r0, r6, #0
	bl sub_804EE84
	cmp r0, #1
	bne _0804EAE8
	ldr r0, _0804EAE4 @ =gUnknown_080D8E14
	ldr r0, [r0, #4]
	str r0, [r5]
	bl sub_802C770
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	adds r1, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r5, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #0x10]
	movs r0, #0
	mov r8, r0
	movs r0, #0x86
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _0804EB08
	.align 2, 0
_0804EAD8: .4byte 0x000003FF
_0804EADC: .4byte gSineTable
_0804EAE0: .4byte 0x00000352
_0804EAE4: .4byte gUnknown_080D8E14
_0804EAE8:
	ldr r1, [r5, #0x14]
	asrs r1, r1, #8
	ldr r2, [r5, #0x18]
	asrs r2, r2, #8
	adds r0, r6, #0
	movs r3, #1
	bl sub_804F010
	cmp r0, #1
	bne _0804EB08
	bl sub_802BA8C
	cmp r0, #1
	bne _0804EB08
	movs r1, #1
	mov r8, r1
_0804EB08:
	mov r2, r8
	cmp r2, #0
	beq _0804EB50
	ldrb r1, [r5, #4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r5, #4]
	ldr r0, _0804EB60 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	str r0, [r5]
	movs r2, #0
	movs r0, #0x10
	strh r0, [r5, #8]
	ldr r0, _0804EB64 @ =gUnknown_080D8918
	adds r1, r0, #0
	adds r1, #0x84
	ldrh r1, [r1]
	strh r1, [r6, #0xa]
	adds r0, #0x86
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #0x10]
	adds r0, r6, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0804EB68 @ =0x0000010B
	bl m4aSongNumStart
_0804EB50:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EB60: .4byte gUnknown_080D8E14
_0804EB64: .4byte gUnknown_080D8918
_0804EB68: .4byte 0x0000010B

	thumb_func_start sub_804EB6C
sub_804EB6C: @ 0x0804EB6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x20
	ldr r0, _0804EBBC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804EBC8
	ldr r0, _0804EBC0 @ =gUnknown_080D8918
	adds r1, r0, #0
	adds r1, #0x84
	ldrh r1, [r1]
	strh r1, [r5, #0xa]
	adds r0, #0x86
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804EBC4 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	str r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #8]
	b _0804EC5E
	.align 2, 0
_0804EBBC: .4byte gCurTask
_0804EBC0: .4byte gUnknown_080D8918
_0804EBC4: .4byte gUnknown_080D8E14
_0804EBC8:
	ldrh r0, [r4, #0xa]
	adds r0, #0x8c
	ldr r1, _0804EC18 @ =0x000003FF
	ands r0, r1
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x14]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	adds r2, r0, r1
	str r2, [r4, #0x14]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x18]
	adds r1, r0, r1
	str r1, [r4, #0x18]
	ldrb r0, [r6, #0xd]
	cmp r0, #0
	bne _0804EC5E
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0804EC5E
	asrs r0, r2, #8
	asrs r1, r1, #8
	bl sub_804ED98
	cmp r0, #0
	beq _0804EC5E
	ldrb r1, [r6, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804EC1C
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804EC22
	.align 2, 0
_0804EC18: .4byte 0x000003FF
_0804EC1C:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804EC22:
	ldr r1, _0804EC64 @ =gUnknown_080D8918
	adds r0, r1, #0
	adds r0, #0x84
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r5, #0xa]
	adds r1, #0x86
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0804EC68 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	str r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #8]
	movs r0, #0x30
	strb r0, [r6, #0xd]
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	beq _0804EC5E
	subs r0, #1
	strb r0, [r6, #0xc]
_0804EC5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EC64: .4byte gUnknown_080D8918
_0804EC68: .4byte gUnknown_080D8E14

	thumb_func_start sub_804EC6C
sub_804EC6C: @ 0x0804EC6C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804EC82
	movs r0, #0
	strb r0, [r4, #4]
	b _0804ECBC
_0804EC82:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	movs r1, #0x28
	bl Div
	ldrh r1, [r4, #0xe]
	subs r1, r1, r0
	strh r1, [r4, #0xe]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	movs r1, #0x28
	bl Div
	ldrh r1, [r4, #0x10]
	subs r1, r1, r0
	strh r1, [r4, #0x10]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	movs r0, #0x10
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	str r0, [r4, #0x18]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r4, #0x14]
_0804ECBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804ECC4
sub_804ECC4: @ 0x0804ECC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	adds r1, r6, #0
	adds r1, #0x1c
	adds r6, #0x48
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	lsls r0, r0, #8
	ldr r4, [r1, #0x24]
	adds r4, r4, r0
	movs r7, #0x22
	ldrsh r0, [r1, r7]
	lsls r0, r0, #8
	ldr r5, [r1, #0x28]
	adds r5, r5, r0
	ldr r1, [r6, #0x44]
	asrs r1, r1, #8
	ldrh r6, [r6, #0x3a]
	adds r1, r1, r6
	movs r0, #0xc0
	lsls r0, r0, #2
	mov sb, r0
	add r1, sb
	ldr r2, _0804ED8C @ =0x000003FF
	mov r8, r2
	mov r7, r8
	ands r1, r7
	ldr r6, _0804ED90 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r2, [r0, r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #4
	adds r4, r4, r0
	lsls r0, r1, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r2, [r0, r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #4
	adds r5, r5, r0
	add r1, sb
	mov r0, r8
	ands r1, r0
	adds r3, r1, r3
	lsls r3, r3, #1
	adds r3, r3, r6
	movs r7, #0
	ldrsh r2, [r3, r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #5
	adds r4, r4, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	adds r5, r5, r0
	ldr r0, [sp]
	subs r4, r4, r0
	ldr r0, [sp, #4]
	subs r5, r5, r0
	asrs r4, r4, #8
	asrs r5, r5, #8
	adds r2, r4, #0
	muls r2, r4, r2
	adds r4, r2, #0
	adds r7, r5, #0
	muls r7, r5, r7
	adds r5, r7, #0
	adds r4, r4, r5
	ldr r0, _0804ED94 @ =0x0000063F
	cmp r4, r0
	bgt _0804ED7E
	bl sub_802BA8C
_0804ED7E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED8C: .4byte 0x000003FF
_0804ED90: .4byte gSineTable
_0804ED94: .4byte 0x0000063F

	thumb_func_start sub_804ED98
sub_804ED98: @ 0x0804ED98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r2, #0
	str r2, [sp]
	ldr r2, _0804EE6C @ =gCurTask
	ldr r2, [r2]
	ldrh r4, [r2, #6]
	ldr r5, _0804EE70 @ =IWRAM_START + 0x1C
	adds r3, r4, r5
	ldr r7, _0804EE74 @ =IWRAM_START + 0x48
	adds r4, r4, r7
	movs r5, #0x20
	ldrsh r2, [r3, r5]
	lsls r2, r2, #8
	ldr r6, [r3, #0x24]
	adds r6, r6, r2
	movs r7, #0x22
	ldrsh r2, [r3, r7]
	lsls r2, r2, #8
	ldr r3, [r3, #0x28]
	mov r8, r3
	add r8, r2
	ldr r3, [r4, #0x44]
	asrs r3, r3, #8
	ldrh r4, [r4, #0x3a]
	adds r3, r3, r4
	movs r2, #0xc0
	lsls r2, r2, #2
	mov ip, r2
	add r3, ip
	ldr r5, _0804EE78 @ =0x000003FF
	mov sl, r5
	mov r7, sl
	ands r3, r7
	ldr r2, _0804EE7C @ =gSineTable
	mov sb, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r2, r3, r5
	lsls r2, r2, #1
	add r2, sb
	movs r7, #0
	ldrsh r4, [r2, r7]
	lsls r2, r4, #2
	adds r2, r2, r4
	asrs r2, r2, #4
	adds r6, r6, r2
	lsls r2, r3, #1
	add r2, sb
	movs r7, #0
	ldrsh r4, [r2, r7]
	lsls r2, r4, #2
	adds r2, r2, r4
	asrs r2, r2, #4
	add r8, r2
	add r3, ip
	mov r2, sl
	ands r3, r2
	adds r5, r3, r5
	lsls r5, r5, #1
	add r5, sb
	movs r7, #0
	ldrsh r4, [r5, r7]
	lsls r2, r4, #2
	adds r2, r2, r4
	asrs r2, r2, #5
	adds r6, r6, r2
	lsls r3, r3, #1
	add r3, sb
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #5
	add r8, r2
	asrs r6, r6, #8
	mov r5, r8
	asrs r5, r5, #8
	subs r6, r6, r0
	subs r5, r5, r1
	mov r8, r5
	adds r7, r6, #0
	muls r7, r6, r7
	adds r6, r7, #0
	mov r0, r8
	muls r0, r5, r0
	mov r8, r0
	add r6, r8
	ldr r0, _0804EE80 @ =0x0000063F
	cmp r6, r0
	bgt _0804EE5A
	movs r1, #1
	str r1, [sp]
_0804EE5A:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804EE6C: .4byte gCurTask
_0804EE70: .4byte IWRAM_START + 0x1C
_0804EE74: .4byte IWRAM_START + 0x48
_0804EE78: .4byte 0x000003FF
_0804EE7C: .4byte gSineTable
_0804EE80: .4byte 0x0000063F

	thumb_func_start sub_804EE84
sub_804EE84: @ 0x0804EE84
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	bl sub_802C750
	adds r6, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	bl sub_802C6E4
	movs r1, #0x82
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0804EF5C
	ldr r0, _0804EF58 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804EF5C
	ldr r0, [r5, #0x30]
	subs r1, #0x81
	cmp r0, r1
	beq _0804EF5C
	ldr r0, [r6, #0x30]
	cmp r0, r1
	beq _0804EF5C
	adds r0, r5, #0
	adds r0, #0x34
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r4, r3
	ldr r0, [sp]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0804EEFC
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0804EF0E
	cmp r2, r1
	blt _0804EF5C
_0804EEFC:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0804EF5C
_0804EF0E:
	adds r0, r5, #0
	adds r0, #0x35
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r7, r4
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0804EF42
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0804EF54
	cmp r2, r3
	blt _0804EF5C
_0804EF42:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0804EF5C
_0804EF54:
	movs r0, #1
	b _0804EF5E
	.align 2, 0
_0804EF58: .4byte gPlayer
_0804EF5C:
	movs r0, #0
_0804EF5E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804EF68
sub_804EF68: @ 0x0804EF68
	push {r4, r5, r6, lr}
	mov ip, r0
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r0, [r0, #0x30]
	movs r3, #1
	rsbs r3, r3, #0
	cmp r0, r3
	beq _0804F008
	ldr r0, [r4, #0x28]
	cmp r0, r3
	beq _0804F008
	mov r0, ip
	adds r0, #0x34
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp, #0x10]
	adds r3, r0, r5
	cmp r1, r3
	bgt _0804EFB0
	mov r0, ip
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _0804EFC2
	cmp r1, r3
	blt _0804F008
_0804EFB0:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	blt _0804F008
_0804EFC2:
	mov r0, ip
	adds r0, #0x35
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r6, r3
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp, #0x14]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0804EFF2
	mov r0, ip
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0804F004
	cmp r2, r1
	blt _0804F008
_0804EFF2:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0804F008
_0804F004:
	movs r0, #1
	b _0804F00A
_0804F008:
	movs r0, #0
_0804F00A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_804F010
sub_804F010: @ 0x0804F010
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	bl sub_802C750
	adds r6, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	bl sub_802C6E4
	ldr r0, _0804F0F4 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804F0F8
	lsls r0, r4, #3
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r0
	ldr r1, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	mov ip, r0
	cmp r1, r2
	beq _0804F0F8
	ldr r0, [r6, #0x28]
	cmp r0, r2
	beq _0804F0F8
	mov r0, ip
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	ldr r0, [sp]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2c
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0804F096
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0804F0A8
	cmp r2, r1
	blt _0804F0F8
_0804F096:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0804F0F8
_0804F0A8:
	mov r1, ip
	adds r3, r7, r1
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r2, r0, r4
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	movs r1, #0x2d
	ldrsb r5, [r1, r6]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0804F0DC
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0804F0EE
	cmp r2, r1
	blt _0804F0F8
_0804F0DC:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0804F0F8
_0804F0EE:
	movs r0, #1
	b _0804F0FA
	.align 2, 0
_0804F0F4: .4byte gPlayer
_0804F0F8:
	movs r0, #0
_0804F0FA:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804F108
sub_804F108: @ 0x0804F108
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _0804F1D8 @ =gCurTask
	ldr r1, [r1]
	ldrh r1, [r1, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r1, r2
	ldr r4, _0804F1DC @ =IWRAM_START + 0x1C
	adds r3, r1, r4
	adds r4, #0x2c
	adds r6, r1, r4
	adds r7, r0, #0
	adds r7, #0xc
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _0804F1CA
	movs r1, #0x20
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	ldr r4, [r3, #0x24]
	adds r4, r4, r0
	movs r2, #0x22
	ldrsh r0, [r3, r2]
	lsls r0, r0, #8
	ldr r5, [r3, #0x28]
	adds r5, r5, r0
	ldr r1, [r6, #0x44]
	asrs r1, r1, #8
	ldrh r6, [r6, #0x3a]
	adds r1, r1, r6
	movs r3, #0xc0
	lsls r3, r3, #2
	mov sb, r3
	add r1, sb
	ldr r0, _0804F1E0 @ =0x000003FF
	mov r8, r0
	mov r2, r8
	ands r1, r2
	ldr r6, _0804F1E4 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r2, r0, r6
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r4, r4, r0
	lsls r0, r1, #1
	adds r2, r0, r6
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r5, r5, r0
	add r1, sb
	mov r2, r8
	ands r1, r2
	adds r3, r1, r3
	lsls r3, r3, #1
	adds r3, r3, r6
	movs r2, #0
	ldrsh r0, [r3, r2]
	movs r2, #0x26
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r4, r4, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r5, r5, r0
	asrs r4, r4, #8
	ldr r1, _0804F1E8 @ =gCamera
	ldr r0, [r1]
	subs r4, r4, r0
	subs r4, #6
	strh r4, [r7, #0x16]
	asrs r5, r5, #8
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r5, #5
	strh r5, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
_0804F1CA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F1D8: .4byte gCurTask
_0804F1DC: .4byte IWRAM_START + 0x1C
_0804F1E0: .4byte 0x000003FF
_0804F1E4: .4byte gSineTable
_0804F1E8: .4byte gCamera

	thumb_func_start sub_804F1EC
sub_804F1EC: @ 0x0804F1EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	ldr r0, _0804F348 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r2, _0804F34C @ =IWRAM_START + 0x1C
	adds r4, r0, r2
	ldr r3, _0804F350 @ =IWRAM_START + 0x48
	adds r5, r0, r3
	ldr r6, _0804F354 @ =IWRAM_START + 0x98
	adds r6, r0, r6
	str r6, [sp, #0x10]
	mov r0, r8
	adds r0, #0xc
	str r0, [sp, #0x14]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _0804F222
	b _0804F462
_0804F222:
	mov r1, r8
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804F23C
	ldr r0, _0804F358 @ =sub_8050DC8
	str r0, [r1]
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStop
_0804F23C:
	mov r2, r8
	ldr r0, [r2, #8]
	adds r7, r0, #2
	movs r0, #0xe8
	lsls r0, r0, #1
	cmp r7, r0
	ble _0804F24C
	adds r7, r0, #0
_0804F24C:
	mov r3, r8
	str r7, [r3, #8]
	movs r6, #0x20
	ldrsh r0, [r4, r6]
	lsls r0, r0, #8
	ldr r1, [r4, #0x24]
	adds r1, r1, r0
	mov sl, r1
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r1, [r4, #0x28]
	adds r1, r1, r0
	mov sb, r1
	ldr r1, [r5, #0x44]
	asrs r1, r1, #8
	ldrh r5, [r5, #0x3a]
	adds r1, r1, r5
	movs r2, #0xc0
	lsls r2, r2, #2
	mov ip, r2
	add r1, ip
	ldr r3, _0804F35C @ =0x000003FF
	adds r4, r3, #0
	ands r1, r4
	ldr r3, _0804F360 @ =gSineTable
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	add sl, r0
	lsls r0, r1, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	add sb, r0
	add r1, ip
	ands r1, r4
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x26
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_802C668
	ldr r0, [sp, #8]
	movs r1, #0xa0
	lsls r1, r1, #4
	add r1, sl
	movs r4, #2
	str r4, [sp]
	adds r2, r7, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r5, r7, r5
	str r4, [sp]
	mov r1, sb
	adds r2, r5, #0
	movs r3, #0xa
	bl sub_8085698
	adds r1, r0, #0
	str r1, [sp, #0xc]
	ldr r0, [sp, #8]
	bl sub_802C6B4
	mov r6, sl
	asrs r4, r6, #8
	mov r0, sb
	asrs r5, r0, #8
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_804F010
	cmp r0, #1
	bne _0804F36C
	bl sub_802C798
	ldr r0, _0804F364 @ =sub_804F47C
	mov r1, r8
	str r0, [r1]
	movs r0, #0x78
	strh r0, [r1, #6]
	movs r0, #0xa
	strb r0, [r1, #4]
	ldr r0, _0804F368 @ =0x000002CB
	ldr r2, [sp, #0x14]
	strh r0, [r2, #0xa]
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	b _0804F462
	.align 2, 0
_0804F348: .4byte gCurTask
_0804F34C: .4byte IWRAM_START + 0x1C
_0804F350: .4byte IWRAM_START + 0x48
_0804F354: .4byte IWRAM_START + 0x98
_0804F358: .4byte sub_8050DC8
_0804F35C: .4byte 0x000003FF
_0804F360: .4byte gSineTable
_0804F364: .4byte sub_804F47C
_0804F368: .4byte 0x000002CB
_0804F36C:
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	ldr r1, _0804F474 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	ldr r3, [sp, #0x14]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x14]
	bl UpdateSpriteAnimation
	ldr r0, [sp, #0x14]
	bl DisplaySprite
	movs r6, #0
	movs r4, #2
	mov r8, r4
_0804F396:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r0, #0x10
	ldr r1, [sp, #0x10]
	adds r5, r1, r0
	ldrb r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F458
	ldr r0, [r5, #0x18]
	mov r2, sb
	subs r0, r0, r2
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x14]
	mov r3, sl
	subs r1, r1, r3
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	ldr r4, _0804F478 @ =0xFED30000
	adds r0, r0, r4
	movs r1, #0xd3
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0804F3DC
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0804F430
_0804F3DC:
	ldr r4, [r5, #0x1c]
	adds r7, r4, #0
	adds r7, #0xa
	movs r0, #1
	strb r0, [r5, #6]
	str r7, [r5, #0x1c]
	ldr r0, [r5, #0x14]
	mov r1, r8
	str r1, [sp]
	movs r1, #0xb0
	lsls r1, r1, #5
	add r1, sl
	adds r2, r7, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x18]
	adds r4, #0xaa
	mov r2, r8
	str r2, [sp]
	mov r1, sb
	adds r2, r4, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5, #0x18]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	movs r4, #0x5a
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5, #0xe]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5, #0x10]
_0804F430:
	adds r0, r5, #0
	adds r0, #0x20
	ldr r1, [r5, #0x14]
	asrs r1, r1, #8
	ldr r2, [r5, #0x18]
	asrs r2, r2, #8
	mov r4, sl
	asrs r3, r4, #8
	adds r3, #0x10
	str r3, [sp]
	mov r4, sb
	asrs r3, r4, #8
	str r3, [sp, #4]
	ldr r3, [sp, #0x14]
	bl sub_804EF68
	cmp r0, #1
	bne _0804F458
	movs r0, #0
	strb r0, [r5, #4]
_0804F458:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0804F396
_0804F462:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F474: .4byte gCamera
_0804F478: .4byte 0xFED30000

	thumb_func_start sub_804F47C
sub_804F47C: @ 0x0804F47C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #6]
	subs r0, #1
	strh r0, [r7, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804F496
	ldr r0, _0804F594 @ =sub_8050DC8
	str r0, [r7]
_0804F496:
	ldr r0, _0804F598 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r3, _0804F59C @ =IWRAM_START + 0x1C
	adds r2, r0, r3
	ldr r4, _0804F5A0 @ =IWRAM_START + 0x48
	adds r3, r0, r4
	movs r0, #0xc
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0804F588
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	lsls r0, r0, #8
	ldr r1, [r2, #0x24]
	adds r5, r1, r0
	movs r4, #0x22
	ldrsh r0, [r2, r4]
	lsls r0, r0, #8
	ldr r1, [r2, #0x28]
	adds r6, r1, r0
	ldr r1, [r3, #0x44]
	asrs r1, r1, #8
	ldrh r3, [r3, #0x3a]
	adds r1, r1, r3
	movs r0, #0xc0
	lsls r0, r0, #2
	mov sb, r0
	add r1, sb
	ldr r2, _0804F5A4 @ =0x000003FF
	mov ip, r2
	mov r3, ip
	ands r1, r3
	ldr r4, _0804F5A8 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r2, r0, r4
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r5, r5, r0
	lsls r0, r1, #1
	adds r2, r0, r4
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r6, r6, r0
	add r1, sb
	mov r2, ip
	ands r1, r2
	adds r3, r1, r3
	lsls r3, r3, #1
	adds r3, r3, r4
	movs r2, #0
	ldrsh r0, [r3, r2]
	movs r2, #0x26
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r5, r5, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r6, r6, r0
	asrs r0, r5, #8
	ldr r2, _0804F5AC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	mov r4, r8
	strh r0, [r4, #0x16]
	asrs r0, r6, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	mov r0, r8
	bl UpdateSpriteAnimation
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #6]
	movs r1, #0xa
	bl Mod
	cmp r0, #0
	bne _0804F588
	ldrh r0, [r7, #6]
	cmp r0, #0x64
	bhi _0804F588
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _0804F588
	subs r0, #1
	strb r0, [r7, #4]
	ldr r0, _0804F5B0 @ =0x0000010F
	bl m4aSongNumStart
	ldr r1, _0804F5B4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0
	beq _0804F588
	subs r0, #1
	strh r0, [r1]
	ldr r1, _0804F5B8 @ =0xFFFFF800
	adds r0, r5, r1
	adds r1, r6, #0
	bl sub_804DEEC
_0804F588:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F594: .4byte sub_8050DC8
_0804F598: .4byte gCurTask
_0804F59C: .4byte IWRAM_START + 0x1C
_0804F5A0: .4byte IWRAM_START + 0x48
_0804F5A4: .4byte 0x000003FF
_0804F5A8: .4byte gSineTable
_0804F5AC: .4byte gCamera
_0804F5B0: .4byte 0x0000010F
_0804F5B4: .4byte gRingCount
_0804F5B8: .4byte 0xFFFFF800

	thumb_func_start sub_804F5BC
sub_804F5BC: @ 0x0804F5BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0x94
	lsls r0, r0, #1
	adds r7, r6, r0
	movs r1, #0
	mov r8, r1
	mov sl, r1
	ldr r2, _0804F6A8 @ =gCamera
	mov sb, r2
_0804F5D8:
	adds r0, r6, #0
	adds r0, #0xe
	mov r3, r8
	adds r2, r0, r3
	ldrb r0, [r2]
	cmp r0, #0
	beq _0804F68A
	adds r1, r6, #0
	adds r1, #0x1e
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0804F5FC
	strb r0, [r2]
_0804F5FC:
	mov r0, r8
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x70
	adds r4, r0, r2
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	adds r0, r6, #0
	adds r0, #0x74
	adds r5, r0, r2
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	mov r0, sl
	cmp r0, #0
	bne _0804F632
	movs r1, #1
	mov sl, r1
	adds r0, r7, #0
	bl UpdateSpriteAnimation
_0804F632:
	adds r0, r7, #0
	bl DisplaySprite
	ldr r1, [r4]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r4]
	mov r3, r8
	lsls r2, r3, #2
	adds r0, r6, #0
	adds r0, #0x2e
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r1, r0
	str r1, [r4]
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	bl sub_802C6E4
	movs r1, #0x82
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0804F68A
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r5]
	asrs r2, r2, #8
	adds r0, r7, #0
	movs r3, #0
	bl sub_804F010
	cmp r0, #1
	bne _0804F68A
	bl sub_802BA8C
_0804F68A:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0xf
	bls _0804F5D8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F6A8: .4byte gCamera

	thumb_func_start sub_804F6AC
sub_804F6AC: @ 0x0804F6AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	ldr r0, _0804F740 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F744 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	lsls r3, r3, #0x16
	lsrs r5, r3, #0x16
	movs r3, #0
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	lsls r0, r0, #1
	ldr r6, _0804F748 @ =gSineTable
	adds r0, r0, r6
	mov sl, r0
_0804F6DE:
	mov r0, ip
	adds r0, #0xe
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804F750
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r3
	movs r1, #0xff
	strb r1, [r0]
	lsls r2, r3, #2
	mov r1, ip
	adds r1, #0x2e
	adds r1, r1, r2
	mov r7, sl
	movs r6, #0
	ldrsh r0, [r7, r6]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	mov r1, ip
	adds r1, #0x30
	adds r1, r1, r2
	lsls r0, r5, #1
	ldr r7, _0804F748 @ =gSineTable
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	lsls r1, r3, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r6, r8
	str r6, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r7, sb
	str r7, [r0]
	ldr r0, _0804F74C @ =0x00000129
	bl m4aSongNumStart
	b _0804F75A
	.align 2, 0
_0804F740: .4byte gCurTask
_0804F744: .4byte IWRAM_START + 0x654
_0804F748: .4byte gSineTable
_0804F74C: .4byte 0x00000129
_0804F750:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0804F6DE
_0804F75A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_804F768
sub_804F768: @ 0x0804F768
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	ldr r0, _0804F7B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F7B4 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r4, #0
	ldr r3, _0804F7B8 @ =IWRAM_START + 0x662
	adds r5, r0, r3
	ldr r7, _0804F7BC @ =gSineTable
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
_0804F78C:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F838
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0804F7C0
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r0, r0, #1
	mov r2, ip
	ldrh r2, [r2, #0xc]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r2, r1, #0
	b _0804F7D0
	.align 2, 0
_0804F7B0: .4byte gCurTask
_0804F7B4: .4byte IWRAM_START + 0x654
_0804F7B8: .4byte IWRAM_START + 0x662
_0804F7BC: .4byte gSineTable
_0804F7C0:
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #1
	mov r3, ip
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0804F7D0:
	ldr r1, _0804F834 @ =0x000003FF
	adds r0, r1, #0
	ands r3, r0
	adds r1, r5, r4
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x2e
	adds r1, r1, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	mov r1, ip
	adds r1, #0x30
	adds r1, r1, r2
	lsls r0, r3, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	lsls r1, r4, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r3, r8
	str r3, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r5, sb
	str r5, [r0]
	movs r0, #0xf3
	bl m4aSongNumStart
	b _0804F842
	.align 2, 0
_0804F834: .4byte 0x000003FF
_0804F838:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0804F78C
_0804F842:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804F850
sub_804F850: @ 0x0804F850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	ldr r0, _0804F8C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F8C8 @ =IWRAM_START + 0x654
	adds r4, r0, r1
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r7, _0804F8CC @ =IWRAM_START + 0x662
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804F886:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804F8AA
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804F886
_0804F8AA:
	cmp r3, #8
	bne _0804F8B0
	movs r5, #1
_0804F8B0:
	cmp r5, #0
	beq _0804F9A2
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804F8D0
	adds r0, r6, #0
	adds r0, #0x3c
	b _0804F8D4
	.align 2, 0
_0804F8C4: .4byte gCurTask
_0804F8C8: .4byte IWRAM_START + 0x654
_0804F8CC: .4byte IWRAM_START + 0x662
_0804F8D0:
	adds r0, r6, #0
	subs r0, #0x3c
_0804F8D4:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0804F9B4 @ =0x000003FF
	ands r6, r0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0xe
	str r0, [sp, #0x10]
	adds r1, r4, #0
	adds r1, #0x1e
	str r1, [sp, #0x14]
	adds r2, r4, #0
	adds r2, #0x2e
	str r2, [sp, #0x18]
	adds r7, r4, #0
	adds r7, #0x30
	str r7, [sp, #0x1c]
	movs r0, #0x70
	adds r0, r0, r4
	mov sl, r0
	adds r4, #0x74
	mov sb, r4
	movs r1, #0x80
	lsls r1, r1, #1
	mov ip, r1
	adds r0, r6, r1
	lsls r0, r0, #1
	ldr r2, _0804F9B8 @ =gSineTable
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	mov r8, r0
_0804F91A:
	mov r7, sp
	adds r0, r7, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r4, [sp, #0x14]
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r3, r2, #2
	ldr r7, [sp, #0x18]
	adds r4, r7, r3
	mov r0, r8
	strh r0, [r4]
	ldr r1, [sp, #0x1c]
	adds r3, r1, r3
	lsls r0, r6, #1
	ldr r7, _0804F9B8 @ =gSineTable
	adds r0, r0, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	lsls r0, r5, #7
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _0804F9B8 @ =gSineTable
	adds r0, r0, r1
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	lsls r0, r5, #8
	ldr r4, _0804F9B8 @ =gSineTable
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r2, r2, #3
	mov r4, sl
	adds r0, r4, r2
	ldr r7, [sp, #8]
	str r7, [r0]
	add r2, sb
	ldr r0, [sp, #0xc]
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804F91A
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804F9A2:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9B4: .4byte 0x000003FF
_0804F9B8: .4byte gSineTable

	thumb_func_start sub_804F9BC
sub_804F9BC: @ 0x0804F9BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r0, _0804F9FC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FA00 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r5, #0
	ldr r3, _0804FA04 @ =IWRAM_START + 0x662
	adds r2, r0, r3
	ldr r6, _0804FA08 @ =gSineTable
_0804F9DC:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FA8C
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0804FA0C
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r7, ip
	ldrh r7, [r7, #0xc]
	adds r0, r0, r7
	b _0804FA18
	.align 2, 0
_0804F9FC: .4byte gCurTask
_0804FA00: .4byte IWRAM_START + 0x654
_0804FA04: .4byte IWRAM_START + 0x662
_0804FA08: .4byte gSineTable
_0804FA0C:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	mov r3, ip
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
_0804FA18:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r7, _0804FA84 @ =0x000003FF
	adds r0, r7, #0
	ands r4, r0
	adds r1, r2, r5
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r5
	movs r1, #0xff
	strb r1, [r0]
	lsls r3, r5, #2
	mov r2, ip
	adds r2, #0x2e
	adds r2, r2, r3
	adds r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
	mov r2, ip
	adds r2, #0x30
	adds r2, r2, r3
	lsls r0, r4, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
	lsls r1, r5, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r7, sb
	str r7, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	ldr r0, _0804FA88 @ =0x00000115
	bl m4aSongNumStart
	b _0804FA96
	.align 2, 0
_0804FA84: .4byte 0x000003FF
_0804FA88: .4byte 0x00000115
_0804FA8C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804F9DC
_0804FA96:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804FAA4
sub_804FAA4: @ 0x0804FAA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0804FB18 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FB1C @ =IWRAM_START + 0x654
	adds r4, r0, r1
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x16
	mov ip, r3
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r6, _0804FB20 @ =IWRAM_START + 0x662
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804FADC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FB00
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FADC
_0804FB00:
	cmp r3, #8
	bne _0804FB06
	movs r5, #1
_0804FB06:
	cmp r5, #0
	beq _0804FBFC
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FB24
	mov r0, ip
	adds r0, #0x46
	b _0804FB28
	.align 2, 0
_0804FB18: .4byte gCurTask
_0804FB1C: .4byte IWRAM_START + 0x654
_0804FB20: .4byte IWRAM_START + 0x662
_0804FB24:
	mov r0, ip
	subs r0, #0x46
_0804FB28:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _0804FB88 @ =0x000003FF
	mov r1, ip
	ands r1, r0
	mov ip, r1
	movs r7, #0
	adds r2, r4, #0
	adds r2, #0xe
	str r2, [sp, #0x10]
	adds r3, r4, #0
	adds r3, #0x1e
	str r3, [sp, #0x14]
	adds r6, r4, #0
	adds r6, #0x2e
	str r6, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x30
	str r1, [sp, #0x1c]
	movs r2, #0x70
	adds r2, r2, r4
	mov sl, r2
	adds r4, #0x74
	mov sb, r4
	ldr r3, _0804FB8C @ =gSineTable
	mov r8, r3
_0804FB5E:
	mov r6, sp
	adds r0, r6, r7
	ldrb r6, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r6
	movs r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	adds r1, r2, r6
	movs r0, #0xff
	strb r0, [r1]
	cmp r7, #3
	bhi _0804FB90
	lsls r0, r7, #4
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r5, r0, #4
	b _0804FBA4
	.align 2, 0
_0804FB88: .4byte 0x000003FF
_0804FB8C: .4byte gSineTable
_0804FB90:
	subs r0, r7, #4
	lsls r1, r0, #4
	mov r3, ip
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x14
	lsrs r5, r1, #0x10
_0804FBA4:
	ldr r0, _0804FC0C @ =0x000003FF
	ands r4, r0
	lsls r2, r6, #2
	ldr r1, [sp, #0x18]
	adds r3, r1, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r5
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	ldr r3, [sp, #0x1c]
	adds r2, r3, r2
	lsls r0, r4, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2]
	lsls r1, r6, #3
	mov r6, sl
	adds r0, r6, r1
	ldr r2, [sp, #8]
	str r2, [r0]
	add r1, sb
	ldr r3, [sp, #0xc]
	str r3, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _0804FB5E
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804FBFC:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC0C: .4byte 0x000003FF

	thumb_func_start sub_804FC10
sub_804FC10: @ 0x0804FC10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x10]
	ldr r0, _0804FC88 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FC8C @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r6, #0
_0804FC34:
	mov r1, sp
	movs r4, #0
	movs r3, #0
	movs r2, #0
	mov r5, ip
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _0804FC4A
	strb r4, [r1]
	adds r1, #1
	movs r3, #1
_0804FC4A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FC6E
	mov r0, ip
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FC4A
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FC4A
_0804FC6E:
	cmp r3, #8
	bne _0804FC74
	movs r4, #1
_0804FC74:
	cmp r4, #0
	beq _0804FD40
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FC90
	ldr r0, [sp, #0x10]
	adds r0, #0x28
	b _0804FC94
	.align 2, 0
_0804FC88: .4byte gCurTask
_0804FC8C: .4byte IWRAM_START + 0x654
_0804FC90:
	ldr r0, [sp, #0x10]
	subs r0, #0x28
_0804FC94:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0804FD50 @ =0x000003FF
	ands r2, r0
	movs r5, #0
	mov r0, ip
	adds r0, #0xe
	str r0, [sp, #0x1c]
	mov r1, ip
	adds r1, #0x1e
	str r1, [sp, #0x20]
	mov r3, ip
	adds r3, #0x2e
	str r3, [sp, #0x14]
	movs r0, #0x30
	add r0, ip
	mov sl, r0
	movs r1, #0x70
	add r1, ip
	mov sb, r1
	movs r3, #0x74
	add r3, ip
	mov r8, r3
	adds r6, #1
	str r6, [sp, #0x18]
	ldr r1, _0804FD54 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r7, [r0, r3]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r6, [r0, r1]
_0804FCDE:
	mov r3, sp
	adds r0, r3, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x1c]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, [sp, #0x20]
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r5, #6
	lsls r3, r2, #2
	ldr r1, [sp, #0x14]
	adds r4, r1, r3
	movs r1, #0x80
	lsls r1, r1, #3
	subs r1, r1, r0
	adds r0, r7, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r4]
	add r3, sl
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	lsls r2, r2, #3
	mov r3, sb
	adds r0, r3, r2
	ldr r1, [sp, #8]
	str r1, [r0]
	add r2, r8
	ldr r3, [sp, #0xc]
	str r3, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804FCDE
	ldr r5, [sp, #0x18]
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bhi _0804FD3A
	b _0804FC34
_0804FD3A:
	movs r0, #0x9c
	bl m4aSongNumStart
_0804FD40:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD50: .4byte 0x000003FF
_0804FD54: .4byte gSineTable

	thumb_func_start sub_804FD58
sub_804FD58: @ 0x0804FD58
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r0, _0804FDF4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FDF8 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r5, #0
	ldr r6, _0804FDFC @ =gSineTable
_0804FD74:
	mov r0, ip
	adds r0, #0xe
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804FE0C
	ldr r0, _0804FE00 @ =gUnknown_080D8EE0
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r2, r2, #5
	ldr r3, _0804FE04 @ =0x0000FFC0
	adds r2, r2, r3
	mov r7, ip
	ldrh r7, [r7, #0xc]
	adds r2, r2, r7
	lsls r2, r2, #0x16
	lsrs r2, r2, #0x16
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r5
	movs r1, #0xff
	strb r1, [r0]
	lsls r4, r5, #2
	mov r3, ip
	adds r3, #0x2e
	adds r3, r3, r4
	adds r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	mov r3, ip
	adds r3, #0x30
	adds r3, r3, r4
	lsls r2, r2, #1
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	lsls r1, r5, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r2, sb
	str r2, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r3, r8
	str r3, [r0]
	ldr r0, _0804FE08 @ =0x0000011F
	bl m4aSongNumStart
	b _0804FE16
	.align 2, 0
_0804FDF4: .4byte gCurTask
_0804FDF8: .4byte IWRAM_START + 0x654
_0804FDFC: .4byte gSineTable
_0804FE00: .4byte gUnknown_080D8EE0
_0804FE04: .4byte 0x0000FFC0
_0804FE08: .4byte 0x0000011F
_0804FE0C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804FD74
_0804FE16:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804FE24
sub_804FE24: @ 0x0804FE24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804FED4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FED8 @ =IWRAM_START + 0x1C
	adds r6, r0, r1
	ldrh r0, [r5, #8]
	subs r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804FE9A
	ldr r0, _0804FEDC @ =sub_804FEFC
	str r0, [r5]
	movs r0, #0x65
	strh r0, [r5, #8]
	ldr r2, _0804FEE0 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804FEE4 @ =0x00196225
	muls r0, r1, r0
	ldr r3, _0804FEE8 @ =0x3C6EF35F
	adds r0, r0, r3
	str r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	bl Mod
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0804FEEC @ =gUnknown_080D89AC
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r5, #4]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r4, r5, r1
	ldr r2, _0804FEF0 @ =gUnknown_080D89C8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r2, [r1, #6]
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r5, r3
	strb r2, [r0]
	ldrb r0, [r1, #8]
	ldr r2, _0804FEF4 @ =0x0000014D
	adds r1, r5, r2
	strb r0, [r1]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
_0804FE9A:
	adds r4, r5, #0
	adds r4, #0xf0
	ldr r0, [r6, #0x24]
	asrs r0, r0, #8
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	ldr r2, _0804FEF8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r6, #0x28]
	asrs r0, r0, #8
	ldrh r6, [r6, #0x22]
	adds r0, r0, r6
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	adds r0, r5, #0
	bl sub_804F5BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FED4: .4byte gCurTask
_0804FED8: .4byte IWRAM_START + 0x1C
_0804FEDC: .4byte sub_804FEFC
_0804FEE0: .4byte gPseudoRandom
_0804FEE4: .4byte 0x00196225
_0804FEE8: .4byte 0x3C6EF35F
_0804FEEC: .4byte gUnknown_080D89AC
_0804FEF0: .4byte gUnknown_080D89C8
_0804FEF4: .4byte 0x0000014D
_0804FEF8: .4byte gCamera

	thumb_func_start sub_804FEFC
sub_804FEFC: @ 0x0804FEFC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0804FF90 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FF94 @ =IWRAM_START + 0x1C
	adds r4, r0, r1
	ldrh r0, [r7, #8]
	subs r0, #1
	strh r0, [r7, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804FF22
	ldr r0, _0804FF98 @ =sub_804FF9C
	str r0, [r7]
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #8]
_0804FF22:
	ldrh r0, [r7, #8]
	movs r1, #6
	bl Mod
	cmp r0, #0
	bne _0804FF80
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r6, [r4, #0x24]
	adds r6, r6, r0
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r5, [r4, #0x28]
	adds r5, r5, r0
	ldr r0, [sp, #4]
	subs r0, r0, r5
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	subs r1, r1, r6
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r7, #0xa]
	ldrh r1, [r7, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r2, r1, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r7, #0xa]
	ldr r4, [r7, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r4
_0804FF80:
	adds r0, r7, #0
	bl sub_804F5BC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FF90: .4byte gCurTask
_0804FF94: .4byte IWRAM_START + 0x1C
_0804FF98: .4byte sub_804FF9C

	thumb_func_start sub_804FF9C
sub_804FF9C: @ 0x0804FF9C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0805001C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050020 @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805000C
	adds r1, r4, #0
	adds r1, #0xf0
	ldr r0, _08050024 @ =0x000002CD
	strh r0, [r1, #0xa]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08050028 @ =0x00000111
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	ldr r2, [r5, #0x24]
	adds r2, r2, r0
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	ldr r1, [r5, #0x28]
	adds r1, r1, r0
	ldr r0, [sp, #4]
	subs r0, r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r4, #0xc]
	ldr r0, _0805002C @ =sub_804FE24
	str r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #8]
_0805000C:
	adds r0, r4, #0
	bl sub_804F5BC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805001C: .4byte gCurTask
_08050020: .4byte IWRAM_START + 0x1C
_08050024: .4byte 0x000002CD
_08050028: .4byte 0x00000111
_0805002C: .4byte sub_804FE24

	thumb_func_start sub_8050030
sub_8050030: @ 0x08050030
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	mov ip, r0
	adds r4, r6, #4
	movs r1, #0x3a
	adds r1, r1, r6
	mov r8, r1
	ldrh r3, [r6, #0x2e]
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r5, [r6, #0x30]
	lsrs r2, r5, #0xc
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050062
	movs r1, #1
	mov sl, r1
_08050062:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r7, _080500FC @ =0x00000FFF
	ands r7, r5
	ands r2, r1
	ldrh r0, [r6, #0x2c]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _080500B0
	movs r5, #0
	adds r2, r4, #0
	lsls r1, r3, #1
_08050080:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r3, ip
	adds r3, #4
	mov ip, r3
	subs r3, #4
	ldm r3!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08050080
	adds r4, r2, #0
_080500B0:
	movs r5, #0
	lsls r7, r7, #0x10
_080500B4:
	lsls r0, r5, #3
	adds r0, r4, r0
	lsrs r1, r7, #0x10
	bl sub_80859F4
	mov r1, r8
	strh r0, [r1]
	movs r3, #2
	add r8, r3
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080500B4
	ldrh r0, [r6, #0x2c]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x2c]
	ldrh r1, [r6, #0x2c]
	ldr r0, [r6, #0x30]
	adds r0, r0, r1
	ldr r1, _08050100 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x30]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080500FC: .4byte 0x00000FFF
_08050100: .4byte 0x00007FFF

	thumb_func_start sub_8050104
sub_8050104: @ 0x08050104
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	mov ip, r0
	adds r4, r6, #4
	adds r7, r6, #0
	adds r7, #0x20
	ldrh r1, [r6, #0x16]
	mov sb, r1
	movs r3, #0
	mov sl, r3
	ldr r5, [r6, #0x18]
	lsrs r2, r5, #0xc
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050134
	movs r0, #1
	mov sl, r0
_08050134:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r0, _080501CC @ =0x00000FFF
	mov r8, r0
	ands r0, r5
	mov r8, r0
	ands r2, r1
	ldrh r0, [r6, #0x14]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _08050186
	movs r5, #0
	adds r2, r4, #0
	lsls r1, r3, #1
_08050156:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r3, ip
	adds r3, #4
	mov ip, r3
	subs r3, #4
	ldm r3!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050156
	adds r4, r2, #0
_08050186:
	movs r5, #0
_08050188:
	lsls r0, r5, #3
	adds r0, r4, r0
	mov r1, r8
	bl sub_8085968
	strh r0, [r7]
	adds r7, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050188
	ldrh r0, [r6, #0x14]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x14]
	ldrh r1, [r6, #0x14]
	ldr r0, [r6, #0x18]
	adds r0, r0, r1
	ldr r1, _080501D0 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x18]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080501CC: .4byte 0x00000FFF
_080501D0: .4byte 0x00007FFF

	thumb_func_start sub_80501D4
sub_80501D4: @ 0x080501D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	mov r6, r8
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp, #0x10]
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _08050298
	ldr r2, _08050248 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r1, r0
	strh r1, [r2]
	mov r3, r8
	ldrb r4, [r3, #0xf]
	cmp r4, #0
	bne _0805026C
	ldr r5, _0805024C @ =0x000007B4
	add r5, r8
	ldr r0, [r5, #4]
	bl VramFree
	movs r0, #0x2a
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _08050250 @ =0x00000317
	strh r0, [r5, #0xa]
	ldr r0, _08050254 @ =0x000007D4
	add r0, r8
	strb r1, [r0]
	ldr r1, _08050258 @ =0x000007D5
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _0805025C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050260 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08050264 @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050268 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	movs r0, #1
	mov r4, r8
	strb r0, [r4, #0xf]
	b _0805027A
	.align 2, 0
_08050248: .4byte gUnknown_03005424
_0805024C: .4byte 0x000007B4
_08050250: .4byte 0x00000317
_08050254: .4byte 0x000007D4
_08050258: .4byte 0x000007D5
_0805025C: .4byte gDispCnt
_08050260: .4byte 0x00007FFF
_08050264: .4byte gWinRegs
_08050268: .4byte gBldRegs
_0805026C:
	mov r7, r8
	ldrb r0, [r7, #0xc]
	cmp r0, #0
	beq _0805027A
	ldr r0, _0805028C @ =0x0000FFDF
	ands r1, r0
	strh r1, [r2]
_0805027A:
	mov r0, r8
	ldrh r1, [r0, #0x10]
	ldr r0, _08050290 @ =0x0000FFFE
	ands r0, r1
	mov r1, r8
	strh r0, [r1, #0x10]
	ldr r3, _08050294 @ =gUnknown_03005424
	b _080502A4
	.align 2, 0
_0805028C: .4byte 0x0000FFDF
_08050290: .4byte 0x0000FFFE
_08050294: .4byte gUnknown_03005424
_08050298:
	ldr r0, _080502BC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	strh r1, [r0]
	adds r3, r0, #0
_080502A4:
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080502C8
	ldr r2, _080502C0 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080502C4 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	b _080502D6
	.align 2, 0
_080502BC: .4byte gUnknown_03005424
_080502C0: .4byte gDispCnt
_080502C4: .4byte 0x0000FBFF
_080502C8:
	ldr r0, _0805057C @ =gDispCnt
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r0]
_080502D6:
	ldrh r1, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080502EA
	b _0805056C
_080502EA:
	movs r7, #0x20
	ldrsh r0, [r6, r7]
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1
	ldr r2, [sp, #0x10]
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	ldrh r3, [r2, #0x3a]
	adds r7, r0, r3
	ldr r1, _08050580 @ =0x000003FF
	adds r0, r1, #0
	ands r7, r0
	ldr r3, _08050584 @ =gSineTable
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r7, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	mov r3, sl
	asrs r1, r3, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _08050590 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r0, _08050594 @ =0x000007C4
	add r0, r8
	str r5, [r0]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c
	ldr r0, [sp, #0x10]
	adds r0, #0x3a
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	adds r1, #0x42
	str r1, [sp, #0x24]
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	movs r2, #0
_08050392:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050392
	ldr r6, _08050584 @ =gSineTable
	ldr r0, _08050598 @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, _0805059C @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r2, [r3]
	mov r0, r8
	bl sub_80508C4
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080503FA
	ldr r5, _080505A0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]
	mov r4, sp
	ldrh r4, [r4, #0x18]
	strh r4, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080503FA:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _080505A4 @ =0xFFFFFF00
	adds r1, r7, r0
	ldr r0, _08050580 @ =0x000003FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0
	movs r4, #0
_0805042A:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x38
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r7, r7, r0
	ldr r0, _08050580 @ =0x000003FF
	ands r7, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _08050584 @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _08050588 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r3, r7, #1
	str r3, [sp, #0x1c]
	ldr r1, _08050584 @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080505AC @ =gUnknown_030054B8
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r7, [r5, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	adds r1, r0, #0
	strh r1, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805042A
	ldr r1, _08050584 @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	ldr r0, [sp, #0x1c]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	ldr r5, _080505B0 @ =0x000008BC
	add r5, r8
	ldr r6, _080505B4 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x24]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050580 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _0805058C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080505AC @ =gUnknown_030054B8
	strb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r3, [r6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
_0805056C:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805057C: .4byte gDispCnt
_08050580: .4byte 0x000003FF
_08050584: .4byte gSineTable
_08050588: .4byte gUnknown_080D89A5
_0805058C: .4byte gCamera
_08050590: .4byte gBgAffineRegs
_08050594: .4byte 0x000007C4
_08050598: .4byte gUnknown_03005590
_0805059C: .4byte 0x000001FF
_080505A0: .4byte 0x000007B4
_080505A4: .4byte 0xFFFFFF00
_080505A8: .4byte 0x00002060
_080505AC: .4byte gUnknown_030054B8
_080505B0: .4byte 0x000008BC
_080505B4: .4byte 0x000008F4

	thumb_func_start sub_80505B8
sub_80505B8: @ 0x080505B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r8, r0
	mov r6, r8
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp, #0x10]
	adds r0, #0x4c
	ldrb r4, [r0]
	cmp r4, #0
	bne _08050606
	movs r5, #0xf7
	lsls r5, r5, #3
	add r5, r8
	ldr r0, [r5]
	cmp r0, #0
	beq _080505FC
	bl VramFree
	str r4, [r5]
	ldr r2, _08050884 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050888 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0805088C @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050890 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
_080505FC:
	mov r2, r8
	ldrh r1, [r2, #0x10]
	ldr r0, _08050894 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #0x10]
_08050606:
	movs r3, #0x20
	ldrsh r0, [r6, r3]
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r4, #0x22
	ldrsh r0, [r6, r4]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1
	ldr r7, [sp, #0x10]
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	ldrh r1, [r7, #0x3a]
	adds r7, r0, r1
	ldr r2, _08050898 @ =0x000003FF
	adds r0, r2, #0
	ands r7, r0
	ldr r4, _0805089C @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r7, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080508A0 @ =gUnknown_080D89A5
	ldrb r3, [r0]
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r7, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r3, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r3, _080508A4 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	mov r4, sl
	asrs r1, r4, #8
	ldr r0, [r3, #4]
	subs r6, r1, r0
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _080508A8 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r2, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r1, _080508AC @ =0x000007C4
	add r1, r8
	movs r0, #0
	str r0, [r1]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c
	ldr r2, [sp, #0x10]
	adds r2, #0x3a
	str r2, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	adds r0, #0x42
	str r0, [sp, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	movs r2, #0
_080506AE:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080506AE
	ldrb r2, [r3]
	mov r0, r8
	movs r1, #0xff
	bl sub_80508C4
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080506FA
	ldr r5, _080508B0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]
	strh r6, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080506FA:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _0805089C @ =gSineTable
	ldr r4, _080508B4 @ =0xFFFFFF00
	adds r1, r7, r4
	ldr r0, _08050898 @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0
	movs r4, #0
_0805072C:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x38
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x1c]
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r7, r7, r0
	ldr r0, _08050898 @ =0x000003FF
	ands r7, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _0805089C @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _080508A0 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r3, r7, #1
	str r3, [sp, #0x18]
	ldr r1, _0805089C @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080508B8 @ =gUnknown_030054B8
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r7, [r5, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	adds r1, r0, #0
	strh r1, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805072C
	ldr r1, _0805089C @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080508A0 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	ldr r5, _080508BC @ =0x000008BC
	add r5, r8
	ldr r6, _080508C0 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x20]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050898 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080508B8 @ =gUnknown_030054B8
	strb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r3, [r6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050884: .4byte gDispCnt
_08050888: .4byte 0x00007FFF
_0805088C: .4byte gWinRegs
_08050890: .4byte gBldRegs
_08050894: .4byte 0x0000FFFE
_08050898: .4byte 0x000003FF
_0805089C: .4byte gSineTable
_080508A0: .4byte gUnknown_080D89A5
_080508A4: .4byte gCamera
_080508A8: .4byte gBgAffineRegs
_080508AC: .4byte 0x000007C4
_080508B0: .4byte 0x000007B4
_080508B4: .4byte 0xFFFFFF00
_080508B8: .4byte gUnknown_030054B8
_080508BC: .4byte 0x000008BC
_080508C0: .4byte 0x000008F4

	thumb_func_start sub_80508C4
sub_80508C4: @ 0x080508C4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _08050938
	ldr r2, _08050940 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08050944 @ =gWinRegs
	ldr r0, _08050948 @ =0x00003735
	strh r0, [r1, #0xa]
	ldr r3, _0805094C @ =gBldRegs
	ldr r0, _08050950 @ =0x00001346
	strh r0, [r3]
	lsls r1, r4, #1
	adds r1, r1, r4
	asrs r1, r1, #8
	adds r1, #0xa
	movs r2, #0xf
	ands r1, r2
	lsls r0, r4, #2
	adds r0, r0, r4
	asrs r0, r0, #8
	adds r0, #8
	ands r0, r2
	lsls r1, r1, #8
	orrs r1, r0
	strh r1, [r3, #2]
	strh r1, [r3, #4]
	ldr r0, _08050954 @ =0x000007B4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2, #0x10]
	movs r3, #0
	movs r4, #0xfe
	lsls r4, r4, #3
_0805091E:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	orrs r0, r1
	str r0, [r2, #0x10]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0805091E
_08050938:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050940: .4byte gDispCnt
_08050944: .4byte gWinRegs
_08050948: .4byte 0x00003735
_0805094C: .4byte gBldRegs
_08050950: .4byte 0x00001346
_08050954: .4byte 0x000007B4

	thumb_func_start sub_8050958
sub_8050958: @ 0x08050958
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08050A5C
	subs r0, #1
	strb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080509B0
	movs r5, #0
	ldr r0, _080509A0 @ =gFlags
	mov sl, r0
	ldr r6, _080509A4 @ =gObjPalette
	ldr r4, _080509A8 @ =gUnknown_080D8F10
	ldr r3, _080509AC @ =gBgPalette
_08050980:
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r2, r5, #1
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, r2, r3
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050980
	b _08050A4C
	.align 2, 0
_080509A0: .4byte gFlags
_080509A4: .4byte gObjPalette
_080509A8: .4byte gUnknown_080D8F10
_080509AC: .4byte gBgPalette
_080509B0:
	ldr r0, _080509F8 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r6, r0, #1
	movs r0, #0xf
	ands r6, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _08050A0C
	movs r5, #0
	ldr r1, _080509FC @ =gFlags
	mov sl, r1
	ldr r0, _08050A00 @ =gObjPalette
	mov ip, r0
	movs r7, #0xf
	ldr r4, _08050A04 @ =gUnknown_080D8EF0
	ldr r3, _08050A08 @ =gBgPalette
_080509D0:
	adds r1, r5, r6
	ands r1, r7
	adds r2, r1, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsrs r0, r0, #5
	strh r0, [r2]
	lsls r1, r1, #1
	adds r1, r1, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _080509D0
	b _08050A4C
	.align 2, 0
_080509F8: .4byte gUnknown_03005590
_080509FC: .4byte gFlags
_08050A00: .4byte gObjPalette
_08050A04: .4byte gUnknown_080D8EF0
_08050A08: .4byte gBgPalette
_08050A0C:
	movs r5, #0
	ldr r1, _08050A6C @ =gFlags
	mov sl, r1
	ldr r0, _08050A70 @ =gObjPalette
	mov sb, r0
	ldr r1, _08050A74 @ =gUnknown_080D8EF0
	mov r8, r1
	ldr r0, _08050A78 @ =gBgPalette
	mov ip, r0
	movs r7, #0xf
_08050A20:
	adds r3, r5, r6
	ands r3, r7
	adds r4, r3, #0
	adds r4, #0x80
	lsls r4, r4, #1
	add r4, sb
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r2, r1, #5
	lsrs r0, r1, #5
	orrs r2, r0
	orrs r2, r1
	strh r2, [r4]
	lsls r3, r3, #1
	add r3, ip
	strh r2, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050A20
_08050A4C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	mov r1, sl
	str r0, [r1]
_08050A5C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050A6C: .4byte gFlags
_08050A70: .4byte gObjPalette
_08050A74: .4byte gUnknown_080D8EF0
_08050A78: .4byte gBgPalette

	thumb_func_start TaskDestructor_TrueArea53BossGfx
TaskDestructor_TrueArea53BossGfx: @ 0x08050A7C
	push {r4, r5, r6, r7, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r1, _08050B1C @ =gIntrTable+8
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08050A94
	bl VramFree
_08050A94:
	movs r4, #0
	ldr r0, _08050B20 @ =IWRAM_START + 0xCC
	adds r7, r5, r0
	ldr r1, _08050B24 @ =gIntrMainBuf + 4
	adds r5, r5, r1
_08050A9E:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050A9E
	movs r4, #0
_08050AB8:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r7, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08050AB8
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xad
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc5
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xe9
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08050B28 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050B1C: .4byte gIntrTable + 8
_08050B20: .4byte IWRAM_START + 0xCC
_08050B24: .4byte gIntrMainBuf + 4
_08050B28: .4byte gActiveBossTask

	thumb_func_start sub_8050B2C
sub_8050B2C: @ 0x08050B2C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08050B40 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	bne _08050B44
	str r0, [r6]
	str r0, [r7]
	b _08050BA2
	.align 2, 0
_08050B40: .4byte gActiveBossTask
_08050B44:
	ldrh r1, [r0, #6]
	ldr r0, _08050BA8 @ =IWRAM_START + 0x1C
	adds r1, r1, r0
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	lsls r0, r0, #8
	ldr r3, [r1, #0x24]
	adds r3, r3, r0
	movs r5, #0x22
	ldrsh r0, [r1, r5]
	lsls r0, r0, #8
	ldr r2, [r1, #0x28]
	adds r2, r2, r0
	ldr r4, _08050BAC @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r2, r2, r0
	movs r5, #0x26
	adds r0, r1, #0
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r2, r2, r0
	str r3, [r6]
	str r2, [r7]
_08050BA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050BA8: .4byte IWRAM_START + 0x1C
_08050BAC: .4byte gSineTable

	thumb_func_start sub_8050BB0
sub_8050BB0: @ 0x08050BB0
	push {lr}
	movs r2, #0
	ldr r0, _08050BD4 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08050BCC
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08050BCC
	movs r2, #1
_08050BCC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08050BD4: .4byte gActiveBossTask

	thumb_func_start sub_8050BD8
sub_8050BD8: @ 0x08050BD8
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BE4
sub_8050BE4: @ 0x08050BE4
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BF0
sub_8050BF0: @ 0x08050BF0
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BFC
sub_8050BFC: @ 0x08050BFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08050C20
	ldr r0, [r4, #0x30]
	ldr r1, _08050C44 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r1, _08050C48 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x24]
	str r0, [r4]
	ldr r0, [r1, #0x28]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #0x2c]
	strh r0, [r4, #0x2e]
_08050C20:
	ldr r1, [r4, #0x30]
	ldr r0, _08050C4C @ =0x00001FFF
	cmp r1, r0
	bls _08050C3C
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	ldr r1, [r4, #0x48]
	subs r1, #0x57
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x44]
_08050C3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050C44: .4byte 0x00000FFF
_08050C48: .4byte gUnknown_080D8D6C
_08050C4C: .4byte 0x00001FFF

	thumb_func_start sub_8050C50
sub_8050C50: @ 0x08050C50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08050CA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CAC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	adds r1, #0x57
	str r1, [r4, #0x48]
	cmp r1, #0
	bne _08050CA2
	ldr r2, _08050CB0 @ =0x00000FFF
	str r1, [r4, #0x30]
	ldr r1, _08050CB4 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r4]
	ldr r0, [r1, #4]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r1, _08050CB8 @ =gUnknown_080D8DCC
	ldr r0, [r1]
	str r0, [r5]
	ldr r0, [r1, #4]
	str r0, [r5, #0x1c]
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x16]
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStop
_08050CA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050CA8: .4byte gCurTask
_08050CAC: .4byte IWRAM_START + 0x1C
_08050CB0: .4byte 0x00000FFF
_08050CB4: .4byte gUnknown_080D8D6C
_08050CB8: .4byte gUnknown_080D8DCC

	thumb_func_start sub_8050CBC
sub_8050CBC: @ 0x08050CBC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050CE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CEC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050CF0 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08050CF4
	ldr r0, [r5, #0x24]
	subs r0, #0xc0
	str r0, [r5, #0x24]
	b _08050D12
	.align 2, 0
_08050CE8: .4byte gCurTask
_08050CEC: .4byte IWRAM_START + 0x1C
_08050CF0: .4byte IWRAM_START + 0x558
_08050CF4:
	cmp r0, #3
	bne _08050D12
	ldr r0, _08050D18 @ =0x00000FFF
	ands r1, r0
	str r1, [r4, #0x30]
	ldr r0, _08050D1C @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x48]
	str r1, [r4]
	ldr r1, [r0, #0x4c]
	str r1, [r4, #0x34]
	adds r0, #0x50
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, _08050D20 @ =sub_804F108
	str r0, [r6]
_08050D12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D18: .4byte 0x00000FFF
_08050D1C: .4byte gUnknown_080D8D6C
_08050D20: .4byte sub_804F108

	thumb_func_start sub_8050D24
sub_8050D24: @ 0x08050D24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050D80 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050D84 @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050D88 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08050D78
	ldr r2, _08050D8C @ =0x00000FFF
	ands r1, r2
	str r1, [r4, #0x30]
	ldr r0, _08050D90 @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x54]
	str r1, [r4]
	ldr r1, [r0, #0x58]
	str r1, [r4, #0x34]
	adds r0, #0x5c
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r0, _08050D94 @ =gUnknown_080D8DCC
	ldr r1, [r0, #0x3c]
	str r1, [r5]
	ldr r1, [r0, #0x40]
	str r1, [r5, #0x1c]
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	ldr r0, _08050D98 @ =sub_8050DC8
	str r0, [r6]
_08050D78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D80: .4byte gCurTask
_08050D84: .4byte IWRAM_START + 0x1C
_08050D88: .4byte IWRAM_START + 0x558
_08050D8C: .4byte 0x00000FFF
_08050D90: .4byte gUnknown_080D8D6C
_08050D94: .4byte gUnknown_080D8DCC
_08050D98: .4byte sub_8050DC8

	thumb_func_start sub_8050D9C
sub_8050D9C: @ 0x08050D9C
	push {lr}
	ldr r1, _08050DBC @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	ldr r1, _08050DC0 @ =IWRAM_START + 0x1C
	adds r2, r2, r1
	ldr r1, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r2, #0x24]
	bl sub_8050030
	pop {r0}
	bx r0
	.align 2, 0
_08050DBC: .4byte gCurTask
_08050DC0: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_8050DC4
sub_8050DC4: @ 0x08050DC4
	bx lr
	.align 2, 0

	thumb_func_start sub_8050DC8
sub_8050DC8: @ 0x08050DC8
	adds r3, r0, #0
	movs r0, #0x3c
	str r0, [r3, #8]
	movs r1, #0
	movs r0, #0xb4
	strh r0, [r3, #6]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r0, _08050DF4 @ =0x000002CE
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	bx lr
	.align 2, 0
_08050DF4: .4byte 0x000002CE

	thumb_func_start sub_8050DF8
sub_8050DF8: @ 0x08050DF8
	push {lr}
	bl sub_804F5BC
	pop {r0}
	bx r0
	.align 2, 0
