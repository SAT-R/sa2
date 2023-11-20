.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

   .global gUnknown_080D7A18
gUnknown_080D7A18:
    .incbin "baserom.gba", 0x000D7A18, 0x10

    .global gUnknown_080D7A28
gUnknown_080D7A28:
    .incbin "baserom.gba", 0x000D7A28, 0x10

    .global gUnknown_080D7A38
gUnknown_080D7A38:
    .incbin "baserom.gba", 0x000D7A38, 0x20

    .global gUnknown_080D7A58
gUnknown_080D7A58:
    .incbin "baserom.gba", 0x000D7A58, 0x20

    .global gUnknown_080D7A78
gUnknown_080D7A78:
    .incbin "baserom.gba", 0x000D7A78, 0x20

    .global gUnknown_080D7A98
gUnknown_080D7A98:
    .incbin "baserom.gba", 0x000D7A98, 0xA

    .global gUnknown_080D7AA2
gUnknown_080D7AA2:
    .incbin "baserom.gba", 0x000D7AA2, 0x6

    .global gUnknown_080D7AA8
gUnknown_080D7AA8:
    .4byte sub_803CAC8, sub_803B018

    .global gUnknown_080D7AB0
gUnknown_080D7AB0:
    .4byte sub_803B17C, sub_803B264, sub_803CB84, sub_803B2F8
    .4byte sub_803CBA4, sub_803B4A0, sub_803B57C, sub_803B62C

    .global gUnknown_080D7AD0
gUnknown_080D7AD0:
    .incbin "baserom.gba", 0x000D7AD0, 0x40

.text
.syntax unified
.arm


	thumb_func_start sub_803CA40
sub_803CA40: @ 0x0803CA40
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803CAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r2, r0, r1
	ldr r0, _0803CAAC @ =IWRAM_START + 0x9C
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r6, _0803CAB0 @ =sub_801EC3C
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	ldr r0, [r4]
	ldr r1, _0803CAB4 @ =0xFFFFEA00
	adds r2, r0, r1
	ldr r0, _0803CAB8 @ =IWRAM_START + 0x98
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	movs r0, #0
	b _0803CABE
	.align 2, 0
_0803CAA8: .4byte gCurTask
_0803CAAC: .4byte IWRAM_START + 0x9C
_0803CAB0: .4byte sub_801EC3C
_0803CAB4: .4byte 0xFFFFEA00
_0803CAB8: .4byte IWRAM_START + 0x98
_0803CABC:
	movs r0, #1
_0803CABE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

@; Refd in gUnknown_080D7AA8
	thumb_func_start sub_803CAC8
sub_803CAC8: @ 0x0803CAC8
	push {lr}
	ldr r0, _0803CB0C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldrh r0, [r1, #0xa]
	adds r0, #0x40
	strh r0, [r1, #0xa]
	ldr r0, _0803CB10 @ =IWRAM_START + 0x9C
	adds r3, r2, r0
	ldr r0, [r3]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _0803CB14 @ =IWRAM_START + 0x98
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803CB00
	str r1, [r3]
_0803CB00:
	ldr r0, [r2]
	cmp r0, r1
	ble _0803CB08
	str r1, [r2]
_0803CB08:
	pop {r0}
	bx r0
	.align 2, 0
_0803CB0C: .4byte gCurTask
_0803CB10: .4byte IWRAM_START + 0x9C
_0803CB14: .4byte IWRAM_START + 0x98

	thumb_func_start sub_803CB18
sub_803CB18: @ 0x0803CB18
	push {r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x4c]
	adds r1, #8
	ldr r2, _0803CB74 @ =0x000003FF
	ands r1, r2
	str r1, [r0, #0x4c]
	ldr r2, _0803CB78 @ =gSineTable
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [r0, #0x50]
	str r1, [r0, #0x2c]
	movs r4, #1
	adds r5, r0, #0
	adds r5, #0x2c
	ldr r0, _0803CB7C @ =gUnknown_080D7A28
	mov ip, r0
	ldr r6, _0803CB80 @ =0xFFFFF400
_0803CB40:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	adds r0, r0, r6
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803CB40
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB74: .4byte 0x000003FF
_0803CB78: .4byte gSineTable
_0803CB7C: .4byte gUnknown_080D7A28
_0803CB80: .4byte 0xFFFFF400

	thumb_func_start sub_803CB84
sub_803CB84: @ 0x0803CB84
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0xac
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _0803CBA0
	movs r0, #0x3c
	str r0, [r2]
	adds r1, #0xa0
	movs r0, #3
	str r0, [r1]
_0803CBA0:
	pop {r0}
	bx r0

	thumb_func_start sub_803CBA4
sub_803CBA4: @ 0x0803CBA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xac
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _0803CBF6
	ldr r2, _0803CBD8 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803CBDC @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803CBE0 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0803CBE4
	movs r0, #0x44
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #5
	b _0803CBF4
	.align 2, 0
_0803CBD8: .4byte gPseudoRandom
_0803CBDC: .4byte 0x00196225
_0803CBE0: .4byte 0x3C6EF35F
_0803CBE4:
	movs r0, #0xef
	bl m4aSongNumStart
	movs r0, #0x3c
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #6
_0803CBF4:
	str r0, [r1]
_0803CBF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_803CBFC
sub_803CBFC: @ 0x0803CBFC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0xb2
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CC2E
	movs r0, #0xde
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _0803CC34 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803CC38 @ =0x00000399
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803CC2E:
	pop {r0}
	bx r0
	.align 2, 0
_0803CC34: .4byte 0x00000275
_0803CC38: .4byte 0x00000399

	thumb_func_start sub_803CC3C
sub_803CC3C: @ 0x0803CC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r2, #0xb1
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803CC90
	movs r4, #0
	ldr r0, _0803CC9C @ =gFlags
	mov r8, r0
	ldr r1, _0803CCA0 @ =gObjPalette
	mov ip, r1
	ldr r7, _0803CCA4 @ =gUnknown_080D7AD0
	adds r5, r2, #0
	movs r6, #4
_0803CC5C:
	adds r3, r4, #0
	adds r3, #0x80
	lsls r3, r3, #1
	add r3, ip
	lsls r1, r4, #1
	ldrb r2, [r5]
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0803CC5C
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
_0803CC90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC9C: .4byte gFlags
_0803CCA0: .4byte gObjPalette
_0803CCA4: .4byte gUnknown_080D7AD0
