.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]        @ sp08 = qX
	str r1, [sp, #0xc]      @ sp0C = qY
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10      @ r6 = sinIndex = sinIndex_;
	ldr r0, _0804F8C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F8C8 @ =IWRAM_START + 0x654
	adds r4, r0, r1         @ r4 = unk654
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r7, _0804F8CC @ =IWRAM_START + 0x662
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804F886:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804F8AA
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804F886
_0804F8AA:
	cmp r3, #8
	bne _0804F8B0
	movs r5, #1
_0804F8B0:
	cmp r5, #0
	beq sub_804F850__return
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804F8D0
	adds r0, r6, #0
	adds r0, #0x3c
	b _0804F8D4
	.align 2, 0
_0804F8C4: .4byte gCurTask
_0804F8C8: .4byte IWRAM_START + 0x654
_0804F8CC: .4byte IWRAM_START + 0x662
_0804F8D0:
	adds r0, r6, #0
	subs r0, #0x3c
_0804F8D4:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0804F9B4 @ =0x000003FF
	ands r6, r0
__0804F8DC:
	movs r5, #0             @ i = 0
	adds r0, r4, #0
	adds r0, #0xe
	str r0, [sp, #0x10]     @ sp10 = &unk654->unkE[0]
	adds r1, r4, #0
	adds r1, #0x1e
	str r1, [sp, #0x14]     @ sp14 = &unk654->unk1E[0]
	adds r2, r4, #0
	adds r2, #0x2e
	str r2, [sp, #0x18]     @ sp18 = &unk654->unk2E[0][0]
	adds r7, r4, #0
	adds r7, #0x30
	str r7, [sp, #0x1c]     @ sp1C = &unk654->unk2E[0][1]
	movs r0, #0x70
	adds r0, r0, r4
	mov sl, r0              @ sl = &unk654->qPos70[0].x
	adds r4, #0x74
	mov sb, r4              @ sb = &unk654->qPos70[0].y
	movs r1, #0x80
	lsls r1, r1, #1
	mov ip, r1              @ ip = 0x100
	adds r0, r6, r1
	lsls r0, r0, #1
	ldr r2, _0804F9B8 @ =gSineTable
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	mov r8, r0              @ r8 = (COS(sinIndex) * 3) >> 6
_0804F91A:
	mov r7, sp
	adds r0, r7, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r4, [sp, #0x14]
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r3, r2, #2
	ldr r7, [sp, #0x18]
	adds r4, r7, r3
	mov r0, r8
	strh r0, [r4]
	ldr r1, [sp, #0x1c]
	adds r3, r1, r3
	lsls r0, r6, #1
	ldr r7, _0804F9B8 @ =gSineTable
	adds r0, r0, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	lsls r0, r5, #7         @ r0 = (i * 128)
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _0804F9B8 @ =gSineTable
	adds r0, r0, r1
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	lsls r0, r5, #8
	ldr r4, _0804F9B8 @ =gSineTable
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r2, r2, #3
	mov r4, sl
	adds r0, r4, r2
	ldr r7, [sp, #8]
	str r7, [r0]
	add r2, sb
	ldr r0, [sp, #0xc]
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804F91A
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
sub_804F850__return:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9B4: .4byte 0x000003FF
_0804F9B8: .4byte gSineTable

.syntax divided
