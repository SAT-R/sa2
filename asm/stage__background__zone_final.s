.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageInit_ZoneFinal_0
StageInit_ZoneFinal_0: @ 0x0801DF08
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r1, _0801DFE0 @ =gDispCnt
	ldr r2, _0801DFE4 @ =0x00001141
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0801DFE8 @ =gUnknown_03004D80
	movs r5, #0
	strb r5, [r0, #2]
	ldr r1, _0801DFEC @ =gUnknown_03002280
	strb r5, [r1, #8]
	strb r5, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	mov sb, r0
	mov r2, sb
	strb r2, [r1, #0xb]
	ldr r4, _0801DFF0 @ =gUnknown_03005850 + 0x80
	ldr r0, _0801DFF4 @ =gBgCntRegs
	mov r8, r0
	ldr r0, _0801DFF8 @ =0x00001A89
	mov r1, r8
	strh r0, [r1, #4]
	ldr r6, _0801DFFC @ =gUnknown_080D5864
	adds r1, r6, #0
	adds r1, #0x80
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	ldr r0, _0801E000 @ =0x00000177
	strh r0, [r4, #0x1c]
	ldr r0, _0801E004 @ =0x06008000
	str r0, [r4, #4]
	ldr r0, _0801E008 @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0xa
	strh r0, [r4, #0x26]
	movs r0, #9
	strh r0, [r4, #0x28]
	ldrh r0, [r4, #0x2e]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	subs r4, #0x80
	ldr r0, _0801E00C @ =0x00001E07
	mov r2, r8
	strh r0, [r2]
	adds r6, #0xc0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xba
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _0801E010 @ =0x06004000
	str r0, [r4, #4]
	ldr r0, _0801E014 @ =0x0600F000
	str r0, [r4, #0xc]
	mov r0, sb
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	strh r5, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	ldr r0, _0801E018 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r5, [r0, #0xe]
	movs r2, #0
	ldr r4, _0801E01C @ =gBgPalette
	ldr r3, _0801E020 @ =gUnknown_080D5CC2
_0801DFB6:
	lsls r0, r2, #1
	adds r1, r0, r4
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0801DFB6
	ldr r0, _0801E024 @ =gFlags
	ldr r1, [r0]
	movs r2, #1
	orrs r1, r2
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFE0: .4byte gDispCnt
_0801DFE4: .4byte 0x00001141
_0801DFE8: .4byte gUnknown_03004D80
_0801DFEC: .4byte gUnknown_03002280
_0801DFF0: .4byte gUnknown_03005850 + 0x80
_0801DFF4: .4byte gBgCntRegs
_0801DFF8: .4byte 0x00001A89
_0801DFFC: .4byte gUnknown_080D5864
_0801E000: .4byte 0x00000177
_0801E004: .4byte 0x06008000
_0801E008: .4byte 0x0600D000
_0801E00C: .4byte 0x00001E07
_0801E010: .4byte 0x06004000
_0801E014: .4byte 0x0600F000
_0801E018: .4byte gBgScrollRegs
_0801E01C: .4byte gBgPalette
_0801E020: .4byte gUnknown_080D5CC2
_0801E024: .4byte gFlags
