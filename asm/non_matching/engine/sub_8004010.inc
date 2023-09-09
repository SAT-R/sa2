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
	mov r8, r0          @ r8 = bgIndex = 0
	mov r1, sp
	str r1, [sp, #0x10] @ sp+0x10 = sp
sub_8004010_loop:
	mov r2, r8          @ r8 = bgIndex
	lsls r0, r2, #2     @ r0 = bgIndex*4
	ldr r1, _080040DC @ =gUnknown_03002280
	adds r1, #1
	adds r4, r0, r1     @ r4 = p1
	ldr r6, _080040E0 @ =gUnknown_03002280 + 3
	adds r6, r0, r6
	str r6, [sp, #0xc]  @ sp+C = p3
	ldrb r1, [r4]
	ldrb r2, [r6]
	mov ip, r2
	mov sl, r0          @ sl = bgIndex*4
	cmp r1, ip
	bne _08004056
	ldr r0, _080040DC @ =gUnknown_03002280
	add r0, sl
	ldr r1, _080040E4 @ =gUnknown_03002280 + 2
	add r1, sl
	ldrb r0, [r0]
	mov r7, r8
	adds r7, #1          @ r7 = bgIndex+1
	ldrb r1, [r1]
	cmp r0, r1
	bne _08004056
	b sub_8004010_continue
_08004056:
	ldr r2, _080040E8 @ =gBgCntRegs
	mov r6, r8
	lsls r3, r6, #1     @ r3 = bgIndex*2
	adds r0, r3, r2     @ r0 = &gBgCntRegs[bgIndex*4]
	ldrh r6, [r0]       @ r6 = bgCtrl
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r6         @ bgCtrl & 0x1F00
	lsls r0, r0, #3
	adds r5, r0, r1     @ r5 = vramBgCtrl
	ldrb r4, [r4]
	ldr r0, _080040DC @ =gUnknown_03002280
	add r0, sl
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r7, r2, #0     @ r7 = gBgCntRegs
	adds r2, r3, #0
	mov r0, r8
	cmp r0, #1
	bls _08004168
	ldr r0, _080040EC @ =gDispCnt
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08004168
__0800408E:
	ldr r1, [sp, #8]
	adds r5, r5, r1     @ r5 = spVramPtr
	lsrs r2, r6, #14
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r2
	lsrs r3, r0, #0x10
	mov r2, ip
	cmp r2, #0xff
	bne _080040F8
__080040A2:
	ldr r0, _080040F0 @ =gUnknown_03004D80
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #8
	orrs r1, r0
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]
	mov r1, sp
	ldr r2, _080040F4 @ =0x040000D4
	str r1, [r2]
	str r0, [r2, #4]
	ldr r6, [sp, #0xc]
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
	ldr r0, [r2, #8]
	add r2, sp, #4
	mov sb, r2          @ sb = 2nd dmaTarget
	b _080041C0
	.align 2, 0
_080040DC: .4byte gUnknown_03002280
_080040E0: .4byte gUnknown_03002280 + 3
_080040E4: .4byte gUnknown_03002280 + 2
_080040E8: .4byte gBgCntRegs
_080040EC: .4byte gDispCnt
_080040F0: .4byte gUnknown_03004D80
_080040F4: .4byte 0x040000D4
_080040F8:
	add r6, sp, #4
	mov sb, r6          @ sb = 2nd dmaTarget
	mov r7, r8
	adds r7, #1         @ r7 = bgIndex + 1
	cmp r4, ip          @ ip = p3
	bls _08004106
	b _0800422C
_08004106:
	ldr r0, _0800415C @ =gUnknown_03004D80
	add r0, r8
	mov ip, r0      @ ip = &gUnknown_03004D80[bgIndex]
	ldr r2, _08004160 @ =0x040000D4
	ldr r1, _08004164 @ =gUnknown_03002280 + 2
	add r1, sl
	mov r8, r1
	ldr r6, [sp, #0xc]
	str r6, [sp, #0x14]
_08004118:
	mov r0, ip
	ldrb r1, [r0]
	lsls r0, r1, #8
	orrs r1, r0             @ r1 = v | (v << 8)
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]           @ sp10[0] = v
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, r8
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1
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
	bls _08004118
	b _0800422C
	.align 2, 0
_0800415C: .4byte gUnknown_03004D80
_08004160: .4byte 0x040000D4
_08004164: .4byte gUnknown_03002280 + 2
_08004168:
	ldr r1, [sp, #8]    @ r1 = sp08
	lsls r0, r1, #1
	adds r5, r5, r0     @ r5 = &vramBgCtrl[sp08]
	movs r3, #0x20      @ r3 = someSize = 32
                        @ r7 = gBgCntRegs
                        @ r2 = bgIndex*2
	adds r0, r2, r7     @ r0 = &gBgCntRegs[bgIndex*2]
	ldrh r0, [r0]
	lsrs r2, r0, #14
	subs r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08004182
	movs r3, #0x40      @ r3 = someSize = 64
_08004182:
	ldr r1, _080041C8 @ =&gUnknown_03002280[0][2]
	add r1, sl        @ r1 = &gUnknown_03002280[bgIndex][2] 
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080041D8
	ldr r0, _080041CC @ =gUnknown_03004D80
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r3, #1
	muls r0, r4, r0
	adds r0, r5, r0
	ldr r2, [sp, #0x10]     @ r2 = &sp00[0]
	strh r1, [r2]           @ sp00[0] = gUnknown_03004D80[bgIndex];
	mov r6, sp              @ r6 = sp
	ldr r1, _080041D0 @ =0x040000D4
	str r6, [r1]
	str r0, [r1, #4]
	ldr r0, _080041D4 @ =&gUnknown_03002280[0][3]
	add r0, sl
	ldrb r0, [r0]
	subs r0, r0, r4
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
_080041C0:
	mov r7, r8
	adds r7, #1
	b _0800422C
	.align 2, 0
_080041C8: .4byte gUnknown_03002280 + 2
_080041CC: .4byte gUnknown_03004D80
_080041D0: .4byte 0x040000D4
_080041D4: .4byte gUnknown_03002280 + 3
_080041D8:
	ldr r0, _08004260 @ =gUnknown_03002280 + 3
	add r0, sl
	add r2, sp, #4
	mov sb, r2          @ sb = dmaTarget
	mov r7, r8
	adds r7, #1
	ldrb r6, [r0]
	cmp r4, r6
	bhi _0800422C
	ldr r2, _08004264 @ =gUnknown_03004D80
	add r8, r2
	ldr r2, _08004268 @ =0x040000D4
	mov ip, r1        @ r1 = &gUnknown_03002280[bgIndex][2] 
	str r0, [sp, #0x14]
	lsls r3, r3, #1
_080041F6:
	mov r6, r8
	ldrb r1, [r6]
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]       @ sp00[0] = r1
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, ip
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1
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
	bls _080041F6
_0800422C:
	movs r0, #0
	str r0, [sp, #4]
	mov r1, sb          @ r1 = sb = dmaTarget
	ldr r2, _08004268 @ r2 = 0x040000D4
	str r1, [r2]
	ldr r0, _0800426C @ =gUnknown_03002280
	add r0, sl
	str r0, [r2, #4]
	ldr r0, _08004270 @ =0x85000001
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
_08004260: .4byte gUnknown_03002280 + 3
_08004264: .4byte gUnknown_03004D80
_08004268: .4byte 0x040000D4
_0800426C: .4byte gUnknown_03002280
_08004270: .4byte 0x85000001

.syntax divided
