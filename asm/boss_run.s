.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.align 2, 0

    .global gUnknown_080D87D8
gUnknown_080D87D8:
    .incbin "baserom.gba", 0x000D87D8, 0xE

    .global gUnknown_080D87E6
gUnknown_080D87E6:
    .incbin "baserom.gba", 0x000D87E6, 0x22

    .global gUnknown_080D8808
gUnknown_080D8808:
    .incbin "baserom.gba", 0x000D8808, 0x38

    .global gUnknown_080D8840
gUnknown_080D8840:
    .incbin "baserom.gba", 0x000D8840, 0x18

    .global gUnknown_080D8858
gUnknown_080D8858:
    .incbin "baserom.gba", 0x000D8858, 0xC

    .global gUnknown_080D8864
gUnknown_080D8864:
    .incbin "baserom.gba", 0x000D8864, 0x10

    .global gUnknown_080D8874
gUnknown_080D8874:
    .incbin "baserom.gba", 0x000D8874, 0x14

.text
.syntax unified
.arm

	thumb_func_start sub_804A070
sub_804A070: @ 0x0804A070
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #5
	adds r6, r5, r0
	movs r0, #0x30
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _0804A1A8 @ =0x0000015F
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A0A8
	lsls r0, r7, #3
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r5, r2
	adds r1, r1, r0
	ldr r0, _0804A1AC @ =0xFFFFF800
	str r0, [r1]
_0804A0A8:
	lsls r2, r7, #3
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov ip, r1
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov sl, r0
	mov r0, ip
	ldr r0, [r0]
	mov sb, r0
	mov r1, sl
	ldr r0, [r1]
	add r0, sb
	asrs r0, r0, #8
	mov ip, r0
	mov r3, ip
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov sb, r1
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov r2, sb
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r2, r1, #8
	adds r4, r2, #0
	ldr r1, _0804A1B0 @ =gCamera
	ldr r0, [r1]
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	subs r0, r4, r0
	strh r0, [r6, #0x18]
	ldr r4, _0804A1B4 @ =gPlayer
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0804A136
	str r4, [sp]
	str r1, [sp, #4]
	adds r0, r6, #0
	mov r1, ip
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	beq _0804A136
	ldr r0, [r4, #0xc]
	ldr r1, _0804A1AC @ =0xFFFFF800
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldr r0, _0804A1B8 @ =0x0000FC80
	strh r0, [r4, #0x12]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r1, #9
	movs r0, #6
	strb r0, [r1]
_0804A136:
	ldr r2, _0804A1A8 @ =0x0000015F
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A17E
	movs r0, #0x84
	lsls r0, r0, #1
	bl m4aSongNumStart
	lsls r1, r7, #1
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A17E
	ldr r3, _0804A1BC @ =gUnknown_080D8858
	movs r0, #0xad
	lsls r0, r0, #1
	adds r2, r5, r0
	adds r2, r2, r7
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A17E:
	adds r0, r6, #0
	bl DisplaySprite
	ldrh r0, [r6, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r6, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1A8: .4byte 0x0000015F
_0804A1AC: .4byte 0xFFFFF800
_0804A1B0: .4byte gCamera
_0804A1B4: .4byte gPlayer
_0804A1B8: .4byte 0x0000FC80
_0804A1BC: .4byte gUnknown_080D8858

	thumb_func_start sub_804A1C0
sub_804A1C0: @ 0x0804A1C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #5
	add r0, r8
	mov sb, r0
	adds r0, #0x30
	str r0, [sp, #0x20]
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, r8
	adds r2, r0, r3
	ldr r0, [r2]
	rsbs r0, r0, #0
	str r0, [sp, #0x24]
	ldr r7, _0804A378 @ =0x0000015F
	add r7, r8
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A200
	ldr r0, _0804A37C @ =0xFFFFF800
	str r0, [r2]
_0804A200:
	ldr r2, [r2]
	ldr r1, [sp, #0x24]
	adds r1, r1, r2
	str r1, [sp, #0x24]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, r8
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A380 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r2, #0x18]
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A2EC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x3c
	beq _0804A258
	str r4, [sp, #0x28]
	cmp r0, #0x32
	bne _0804A2B6
_0804A258:
	movs r7, #0
	str r4, [sp, #0x28]
	adds r3, r6, #0
	subs r3, #0x10
	str r3, [sp, #0x2c]
	mov r4, sp
	movs r2, #0
_0804A266:
	lsls r0, r7, #6
	ldr r1, _0804A384 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r0, r0, r5
	subs r0, #0x14
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r4, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	movs r0, #0x30
	strh r0, [r4, #0x1c]
	adds r0, #0xd0
	strh r0, [r4, #0xe]
	adds r0, #0x20
	add r0, r8
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, _0804A388 @ =0x000002C3
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	str r2, [sp, #4]
	mov r0, sp
	ldr r1, _0804A38C @ =0x0000015D
	add r1, r8
	str r2, [sp, #0x30]
	bl CreateBossParticleStatic
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [sp, #0x30]
	cmp r7, #7
	bls _0804A266
_0804A2B6:
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	ldr r2, [sp, #0x28]
	adds r4, r0, r2
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A2EC
	ldr r3, _0804A390 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, r8
	add r2, sl
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A2EC:
	ldr r0, _0804A394 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A320
	ldr r0, [r4, #0x3c]
	cmp r0, sb
	bne _0804A320
	ldr r0, [r4, #0xc]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r1, [sp, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A320
	ldr r0, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #8]
_0804A320:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A34E
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A34E
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A34E:
	mov r0, sb
	bl DisplaySprite
	mov r2, sb
	ldrh r0, [r2, #0x16]
	ldr r3, [sp, #0x20]
	strh r0, [r3, #0x16]
	ldrh r0, [r2, #0x18]
	adds r0, #0x40
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x20]
	bl DisplaySprite
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A378: .4byte 0x0000015F
_0804A37C: .4byte 0xFFFFF800
_0804A380: .4byte gCamera
_0804A384: .4byte gSineTable
_0804A388: .4byte 0x000002C3
_0804A38C: .4byte 0x0000015D
_0804A390: .4byte gUnknown_080D8858
_0804A394: .4byte gPlayer

	thumb_func_start sub_804A398
sub_804A398: @ 0x0804A398
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	mov sl, r0
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r4, #0x30
	adds r4, r4, r7
	mov r8, r4
	mov r0, sb
	lsls r3, r0, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	str r1, [sp, #0xc]
	rsbs r4, r1, #0
	str r4, [sp]
	ldr r0, _0804A528 @ =0x0000015F
	add r0, ip
	str r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A406
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r4, _0804A52C @ =gSineTable
	adds r0, r0, r4
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #7
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	str r0, [r2]
_0804A406:
	ldr r2, [r2]
	ldr r4, [sp]
	adds r4, r4, r2
	str r4, [sp]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A530 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804A480
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	mov r1, sl
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A480
	ldr r3, _0804A534 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A480:
	ldr r0, _0804A538 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A4B8
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A4B8
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A4B8
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A4B8:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A4E6
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A4E6
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A4E6:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r4, r8
	strh r0, [r4, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A528: .4byte 0x0000015F
_0804A52C: .4byte gSineTable
_0804A530: .4byte gCamera
_0804A534: .4byte gUnknown_080D8858
_0804A538: .4byte gPlayer

	thumb_func_start sub_804A53C
sub_804A53C: @ 0x0804A53C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	str r0, [sp]
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	mov r1, sb
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	rsbs r0, r1, #0
	mov sl, r0
	ldr r4, _0804A6A4 @ =0x0000015F
	add r4, ip
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A588
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r2]
_0804A588:
	ldr r2, [r2]
	add sl, r2
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A6A8 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A5FC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [sp]
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A5FC
	ldr r3, _0804A6AC @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A5FC:
	ldr r0, _0804A6B0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A632
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A632
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	add r0, sl
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A632
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A632:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A660
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A660
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A660:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A6A4: .4byte 0x0000015F
_0804A6A8: .4byte gCamera
_0804A6AC: .4byte gUnknown_080D8858
_0804A6B0: .4byte gPlayer

	thumb_func_start sub_804A6B4
sub_804A6B4: @ 0x0804A6B4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
