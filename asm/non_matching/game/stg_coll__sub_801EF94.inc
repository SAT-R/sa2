.include "constants/gba_constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0         @ r6 = p1
	mov sb, r2              @ sb = layer
	asrs r4, r0, #3         @ r4 = p0 / 8
	ldr r5, _0801EFB0 @ =IWRAM_START + 0x410
	ldr r0, [r5]
	cmp r0, r4
	bne _0801EFB4
	ldr r7, [r5, #8]
	ldr r0, [r5, #4]
	b _0801EFCC
	.align 2, 0
_0801EFB0: .4byte IWRAM_START + 0x410
_0801EFB4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	str r4, [r5]
	str r0, [r5, #4]
	str r1, [r5, #8]
	adds r7, r1, #0
_0801EFCC:
	mov r8, r0
	asrs r4, r6, #3
	ldr r6, _0801EFE0 @ =IWRAM_START + 0x420
	ldr r0, [r6]
	cmp r0, r4
	bne _0801EFE4
	ldr r5, [r6, #8]
	ldr r3, [r6, #4]
	b _0801EFFE
	.align 2, 0
_0801EFE0: .4byte IWRAM_START + 0x420
_0801EFE4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	adds r3, r0, #0
	str r4, [r6]
	str r3, [r6, #4]
	str r1, [r6, #8]
	adds r5, r1, #0
_0801EFFE:
	ldr r0, _0801F040 @ =gUnknown_030059C8
	ldr r4, [r0]
	mov r1, sb
	lsls r0, r1, #2
	adds r1, r4, #0         @ r1 = &gUnknown_030059C8[p2]
	adds r1, #0xc
	adds r1, r1, r0
	ldrh r0, [r4, #0x18]
	muls r0, r3, r0
	add r0, r8
	ldr r1, [r1]            @ r1 = gUnknown_030059C8[p2].map_front
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]           @ r2 = mtIndex
	lsls r1, r5, #3
	lsls r0, r5, #2
	adds r1, r1, r0
	adds r1, r1, r7         @ r1 = mapIndex2 = (r5 * TILES_PER_METATILE_AXIS + r7)
	lsls r3, r2, #8         @ r3 = mtIndex * 256
	lsls r2, r2, #5         @ r2 = mtIndex * 32
	lsls r1, r1, #1
	ldr r0, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F040: .4byte gUnknown_030059C8

    .syntax divided
