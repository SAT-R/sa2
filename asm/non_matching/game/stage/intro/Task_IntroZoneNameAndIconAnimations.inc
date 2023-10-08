.include "constants/gba_constants.inc"
.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0802FFC8 @ =gCurTask
	ldr r1, [r0]
	ldrh r6, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov ip, r0          @ ip = sit_d
	ldr r0, [r0]
	ldr r3, [r0]        @ r3 = counter
	adds r0, r3, #0
	subs r0, #0xa
	cmp r0, #0x7c
	bls _0803004E
	cmp r3, #0xc7
	bls _0802FFCC
	adds r0, r1, #0
	bl TaskDestroy
	b _0803029C
	.align 2, 0
_0802FFC8: .4byte gCurTask
_0802FFCC:
	cmp r3, #0x95
	bhi _0802FFD2
	b _0803029C
_0802FFD2:
	ldr r0, _08030018 @ =IWRAM_START + 0x1B4
	adds r5, r6, r0
	cmp r3, #0x96
	bne _08030030
	ldr r2, _0803001C @ =sColoredTriangle
	ldr r1, _08030020 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	movs r3, #0
	movs r4, #0
	strh r0, [r5, #0xa]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r1, [r0, #6]
	ldr r2, _08030024 @ =IWRAM_START + 0x1D4
	adds r0, r6, r2
	strb r1, [r0]
	ldr r7, _08030028 @ =IWRAM_START + 0x1D9
	adds r0, r6, r7
	strb r3, [r0]
	ldr r0, _0803002C @ =IWRAM_START + 0x1D5
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xf0
	strh r0, [r5, #0x16]
	movs r0, #0xa0
	strh r0, [r5, #0x18]
	str r4, [r5, #0x10]
	b _08030040
	.align 2, 0
_08030018: .4byte IWRAM_START + 0x1B4
_0803001C: .4byte sColoredTriangle
_08030020: .4byte gSelectedCharacter
_08030024: .4byte IWRAM_START + 0x1D4
_08030028: .4byte IWRAM_START + 0x1D9
_0803002C: .4byte IWRAM_START + 0x1D5
_08030030:
	cmp r3, #0xbd
	bls _08030040
	ldrh r0, [r5, #0x16]
	adds r0, #4
	strh r0, [r5, #0x16]
	ldrh r0, [r5, #0x18]
	adds r0, #4
	strh r0, [r5, #0x18]
_08030040:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	b _0803029C
_0803004E:
	subs r3, #9
	ldr r1, _08030074 @ =IWRAM_START + 0x1B4
	adds r5, r6, r1
	cmp r3, #0xc
	bhi _08030078
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r1, #0xfe
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #2
	subs r0, r0, r3
	b _080300A4
	.align 2, 0
_08030074: .4byte IWRAM_START + 0x1B4
_08030078:
	cmp r3, #0x64
	bhi _08030086
	movs r0, #0x18
	strh r0, [r5, #0x16]
	movs r0, #0x4a
	strh r0, [r5, #0x18]
	b _080300AE
_08030086:
	adds r2, r3, #0
	subs r2, #0x58
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r1, #0xfe
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
_080300A4:
	lsls r0, r0, #3
	lsrs r0, r0, #8
	movs r1, #0x79
	subs r1, r1, r0
	strh r1, [r5, #0x18]
_080300AE:
	movs r4, #0
	lsls r2, r3, #0x18
	str r2, [sp, #8]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r7, #0x8e
	lsls r7, r7, #1
	mov r8, r7
	mov r1, r8          @ r1 = r8 = 284
	subs r0, r1, r0
	mov sl, r0
	movs r6, #0
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #2
	subs r0, r0, r3
	lsls r0, r0, #3
	lsrs r0, r0, #8
	movs r7, #0x7f
	subs r0, r7, r0
	mov sb, r0
	adds r2, r3, #0
	subs r2, #0x58
_080300E4:
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r6, r1
	mov r1, ip          @ r1 = ip = sit_d
	adds r5, r1, r0     @ r5 = s = &sit_d->sprZoneName[i];
	cmp r3, #0xc
	bhi _080300FC
	mov r0, sl
	strh r0, [r5, #0x16]
	mov r1, sb
	strh r1, [r5, #0x18]
	b _0803012A
_080300FC:
	cmp r3, #0x64
	bhi _08030108
	movs r0, #0x36
	strh r0, [r5, #0x16]
	movs r0, #0x50
	b _08030128
_08030108:
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #6
	lsrs r1, r1, #8
	mov r0, r8
	subs r1, r0, r1
	strh r1, [r5, #0x16]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #3
	lsrs r0, r0, #8
	subs r0, r7, r0
_08030128:
	strh r0, [r5, #0x18]
_0803012A:
	cmp r4, #3
	bne _08030134
	ldrh r0, [r5, #0x16]
	subs r0, #0x18
	strh r0, [r5, #0x16]
_08030134:
	adds r6, #0x30
	adds r4, #1
	cmp r4, #3
	bls _080300E4
	ldr r1, [sp, #8]        
	lsrs r2, r1, #0x18      @ r2 = (u8)counter
	movs r4, #0
	movs r7, #1
	mov r8, r7              @ r8 = 1
	movs r0, #0x14
	mov sl, r0              @ sl = 20
	movs r1, #0xc
	mov sb, r1              @ sb = 12
	adds r0, r3, #0
	subs r0, #0x64          @ r0 = (counter - 100)
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #1
	subs r1, #0x16
	str r1, [sp, #0xc]      @ sp0C = sp08*10 - 22
	adds r6, r2, #0         @ r6 = sp08
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r7, sl
	subs r7, r7, r1
	str r7, [sp]            @ sp = 20 - (counter - 100)*6
	mov r0, sb
	subs r0, r0, r1
	str r0, [sp, #4]
_08030170:
	movs r0, #8
	subs r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, #4
	mov r7, ip
	adds r5, r7, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	adds r1, #0x43
	strh r1, [r5, #0x16]
	movs r0, #0x16
	rsbs r0, r0, #0
	strh r0, [r5, #0x18]
	cmp r2, #0x31       @ sp08 < 50
	bhi _080301C8
	lsls r1, r4, #1
	cmp r2, r1
	blo _080301F8
	adds r0, r4, #0     @ r0 = i
	mov r7, r8
	ands r0, r7
	cmp r0, #0
	bne _080301B2
	cmp r6, #4
	bhi _080301AC
	mov r0, sp
	ldrh r0, [r0, #0xc] @ s->y = [sp, #0xc]
	b _080301F6
_080301AC:
	mov r1, sl
	strh r1, [r5, #0x18]
	b _080301F8
_080301B2:
	subs r1, r2, r1     @ r1 = (sp08 - i*2)
	cmp r1, #4
	bhi _080301C2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #0x16
	b _080301F6
_080301C2:
	mov r7, sb
	strh r7, [r5, #0x18]
	b _080301F8
_080301C8:
	cmp r3, #0x63
	bhi _080301E0
	adds r0, r4, #0     @ r0 = r4 = i
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080301DC
	mov r7, sl
	strh r7, [r5, #0x18]
	b _080301F8
_080301DC:
	mov r0, sb
	b _080301F6
_080301E0:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080301F2
	mov r7, sp
	ldrh r7, [r7]
	strh r7, [r5, #0x18]
	b _080301F8
_080301F2:
	mov r0, sp
	ldrh r0, [r0, #4]
_080301F6:
	strh r0, [r5, #0x18]
_080301F8:
	ldr r1, [sp, #0xc]
	subs r1, #0x14
	str r1, [sp, #0xc]
	subs r6, #2
	adds r4, #1
	cmp r4, #8
	bls _08030170
	movs r5, #0xa9
	lsls r5, r5, #2
	add r5, ip
	movs r0, #0x24
	strh r0, [r5, #0x16]
	cmp r3, #0x10
	bhi _0803021C
	ldr r0, _08030218 @ =0x0000FFD0
	b _08030240
	.align 2, 0
_08030218: .4byte 0x0000FFD0
_0803021C:
	cmp r3, #0x19
	bhi _0803022C
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	subs r0, #0x28
	b _08030240
_0803022C:
	cmp r3, #0x64
	bhi _08030234
	movs r0, #0x20
	b _08030240
_08030234:
	adds r1, r3, #0
	subs r1, #0x64
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	movs r0, #0x20
	subs r0, r0, r1
_08030240:
	strh r0, [r5, #0x18]
	movs r5, #0xb5
	lsls r5, r5, #2
	add r5, ip
	ldr r2, _08030268 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	movs r0, #0x23
	strh r0, [r5, #0x16]
	cmp r3, #0x10
	bhi _08030270
	ldr r0, _0803026C @ =0x0000FFCF
	b _08030296
	.align 2, 0
_08030268: .4byte gUnknown_030054B8
_0803026C: .4byte 0x0000FFCF
_08030270:
	cmp r3, #0x19
	bhi _08030280
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	subs r0, #0x29
	b _08030296
_08030280:
	cmp r3, #0x64
	bhi _0803028A
	strh r0, [r5, #0x16]
	movs r0, #0x20
	b _08030296
_0803028A:
	adds r1, r3, #0
	subs r1, #0x64
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	movs r0, #0x20
	subs r0, r0, r1
_08030296:
	strh r0, [r5, #0x18]
	bl StageIntroUpdateIcons
_0803029C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
