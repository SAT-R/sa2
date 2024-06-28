.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc8
	ldr r2, _0804D2A8 @ =gStageFlags
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]		@ gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU
	ldr r4, _0804D2AC @ =gActiveBossTask
	ldr r0, [r4]
	cmp r0, #0
	bne _0804CEF8
	ldr r0, _0804D2B0 @ =Task_TrueArea53BossMain
	movs r1, #0x94
	lsls r1, r1, #4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0804D2B4 @ =TaskDestructor_TrueArea53BossGfx
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]		@ gActiveBossTask = TaskCreate(Task_TrueArea53BossMain, ...)
_0804CEF8:
	ldr r0, [r4]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	str r0, [sp, #4]        @ sp04 = boss
	ldr r0, _0804D2B8 @ =IWRAM_START + 0x1C
	adds r2, r4, r0			@ r2 = &boss->unk1C
	ldr r1, _0804D2BC @ =IWRAM_START + 0x48
	adds r6, r4, r1			@ r6 = &boss->unk48
	ldr r5, _0804D2C0 @ =IWRAM_START + 0x98
	adds r5, r4, r5			@ r5 = &boss->unk98
	str r5, [sp, #8]		@ sp08 = unk98 = &boss->unk98
	ldr r7, _0804D2C4 @ =IWRAM_START + 0x558
	adds r7, r7, r4
	mov r8, r7				@ r8 = r7 = boss->unk558
	ldr r0, _0804D2C8 @ =IWRAM_START + 0x594
	adds r7, r4, r0         @ r7 = &boss->unk594
	ldr r1, _0804D2CC @ =IWRAM_START + 0x654
	adds r1, r4, r1
	str r1, [sp, #0xc]      @ sp0C = &boss->unk654
	movs r3, #0
	movs r0, #0xc
	ldr r5, [sp, #4]        @ r5 = boss
	strb r0, [r5, #0xc]
	strb r3, [r5, #0xd]
	movs r1, #0
	movs r0, #1
	mov sb, r0              @ sb = 1
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
	mov r5, r8				@ r5 = r8 = &boss->unk558
	str r0, [r5]
	movs r0, #0xc8
	strh r0, [r5, #6]
	strb r1, [r5, #4]       @ r2 = &boss->unk1C
	ldr r0, [r2, #0x18]
	ldr r1, _0804D2D4 @ =0x00000FFF
	ands r0, r1
	str r0, [r2, #0x18]     @ boss->unk18 &= 0xFFF;
	ldr r1, _0804D2D8 @ =gUnknown_080D8DCC
	ldr r0, [r1]
	str r0, [r2]            @ unk1C->unk0 = gUnknown_080D8DCC;
	ldr r0, [r1, #4]
	str r0, [r2, #0x1c]     @ unk1C->unk1C = gUnknown_080D8DCC->ref;
	ldrh r1, [r1, #8]
	strh r1, [r2, #0x16]    @ unk1C->unk16 = gUnknown_080D8DCC->unk8;
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
	mov ip, r0              @ ip = 0
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
	str r0, [r6]            @ unk48->unk0 = gUnknown_080D8D6C->unkC
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
	str r1, [r6, #0x30]     @ unk48->unk30 = 0;
	mov ip, r1              @ ip = r1 = 0
	adds r0, r6, #4
	mov sl, r0              @ sl = &unk48->unk4[0]
	movs r1, #0xc
	adds r1, r1, r6         @ r1 = unk48->unkC[0]
	mov sb, r1              @ sb = r1
	adds r5, r6, #0
	adds r5, #0x14          @ r5 = &unk48->unk14[0]
	adds r3, r6, #0
	adds r3, #0x1c          @ r3 = &unk48->unk1C[0]
	adds r4, r6, #0
	adds r4, #0x24          @ r4 = &unk48->unk24[0]
	adds r2, r7, #4
	str r2, [sp, #0x1c]     @ sp1C = &unk594->unk4[0]
	adds r6, r7, #0
	adds r6, #0xe
	str r6, [sp, #0x34]     @ sp34 = &unk594->unkE[0]
	adds r0, r7, #0
	adds r0, #0x18
	str r0, [sp, #0x3c]     @ sp3C = &unk594->unk18[0]
	adds r1, r7, #0
	adds r1, #0x1a
	str r1, [sp, #0x40]     @ sp40 = &unk594->unk1A
	adds r2, #0x3c
	str r2, [sp, #0x60]     @ sp60 = &unk594->unk40
	adds r6, #0x36
	str r6, [sp, #0xc0]     @ spC0 = &unk594->unk44
	ldr r0, [sp, #0xc]      @ r0 = &boss->unk654
	adds r0, #0xe
	str r0, [sp, #0x38]     @ sp38 = &unk654->unkE
	ldr r1, [sp, #0xc]
	adds r1, #0x1e
	str r1, [sp, #0x44]     @ sp44 = &unk654->unk1E
	ldr r2, [sp, #0xc]
	adds r2, #0x2e
	str r2, [sp, #0x54]     @ sp54 = &unk654->unk2E
	ldr r6, [sp, #0xc]
	adds r6, #0x30
	str r6, [sp, #0x5c]     @ sp5C = &unk654->unk30
	ldr r0, [sp, #0xc]
	adds r0, #0x70
	str r0, [sp, #0x74]     @ sp74 = &unk654->unk70 @ someX?
	ldr r1, [sp, #0xc]
	adds r1, #0x74
	str r1, [sp, #0x78]     @ sp78 = &unk654->unk74 @ someY?
	ldr r6, _0804D2F0 @ =0x000007D4
	ldr r2, [sp, #4]
	adds r6, r2, r6
	str r6, [sp, #0x7c]     @ sp7C = &boss->spr7B4.variant
	ldr r0, _0804D2F4 @ =0x000007D5
	adds r0, r2, r0
	str r0, [sp, #0x80]     @ sp80 = &boss->spr7B4.prevVariant
	ldr r1, _0804D2F8 @ =0x000007D6
	adds r1, r2, r1
	str r1, [sp, #0x88]     @ sp88 = &boss->spr7B4.animSpeed
	ldr r6, _0804D2FC @ =0x000007D9
	adds r6, r2, r6
	str r6, [sp, #0x8c]     @ sp8C = &boss->spr7B4.palId
	mov r0, r8              @ r0 = r8 = &boss->unk558
	adds r0, #0xc           @ r0 = &boss->unk558->s @ Sprite ?
	str r0, [sp, #0x2c]     @ sp2C = &boss->unk558->s
	mov r1, r8
	adds r1, #0x2c
	str r1, [sp, #0x48]     @ sp48 = &boss->unk558->s.variant
	mov r2, r8
	adds r2, #0x2d
	str r2, [sp, #0x4c]     @ sp4C = &boss->unk558->s.prevVariant
	mov r6, r8
	adds r6, #0x2e
	str r6, [sp, #0x50]     @ sp50 = &boss->unk558->s.animSpeed
	adds r0, #0x25
	str r0, [sp, #0x58]     @ sp58 = &boss->unk558->s.palId
	adds r1, r7, #0
	adds r1, #0x90
	str r1, [sp, #0x84]     @ sp84 = &unk594->spr90
	adds r2, r7, #0
	adds r2, #0xb0
	str r2, [sp, #0x90]     @ sp90 = &unk594->spr90.variant
	adds r6, r7, #0
	adds r6, #0xb1
	str r6, [sp, #0x94]     @ sp90 = &unk594->spr90.prevVariant
	adds r0, r7, #0
	adds r0, #0xb2
	str r0, [sp, #0x98]     @ sp90 = &unk594->spr90.animSpeed
	adds r1, #0x25
	str r1, [sp, #0x9c]     @ sp90 = &unk594->spr90.animId
	ldr r2, [sp, #0xc]
	adds r2, #0xf0
	str r2, [sp, #0xa0]     @ spA0 = &unk654->sprF0
	movs r0, #0x88
	lsls r0, r0, #1
	ldr r6, [sp, #0xc]      @ r6 = sp0C = &boss->unk654
	adds r0, r6, r0
	str r0, [sp, #0x20]     @ sp20 = &unk654->sprF0.variant
	ldr r1, _0804D300 @ =0x00000111
	adds r1, r6, r1
	str r1, [sp, #0x24]     @ sp24 = &unk654->sprF0.prevVariant
	movs r2, #0x89
	lsls r2, r2, #1
	adds r2, r6, r2
	str r2, [sp, #0x28]     @ sp28 = &unk654->sprF0.animSpeed
	ldr r0, _0804D304 @ =0x00000115
	adds r0, r6, r0
	str r0, [sp, #0x30]     @ sp30 = &unk654->sprF0.palId
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r1, r6, r1
	str r1, [sp, #0x64]     @ sp64 = &unk654->sprF0.palId
	ldr r2, _0804D308 @ =0x00000149
	adds r2, r6, r2
	str r2, [sp, #0x68]     @ sp68 = &unk654->sprF0.palId
	movs r0, #0xa5
	lsls r0, r0, #1
	adds r0, r6, r0
	str r0, [sp, #0x6c]     @ sp6C = &unk654->sprF0.palId
	ldr r1, _0804D30C @ =0x0000014D
	adds r1, r6, r1
	str r1, [sp, #0x70]     @ sp70 = &unk654->sprF0.palId
_0804D0C4:
	mov r2, ip              @ r2 = ip = i = 0
	lsls r1, r2, #1
	mov r6, sl
	adds r2, r6, r1
	ldr r6, _0804D310 @ =gUnknown_080D8A1C
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]           @ unk48->unk4[i] = gUnknown_080D8A1C[i]
	mov r0, sb              @ r0 = sb = unk48->unkC[0]
	adds r2, r0, r1
	ldr r6, _0804D314 @ =gUnknown_080D8A34
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]           @ unk48->unkC[i] = gUnknown_080D8A34[i]
	adds r2, r5, r1
	ldr r6, _0804D318 @ =gUnknown_080D8A4C
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]           @ unk48->unk14[i] = gUnknown_080D8A4C[i]
	adds r2, r3, r1
	ldr r6, _0804D31C @ =gUnknown_080D8A64
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]           @ unk48->unk1C[i] = gUnknown_080D8A64[i]
	adds r2, r4, r1
	ldr r0, _0804D320 @ =gUnknown_080D8A7C
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]           @ unk48->unk24[i] = gUnknown_080D8A7C[i]
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
	strb r2, [r0]           @ unk594->unk4[i] = 0;
	adds r0, r4, r7
	strb r2, [r0]           @ unk594->unkE[i] = 0;
	lsls r0, r7, #2
	strh r2, [r3]           @ unk594->unk18[i][0] = 0;
	ldr r1, [sp, #0x40]
	adds r0, r1, r0
	strh r2, [r0]           @ unk594->unk18[i][1] = 0;
	lsls r1, r7, #3
	ldr r6, [sp, #0x60]
	adds r0, r6, r1
	str r2, [r0]            @ unk594->unk40[i].x = 0
	ldr r7, [sp, #0xc0]
	adds r1, r7, r1
	str r2, [r1]            @ unk594->unk40[i].y = 0
	adds r3, #4
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #9
	bls _0804D118
	ldr r2, _0804D328 @ =sub_804FF9C
	ldr r5, [sp, #0xc]
	str r2, [r5]            @ boss->unk654 = sub_804FF9C
	ldr r6, _0804D32C @ =sub_804F768
	str r6, [r5, #4]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #8]
	adds r0, #0xd4
	strh r0, [r5, #0xa]
	movs r7, #0
	mov sb, r7              @ sb = r7 = i = 0
	ldr r5, [sp, #0x38]     @ r5 = &unk654->unkE
	movs r2, #0
	ldr r4, [sp, #0x44]     @ r4 = &unk654->unk1E
	ldr r3, [sp, #0x54]     @ r3 = &unk654->unk2E
_0804D166:
	mov r1, sb
	adds r0, r5, r1
	strb r2, [r0]
	adds r0, r4, r1
	strb r2, [r0]
	lsls r0, r1, #2
	strh r2, [r3]
	ldr r6, [sp, #0x5c]     @ r6 = &unk654->unk30
	adds r0, r6, r0
	strh r2, [r0]
	lsls r1, r1, #3
	ldr r7, [sp, #0x74]     @ r7 = &unk654->unk70[0].x
	adds r0, r7, r1
	str r2, [r0]
	ldr r0, [sp, #0x78]     @ r0 = &unk654->unk70[0].y
	adds r1, r0, r1
	str r2, [r1]
	adds r3, #4
	movs r1, #1
	add sb, r1
	mov r6, sb
	cmp r6, #0xf
	bls _0804D166
__0804D194:
	ldr r7, _0804D330 @ =sub_804E66C
	ldr r0, [sp, #8]
	str r7, [r0]            @ unk98->unk0 = sub_804E66C
	movs r0, #0
	movs r1, #0x96
	lsls r1, r1, #1
	ldr r2, [sp, #8]        @ r2 = &boss->unk98
	strh r1, [r2, #4]       @ unk98->unk4 = 300
	adds r1, #0xd4
	strh r1, [r2, #6]       @ unk98->unk6 = 512
	str r0, [r2, #8]        @ unk98->unk8 = 0
	str r0, [r2, #0xc]      @ unk98->unkC = 0
	movs r0, #0x20
	bl VramMalloc
	str r0, [sp, #0x10]     @ sp10 = vram
	movs r5, #0
	mov sb, r5              @ sb = r5 = 0
	movs r4, #0
	ldr r6, [sp, #8]        @ r6 = unk98
	adds r6, #0x8c
	str r6, [sp, #0xa4]     @ spA4 = unk98->unk8C
	ldr r7, [sp, #8]
	adds r7, #0x88
	str r7, [sp, #0xa8]     @ spA8 = unkA8 + 0x98
	ldr r0, [sp, #8]
	adds r0, #0x74
	str r0, [sp, #0xac]
	ldr r1, [sp, #8]
	adds r1, #0x72
	str r1, [sp, #0xb0]
	ldr r2, [sp, #8]        @ r2 = unk98
	adds r2, #0x6c
	str r2, [sp, #0xb4]     @ spB4 = unkA8->unk5C
	ldr r5, [sp, #8]
	adds r5, #0x68          @ r5 = &unkA8->unk58
	str r5, [sp, #0xb8]     @ spB8 = &unkA8->unk58
	ldr r6, [sp, #8]
	adds r6, #0x51
	mov sl, r6
	ldr r7, [sp, #8]        @ r7 = unk98
	adds r7, #0x14
	mov r8, r7              @ r8 = unk98->unk10[i].unk4
	ldr r0, [sp, #8]
	adds r0, #0x10
	str r0, [sp, #0xbc]     @ spBC = unkA8 = unk98->unk10[i];
_0804D1F0:
	ldr r7, [sp, #0xbc]
	adds r7, #0x20          @ r7 = s = &unkA8->spr20
	mov r1, r8              @ r1 = r8 = &unk98->unk10.unk4
	strb r4, [r1]           @ unk98->unk10.unk4 = 0
	strh r4, [r1, #6]       @ unk98->unk10.unkA = 0
	strh r4, [r1, #0xa]     @ unk98->unk10.unkE = 0
	strh r4, [r1, #0xc]     @ unk98->unk10.unk10 = 0
	str r4, [r1, #0x10]     @ unk98->unk10.qUnk14 = 0
	str r4, [r1, #0x14]     @ unk98->unk10.qUnk18 = 0
	strh r4, [r7, #0x16]    @ s->x = 0
	strh r4, [r7, #0x18]    @ s->y = 0
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
	mov r5, r8              @ r5 = r8 = &unkA8->unk4
	str r0, [r5, #0x54]     @ unkA8->unk58
	movs r6, #0
	mov ip, r6              @ ip = r6 = 0
	ldr r1, [sp, #0xb8]     @ r1 = &unkA8->unk58
	adds r1, #0x50          @ r1 = &unkA8->sprA0[0] + 0x8
	ldr r7, [sp, #0xb8]
	adds r7, #0x48
	str r7, [sp, #0xc4]     @ r7 = s = &unkA8->sprA0[0]
	ldr r6, [sp, #0xa4]     @ r6 = &unk98->unk8C
	ldr r5, [sp, #0xa8]     @ r5 = unkA8 + 0x98
	ldr r3, [sp, #0xac]
	ldr r2, [sp, #0xb0]     @ r2 = unkA8->unk62
_0804D25C:
	ldr r0, [sp, #0xb4]     @ r0 = +0x104
	add r0, ip
	strb r4, [r0]           @ r0 = (boss+0x104+i) = 0
	strh r4, [r2]           @ r2 = (boss+0x10A) = 0
	strh r4, [r3]           @ r3 = (boss+0x10C) = 0
	str r4, [r5]            @ r5 = (boss+0x120) = 0
	str r4, [r6]            @ r6 = (boss+0x124) = 0
	strh r4, [r1, #0xe]
	strh r4, [r1, #0x10]
	ldr r0, [sp, #0x10]     @ r0 = vram
	ldr r7, [sp, #0xc4]     @ r7 = (boss+0x148) = 0
	str r0, [r7, #4]
	ldr r0, _0804D33C @ =0x000002CA
	strh r0, [r1, #2]
	strb r4, [r1, #0x18]
	movs r0, #1
	rsbs r0, r0, #0
	mov r7, sp
	strb r0, [r7, #0x14]    @ sp14 = -1
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
_0804D2A8: .4byte gStageFlags
_0804D2AC: .4byte gActiveBossTask
_0804D2B0: .4byte Task_TrueArea53BossMain
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
	ldr r0, [sp, #4]        @ r0 = sp04 = boss
	ldr r1, _0804D57C @ =0x000007B4
	adds r7, r0, r1         @ r7 = s = boss->spr7B4
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
	ldr r2, [sp, #0x7c]     @ sp7C = &boss->spr7B4.variant
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
	strb r0, [r5]           @ boss->spr7B4.animSpeed = SPRITE_ANIM_SPEED(1.0)
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
	ldr r7, [sp, #0x84]         @ r7 = sp84 = &unk594->spr90
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
	ldr r7, [sp, #0xa0]         @ r7 = spA0 = &unk654->sprF0
	strh r4, [r7, #0x16]        @ Yellow Projectile
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
	ldr r0, [sp, #0xc]          @ r0 = boss->unk654
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

.syntax divided
