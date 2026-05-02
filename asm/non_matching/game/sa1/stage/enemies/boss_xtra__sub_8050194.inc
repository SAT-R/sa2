.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r1, _080504B8 @ =gExtraBossTaskData
	ldr r0, [r1, #0x3c]
	mov r8, r0
	adds r0, #0x70
	ldrh r5, [r0]
	ldr r0, [r1, #0x38]
	adds r0, #0x70
	ldrh r0, [r0]
	str r0, [sp, #8]
	mov r1, r8
	ldr r0, [r1, #0x50]
	asrs r7, r0, #8
	ldr r2, _080504BC @ =gStageTime
	ldr r0, [r2]
	lsls r0, r0, #3
	adds r7, r7, r0
	adds r1, r7, #0
	subs r1, #0x48
	ldr r0, _080504C0 @ =0x00000A7F
	cmp r1, r0
	ble _080501DC
	adds r7, r1, #0
	movs r1, #0xa8
	lsls r1, r1, #4
	adds r0, r7, #0
	bl Mod
	adds r7, r0, #0
	adds r7, #0x48
_080501DC:
	mov r0, r8
	ldr r3, [r0, #0x54]
	asrs r3, r3, #8
	ldr r4, _080504C4 @ =gSineTable
	lsrs r1, r5, #6
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x16
	lsls r2, r2, #0xc
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #8
	subs r0, r0, r2
	asrs r0, r0, #0x10
	adds r0, #6
	adds r6, r3, r0
	adds r1, r7, #0
	adds r1, #0x10
	ldr r2, _080504C8 @ =sa2__sub_801EC3C
	mov sl, r2
	str r2, [sp]
	adds r0, r6, #0
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F100
	mov sb, r0
	mov r0, r8
	ldr r3, [r0, #0x54]
	asrs r3, r3, #8
	ldr r1, [sp, #8]
	lsrs r2, r1, #6
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #8
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #0xb
	adds r1, r1, r0
	asrs r1, r1, #0x10
	adds r1, #6
	adds r4, r3, r1
	adds r1, r7, #0
	adds r1, #0x15
	mov r2, sl
	str r2, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F100
	mov sl, r0
	cmp sl, sb
	ble _08050278
	mov sl, sb
_08050278:
	mov r0, sl
	cmp r0, #0
	bgt _080502D2
	ldr r0, [sp, #4]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080502D2
	ldr r1, _080504BC @ =gStageTime
	ldr r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080502D2
	ldr r2, _080504CC @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _080504D0 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080504D4 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	bne _080502D2
	mov r2, r8
	ldr r0, [r2, #0x50]
	asrs r2, r0, #8
	adds r0, r4, #0
	cmp r0, r6
	bge _080502BE
	adds r0, r6, #0
_080502BE:
	subs r1, r0, #2
	adds r0, r2, #0
	bl CreateBrakingDustEffect
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, _080504D8 @ =0x0000FFFC
	strh r1, [r0, #4]
_080502D2:
	ldr r1, _080504B8 @ =gExtraBossTaskData
	ldr r0, [r1, #0x48]
	mov r8, r0
	adds r0, #0x70
	ldrh r5, [r0]
	ldr r0, [r1, #0x44]
	adds r0, #0x70
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	mov r1, r8
	ldr r0, [r1, #0x50]
	asrs r7, r0, #8
	ldr r2, _080504BC @ =gStageTime
	ldr r0, [r2]
	lsls r0, r0, #3
	adds r7, r7, r0
	adds r1, r7, #0
	subs r1, #0x48
	ldr r0, _080504C0 @ =0x00000A7F
	cmp r1, r0
	ble _0805030C
	adds r7, r1, #0
	movs r1, #0xa8
	lsls r1, r1, #4
	adds r0, r7, #0
	bl Mod
	adds r7, r0, #0
	adds r7, #0x48
_0805030C:
	mov r0, r8
	ldr r3, [r0, #0x54]
	asrs r3, r3, #8
	ldr r4, _080504C4 @ =gSineTable
	lsrs r1, r5, #6
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x16
	lsls r2, r2, #0xc
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #8
	subs r0, r0, r2
	asrs r0, r0, #0x10
	adds r0, #6
	adds r5, r3, r0
	adds r1, r7, #0
	adds r1, #0x10
	ldr r2, _080504C8 @ =sa2__sub_801EC3C
	str r2, [sp]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F100
	mov sb, r0
	mov r0, r8
	ldr r3, [r0, #0x54]
	asrs r3, r3, #8
	ldr r1, [sp, #0xc]
	lsrs r2, r1, #6
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #8
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #0xb
	adds r1, r1, r0
	asrs r1, r1, #0x10
	adds r1, #6
	adds r4, r3, r1
	adds r1, r7, #0
	adds r1, #0x15
	ldr r2, _080504C8 @ =sa2__sub_801EC3C
	str r2, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F100
	adds r6, r0, #0
	cmp r6, sb
	ble _080503A6
	mov r6, sb
_080503A6:
	cmp r6, #0
	bgt _080503FE
	ldr r0, [sp, #4]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080503FE
	ldr r1, _080504BC @ =gStageTime
	ldr r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080503FE
	ldr r2, _080504CC @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _080504D0 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080504D4 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	bne _080503FE
	mov r2, r8
	ldr r0, [r2, #0x50]
	asrs r2, r0, #8
	adds r0, r4, #0
	cmp r0, r5
	bge _080503EA
	adds r0, r5, #0
_080503EA:
	subs r1, r0, #2
	adds r0, r2, #0
	bl CreateBrakingDustEffect
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, _080504D8 @ =0x0000FFFC
	strh r1, [r0, #4]
_080503FE:
	ldr r0, _080504B8 @ =gExtraBossTaskData
	ldr r0, [r0, #4]
	str r0, [sp, #0x10]
	adds r0, #0x70
	ldrh r1, [r0]
	ldr r3, _080504C4 @ =gSineTable
	lsrs r1, r1, #6
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x16
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r3, [r1]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	ldr r0, [sp, #0x10]
	ldr r4, [r0, #0x54]
	asrs r4, r4, #8
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	subs r1, r1, r3
	lsls r1, r1, #8
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #9
	subs r1, r1, r0
	asrs r1, r1, #0x10
	adds r7, r4, r1
	ldr r1, [sp, #0x10]
	ldr r4, [r1, #0x50]
	asrs r4, r4, #8
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	subs r1, r1, r2
	lsls r1, r1, #8
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	subs r0, r0, r3
	lsls r0, r0, #9
	adds r1, r1, r0
	asrs r1, r1, #0x10
	adds r4, r4, r1
	ldr r0, _080504BC @ =gStageTime
	ldr r0, [r0]
	lsls r0, r0, #3
	adds r4, r4, r0
	adds r1, r4, #0
	subs r1, #0x48
	ldr r0, _080504C0 @ =0x00000A7F
	cmp r1, r0
	ble _08050488
	adds r4, r1, #0
	movs r1, #0xa8
	lsls r1, r1, #4
	adds r0, r4, #0
	bl Mod
	adds r4, r0, #0
	adds r4, #0x48
_08050488:
	ldr r0, _080504C8 @ =sa2__sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F100
	adds r1, r6, #0
	cmp r1, sl
	ble _080504A0
	mov r1, sl
_080504A0:
	cmp r0, r1
	ble _080504A6
	adds r0, r1, #0
_080504A6:
	adds r1, r0, #0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080504B8: .4byte gExtraBossTaskData
_080504BC: .4byte gStageTime
_080504C0: .4byte 0x00000A7F
_080504C4: .4byte gSineTable
_080504C8: .4byte sa2__sub_801EC3C
_080504CC: .4byte gPseudoRandom
_080504D0: .4byte 0x00196225
_080504D4: .4byte 0x3C6EF35F
_080504D8: .4byte 0x0000FFFC

.syntax divided
