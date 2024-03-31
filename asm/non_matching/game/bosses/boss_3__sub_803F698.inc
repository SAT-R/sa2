.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0     @ r6 = totem
	adds r5, r6, #0     @ r5 = s
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
	bl DisplaySprite
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r5, r6, r0     @ r5 = s = &totem->spr2A8;
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
	bl DisplaySprite
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
	bl DisplaySprite
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
	adds r4, r6, r0     @ r4 = &totem->unk3C[i]
	lsls r0, r7, #6
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r5, r6, r0     @ r5 = s = &totem->spr188[i];
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8          @ r2 = r8 = gCamera
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
	bl DisplaySprite
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	cmp r1, #0
	beq _0803F7FE           @ if(t3c->unk17 != 0)
	ldrb r0, [r4, #0x14]
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r5, r6, r2         @ r5 = &totem->spr248[1]
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
	bl DisplaySprite
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
	bl DisplaySprite
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
	bl DisplaySprite
_0803F868:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F874: .4byte gCamera

.syntax divided
