.include "asm/macros.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	mov r8, r0          @ r8 = bg = 0
	mov r1, sp
	str r1, [sp, #0x10] @ sp+0x10 = sp
sub_8004010_loop:
	mov r2, r8          @ r8 = bg
	lsls r0, r2, #2     @ r0 = bg*4
	ldr r1, _sa2_080040DC @ =gBgSprites_Unknown2
	adds r1, #1
	adds r4, r0, r1     @ r4 = gBgSprites_Unknown2[bg][1]
	ldr r6, _sa2_080040E0 @ =gBgSprites_Unknown2 + 3
	adds r6, r0, r6     @ r6 = &gBgSprites_Unknown2[bg][3]
	str r6, [sp, #0xc]  @ sp0C = r6 = &gBgSprites_Unknown2[bg][3]
	ldrb r1, [r4]       @ r1 = *r4 = gBgSprites_Unknown2[bg][1]
	ldrb r2, [r6]       @ r2 = *r6 = gBgSprites_Unknown2[bg][3]
	mov ip, r2          @ ip = r2 = gBgSprites_Unknown2[bg][3]
	mov sl, r0          @ sl = bg*4
__sa2_0800403C:
	cmp r1, ip
	bne _sa2_08004056
	ldr r0, _sa2_080040DC @ =gBgSprites_Unknown2 + 0
	add r0, sl
	ldr r1, _sa2_080040E4 @ =gBgSprites_Unknown2 + 2
	add r1, sl          @ r1 = gBgSprites_Unknown2[bg][2]
	ldrb r0, [r0]       @ r0 = gBgSprites_Unknown2[bg][0]
	mov r7, r8
	adds r7, #1          @ r7 = bg+1
	ldrb r1, [r1]
__sa2_08004050:
	cmp r0, r1
	bne _sa2_08004056
	b sub_8004010_continue
_sa2_08004056:
	ldr r2, _sa2_080040E8 @ =gBgCntRegs
	mov r6, r8          @ r6 = r8 = bg
	lsls r3, r6, #1     @ r3 = bg*2
	adds r0, r3, r2     @ r0 = &gBgCntRegs[bg]
	ldrh r6, [r0]       @ r6 = bgCtrl = gBgCntRegs[bg]
	movs r1, #0xc0
	lsls r1, r1, #0x13  @ r1 = VRAM
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r6         @ bgCtrl & 0x1F00
	lsls r0, r0, #3
	adds r5, r0, r1     @ r5 = vramBase
	ldrb r4, [r4]       @ r4 = gBgSprites_Unknown2[bg][1]
	ldr r0, _sa2_080040DC @ =gBgSprites_Unknown2
	add r0, sl          @ r0 = &gBgSprites_Unknown2[bg][0]
	ldrb r0, [r0]       @ r0 = gBgSprites_Unknown2[bg][0]
	str r0, [sp, #8]
	adds r7, r2, #0     @ r7 = gBgCntRegs
	adds r2, r3, #0     @ r2 = r3 = bg * 2
	mov r0, r8
__sa2_0800407E:
	cmp r0, #1
	bls _sa2_08004168
	ldr r0, _sa2_080040EC @ =gDispCnt
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
__sa2_0800408A:
	cmp r0, #0
	beq _sa2_08004168
__sa2_0800408E:
	ldr r1, [sp, #8]
	adds r5, r5, r1     @ r5 = vramBase + sp08
	lsrs r2, r6, #14    @ r2 = (r6 = bgCtrl) >> 14
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r2
	lsrs r3, r0, #0x10  @ r3 = affineSize = (16 << (gBgCntRegs[bg] >> 14))
	mov r2, ip          @ r2 = ip = gBgSprites_Unknown2[bg][3]
__sa2_0800409E:
	cmp r2, #0xff
	bne _sa2_080040F8
__sa2_080040A2:
	ldr r0, _sa2_080040F0 @ =gBgSprites_Unknown1
	add r0, r8          @ r0 = &gBgSprites_Unknown1[bg]
	ldrb r1, [r0]       @ r1 = gBgSprites_Unknown1[bg]
	lsls r0, r1, #8     @           combine(v) : ((v) << 8 | (v))
	orrs r1, r0         @ r1 = cb = combine(gBgSprites_Unknown1[bg])
	adds r0, r4, #0     @ r0 = r4 = gBgSprites_Unknown2[bg][1]
	muls r0, r3, r0     @ r0 = affineSize * gBgSprites_Unknown2[bg][1]
	adds r0, r5, r0     @ r0 = vramBase + (affineSize * gBgSprites_Unknown2[bg][1])
	ldr r6, [sp, #0x10] @ --- DMA Start ---
	strh r1, [r6]       @ *sp10 = cb
	mov r1, sp
	ldr r2, _sa2_080040F4 @ =0x040000D4
	str r1, [r2]        @ DMASrc = sp00 (fill: cb)
	str r0, [r2, #4]    @ vramBase
	ldr r6, [sp, #0xc]  @ sp0C = &gBgSprites_Unknown2[bg][3]
	ldrb r0, [r6]
	subs r0, r0, r4
	muls r0, r3, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x81
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]    @ @ ---  DMA End  ---
	add r2, sp, #4
	mov sb, r2          @ sb = 2nd dmaTarget
	b _sa2_080041C0
	.align 2, 0
_sa2_080040DC: .4byte gBgSprites_Unknown2
_sa2_080040E0: .4byte gBgSprites_Unknown2 + 3
_sa2_080040E4: .4byte gBgSprites_Unknown2 + 2
_sa2_080040E8: .4byte gBgCntRegs
_sa2_080040EC: .4byte gDispCnt
_sa2_080040F0: .4byte gBgSprites_Unknown1
_sa2_080040F4: .4byte 0x040000D4
_sa2_080040F8:
	add r6, sp, #4
	mov sb, r6          @ sb = sp04 (2nd dmaTarget)
	mov r7, r8          @ r7 = r8 = bg
	adds r7, #1         @ r7 = bg + 1
__sa2_08004100:
	cmp r4, ip          @ ip = p3
	bls _sa2_08004106
	b _sa2_0800422C
_sa2_08004106:
	ldr r0, _sa2_0800415C @ =gBgSprites_Unknown1
	add r0, r8
	mov ip, r0      @ ip = &gBgSprites_Unknown1[bg]
	ldr r2, _sa2_08004160 @ =0x040000D4
	ldr r1, _sa2_08004164 @ =gBgSprites_Unknown2 + 2
	add r1, sl
	mov r8, r1      @ r8 = &gBgSprites_Unknown2[bg][2]
	ldr r6, [sp, #0xc]
	str r6, [sp, #0x14]
_sa2_08004118_loop:
	mov r0, ip              @ r0 = ip = &gBgSprites_Unknown1[bg]
	ldrb r1, [r0]
	lsls r0, r1, #8
	orrs r1, r0             @ r1 = cb = combine(gBgSprites_Unknown1[bg])
	adds r0, r4, #0
	muls r0, r3, r0         @ r0 *= affineSize
	adds r0, r5, r0
	ldr r6, [sp, #0x10]     @ r6 = sp00
	strh r1, [r6]           @ sp00[0] = cb
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, r8              @ r6 = r8 = &gBgSprites_Unknown2[bg][2]
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1         @ r0 = gBgSprites_Unknown2[bg][2] - gBgSprites_Unknown2[bg][0]
	adds r0, #1
	asrs r1, r0, #1
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r6, #0x81
	lsls r6, r6, #0x18
	orrs r1, r6
	str r1, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r4, r0
	bls _sa2_08004118_loop
	b _sa2_0800422C
	.align 2, 0
_sa2_0800415C: .4byte gBgSprites_Unknown1
_sa2_08004160: .4byte 0x040000D4
_sa2_08004164: .4byte gBgSprites_Unknown2 + 2
_sa2_08004168:
	ldr r1, [sp, #8]    @ r1 = sp08 = gBgSprites_Unknown2[bg][0]
	lsls r0, r1, #1
	adds r5, r5, r0     @ r5 = vramBase + (sp08 * 2)
	movs r3, #0x20      @ r3 = tileSize = 32
                        @ r7 = gBgCntRegs
                        @ r2 = bg*2
	adds r0, r2, r7     @ r0 = &gBgCntRegs[bg]
	ldrh r0, [r0]
	lsrs r2, r0, #14
	subs r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18  @ r0 = affineSize
__sa2_0800417C:
	cmp r0, #1
	bhi _sa2_08004182
	movs r3, #0x40      @ r3 = tileSize = 64
_sa2_08004182:
	ldr r1, _sa2_080041C8 @ =&gBgSprites_Unknown2[0][2]
	add r1, sl        @ r1 = &gBgSprites_Unknown2[bg][2] 
	ldrb r0, [r1]
__sa2_08004188:
	cmp r0, #0xff
	bne _sa2_080041D8
__sa2_0800418C:
	ldr r0, _sa2_080041CC @ =gBgSprites_Unknown1
	add r0, r8
	ldrb r1, [r0]           @ r1 = gBgSprites_Unknown1[bg]
	lsls r0, r3, #1         @ r3 = tileSize
	muls r0, r4, r0         @ r0 = tileSize * gBgSprites_Unknown2[bg][1]
	adds r0, r5, r0
	ldr r2, [sp, #0x10]     @ r2 = &sp00[0]
	strh r1, [r2]           @ sp00[0] = gBgSprites_Unknown1[bg];
	mov r6, sp              @ r6 = sp
	ldr r1, _sa2_080041D0 @ =0x040000D4
	str r6, [r1]
	str r0, [r1, #4]
	ldr r0, _sa2_080041D4       @ r0 = &gBgSprites_Unknown2[0][3]
	add r0, sl              @ r0 = &gBgSprites_Unknown2[bg][3]
	ldrb r0, [r0]           @ r0 = gBgSprites_Unknown2[bg][3]
	subs r0, r0, r4         @ r0 = r0 - gBgSprites_Unknown2[bg][1]
	muls r0, r3, r0
	lsls r0, r0, #1
	asrs r0, r0, #1
	movs r2, #0x81
	lsls r2, r2, #0x18
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add r6, sp, #4
	mov sb, r6          @ sb = dmaTarget
_sa2_080041C0:
	mov r7, r8
	adds r7, #1
	b _sa2_0800422C
	.align 2, 0
_sa2_080041C8: .4byte gBgSprites_Unknown2 + 2
_sa2_080041CC: .4byte gBgSprites_Unknown1
_sa2_080041D0: .4byte 0x040000D4
_sa2_080041D4: .4byte gBgSprites_Unknown2 + 3
_sa2_080041D8:
	ldr r0, _sa2_08004260 @ =gBgSprites_Unknown2 + 3
	add r0, sl          @ r0 = &gBgSprites_Unknown2[bg][3]
	add r2, sp, #4
	mov sb, r2          @ sb = dmaTarget
	mov r7, r8          @ r7 = bg+1 (done by loop)
	adds r7, #1
	ldrb r6, [r0]       @ r6 = gBgSprites_Unknown2[bg][3]
__sa2_080041E6:
	cmp r4, r6
	bhi _sa2_0800422C
	ldr r2, _sa2_08004264   @ r2 = gBgSprites_Unknown1
	add r8, r2          @ r8 = gBgSprites_Unknown1[bg]
	ldr r2, _sa2_08004268 @ =0x040000D4
	mov ip, r1        @ ip = r1 = &gBgSprites_Unknown2[bg][2] 
	str r0, [sp, #0x14]
	lsls r3, r3, #1
_sa2_080041F6:
	mov r6, r8          @ r6 = &gBgSprites_Unknown1[bg]
	ldrb r1, [r6]       @ r1 = gBgSprites_Unknown1[bg]
	adds r0, r4, #0     @ r0 = r4 = gBgSprites_Unknown2[bg][1]
	muls r0, r3, r0     @ r0 = tileSize * gBgSprites_Unknown2[bg][1]
	adds r0, r5, r0     
	ldr r6, [sp, #0x10]
	strh r1, [r6]       @ sp00[0] = gBgSprites_Unknown1[bg]
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, ip          @ r6 = ip = &gBgSprites_Unknown2[bg][2] 
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1     @ r0 = (gBgSprites_Unknown2[bg][2] - gBgSprites_Unknown2[bg][0])
	adds r0, #1
	movs r6, #0x81
	lsls r6, r6, #0x18
	orrs r0, r6
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r4, r0
	bls _sa2_080041F6
_sa2_0800422C:
	movs r0, #0
	str r0, [sp, #4]
	mov r1, sb          @ r1 = sb = &sp04 = dmaTarget
	ldr r2, _sa2_08004268 @ r2 = 0x040000D4
	str r1, [r2]
	ldr r0, _sa2_0800426C @ =gBgSprites_Unknown2
	add r0, sl          @ r0 = &gBgSprites_Unknown2[bg][0]
	str r0, [r2, #4]
	ldr r0, _sa2_08004270 @ =0x85000001
	str r0, [r2, #8]
	ldr r0, [r2, #8]
sub_8004010_continue:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi sub_8004010_return
	b sub_8004010_loop
sub_8004010_return:
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_sa2_08004260: .4byte gBgSprites_Unknown2 + 3
_sa2_08004264: .4byte gBgSprites_Unknown1
_sa2_08004268: .4byte 0x040000D4
_sa2_0800426C: .4byte gBgSprites_Unknown2
_sa2_08004270: .4byte 0x85000001

.syntax divided
