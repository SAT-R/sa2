.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0             @ r5 = boss
	movs r7, #0                 @ r7 = FALSE
	ldr r4, _08041AEC @ =gSineTable
	ldr r0, _08041AF0 @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2             @ r0 = gStageTime * 12
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1             @ r0 += 0x200
	ldr r2, _08041AF4 @ =0x000003FF
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x90
	lsls r3, r3, #1
	adds r6, r5, r3             @ r6 = s = &boss->sub.spr108
	ldr r3, [r5, #4]
	asrs r3, r3, #8
	mov ip, r3                  @ ip = worldX = boss->main.worldX
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r1, r1, r0             @ r1 = tVal += 500
	ands r1, r2                 @ r1 = tVal &= ONE_CYCLE
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	asrs r0, r0, #0xc
	mov r2, ip
	adds r3, r2, r0             @ r3 = worldX + ((COS(tVal & ONE_CYCLE) * 15) >> 12)
	ldr r2, [r5, #8]
	asrs r2, r2, #8             @ r2 = worldY = Q_24_8_TO_INT(boss->main.worldY)
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #0xc
	adds r0, #0x14
	adds r2, r2, r0
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	bne _08041B08
	ldr r4, _08041AF8 @ =gPlayer    @ r4 = gPlayer
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08041ABA
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08041ABA
	adds r0, r6, #0
	adds r1, r3, #0
	adds r3, r4, #0
	bl sub_800DF38
	cmp r0, #0
	beq _08041ABA
	ldr r0, _08041AFC @ =0x0000FB40
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	ldr r1, _08041B00 @ =0xFFFFFEF7
	ands r0, r1
	str r0, [r4, #0x20]
	str r7, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xb
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r7, #1
_08041ABA:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0x96
	lsls r2, r2, #1
	cmp r0, r2
	bls _08041ACE
	movs r7, #1
_08041ACE:
	cmp r7, #0
	beq _08041B36
	ldr r0, _08041B04 @ =0x00000296
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	strh r2, [r5, #0x10]
	movs r0, #1
	b _08041B34 @ -> strb r0, [r5, #0x17] -> return
	.align 2, 0
_08041AEC: .4byte gSineTable
_08041AF0: .4byte gStageTime
_08041AF4: .4byte 0x000003FF
_08041AF8: .4byte gPlayer
_08041AFC: .4byte 0x0000FB40
_08041B00: .4byte 0xFFFFFEF7
_08041B04: .4byte 0x00000296
_08041B08:
	ldrh r0, [r5, #0x10]
	subs r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x12
	bne _08041B2C
	ldr r0, _08041B3C @ =0x00000296
	strh r0, [r6, #0xa]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #3
	strb r0, [r1]
	ldr r3, _08041B40 @ =0x00000141
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
_08041B2C:
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	bne _08041B36
	movs r0, #0
_08041B34:
	strb r0, [r5, #0x17]
_08041B36:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041B3C: .4byte 0x00000296
_08041B40: .4byte 0x00000141

	
.syntax divided
