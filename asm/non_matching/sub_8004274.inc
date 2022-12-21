
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]        @ sp = param0
	mov sl, r1          @ sl = param1
	ldr r0, [sp, #0x24] @ param4
	ldr r7, [sp, #0x28] @ tileCounts
	ldr r1, [sp, #0x2c] @ u8 param6
	lsls r2, r2, #0x10  @ r2 = param2 << 16
	lsls r3, r3, #0x10  @ r3 = param3 << 16
	lsls r0, r0, #0x18  @ r0 = param4 << 16
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1          @ sb = (u8)param6
	movs r5, #0
	ldr r1, _08004310 @ =gBgCntRegs
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r4, [r0]       @ r4 = gBgCntRegs[bgControlReg]
	movs r0, #0xc
	ands r0, r4         @ r0 = r4 & BGCNT_TXT512x512
	lsls r0, r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	mov r8, r0          @ r8 = vramTxtMode = (VRAM + (textMode << 12))
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r4         
	lsls r0, r0, #3     @ r0 = blendTarget = bgReg & (BLDCNT_TGT2_OBJ +_BG3 +_BG2 +_BG1 +_BG0)
	adds r0, r0, r1
	lsrs r3, r3, #0xa   @ r3 = vramBlend = param3 * 64 (32 as u16*)
	adds r0, r0, r3
	lsrs r2, r2, #0xf   @ r2 = param2 * 2
	adds r6, r0, r2     @ r6 = [param2]
	ldrb r0, [r7]
	cmp r0, #0
	beq _080042FE
_080042C6:
	lsls r4, r5, #5
	ldr r0, [sp]
	adds r4, r0, r4
	adds r0, r7, r5
	ldrb r0, [r0]
	lsls r0, r0, #5
	add r0, sl
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	mov r2, r8
	subs r4, r4, r2     @ r4 = offset = copyDest - txtMode
	lsls r4, r4, #0xb
	lsrs r4, r4, #0x10  @ r4 = offset * 64
	lsls r1, r5, #1
	adds r1, r6, r1     @ r1 = &vramBlend[i]
	mov r2, sb          @ r2 = param6
	lsls r0, r2, #0xc
	orrs r4, r0
	strh r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080042C6
_080042FE:
	lsls r0, r5, #5
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004310: .4byte gBgCntRegs
    	
.syntax divided
