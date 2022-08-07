.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r0, _0805BE8C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r4, [r0, #6]
	ldr r0, _0805BE90 @ =gWinRegs
	movs r2, #0
	mov r1, r8
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0, #6]
	ldr r0, _0805BE94 @ =gDispCnt
	movs r3, #0x40
	strh r3, [r0]
	ldr r1, _0805BE98 @ =gBgCntRegs
	ldr r0, _0805BE9C @ =0x00005E0B
	strh r0, [r1, #6]
	ldr r0, _0805BEA0 @ =gBldRegs
	mov r1, r8
	strh r1, [r0]
	strh r1, [r0, #4]
	ldr r0, _0805BEA4 @ =gUnknown_030054D4
	strb r2, [r0, #3]
	strb r2, [r0, #2]
	strb r2, [r0, #1]
	strb r2, [r0]
	ldr r0, _0805BEA8 @ =gUnknown_03004D80
	strb r2, [r0, #3]
	ldr r0, _0805BEAC @ =gUnknown_03002280
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	movs r1, #0xff
	strb r1, [r0, #0xe]
	strb r3, [r0, #0xf]
	mov r2, r8
	str r2, [sp, #4]
	ldr r1, _0805BEB0 @ =0x040000D4
	add r3, sp, #4
	str r3, [r1]
	ldr r0, _0805BEB4 @ =0x06009FE0
	str r0, [r1, #4]
	ldr r0, _0805BEB8 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0805BEBC @ =sub_805C0F0
	movs r1, #0x82
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	mov r3, r8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _0805BEC0 @ =IWRAM_START + 0x200
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	movs r6, #0
	ldr r2, _0805BEC4 @ =gUnknown_030055B8
	ldrb r0, [r2]
	movs r1, #1
	b _0805BED2
	.align 2, 0
_0805BE8C: .4byte gLoadedSaveGame
_0805BE90: .4byte gWinRegs
_0805BE94: .4byte gDispCnt
_0805BE98: .4byte gBgCntRegs
_0805BE9C: .4byte 0x00005E0B
_0805BEA0: .4byte gBldRegs
_0805BEA4: .4byte gUnknown_030054D4
_0805BEA8: .4byte gUnknown_03004D80
_0805BEAC: .4byte gUnknown_03002280
_0805BEB0: .4byte 0x040000D4
_0805BEB4: .4byte 0x06009FE0
_0805BEB8: .4byte 0x85000010
_0805BEBC: .4byte sub_805C0F0
_0805BEC0: .4byte IWRAM_START + 0x200
_0805BEC4: .4byte gUnknown_030055B8
_0805BEC8:
	adds r6, #1
	cmp r6, #3
	bhi _0805BED8
	ldrb r0, [r2]
	asrs r0, r6
_0805BED2:
	ands r0, r1
	cmp r0, #0
	bne _0805BEC8
_0805BED8:
	ldr r3, _0805BEFC @ =0x00000202
	adds r0, r5, r3
	strb r6, [r0]
	ldr r1, _0805BF00 @ =0x00000203
	adds r0, r5, r1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _0805BF04
	movs r0, #0x81
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xde
	strb r0, [r1]
	b _0805BF10
	.align 2, 0
_0805BEFC: .4byte 0x00000202
_0805BF00: .4byte 0x00000203
_0805BF04:
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r5, r1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
_0805BF10:
	ldr r0, _0805BFD8 @ =0x06008000
	str r0, [r5, #4]
	movs r3, #0
	movs r1, #0
	strh r1, [r5, #0xa]
	ldr r0, _0805BFDC @ =0x0600F000
	str r0, [r5, #0xc]
	strh r1, [r5, #0x18]
	strh r1, [r5, #0x1a]
	ldr r2, _0805BFE0 @ =gUnknown_080D92A8
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
	strh r1, [r5, #0x1e]
	strh r1, [r5, #0x20]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r0, #0x1e
	strh r0, [r5, #0x26]
	movs r0, #0x20
	strh r0, [r5, #0x28]
	adds r0, r5, #0
	adds r0, #0x2a
	strb r3, [r0]
	movs r0, #3
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl sub_8002A3C
	mov r3, r8
	cmp r3, #3
	bhi _0805BF7A
	ldr r2, _0805BFE4 @ =gUnknown_030054B4
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805BF7A
_0805BF64:
	movs r0, #1
	add r8, r0
	mov r3, r8
	cmp r3, #3
	bhi _0805BF7A
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _0805BF64
_0805BF7A:
	movs r6, #0
	movs r7, #0
	ldr r1, _0805BFE8 @ =gUnknown_080D9100
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #0
	mov sl, r0
	mov sb, r0
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #0xc]
_0805BF94:
	ldr r0, _0805BFEC @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0805BFA4
	b _0805C0B0
_0805BFA4:
	mov r0, sl
	adds r0, #0x80
	adds r2, r5, r0
	movs r0, #0xc8
	strh r0, [r2, #0x16]
	mov r0, sb
	adds r0, #0x33
	strh r0, [r2, #0x18]
	lsls r0, r6, #0xb
	ldr r3, _0805BFF0 @ =0x06010000
	adds r0, r0, r3
	str r0, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r7, [r2, #8]
	ldr r0, _0805BFE4 @ =gUnknown_030054B4
	adds r0, r6, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #5
	bne _0805BFF4
	ldrh r0, [r4, #0xc]
	strh r0, [r2, #0xa]
	ldrb r1, [r4, #0xe]
	b _0805BFFE
	.align 2, 0
_0805BFD8: .4byte 0x06008000
_0805BFDC: .4byte 0x0600F000
_0805BFE0: .4byte gUnknown_080D92A8
_0805BFE4: .4byte gUnknown_030054B4
_0805BFE8: .4byte gUnknown_080D9100
_0805BFEC: .4byte gUnknown_030055B8
_0805BFF0: .4byte 0x06010000
_0805BFF4:
	cmp r1, #4
	bne _0805C006
	ldrh r0, [r4, #0x14]
	strh r0, [r2, #0xa]
	ldrb r1, [r4, #0x16]
_0805BFFE:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0805C02E
_0805C006:
	mov r0, r8
	cmp r0, #2
	beq _0805C014
	ldr r0, _0805C01C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _0805C020
_0805C014:
	ldrh r0, [r4, #4]
	strh r0, [r2, #0xa]
	ldrb r0, [r4, #6]
	b _0805C026
	.align 2, 0
_0805C01C: .4byte gGameMode
_0805C020:
	ldrh r0, [r4, #0x1c]
	strh r0, [r2, #0xa]
	ldrb r0, [r4, #0x1e]
_0805C026:
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x20
	strb r0, [r1]
_0805C02E:
	strh r7, [r2, #0x14]
	strh r7, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	movs r3, #0xff
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r7, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, sl
	adds r2, r5, r0
	strh r7, [r2, #0x16]
	mov r0, sb
	adds r0, #0x1f
	strh r0, [r2, #0x18]
	ldr r1, [sp, #0xc]
	ldr r3, _0805C0E8 @ =0x06010000
	adds r0, r1, r3
	str r0, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r7, [r2, #8]
	ldr r0, _0805C0EC @ =gUnknown_080D9288
	lsls r1, r6, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	strh r7, [r2, #0x14]
	strh r7, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	movs r3, #0xff
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r7, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
_0805C0B0:
	movs r0, #0x30
	add sl, r0
	movs r1, #0x20
	add sb, r1
	ldr r2, [sp, #0xc]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	str r2, [sp, #0xc]
	adds r6, #1
	cmp r6, #3
	bhi _0805C0CA
	b _0805BF94
_0805C0CA:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0805C0D6
	movs r0, #0x3b
	bl m4aSongNumStart
_0805C0D6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C0E8: .4byte 0x06010000
_0805C0EC: .4byte gUnknown_080D9288

	
.syntax divided
