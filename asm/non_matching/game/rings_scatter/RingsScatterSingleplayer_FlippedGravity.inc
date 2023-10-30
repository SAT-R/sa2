.include "constants/gba_constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0801FFDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]        @ sp04 = rs
	ldr r0, _0801FFE0 @ =IWRAM_START + 0x30
	adds r5, r1, r0         @ r5 = ring = &rings[0]
	ldr r2, [sp, #4]
	mov sb, r2              @ sb = s
	ldr r4, _0801FFE4 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _0801FFE8 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]          @ sp0C = rings->unk2B4
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	movs r2, #0x1f
	str r2, [sp, #0x14]
_0801FEB8_loop:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0801FEC0
	b _08020180_continue
_0801FEC0:
	movs r4, #8
	ldrsh r0, [r5, r4]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r0, #0xa
	ldrsh r2, [r5, r0]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r7, r1, #8             @ r7 = ringIntX = Q_24_8_TO_INT(ring->x)
	asrs r0, r0, #8
	mov r8, r0                  @ r8 = ringIntY = Q_24_8_TO_INT(ring->y)
	ldr r1, _0801FFEC @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	str r0, [sp, #0x18]         @ sp18 = screenX
	ldr r0, [r1, #4]
	mov r2, r8
	subs r2, r2, r0
	mov sl, r2                  @ sl = screenY
	ldr r4, _0801FFF0 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]                @ r2 = unk90
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _0801FEFC
	b _08020008
_0801FEFC:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0801FF12
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801FF12
	b _08020008
_0801FF12:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020008       @ IS_ALIVE(p)
	adds r6, r2, #0
	adds r6, #0x38      @ r6 = hb = &p->unk90->s.hitboxes[0].left
	adds r2, r7, #0
	subs r2, #8         @ r2 = (ringIntX - TILE_WIDTH)
	ldr r0, [r4, #8]
	asrs r0, r0, #8     @ r0 = Q_24_8_TO_INT(p->x)
	movs r3, #0
	ldrsb r3, [r6, r3]  @ r3 = unk90->s.hitboxes[0].left
	adds r1, r0, r3     @ r1 = (r0 + r3)
	cmp r2, r1      @ ( (ringIntX - TILE_WIDTH) > HB_LEFT(p, hb) )
	bgt _0801FF3E
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1      @ ( (ringIntX + TILE_WIDTH) <
	bge _0801FF4A
	cmp r2, r1      @ ( (ringIntX - TILE_WIDTH) >= HB_LEFT(p)
	blt _08020008
_0801FF3E:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3     @ r0 = HB_WIDTH(hb)
	adds r0, r1, r0     @ r0 = HB_LEFT(hb) + HB_WIDTH(hb)
	cmp r0, r2
	blt _08020008
_0801FF4A:
	mov r2, r8          @ r2 = r8 = ringIntY
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0801FF64
	cmp r8, r1
	bge _0801FF70
	cmp r2, r1
	blt _08020008
_0801FF64:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020008
_0801FF70:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _0801FFF4 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _0801FFF8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0801FFC4
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0801FFC4
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801FFC4
	ldr r1, _08020000 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0801FFBC
	movs r0, #0xff
_0801FFBC:
	strb r0, [r1]
	ldr r1, _08020004 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0801FFC4:
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801FFD8
	ldr r1, _0801FFF4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0801FFD8
	movs r0, #0xff
	strh r0, [r1]
_0801FFD8:
	movs r0, #0
	b _0802017E
	.align 2, 0
_0801FFDC: .4byte gCurTask
_0801FFE0: .4byte IWRAM_START + 0x30
_0801FFE4: .4byte IWRAM_START + 0x2B0
_0801FFE8: .4byte IWRAM_START + 0x2B4
_0801FFEC: .4byte gCamera
_0801FFF0: .4byte gPlayer
_0801FFF4: .4byte gRingCount
_0801FFF8: .4byte gCurrentLevel
_0801FFFC: .4byte gGameMode
_08020000: .4byte gNumLives
_08020004: .4byte gUnknown_030054A8
_08020008:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _08020046
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020046
	mov r0, r8          @ r0 = r8 = ringIntY
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _080200EC @ =sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0     @ r1 = r7 = ringIntX
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020046
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020046:
	ldr r2, [sp, #4]        @ r2 = sp04 = rs
	ldr r4, _080200F0 @ =0x000002B6
	adds r0, r2, r4
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020090
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _08020090
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020090
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _080200EC @ =sub_801EC3C
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020090
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020090:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]     @ r0 = sp18 = screenX
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020166
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _08020166
	mov r2, sl              @ r2 = sl = screenY
	cmp r2, #0xa7
	bgt _08020166
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080200C0
	ldr r0, _080200F4 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020166
_080200C0:
	mov r2, sb              @ r2 = sb = s
	adds r2, #0x23
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _080200D2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080200F8
_080200D2:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0, #0x18]    @ r1 = sp18 =screenX
	mov r0, sb
	strh r1, [r0, #0x16]
	mov r2, sl
	strh r2, [r0, #0x18]
	bl DisplaySprite
	movs r4, #1
	str r4, [sp, #0x10]
	b _08020166
	.align 2, 0
_080200EC: .4byte sub_801EC3C
_080200F0: .4byte 0x000002B6
_080200F4: .4byte gStageTime
_080200F8:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080201A0 @ =gUnknown_030022D0
	adds r4, r0, r1         @ r4 = oam = gUnknown_030022D0[s->oamBaseIndex];
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _080201A4 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020166
	ldr r1, _080201A8 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _080201AC @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl          @ r4 = sl = screenY
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb          @ r4 = sb = s
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _080201B0 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020166:
	ldrh r1, [r5, #0x10]
	ldr r2, _080201B4 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_0802017E:
	strh r0, [r5, #0xc]
_08020180_continue:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _0802018E
	b _0801FEB8_loop
_0802018E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080201A0: .4byte gUnknown_030022D0
_080201A4: .4byte iwram_end
_080201A8: .4byte 0x040000D4
_080201AC: .4byte 0x80000003
_080201B0: .4byte 0x000001FF
_080201B4: .4byte 0x0000FFFC

.syntax divided
