.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0         @ r1 = boss
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08050A5C
	subs r0, #1
	strb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080509B0
	movs r5, #0
	ldr r0, _080509A0 @ =gFlags
	mov sl, r0
	ldr r6, _080509A4 @ =gObjPalette
	ldr r4, _080509A8 @ =gUnknown_080D8EF0+0x20
	ldr r3, _080509AC @ =gBgPalette
_08050980:
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6     @ r1 = &gObjPalette[8*16 + i]
	lsls r2, r5, #1
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, r2, r3
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050980
	b _08050A4C
	.align 2, 0
_080509A0: .4byte gFlags
_080509A4: .4byte gObjPalette
_080509A8: .4byte gUnknown_080D8EF0+0x20
_080509AC: .4byte gBgPalette
_080509B0:
	ldr r0, _080509F8 @ =gStageTime
	ldr r0, [r0]
	lsrs r6, r0, #1
	movs r0, #0xf
	ands r6, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _08050A0C
	movs r5, #0
	ldr r1, _080509FC @ =gFlags
	mov sl, r1
	ldr r0, _08050A00 @ =gObjPalette
	mov ip, r0
	movs r7, #0xf
	ldr r4, _08050A04 @ =gUnknown_080D8EF0
	ldr r3, _08050A08 @ =gBgPalette
_080509D0:
	adds r1, r5, r6
	ands r1, r7         @ r1 = bgPalId = (r6 + i) % 16u
	adds r2, r1, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip          @ r2 = &gObjPalette[8*16 + colId]
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsrs r0, r0, #5
	strh r0, [r2]
	lsls r1, r1, #1
	adds r1, r1, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _080509D0
	b _08050A4C
	.align 2, 0
_080509F8: .4byte gStageTime
_080509FC: .4byte gFlags
_08050A00: .4byte gObjPalette
_08050A04: .4byte gUnknown_080D8EF0
_08050A08: .4byte gBgPalette
_08050A0C:
	movs r5, #0
	ldr r1, _08050A6C @ =gFlags
	mov sl, r1
	ldr r0, _08050A70 @ =gObjPalette
	mov sb, r0
	ldr r1, _08050A74 @ =gUnknown_080D8EF0
	mov r8, r1
	ldr r0, _08050A78 @ =gBgPalette
	mov ip, r0
	movs r7, #0xf
_08050A20:
	adds r3, r5, r6
	ands r3, r7         @ r3 = (r6 + i) % 16u
	adds r4, r3, #0
	adds r4, #0x80
	lsls r4, r4, #1
	add r4, sb
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r2, r1, #5
	lsrs r0, r1, #5
	orrs r2, r0
	orrs r2, r1
	strh r2, [r4]
	lsls r3, r3, #1
	add r3, ip
	strh r2, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050A20
_08050A4C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	mov r1, sl
	str r0, [r1]
_08050A5C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050A6C: .4byte gFlags
_08050A70: .4byte gObjPalette
_08050A74: .4byte gUnknown_080D8EF0
_08050A78: .4byte gBgPalette

.syntax divided
