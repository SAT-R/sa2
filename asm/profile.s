.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; Unlikely to all be profile but a large section
@; but a large section seems to relate to it

	thumb_func_start sub_806525C
sub_806525C: @ 0x0806525C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	movs r0, #4
	add r0, sl
	mov ip, r0
	mov r7, sl
	adds r7, #0x64
	mov r1, sl
	adds r1, #0xc4
	str r1, [sp, #0x18]
	mov r0, sl
	adds r0, #0xf6
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r2, r5, #3
	mov r8, r2
	ldr r1, _080653D8 @ =gUnknown_080D9888
	add r1, r8
	ldr r0, _080653DC @ =gUnknown_080D98B8
	add r8, r0
	lsls r5, r5, #4
	ldr r0, _080653E0 @ =gUnknown_080D9798
	adds r5, r5, r0
	mov r2, sl
	ldr r0, [r2]
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	mov r0, sl
	adds r0, #0xf4
	movs r6, #0
	ldrsb r6, [r0, r6]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	mov sb, r0
	movs r0, #0xa8
	lsls r0, r0, #0x11
	adds r4, r4, r0
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	movs r0, #0x32
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	mov r0, ip
	movs r1, #1
	bl sub_806A568
	movs r2, #0x34
	add r2, sl
	mov ip, r2
	mov r0, r8
	ldrh r2, [r0, #4]
	ldrh r3, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	str r4, [sp, #4]
	movs r0, #0x74
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	mov r1, r8
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	mov r0, ip
	movs r1, #1
	bl sub_806A568
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r0, #0x89
	lsls r0, r0, #1
	add r0, sb
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r4, #0x4c
	str r4, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #1
	bl sub_806A568
	adds r7, #0x30
	adds r5, #8
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0xa7
	lsls r0, r0, #1
	add r0, sb
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #1
	bl sub_806A568
	movs r3, #0xee
	lsls r3, r3, #2
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #0x12
	movs r2, #0x88
	lsls r2, r2, #0x11
	adds r0, r0, r2
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #7
	str r0, [sp, #0xc]
	movs r0, #3
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #1
	movs r2, #0x12
	bl sub_806A568
	movs r1, #0
	subs r7, #0x30
_080653A4:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	eors r1, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	adds r1, r7, #0
	adds r1, #0x25
	strb r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	adds r7, #0x30
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _080653A4
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080653D8: .4byte gUnknown_080D9888
_080653DC: .4byte gUnknown_080D98B8
_080653E0: .4byte gUnknown_080D9798

	thumb_func_start sub_80653E4
sub_80653E4: @ 0x080653E4
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806547C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #4
	adds r3, r0, r1
	ldr r2, _08065480 @ =IWRAM_START + 0x64
	adds r4, r0, r2
	ldr r6, _08065484 @ =IWRAM_START + 0xC4
	adds r7, r0, r6
	ldr r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r2, #0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r6, #0xa8
	lsls r6, r6, #1
	adds r1, r1, r6
	adds r6, r0, #0
_08065416:
	strh r1, [r3, #0x16]
	lsls r0, r2, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r3, #0x30
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08065416
	asrs r2, r6, #0x10
	movs r6, #0x89
	lsls r6, r6, #1
	adds r0, r2, r6
	strh r0, [r4, #0x16]
	adds r4, #0x30
	movs r1, #0xa7
	lsls r1, r1, #1
	adds r0, r2, r1
	strh r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0xf4
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r6, #2
	adds r0, r0, r6
	adds r2, r2, r0
	strh r2, [r7, #0x16]
	bl sub_806AE54
	adds r1, r5, #0
	adds r1, #0xf5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xf
	ble _08065476
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0806547C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08065488 @ =sub_806548C
	str r0, [r1, #8]
_08065476:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806547C: .4byte gCurTask
_08065480: .4byte IWRAM_START + 0x64
_08065484: .4byte IWRAM_START + 0xC4
_08065488: .4byte sub_806548C

	thumb_func_start sub_806548C
sub_806548C: @ 0x0806548C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08065594 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r0, _08065598 @ =IWRAM_START + 0x64
	adds r6, r4, r0
	ldr r1, _0806559C @ =IWRAM_START + 0xC4
	adds r1, r1, r4
	mov sb, r1
	mov r2, r8
	ldr r7, [r2]
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrh r5, [r0]
	ldr r1, _080655A0 @ =IWRAM_START + 0xF6
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _080655A4 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08065534
	movs r0, #0x6c
	bl m4aSongNumStart
	movs r2, #0
	ldr r3, _080655A8 @ =IWRAM_START + 0xF4
	adds r1, r4, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080654EC
	movs r2, #1
_080654EC:
	strb r2, [r1]
	movs r0, #0
	ldr r1, _080655A8 @ =IWRAM_START + 0xF4
	adds r4, r4, r1
	lsls r5, r5, #0x10
	adds r3, r4, #0
_080654F8:
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	eors r2, r1
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	adds r2, r6, #0
	adds r2, #0x25
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	adds r6, #0x30
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	ble _080654F8
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r1, r2
	asrs r0, r5, #0x10
	adds r0, r0, r1
	mov r3, sb
	strh r0, [r3, #0x16]
_08065534:
	bl sub_806AE54
	ldr r0, _080655A4 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _080655E0
	ldr r0, _080655AC @ =gPressedKeys
	ldrh r1, [r0]
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _080655C4
	mov r0, sl
	lsls r2, r0, #0x10
	asrs r2, r2, #0xc
	mov r5, r8
	adds r5, #0xf4
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _080655B0 @ =gUnknown_080D9798
	adds r0, r0, r1
	adds r2, r2, r0
	ldr r1, _080655B4 @ =0x000005C4
	adds r6, r7, r1
	ldrh r1, [r2, #2]
	ldr r3, _080655B8 @ =0x000005E4
	adds r0, r7, r3
	strb r1, [r0]
	ldrh r0, [r2]
	movs r4, #0
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	bl sub_8004558
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrb r1, [r5]
	ldr r2, _080655BC @ =0x00000359
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _080655C0 @ =0x00000784
	adds r0, r7, r3
	b _080655D6
	.align 2, 0
_08065594: .4byte gCurTask
_08065598: .4byte IWRAM_START + 0x64
_0806559C: .4byte IWRAM_START + 0xC4
_080655A0: .4byte IWRAM_START + 0xF6
_080655A4: .4byte gRepeatedKeys
_080655A8: .4byte IWRAM_START + 0xF4
_080655AC: .4byte gPressedKeys
_080655B0: .4byte gUnknown_080D9798
_080655B4: .4byte 0x000005C4
_080655B8: .4byte 0x000005E4
_080655BC: .4byte 0x00000359
_080655C0: .4byte 0x00000784
_080655C4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080655E0
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _080655F0 @ =0x00000784
	adds r0, r7, r1
_080655D6:
	strb r4, [r0]
	ldr r0, _080655F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080655F8 @ =sub_80655FC
	str r0, [r1, #8]
_080655E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080655F0: .4byte 0x00000784
_080655F4: .4byte gCurTask
_080655F8: .4byte sub_80655FC

	thumb_func_start sub_80655FC
sub_80655FC: @ 0x080655FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _08065690 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	adds r1, #4
	adds r3, r0, r1
	ldr r4, _08065694 @ =IWRAM_START + 0x64
	adds r5, r0, r4
	ldr r7, _08065698 @ =IWRAM_START + 0xC4
	adds r7, r7, r0
	mov r8, r7
	ldr r0, [r6]
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r4, #0
	mov ip, r2
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	movs r7, #0xa8
	lsls r7, r7, #1
	adds r2, r0, r7
_08065634:
	strh r2, [r3, #0x16]
	lsls r0, r4, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r0, r4
	adds r3, #0x30
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08065634
	asrs r2, r1, #0x10
	movs r7, #0x89
	lsls r7, r7, #1
	adds r0, r2, r7
	strh r0, [r5, #0x16]
	adds r5, #0x30
	movs r1, #0xa7
	lsls r1, r1, #1
	adds r0, r2, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xf4
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	movs r4, #0x88
	lsls r4, r4, #1
	adds r0, r0, r4
	adds r2, r2, r0
	mov r7, r8
	strh r2, [r7, #0x16]
	adds r1, r6, #0
	adds r1, #0xf5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bgt _0806569C
	bl sub_806AE54
	b _080656A4
	.align 2, 0
_08065690: .4byte gCurTask
_08065694: .4byte IWRAM_START + 0x64
_08065698: .4byte IWRAM_START + 0xC4
_0806569C:
	mov r1, ip
	ldr r0, [r1]
	bl TaskDestroy
_080656A4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80656B0
sub_80656B0: @ 0x080656B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	movs r0, #4
	add r0, sl
	mov ip, r0
	mov r7, sl
	adds r7, #0x64
	mov r1, sl
	adds r1, #0xc4
	str r1, [sp, #0x18]
	mov r0, sl
	adds r0, #0xf6
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r2, r5, #3
	mov r8, r2
	ldr r1, _0806582C @ =gUnknown_080D98E8
	add r1, r8
	ldr r0, _08065830 @ =gUnknown_080D9918
	add r8, r0
	lsls r5, r5, #4
	ldr r0, _08065834 @ =gUnknown_080D97F8
	adds r5, r5, r0
	mov r2, sl
	ldr r0, [r2]
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	mov r0, sl
	adds r0, #0xf4
	movs r6, #0
	ldrsb r6, [r0, r6]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	mov sb, r0
	movs r0, #0xa8
	lsls r0, r0, #0x11
	adds r4, r4, r0
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	movs r0, #0x32
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	mov r0, ip
	movs r1, #1
	bl sub_806A568
	movs r2, #0x34
	add r2, sl
	mov ip, r2
	mov r0, r8
	ldrh r2, [r0, #4]
	ldrh r3, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	str r4, [sp, #4]
	movs r0, #0x74
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	mov r1, r8
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	mov r0, ip
	movs r1, #1
	bl sub_806A568
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r0, #0x89
	lsls r0, r0, #1
	add r0, sb
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r4, #0x4c
	str r4, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #1
	bl sub_806A568
	adds r7, #0x30
	adds r5, #8
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0xa7
	lsls r0, r0, #1
	add r0, sb
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #1
	bl sub_806A568
	movs r3, #0xee
	lsls r3, r3, #2
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #0x12
	movs r2, #0x88
	lsls r2, r2, #0x11
	adds r0, r0, r2
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #7
	str r0, [sp, #0xc]
	movs r0, #3
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #1
	movs r2, #0x12
	bl sub_806A568
	movs r1, #0
	subs r7, #0x30
_080657F8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	eors r1, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	adds r1, r7, #0
	adds r1, #0x25
	strb r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	adds r7, #0x30
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _080657F8
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806582C: .4byte gUnknown_080D98E8
_08065830: .4byte gUnknown_080D9918
_08065834: .4byte gUnknown_080D97F8

	thumb_func_start sub_8065838
sub_8065838: @ 0x08065838
	push {r4, r5, r6, r7, lr}
	ldr r0, _080658D0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #4
	adds r3, r0, r1
	ldr r2, _080658D4 @ =IWRAM_START + 0x64
	adds r4, r0, r2
	ldr r6, _080658D8 @ =IWRAM_START + 0xC4
	adds r7, r0, r6
	ldr r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r2, #0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r6, #0xa8
	lsls r6, r6, #1
	adds r1, r1, r6
	adds r6, r0, #0
_0806586A:
	strh r1, [r3, #0x16]
	lsls r0, r2, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r3, #0x30
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806586A
	asrs r2, r6, #0x10
	movs r6, #0x89
	lsls r6, r6, #1
	adds r0, r2, r6
	strh r0, [r4, #0x16]
	adds r4, #0x30
	movs r1, #0xa7
	lsls r1, r1, #1
	adds r0, r2, r1
	strh r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0xf4
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r6, #2
	adds r0, r0, r6
	adds r2, r2, r0
	strh r2, [r7, #0x16]
	bl sub_806AF10
	adds r1, r5, #0
	adds r1, #0xf5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xf
	ble _080658CA
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080658D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080658DC @ =sub_80658E0
	str r0, [r1, #8]
_080658CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080658D0: .4byte gCurTask
_080658D4: .4byte IWRAM_START + 0x64
_080658D8: .4byte IWRAM_START + 0xC4
_080658DC: .4byte sub_80658E0

	thumb_func_start sub_80658E0
sub_80658E0: @ 0x080658E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080659E8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r0, _080659EC @ =IWRAM_START + 0x64
	adds r6, r4, r0
	ldr r1, _080659F0 @ =IWRAM_START + 0xC4
	adds r1, r1, r4
	mov sb, r1
	mov r2, r8
	ldr r7, [r2]
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrh r5, [r0]
	ldr r1, _080659F4 @ =IWRAM_START + 0xF6
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _080659F8 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08065988
	movs r0, #0x6c
	bl m4aSongNumStart
	movs r2, #0
	ldr r3, _080659FC @ =IWRAM_START + 0xF4
	adds r1, r4, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08065940
	movs r2, #1
_08065940:
	strb r2, [r1]
	movs r0, #0
	ldr r1, _080659FC @ =IWRAM_START + 0xF4
	adds r4, r4, r1
	lsls r5, r5, #0x10
	adds r3, r4, #0
_0806594C:
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	eors r2, r1
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	adds r2, r6, #0
	adds r2, #0x25
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	adds r6, #0x30
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	ble _0806594C
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r1, r2
	asrs r0, r5, #0x10
	adds r0, r0, r1
	mov r3, sb
	strh r0, [r3, #0x16]
_08065988:
	bl sub_806AF10
	ldr r0, _080659F8 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08065A34
	ldr r0, _08065A00 @ =gPressedKeys
	ldrh r1, [r0]
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _08065A18
	mov r0, sl
	lsls r2, r0, #0x10
	asrs r2, r2, #0xc
	mov r5, r8
	adds r5, #0xf4
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _08065A04 @ =gUnknown_080D97F8
	adds r0, r0, r1
	adds r2, r2, r0
	ldr r1, _08065A08 @ =0x000005F4
	adds r6, r7, r1
	ldrh r1, [r2, #2]
	ldr r3, _08065A0C @ =0x00000614
	adds r0, r7, r3
	strb r1, [r0]
	ldrh r0, [r2]
	movs r4, #0
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	bl sub_8004558
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrb r1, [r5]
	ldr r2, _08065A10 @ =0x0000035A
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _08065A14 @ =0x00000784
	adds r0, r7, r3
	b _08065A2A
	.align 2, 0
_080659E8: .4byte gCurTask
_080659EC: .4byte IWRAM_START + 0x64
_080659F0: .4byte IWRAM_START + 0xC4
_080659F4: .4byte IWRAM_START + 0xF6
_080659F8: .4byte gRepeatedKeys
_080659FC: .4byte IWRAM_START + 0xF4
_08065A00: .4byte gPressedKeys
_08065A04: .4byte gUnknown_080D97F8
_08065A08: .4byte 0x000005F4
_08065A0C: .4byte 0x00000614
_08065A10: .4byte 0x0000035A
_08065A14: .4byte 0x00000784
_08065A18:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08065A34
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _08065A44 @ =0x00000784
	adds r0, r7, r1
_08065A2A:
	strb r4, [r0]
	ldr r0, _08065A48 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08065A4C @ =sub_8065A50
	str r0, [r1, #8]
_08065A34:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065A44: .4byte 0x00000784
_08065A48: .4byte gCurTask
_08065A4C: .4byte sub_8065A50

	thumb_func_start sub_8065A50
sub_8065A50: @ 0x08065A50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _08065AE4 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	adds r1, #4
	adds r3, r0, r1
	ldr r4, _08065AE8 @ =IWRAM_START + 0x64
	adds r5, r0, r4
	ldr r7, _08065AEC @ =IWRAM_START + 0xC4
	adds r7, r7, r0
	mov r8, r7
	ldr r0, [r6]
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r4, #0
	mov ip, r2
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	movs r7, #0xa8
	lsls r7, r7, #1
	adds r2, r0, r7
_08065A88:
	strh r2, [r3, #0x16]
	lsls r0, r4, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r0, r4
	adds r3, #0x30
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08065A88
	asrs r2, r1, #0x10
	movs r7, #0x89
	lsls r7, r7, #1
	adds r0, r2, r7
	strh r0, [r5, #0x16]
	adds r5, #0x30
	movs r1, #0xa7
	lsls r1, r1, #1
	adds r0, r2, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xf4
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	movs r4, #0x88
	lsls r4, r4, #1
	adds r0, r0, r4
	adds r2, r2, r0
	mov r7, r8
	strh r2, [r7, #0x16]
	adds r1, r6, #0
	adds r1, #0xf5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bgt _08065AF0
	bl sub_806AF10
	b _08065AF8
	.align 2, 0
_08065AE4: .4byte gCurTask
_08065AE8: .4byte IWRAM_START + 0x64
_08065AEC: .4byte IWRAM_START + 0xC4
_08065AF0:
	mov r1, ip
	ldr r0, [r1]
	bl TaskDestroy
_08065AF8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8065B04
sub_8065B04: @ 0x08065B04
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08065B40 @ =sub_8065F04
	movs r1, #0x93
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	str r5, [r3]
	movs r1, #0xd4
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrh r1, [r0]
	cmp r1, #2
	beq _08065B58
	cmp r1, #2
	bgt _08065B44
	cmp r1, #1
	beq _08065B4E
	b _08065B66
	.align 2, 0
_08065B40: .4byte sub_8065F04
_08065B44:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _08065B60
	b _08065B66
_08065B4E:
	ldr r1, _08065B54 @ =IWRAM_START + 0x244
	b _08065B62
	.align 2, 0
_08065B54: .4byte IWRAM_START + 0x244
_08065B58:
	ldr r1, _08065B5C @ =IWRAM_START + 0x245
	b _08065B62
	.align 2, 0
_08065B5C: .4byte IWRAM_START + 0x245
_08065B60:
	ldr r1, _08065B7C @ =IWRAM_START + 0x246
_08065B62:
	adds r0, r2, r1
	strb r4, [r0]
_08065B66:
	ldr r2, _08065B80 @ =0x00000352
	adds r0, r5, r2
	ldrh r1, [r0]
	cmp r1, #2
	beq _08065B98
	cmp r1, #2
	bgt _08065B84
	cmp r1, #1
	beq _08065B8E
	b _08065BAC
	.align 2, 0
_08065B7C: .4byte IWRAM_START + 0x246
_08065B80: .4byte 0x00000352
_08065B84:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _08065BA4
	b _08065BAC
_08065B8E:
	movs r2, #0x91
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r1, [r0]
	b _08065BAC
_08065B98:
	ldr r0, _08065BA0 @ =0x00000245
	adds r1, r3, r0
	b _08065BA8
	.align 2, 0
_08065BA0: .4byte 0x00000245
_08065BA4:
	ldr r2, _08065BC4 @ =0x00000246
	adds r1, r3, r2
_08065BA8:
	movs r0, #1
	strb r0, [r1]
_08065BAC:
	movs r1, #0xd5
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrh r1, [r0]
	cmp r1, #2
	beq _08065BDA
	cmp r1, #2
	bgt _08065BC8
	cmp r1, #1
	beq _08065BD2
	b _08065BF0
	.align 2, 0
_08065BC4: .4byte 0x00000246
_08065BC8:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _08065BE8
	b _08065BF0
_08065BD2:
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r3, r2
	b _08065BEC
_08065BDA:
	ldr r2, _08065BE4 @ =0x00000245
	adds r0, r3, r2
	strb r1, [r0]
	b _08065BF0
	.align 2, 0
_08065BE4: .4byte 0x00000245
_08065BE8:
	ldr r0, _08065C1C @ =0x00000246
	adds r1, r3, r0
_08065BEC:
	movs r0, #2
	strb r0, [r1]
_08065BF0:
	ldr r1, _08065C20 @ =0x00000247
	adds r0, r3, r1
	movs r1, #0
	strb r1, [r0]
	movs r2, #0x92
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, _08065C24 @ =0x0000035B
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r2, #1
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_8065C28
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065C1C: .4byte 0x00000246
_08065C20: .4byte 0x00000247
_08065C24: .4byte 0x0000035B

	thumb_func_start sub_8065C28
sub_8065C28: @ 0x08065C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	adds r1, r7, #4
	movs r0, #0x92
	lsls r0, r0, #1
	adds r0, r0, r7
	mov sl, r0
	movs r2, #0xda
	lsls r2, r2, #1
	adds r2, r7, r2
	str r2, [sp, #0x18]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r5, r7, r5
	str r5, [sp, #0x1c]
	ldr r2, _08065EE4 @ =0x00000249
	adds r0, r7, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r5, r0, #1
	mov r8, r5
	add r8, r0
	mov r0, r8
	lsls r0, r0, #3
	mov r8, r0
	ldr r4, _08065EE8 @ =gUnknown_080D9948
	add r4, r8
	ldr r6, _08065EEC @ =gUnknown_080D99D8
	ldr r0, _08065EF0 @ =gUnknown_080D99F0
	add r8, r0
	ldr r0, [r7]
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r5, [r0]
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r5, r5, #0x10
	asrs r0, r5, #0x10
	str r0, [sp, #0x20]
	movs r0, #0xa8
	lsls r0, r0, #0x11
	adds r5, r5, r0
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	movs r0, #0x1c
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r4, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	mov sb, r0
	str r0, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #1
	bl sub_806A568
	adds r1, r7, #0
	adds r1, #0x34
	adds r4, #8
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r4, #2]
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #1
	bl sub_806A568
	adds r1, r7, #0
	adds r1, #0x64
	adds r4, #8
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0x87
	str r0, [sp, #8]
	movs r5, #8
	str r5, [sp, #0xc]
	ldrb r0, [r4, #2]
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #1
	bl sub_806A568
	adds r1, r7, #0
	adds r1, #0x94
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [sp]
	ldr r0, [sp, #0x20]
	movs r5, #0x84
	lsls r5, r5, #1
	adds r4, r0, r5
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r5, #8
	str r5, [sp, #0xc]
	ldrb r0, [r6, #2]
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #1
	bl sub_806A568
	adds r1, r7, #0
	adds r1, #0xc4
	adds r6, #8
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x4d
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r6, #2]
	str r0, [sp, #0x10]
	mov r5, sb
	str r5, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #1
	bl sub_806A568
	adds r1, r7, #0
	adds r1, #0xf4
	adds r6, #8
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x65
	str r0, [sp, #8]
	movs r5, #8
	str r5, [sp, #0xc]
	ldrb r0, [r6, #2]
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #1
	bl sub_806A568
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r2, [r0, #4]
	ldrh r3, [r0]
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [sp]
	ldr r0, [sp, #0x20]
	movs r5, #0xa6
	lsls r5, r5, #1
	adds r4, r0, r5
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	movs r0, #0x2d
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrb r0, [r0, #2]
	str r0, [sp, #0x10]
	mov r1, sb
	str r1, [sp, #0x14]
	mov r0, sl
	movs r1, #1
	bl sub_806A568
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r2, r2, r7
	mov sl, r2
	adds r5, #0xf9
	adds r1, r7, r5
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r2, [r0, #4]
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x45
	str r0, [sp, #8]
	movs r5, #8
	str r5, [sp, #0xc]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrb r0, [r0, #2]
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	mov r0, sl
	movs r1, #1
	bl sub_806A568
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r1, r1, r7
	mov sl, r1
	ldr r2, _08065EF4 @ =0x00000246
	adds r1, r7, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r2, [r0, #4]
	ldrh r3, [r0]
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x5d
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrb r0, [r0, #2]
	str r0, [sp, #0x10]
	mov r1, sb
	str r1, [sp, #0x14]
	mov r0, sl
	movs r1, #1
	bl sub_806A568
	ldr r5, _08065EF8 @ =0x000003B6
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp]
	ldr r0, [sp, #0x20]
	adds r0, #0xfc
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x2a
	str r0, [sp, #8]
	movs r4, #6
	str r4, [sp, #0xc]
	movs r0, #7
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #1
	movs r2, #0x42
	adds r3, r5, #0
	bl sub_806A568
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	ldr r2, [sp, #0x20]
	ldr r1, _08065EFC @ =0x00000143
	adds r0, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r2, #0x35
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	mov r1, sb
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #1
	movs r2, #2
	adds r3, r5, #0
	bl sub_806A568
	movs r2, #0xf2
	lsls r2, r2, #1
	adds r2, r7, r2
	str r2, [sp, #0x18]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	ldr r1, [sp, #0x20]
	ldr r2, _08065F00 @ =0x0000019D
	adds r0, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #9
	str r0, [sp, #0x10]
	mov r1, sb
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #1
	movs r2, #2
	adds r3, r5, #0
	bl sub_806A568
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065EE4: .4byte 0x00000249
_08065EE8: .4byte gUnknown_080D9948
_08065EEC: .4byte gUnknown_080D99D8
_08065EF0: .4byte gUnknown_080D99F0
_08065EF4: .4byte 0x00000246
_08065EF8: .4byte 0x000003B6
_08065EFC: .4byte 0x00000143
_08065F00: .4byte 0x0000019D

	thumb_func_start sub_8065F04
sub_8065F04: @ 0x08065F04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08065FE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _08065FEC @ =IWRAM_START+4
	adds r3, r0, r1
	ldr r2, _08065FF0 @ =IWRAM_START + 0x124
	adds r5, r0, r2
	ldr r4, _08065FF4 @ =IWRAM_START + 0x1B4
	adds r4, r4, r0
	mov ip, r4
	ldr r1, _08065FF8 @ =IWRAM_START + 0x214
	adds r1, r1, r0
	mov sb, r1
	mov r2, r8
	ldr r0, [r2]
	movs r4, #0xd8
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r4, #0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xa8
	lsls r2, r2, #1
	adds r1, r1, r2
	adds r6, r0, #0
_08065F48:
	strh r1, [r3, #0x16]
	lsls r0, r4, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r0, r4
	lsrs r4, r0, #0x10
	adds r3, #0x30
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r2, #2
	ble _08065F48
	adds r1, r0, #0
	mov r7, ip
	adds r7, #0x30
	cmp r2, #5
	bgt _08065F80
	asrs r0, r6, #0x10
	movs r4, #0x84
	lsls r4, r4, #1
	adds r2, r0, r4
_08065F70:
	strh r2, [r3, #0x16]
	adds r3, #0x30
	movs r0, #0x80
	lsls r0, r0, #9
	adds r1, r1, r0
	asrs r0, r1, #0x10
	cmp r0, #5
	ble _08065F70
_08065F80:
	movs r4, #0
	asrs r0, r6, #0x10
	movs r2, #0xa6
	lsls r2, r2, #1
	adds r1, r0, r2
_08065F8A:
	strh r1, [r5, #0x16]
	lsls r0, r4, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r0, r4
	adds r5, #0x30
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08065F8A
	asrs r1, r6, #0x10
	adds r0, r1, #0
	adds r0, #0xfc
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r4, _08065FFC @ =0x00000143
	adds r0, r1, r4
	mov r2, ip
	strh r0, [r2, #0x16]
	adds r4, #0x5a
	adds r0, r1, r4
	strh r0, [r7, #0x16]
	bl sub_8066818
	movs r1, #0x92
	lsls r1, r1, #2
	add r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xf
	ble _08065FDA
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08065FE8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08066000 @ =sub_8066004
	str r0, [r1, #8]
_08065FDA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065FE8: .4byte gCurTask
_08065FEC: .4byte IWRAM_START+4
_08065FF0: .4byte IWRAM_START + 0x124
_08065FF4: .4byte IWRAM_START + 0x1B4
_08065FF8: .4byte IWRAM_START + 0x214
_08065FFC: .4byte 0x00000143
_08066000: .4byte sub_8066004

	thumb_func_start sub_8066004
sub_8066004: @ 0x08066004
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08066068 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _0806606C @ =IWRAM_START + 0x124
	adds r5, r4, r1
	ldr r2, _08066070 @ =IWRAM_START + 0x249
	adds r0, r4, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08066074 @ =gUnknown_080D99F0
	adds r0, r0, r1
	mov r8, r0
	bl sub_8066818
	ldr r7, _08066078 @ =gRepeatedKeys
	ldrh r1, [r7]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080660BE
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrh r1, [r7]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08066086
	ldr r3, _0806607C @ =IWRAM_START + 0x244
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08066080
	subs r0, #1
	strb r0, [r1]
	b _0806609E
	.align 2, 0
_08066068: .4byte gCurTask
_0806606C: .4byte IWRAM_START + 0x124
_08066070: .4byte IWRAM_START + 0x249
_08066074: .4byte gUnknown_080D99F0
_08066078: .4byte gRepeatedKeys
_0806607C: .4byte IWRAM_START + 0x244
_08066080:
	movs r0, #2
	strb r0, [r1]
	b _0806609E
_08066086:
	ldr r0, _08066098 @ =IWRAM_START + 0x244
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #1
	bhi _0806609C
	adds r0, #1
	strb r0, [r1]
	b _0806609E
	.align 2, 0
_08066098: .4byte IWRAM_START + 0x244
_0806609C:
	strb r2, [r1]
_0806609E:
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0]
	strh r1, [r5, #0xa]
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8004558
	b _08066212
_080660BE:
	ldr r0, _080660F0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r5, #1
	ands r5, r1
	cmp r5, #0
	bne _080660CC
	b _080661CC
_080660CC:
	ldr r3, _080660F4 @ =IWRAM_START + 0x244
	adds r2, r4, r3
	ldr r5, _080660F8 @ =IWRAM_START + 0x245
	adds r1, r4, r5
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	bne _08066136
	adds r3, r2, #0
	adds r5, #1
	adds r2, r4, r5
	movs r4, #0
_080660E4:
	ldrb r0, [r1]
	cmp r0, #1
	bhi _080660FC
	adds r0, #1
	strb r0, [r1]
	b _080660FE
	.align 2, 0
_080660F0: .4byte gPressedKeys
_080660F4: .4byte IWRAM_START + 0x244
_080660F8: .4byte IWRAM_START + 0x245
_080660FC:
	strb r4, [r1]
_080660FE:
	ldrb r0, [r3]
	ldrb r5, [r1]
	cmp r0, r5
	beq _080660E4
	ldrb r5, [r2]
	cmp r0, r5
	beq _080660E4
	movs r0, #0xaa
	lsls r0, r0, #1
	adds r5, r6, r0
	ldr r2, _08066160 @ =0x00000245
	adds r1, r6, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	movs r3, #0xba
	lsls r3, r3, #1
	adds r0, r6, r3
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8004558
_08066136:
	movs r5, #0x91
	lsls r5, r5, #2
	adds r3, r6, r5
	ldr r0, _08066164 @ =0x00000246
	adds r1, r6, r0
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	bne _080661A2
	adds r2, r1, #0
	adds r4, r3, #0
	adds r5, #1
	adds r3, r6, r5
	movs r5, #0
_08066152:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _08066168
	adds r0, #1
	strb r0, [r2]
	b _0806616A
	.align 2, 0
_08066160: .4byte 0x00000245
_08066164: .4byte 0x00000246
_08066168:
	strb r5, [r2]
_0806616A:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08066152
	ldrb r0, [r3]
	cmp r0, r1
	beq _08066152
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r5, r6, r0
	ldr r2, _080661BC @ =0x00000246
	adds r1, r6, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	movs r3, #0xd2
	lsls r3, r3, #1
	adds r0, r6, r3
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8004558
_080661A2:
	ldr r5, _080661C0 @ =0x00000247
	adds r1, r6, r5
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _080661C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080661C8 @ =sub_806AFAC
	str r0, [r1, #8]
	b _08066212
	.align 2, 0
_080661BC: .4byte 0x00000246
_080661C0: .4byte 0x00000247
_080661C4: .4byte gCurTask
_080661C8: .4byte sub_806AFAC
_080661CC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08066200
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _080661F4 @ =IWRAM_START + 0x248
	adds r0, r4, r1
	strb r5, [r0]
	ldr r0, [r6]
	ldr r2, _080661F8 @ =0x00000784
	adds r0, r0, r2
	strb r5, [r0]
	mov r3, sb
	ldr r1, [r3]
	ldr r0, _080661FC @ =sub_8066718
	str r0, [r1, #8]
	b _08066212
	.align 2, 0
_080661F4: .4byte IWRAM_START + 0x248
_080661F8: .4byte 0x00000784
_080661FC: .4byte sub_8066718
_08066200:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08066212
	movs r0, #0x6a
	bl m4aSongNumStart
	bl sub_80665D8
_08066212:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8066220
sub_8066220: @ 0x08066220
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08066280 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _08066284 @ =IWRAM_START + 0x249
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08066288 @ =gUnknown_080D99F0
	adds r0, r0, r1
	mov r8, r0
	bl sub_8066818
	ldr r5, _0806628C @ =gRepeatedKeys
	ldrh r1, [r5]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08066304
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrh r1, [r5]
	movs r0, #0x20
	ands r0, r1
	ldr r2, _08066290 @ =IWRAM_START + 0x174
	adds r7, r4, r2
	cmp r0, #0
	beq _080662A8
	ldr r5, _08066294 @ =IWRAM_START + 0x245
	adds r1, r4, r5
	ldr r0, _08066298 @ =IWRAM_START + 0x244
	adds r2, r4, r0
	movs r3, #2
_08066274:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806629C
	subs r0, #1
	strb r0, [r1]
	b _0806629E
	.align 2, 0
_08066280: .4byte gCurTask
_08066284: .4byte IWRAM_START + 0x249
_08066288: .4byte gUnknown_080D99F0
_0806628C: .4byte gRepeatedKeys
_08066290: .4byte IWRAM_START + 0x174
_08066294: .4byte IWRAM_START + 0x245
_08066298: .4byte IWRAM_START + 0x244
_0806629C:
	strb r3, [r1]
_0806629E:
	ldrb r0, [r2]
	ldrb r4, [r1]
	cmp r0, r4
	beq _08066274
	b _080662DE
_080662A8:
	movs r0, #0x10
	ands r0, r1
	ldr r5, _080662CC @ =IWRAM_START + 0x174
	adds r7, r4, r5
	cmp r0, #0
	beq _080662DE
	ldr r0, _080662D0 @ =IWRAM_START + 0x245
	adds r1, r4, r0
	adds r5, #0xd0
	adds r2, r4, r5
	movs r3, #0
_080662BE:
	ldrb r0, [r1]
	cmp r0, #1
	bhi _080662D4
	adds r0, #1
	strb r0, [r1]
	b _080662D6
	.align 2, 0
_080662CC: .4byte IWRAM_START + 0x174
_080662D0: .4byte IWRAM_START + 0x245
_080662D4:
	strb r3, [r1]
_080662D6:
	ldrb r0, [r2]
	ldrb r4, [r1]
	cmp r0, r4
	beq _080662BE
_080662DE:
	ldr r5, _08066300 @ =0x00000245
	adds r0, r6, r5
	ldrb r0, [r0]
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r2, r6, r1
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0]
	strh r1, [r2, #0xa]
	ldrh r0, [r0, #2]
	strb r0, [r7]
	adds r0, r2, #0
	bl sub_8004558
	b _0806646E
	.align 2, 0
_08066300: .4byte 0x00000245
_08066304:
	ldr r0, _08066344 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080663B4
	ldr r2, _08066348 @ =IWRAM_START + 0x244
	adds r3, r4, r2
	ldr r5, _0806634C @ =IWRAM_START + 0x246
	adds r2, r4, r5
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0806632A
	subs r5, #1
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, r1
	bne _0806638C
_0806632A:
	ldr r0, _08066350 @ =IWRAM_START + 0x1A4
	adds r7, r4, r0
	adds r5, r3, #0
	ldr r1, _08066354 @ =IWRAM_START + 0x245
	adds r3, r4, r1
	movs r4, #0
_08066336:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _08066358
	adds r0, #1
	strb r0, [r2]
	b _0806635A
	.align 2, 0
_08066344: .4byte gPressedKeys
_08066348: .4byte IWRAM_START + 0x244
_0806634C: .4byte IWRAM_START + 0x246
_08066350: .4byte IWRAM_START + 0x1A4
_08066354: .4byte IWRAM_START + 0x245
_08066358:
	strb r4, [r2]
_0806635A:
	ldrb r0, [r5]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08066336
	ldrb r0, [r3]
	cmp r0, r1
	beq _08066336
	movs r4, #0xc2
	lsls r4, r4, #1
	adds r2, r6, r4
	ldr r5, _080663A4 @ =0x00000246
	adds r1, r6, r5
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #2]
	strb r0, [r7]
	adds r0, r2, #0
	bl sub_8004558
_0806638C:
	ldr r0, _080663A8 @ =0x00000247
	adds r1, r6, r0
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _080663AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080663B0 @ =sub_806AFEC
	str r0, [r1, #8]
	b _0806646E
	.align 2, 0
_080663A4: .4byte 0x00000246
_080663A8: .4byte 0x00000247
_080663AC: .4byte gCurTask
_080663B0: .4byte sub_806AFEC
_080663B4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806645C
	ldr r1, _080663F0 @ =IWRAM_START + 0x244
	adds r3, r4, r1
	ldr r5, _080663F4 @ =IWRAM_START + 0x245
	adds r2, r4, r5
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _080663D6
	adds r5, #1
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	bne _08066434
_080663D6:
	ldr r0, _080663F8 @ =IWRAM_START + 0x174
	adds r7, r4, r0
	adds r5, r3, #0
	ldr r1, _080663FC @ =IWRAM_START + 0x246
	adds r3, r4, r1
	movs r4, #0
_080663E2:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _08066400
	adds r0, #1
	strb r0, [r2]
	b _08066402
	.align 2, 0
_080663F0: .4byte IWRAM_START + 0x244
_080663F4: .4byte IWRAM_START + 0x245
_080663F8: .4byte IWRAM_START + 0x174
_080663FC: .4byte IWRAM_START + 0x246
_08066400:
	strb r4, [r2]
_08066402:
	ldrb r0, [r5]
	ldrb r1, [r2]
	cmp r0, r1
	beq _080663E2
	ldrb r0, [r3]
	cmp r1, r0
	beq _080663E2
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r2, r6, r1
	ldr r4, _0806644C @ =0x00000245
	adds r1, r6, r4
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #2]
	strb r0, [r7]
	adds r0, r2, #0
	bl sub_8004558
_08066434:
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r5, _08066450 @ =0x00000247
	adds r1, r6, r5
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08066454 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08066458 @ =sub_806AF6C
	str r0, [r1, #8]
	b _0806646E
	.align 2, 0
_0806644C: .4byte 0x00000245
_08066450: .4byte 0x00000247
_08066454: .4byte gCurTask
_08066458: .4byte sub_806AF6C
_0806645C:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806646E
	movs r0, #0x6a
	bl m4aSongNumStart
	bl sub_80665D8
_0806646E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8066478
sub_8066478: @ 0x08066478
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080664C0 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov r8, r0
	ldr r5, [r0]
	bl sub_8066818
	ldr r0, _080664C4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r7, #1
	adds r4, r7, #0
	ands r4, r1
	cmp r4, #0
	bne _080664A6
	b _08066590
_080664A6:
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _080664C8 @ =IWRAM_START + 0x244
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080664D8
	cmp r0, #1
	bgt _080664CC
	cmp r0, #0
	beq _080664D2
	b _080664EC
	.align 2, 0
_080664C0: .4byte gCurTask
_080664C4: .4byte gPressedKeys
_080664C8: .4byte IWRAM_START + 0x244
_080664CC:
	cmp r0, #2
	beq _080664E4
	b _080664EC
_080664D2:
	movs r2, #0xd4
	lsls r2, r2, #2
	b _080664E8
_080664D8:
	ldr r1, _080664E0 @ =0x00000352
	adds r0, r5, r1
	b _080664EA
	.align 2, 0
_080664E0: .4byte 0x00000352
_080664E4:
	movs r2, #0xd5
	lsls r2, r2, #2
_080664E8:
	adds r0, r5, r2
_080664EA:
	strh r7, [r0]
_080664EC:
	ldr r0, _08066500 @ =0x00000245
	add r0, r8
	ldrb r1, [r0]
	cmp r1, #1
	beq _08066512
	cmp r1, #1
	bgt _08066504
	cmp r1, #0
	beq _0806650A
	b _08066528
	.align 2, 0
_08066500: .4byte 0x00000245
_08066504:
	cmp r1, #2
	beq _08066520
	b _08066528
_0806650A:
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r5, r0
	b _08066516
_08066512:
	ldr r2, _0806651C @ =0x00000352
	adds r1, r5, r2
_08066516:
	movs r0, #2
	strh r0, [r1]
	b _08066528
	.align 2, 0
_0806651C: .4byte 0x00000352
_08066520:
	movs r2, #0xd5
	lsls r2, r2, #2
	adds r0, r5, r2
	strh r1, [r0]
_08066528:
	ldr r0, _0806653C @ =0x00000246
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	beq _0806654C
	cmp r0, #1
	bgt _08066540
	cmp r0, #0
	beq _08066546
	b _08066564
	.align 2, 0
_0806653C: .4byte 0x00000246
_08066540:
	cmp r0, #2
	beq _08066558
	b _08066564
_08066546:
	movs r0, #0xd4
	lsls r0, r0, #2
	b _0806655C
_0806654C:
	ldr r2, _08066554 @ =0x00000352
	adds r1, r5, r2
	b _0806655E
	.align 2, 0
_08066554: .4byte 0x00000352
_08066558:
	movs r0, #0xd5
	lsls r0, r0, #2
_0806655C:
	adds r1, r5, r0
_0806655E:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_08066564:
	movs r0, #0x92
	lsls r0, r0, #2
	add r0, r8
	movs r1, #0
	strb r1, [r0]
	mov r2, r8
	ldr r0, [r2]
	ldr r2, _08066584 @ =0x00000784
	adds r0, r0, r2
	strb r1, [r0]
	ldr r0, _08066588 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806658C @ =sub_8066718
	str r0, [r1, #8]
	b _080665CA
	.align 2, 0
_08066584: .4byte 0x00000784
_08066588: .4byte gCurTask
_0806658C: .4byte sub_8066718
_08066590:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080665B8
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _080665B0 @ =IWRAM_START + 0x247
	adds r0, r6, r1
	strb r4, [r0]
	mov r2, sb
	ldr r1, [r2]
	ldr r0, _080665B4 @ =sub_806AFAC
	str r0, [r1, #8]
	b _080665CA
	.align 2, 0
_080665B0: .4byte IWRAM_START + 0x247
_080665B4: .4byte sub_806AFAC
_080665B8:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080665CA
	movs r0, #0x6a
	bl m4aSongNumStart
	bl sub_80665D8
_080665CA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80665D8
sub_80665D8: @ 0x080665D8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08066628 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r2, r0
	ldr r3, [r6]
	ldr r0, _0806662C @ =IWRAM_START + 0x124
	adds r5, r2, r0
	ldr r1, _08066630 @ =IWRAM_START + 0x249
	adds r0, r2, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08066634 @ =gUnknown_080D99F0
	adds r7, r0, r1
	ldr r4, _08066638 @ =IWRAM_START + 0x244
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	adds r4, #1
	adds r0, r2, r4
	movs r4, #1
	strb r4, [r0]
	ldr r0, _0806663C @ =IWRAM_START + 0x246
	adds r2, r2, r0
	movs r0, #2
	strb r0, [r2]
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806664C
	cmp r0, #1
	bgt _08066640
	cmp r0, #0
	beq _08066646
	b _08066660
	.align 2, 0
_08066628: .4byte gCurTask
_0806662C: .4byte IWRAM_START + 0x124
_08066630: .4byte IWRAM_START + 0x249
_08066634: .4byte gUnknown_080D99F0
_08066638: .4byte IWRAM_START + 0x244
_0806663C: .4byte IWRAM_START + 0x246
_08066640:
	cmp r0, #2
	beq _08066658
	b _08066660
_08066646:
	movs r1, #0xd4
	lsls r1, r1, #2
	b _0806665C
_0806664C:
	ldr r2, _08066654 @ =0x00000352
	adds r0, r3, r2
	b _0806665E
	.align 2, 0
_08066654: .4byte 0x00000352
_08066658:
	movs r1, #0xd5
	lsls r1, r1, #2
_0806665C:
	adds r0, r3, r1
_0806665E:
	strh r4, [r0]
_08066660:
	ldr r2, _08066674 @ =0x00000245
	adds r0, r6, r2
	ldrb r1, [r0]
	cmp r1, #1
	beq _08066686
	cmp r1, #1
	bgt _08066678
	cmp r1, #0
	beq _0806667E
	b _0806669C
	.align 2, 0
_08066674: .4byte 0x00000245
_08066678:
	cmp r1, #2
	beq _08066694
	b _0806669C
_0806667E:
	movs r4, #0xd4
	lsls r4, r4, #2
	adds r1, r3, r4
	b _0806668A
_08066686:
	ldr r0, _08066690 @ =0x00000352
	adds r1, r3, r0
_0806668A:
	movs r0, #2
	strh r0, [r1]
	b _0806669C
	.align 2, 0
_08066690: .4byte 0x00000352
_08066694:
	movs r2, #0xd5
	lsls r2, r2, #2
	adds r0, r3, r2
	strh r1, [r0]
_0806669C:
	ldr r4, _080666B0 @ =0x00000246
	adds r0, r6, r4
	ldrb r0, [r0]
	cmp r0, #1
	beq _080666C2
	cmp r0, #1
	bgt _080666B4
	cmp r0, #0
	beq _080666BA
	b _080666D8
	.align 2, 0
_080666B0: .4byte 0x00000246
_080666B4:
	cmp r0, #2
	beq _080666CC
	b _080666D8
_080666BA:
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r3, r0
	b _080666D2
_080666C2:
	ldr r2, _080666C8 @ =0x00000352
	adds r1, r3, r2
	b _080666D2
	.align 2, 0
_080666C8: .4byte 0x00000352
_080666CC:
	movs r4, #0xd5
	lsls r4, r4, #2
	adds r1, r3, r4
_080666D2:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_080666D8:
	movs r0, #0
_080666DA:
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #3
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8004558
	adds r4, #1
	lsls r4, r4, #0x10
	adds r5, #0x30
	lsrs r0, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #2
	ble _080666DA
	ldr r0, _08066710 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08066714 @ =sub_806AF6C
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066710: .4byte gCurTask
_08066714: .4byte sub_806AF6C

	thumb_func_start sub_8066718
sub_8066718: @ 0x08066718
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _080667E8 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _080667EC @ =IWRAM_START+4
	adds r4, r0, r1
	ldr r3, _080667F0 @ =IWRAM_START + 0x124
	adds r6, r0, r3
	ldr r5, _080667F4 @ =IWRAM_START + 0x1B4
	adds r5, r5, r0
	mov ip, r5
	ldr r1, _080667F8 @ =IWRAM_START + 0x214
	adds r1, r1, r0
	mov sb, r1
	mov r3, r8
	ldr r0, [r3]
	movs r5, #0xd8
	lsls r5, r5, #2
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r5, #0
	mov sl, r2
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	movs r3, #0xa8
	lsls r3, r3, #1
	adds r2, r0, r3
	adds r7, r1, #0
_08066760:
	strh r2, [r4, #0x16]
	lsls r0, r5, #0x10
	movs r5, #0x80
	lsls r5, r5, #9
	adds r0, r0, r5
	lsrs r5, r0, #0x10
	adds r4, #0x30
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	cmp r3, #2
	ble _08066760
	adds r1, r0, #0
	mov r2, ip
	adds r2, #0x30
	cmp r3, #5
	bgt _08066798
	asrs r0, r7, #0x10
	movs r5, #0x84
	lsls r5, r5, #1
	adds r3, r0, r5
_08066788:
	strh r3, [r4, #0x16]
	adds r4, #0x30
	movs r0, #0x80
	lsls r0, r0, #9
	adds r1, r1, r0
	asrs r0, r1, #0x10
	cmp r0, #5
	ble _08066788
_08066798:
	movs r5, #0
	asrs r0, r7, #0x10
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r3, r0, r1
_080667A2:
	strh r3, [r6, #0x16]
	lsls r0, r5, #0x10
	movs r5, #0x80
	lsls r5, r5, #9
	adds r0, r0, r5
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080667A2
	asrs r1, r7, #0x10
	adds r0, r1, #0
	adds r0, #0xfc
	mov r3, sb
	strh r0, [r3, #0x16]
	ldr r5, _080667FC @ =0x00000143
	adds r0, r1, r5
	mov r3, ip
	strh r0, [r3, #0x16]
	adds r5, #0x5a
	adds r0, r1, r5
	strh r0, [r2, #0x16]
	movs r1, #0x92
	lsls r1, r1, #2
	add r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bgt _08066800
	bl sub_8066818
	b _08066808
	.align 2, 0
_080667E8: .4byte gCurTask
_080667EC: .4byte IWRAM_START+4
_080667F0: .4byte IWRAM_START + 0x124
_080667F4: .4byte IWRAM_START + 0x1B4
_080667F8: .4byte IWRAM_START + 0x214
_080667FC: .4byte 0x00000143
_08066800:
	mov r1, sl
	ldr r0, [r1]
	bl TaskDestroy
_08066808:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8066818
sub_8066818: @ 0x08066818
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806689C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _080668A0 @ =IWRAM_START+4
	adds r4, r0, r1
	ldr r1, _080668A4 @ =IWRAM_START + 0x124
	adds r7, r0, r1
	adds r1, #0x90
	adds r6, r0, r1
	adds r1, #0x60
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
_08066838:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08066838
	movs r5, #0
_08066852:
	adds r0, r7, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r7, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08066852
	movs r5, #0
_0806686C:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806686C
	mov r0, r8
	bl sub_80051E8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806689C: .4byte gCurTask
_080668A0: .4byte IWRAM_START+4
_080668A4: .4byte IWRAM_START + 0x124

	thumb_func_start sub_80668A8
sub_80668A8: @ 0x080668A8
	push {lr}
	sub sp, #4
	movs r1, #0xf8
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r2, _0806690C @ =gDispCnt
	movs r3, #0xba
	lsls r3, r3, #5
	adds r1, r3, #0
	strh r1, [r2]
	ldr r2, _08066910 @ =gBgCntRegs
	movs r3, #0
	ldr r1, _08066914 @ =0x00000703
	strh r1, [r2]
	ldr r1, _08066918 @ =0x00004E05
	strh r1, [r2, #4]
	ldr r1, _0806691C @ =0x0000DC0E
	strh r1, [r2, #6]
	ldr r1, _08066920 @ =gBgScrollRegs
	strh r3, [r1]
	strh r3, [r1, #2]
	strh r3, [r1, #8]
	ldr r2, _08066924 @ =0x0000FFFD
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r3, [r1, #0xe]
	str r3, [sp]
	ldr r2, _08066928 @ =0x040000D4
	mov r1, sp
	str r1, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r2, #4]
	ldr r1, _0806692C @ =0x85006000
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	strh r3, [r0]
	movs r1, #2
	strh r1, [r0, #2]
	strh r3, [r0, #4]
	adds r1, #0xfe
	strh r1, [r0, #6]
	strh r3, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	bl sub_802D4CC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0806690C: .4byte gDispCnt
_08066910: .4byte gBgCntRegs
_08066914: .4byte 0x00000703
_08066918: .4byte 0x00004E05
_0806691C: .4byte 0x0000DC0E
_08066920: .4byte gBgScrollRegs
_08066924: .4byte 0x0000FFFD
_08066928: .4byte 0x040000D4
_0806692C: .4byte 0x85006000

	thumb_func_start sub_8066930
sub_8066930: @ 0x08066930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sl
	adds r7, r1, #0
	adds r7, #0x60
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r6, _08066AF0 @ =gUnknown_080D9A80
	ldr r2, _08066AF4 @ =gUnknown_080D9B10
	str r2, [sp, #0x1c]
	ldr r2, _08066AF8 @ =0x00000201
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _08066AFC @ =gUnknown_080D9AE0
	mov sb, r1
	cmp r0, #0
	bne _08066976
	ldr r2, _08066B00 @ =gUnknown_080D9AB0
	mov sb, r2
_08066976:
	adds r0, r6, #0
	movs r1, #6
	bl sub_806B8D4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sb
	movs r1, #6
	bl sub_806B8D4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
	asrs r0, r0, #0xd
	adds r6, r0, r6
	add sb, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r3, [r6]
	movs r1, #0xc0
	lsls r1, r1, #6
	str r1, [sp]
	movs r2, #0x78
	str r2, [sp, #4]
	movs r0, #0x1a
	str r0, [sp, #8]
	movs r0, #0xd
	mov r8, r0
	str r0, [sp, #0xc]
	ldrb r0, [r6, #2]
	str r0, [sp, #0x10]
	movs r6, #0
	str r6, [sp, #0x14]
	mov r0, sl
	movs r1, #0
	adds r2, r4, #0
	bl sub_806A568
	mov r1, sl
	adds r1, #0x30
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sb
	ldrh r3, [r2]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r2, #0x78
	str r2, [sp, #4]
	movs r0, #0x8a
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	mov r2, sb
	ldrb r0, [r2, #2]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	adds r2, r5, #0
	bl sub_806A568
	movs r0, #0
	mov r8, r0
	movs r4, #0x28
	ldr r1, [sp, #0x20]
	mov sl, r1
_08066A04:
	ldr r0, [sp, #0x1c]
	ldrh r2, [r0, #4]
	ldrh r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #6
	mov sb, r1
	str r1, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r6, #0
	str r6, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	bl sub_806A568
	mov r2, sl
	asrs r5, r2, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	adds r0, r7, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r2, #1
	lsls r2, r2, #0x10
	adds r7, #0x30
	ldr r1, [sp, #0x1c]
	adds r1, #8
	str r1, [sp, #0x1c]
	adds r4, #0xf
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r0, r2, #0x10
	mov r8, r0
	asrs r2, r2, #0x10
	cmp r2, #5
	ble _08066A04
	ldr r3, _08066B04 @ =0x000003BD
	mov r1, sb
	str r1, [sp]
	movs r0, #0x26
	str r0, [sp, #4]
	lsls r0, r5, #4
	subs r0, r0, r5
	adds r0, #0x28
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r5, #0xc
	str r5, [sp, #0xc]
	movs r0, #5
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #0
	movs r2, #0x3f
	bl sub_806A568
	movs r4, #0xf1
	lsls r4, r4, #2
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_806A568
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_806A568
	ldr r3, _08066B08 @ =0x000003C3
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	str r5, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_806A568
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066AF0: .4byte gUnknown_080D9A80
_08066AF4: .4byte gUnknown_080D9B10
_08066AF8: .4byte 0x00000201
_08066AFC: .4byte gUnknown_080D9AE0
_08066B00: .4byte gUnknown_080D9AB0
_08066B04: .4byte 0x000003BD
_08066B08: .4byte 0x000003C3

	thumb_func_start sub_8066B0C
sub_8066B0C: @ 0x08066B0C
	push {r4, r5, lr}
	ldr r0, _08066B44 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	bl sub_806B1B8
	ldr r0, _08066B48 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08066B5A
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r0, _08066B4C @ =IWRAM_START + 0x200
	adds r1, r4, r0
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	ble _08066B50
	movs r0, #0
	b _08066B52
	.align 2, 0
_08066B44: .4byte gCurTask
_08066B48: .4byte gRepeatedKeys
_08066B4C: .4byte IWRAM_START + 0x200
_08066B50:
	adds r0, r2, #1
_08066B52:
	strb r0, [r1]
	bl sub_8066C2C
	b _08066B88
_08066B5A:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08066B88
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r2, _08066B7C @ =IWRAM_START + 0x200
	adds r1, r4, r2
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _08066B80
	movs r0, #5
	b _08066B82
	.align 2, 0
_08066B7C: .4byte IWRAM_START + 0x200
_08066B80:
	subs r0, r2, #1
_08066B82:
	strb r0, [r1]
	bl sub_8066C2C
_08066B88:
	bl sub_806B1F8
	ldr r0, _08066BCC @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08066C1C
	ldr r1, _08066BD0 @ =0x00000201
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08066BDC
	ldr r0, _08066BD4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08066C1C
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _08066BD8 @ =gLoadedSaveGame
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	adds r0, #1
	strb r0, [r1, #6]
	bl sub_806B110
	b _08066C1C
	.align 2, 0
_08066BCC: .4byte gRepeatedKeys
_08066BD0: .4byte 0x00000201
_08066BD4: .4byte gPressedKeys
_08066BD8: .4byte gLoadedSaveGame
_08066BDC:
	ldr r4, _08066C24 @ =gPressedKeys
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08066C08
	movs r0, #0x6a
	bl m4aSongNumStart
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r0, r5, r1
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r1, [r1]
	ldr r2, _08066C28 @ =0x0000035B
	adds r0, r0, r2
	strb r1, [r0]
	bl sub_806B110
_08066C08:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08066C1C
	movs r0, #0x6b
	bl m4aSongNumStart
	bl sub_806B110
_08066C1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08066C24: .4byte gPressedKeys
_08066C28: .4byte 0x0000035B

	thumb_func_start sub_8066C2C
sub_8066C2C: @ 0x08066C2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08066C6C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r2, r4, #0
	adds r1, #0x60
	adds r1, r1, r0
	mov ip, r1
	ldr r3, _08066C70 @ =IWRAM_START + 0x180
	adds r6, r0, r3
	adds r3, #0x80
	adds r1, r0, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r3, r1, #3
	ldr r1, _08066C74 @ =gUnknown_080D9A80
	adds r1, r1, r3
	mov r8, r1
	ldr r1, _08066C78 @ =IWRAM_START + 0x201
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08066C80
	ldr r0, _08066C7C @ =gUnknown_080D9AB0
	b _08066C82
	.align 2, 0
_08066C6C: .4byte gCurTask
_08066C70: .4byte IWRAM_START + 0x180
_08066C74: .4byte gUnknown_080D9A80
_08066C78: .4byte IWRAM_START + 0x201
_08066C7C: .4byte gUnknown_080D9AB0
_08066C80:
	ldr r0, _08066CF8 @ =gUnknown_080D9AE0
_08066C82:
	adds r5, r3, r0
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r2, r3
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	adds r0, #0x28
	strh r0, [r6, #0x18]
	movs r0, #0
	adds r6, r4, #0
	adds r6, #0x20
	adds r7, r4, #0
	adds r7, #0x30
	adds r3, r2, #0
_08066CA2:
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	eors r2, r1
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	mov r2, ip
	adds r2, #0x25
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	movs r0, #0x30
	add ip, r0
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _08066CA2
	mov r1, r8
	ldrh r0, [r1, #2]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	bl sub_8004558
	adds r4, r7, #0
	ldrh r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrh r0, [r5]
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	bl sub_8004558
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066CF8: .4byte gUnknown_080D9AE0

	thumb_func_start sub_8066CFC
sub_8066CFC: @ 0x08066CFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08066D68 @ =sub_806B280
	movs r1, #0xa2
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #6
	movs r6, #0
	str r6, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r1, r4
	ldr r2, _08066D6C @ =IWRAM_START + 0x13C
	adds r0, r1, r2
	str r5, [r0]
	ldr r3, _08066D70 @ =IWRAM_START + 0x140
	adds r2, r1, r3
	movs r0, #1
	strb r0, [r2]
	ldr r2, _08066D74 @ =IWRAM_START + 0x141
	adds r0, r1, r2
	strb r6, [r0]
	ldr r3, _08066D78 @ =0x0000035B
	adds r5, r5, r3
	ldrb r2, [r5]
	ldr r3, _08066D7C @ =IWRAM_START + 0x142
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08066D80 @ =IWRAM_START + 0x143
	adds r1, r1, r0
	strb r6, [r1]
	ldr r1, _08066D84 @ =gUnknown_03005B50
	ldr r0, _08066D88 @ =0x06010000
	str r0, [r1]
	ldr r0, _08066D8C @ =gUnknown_03005B54
	str r6, [r0]
	adds r0, r4, #0
	bl sub_8066D90
	adds r0, r4, #0
	bl sub_806B258
	adds r0, r4, #0
	bl sub_8066E18
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066D68: .4byte sub_806B280
_08066D6C: .4byte IWRAM_START + 0x13C
_08066D70: .4byte IWRAM_START + 0x140
_08066D74: .4byte IWRAM_START + 0x141
_08066D78: .4byte 0x0000035B
_08066D7C: .4byte IWRAM_START + 0x142
_08066D80: .4byte IWRAM_START + 0x143
_08066D84: .4byte gUnknown_03005B50
_08066D88: .4byte 0x06010000
_08066D8C: .4byte gUnknown_03005B54

	thumb_func_start sub_8066D90
sub_8066D90: @ 0x08066D90
	push {lr}
	sub sp, #4
	movs r1, #0x98
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r2, _08066DF4 @ =gDispCnt
	movs r3, #0xba
	lsls r3, r3, #5
	adds r1, r3, #0
	strh r1, [r2]
	ldr r2, _08066DF8 @ =gBgCntRegs
	movs r3, #0
	ldr r1, _08066DFC @ =0x00000703
	strh r1, [r2]
	ldr r1, _08066E00 @ =0x00004E05
	strh r1, [r2, #4]
	ldr r1, _08066E04 @ =0x0000DC0E
	strh r1, [r2, #6]
	ldr r1, _08066E08 @ =gBgScrollRegs
	strh r3, [r1]
	strh r3, [r1, #2]
	strh r3, [r1, #8]
	ldr r2, _08066E0C @ =0x0000FFFD
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r3, [r1, #0xe]
	str r3, [sp]
	ldr r2, _08066E10 @ =0x040000D4
	mov r1, sp
	str r1, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r2, #4]
	ldr r1, _08066E14 @ =0x85006000
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	strh r3, [r0]
	movs r1, #2
	strh r1, [r0, #2]
	strh r3, [r0, #4]
	adds r1, #0xfe
	strh r1, [r0, #6]
	strh r3, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	bl sub_802D4CC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08066DF4: .4byte gDispCnt
_08066DF8: .4byte gBgCntRegs
_08066DFC: .4byte 0x00000703
_08066E00: .4byte 0x00004E05
_08066E04: .4byte 0x0000DC0E
_08066E08: .4byte gBgScrollRegs
_08066E0C: .4byte 0x0000FFFD
_08066E10: .4byte 0x040000D4
_08066E14: .4byte 0x85006000

	thumb_func_start sub_8066E18
sub_8066E18: @ 0x08066E18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	movs r1, #0xa1
	lsls r1, r1, #1
	adds r0, r7, r1
	movs r2, #0x60
	adds r2, r2, r7
	mov sl, r2
	adds r6, r7, #0
	adds r6, #0xc0
	str r6, [sp, #0x18]
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r0, r5, #3
	mov r8, r0
	ldr r1, _08066F9C @ =gUnknown_080D9B40
	add r1, r8
	ldr r0, _08066FA0 @ =gUnknown_080D9BA0
	add r8, r0
	lsls r5, r5, #4
	ldr r0, _08066FA4 @ =gUnknown_080D9BD0
	adds r5, r5, r0
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r7, r2
	movs r6, #0
	ldrsb r6, [r0, r6]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r6, [sp, #0x1c]
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r6, #0xc0
	lsls r6, r6, #6
	str r6, [sp]
	movs r0, #0x78
	mov sb, r0
	str r0, [sp, #4]
	movs r0, #0x32
	str r0, [sp, #8]
	movs r6, #0xd
	str r6, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r4, #0
	str r4, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	bl sub_806A568
	adds r0, r7, #0
	adds r0, #0x30
	mov r1, r8
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r6, #0xc0
	lsls r6, r6, #6
	str r6, [sp]
	mov r1, sb
	str r1, [sp, #4]
	movs r1, #0x74
	str r1, [sp, #8]
	movs r6, #0xd
	str r6, [sp, #0xc]
	mov r6, r8
	ldrb r1, [r6, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806A568
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x3a
	str r0, [sp, #4]
	movs r1, #0x4c
	mov r8, r1
	str r1, [sp, #8]
	movs r6, #0xd
	str r6, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r0, sl
	movs r1, #0
	bl sub_806A568
	adds r0, r7, #0
	adds r0, #0x85
	movs r1, #1
	strb r1, [r0]
	adds r7, #0x90
	mov sl, r7
	adds r5, #8
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r6, #0xc0
	lsls r6, r6, #6
	str r6, [sp]
	movs r0, #0x76
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r0, sl
	movs r1, #0
	bl sub_806A568
	movs r3, #0xee
	lsls r3, r3, #2
	str r6, [sp]
	ldr r2, [sp, #0x1c]
	lsls r6, r2, #0x10
	asrs r6, r6, #0x10
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #0x12
	movs r6, #0xe0
	lsls r6, r6, #0xe
	adds r0, r0, r6
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	movs r6, #0xc
	str r6, [sp, #0xc]
	movs r0, #3
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #0
	movs r2, #0x12
	bl sub_806A568
	movs r5, #0xf1
	lsls r5, r5, #2
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_806A568
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_806A568
	ldr r3, _08066FA8 @ =0x000003C3
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_806A568
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066F9C: .4byte gUnknown_080D9B40
_08066FA0: .4byte gUnknown_080D9BA0
_08066FA4: .4byte gUnknown_080D9BD0
_08066FA8: .4byte 0x000003C3

	thumb_func_start sub_8066FAC
sub_8066FAC: @ 0x08066FAC
	push {r4, r5, r6, r7, lr}
	ldr r0, _08067060 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	adds r0, #0x60
	adds r5, r4, r0
	ldr r1, _08067064 @ =IWRAM_START + 0xC0
	adds r7, r4, r1
	ldr r0, _08067068 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08067024
	movs r0, #0x6c
	bl m4aSongNumStart
	movs r2, #0
	ldr r0, _0806706C @ =IWRAM_START + 0x140
	adds r1, r4, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08066FE4
	movs r2, #1
_08066FE4:
	strb r2, [r1]
	movs r0, #0
	ldr r1, _0806706C @ =IWRAM_START + 0x140
	adds r3, r4, r1
_08066FEC:
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	eors r2, r1
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	adds r2, r5, #0
	adds r2, #0x25
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	adds r5, #0x30
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	ble _08066FEC
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x38
	strh r0, [r7, #0x16]
_08067024:
	bl sub_806B2F8
	ldr r0, _08067068 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0806708E
	ldr r0, _08067070 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08067078
	movs r0, #0x6a
	bl m4aSongNumStart
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08067086
	ldr r0, _08067060 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08067074 @ =sub_806709C
	b _0806708C
	.align 2, 0
_08067060: .4byte gCurTask
_08067064: .4byte IWRAM_START + 0xC0
_08067068: .4byte gRepeatedKeys
_0806706C: .4byte IWRAM_START + 0x140
_08067070: .4byte gPressedKeys
_08067074: .4byte sub_806709C
_08067078:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806708E
	movs r0, #0x6b
	bl m4aSongNumStart
_08067086:
	ldr r0, _08067094 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08067098 @ =sub_806B2B4
_0806708C:
	str r0, [r1, #8]
_0806708E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067094: .4byte gCurTask
_08067098: .4byte sub_806B2B4

	thumb_func_start sub_806709C
sub_806709C: @ 0x0806709C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806712C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	adds r0, #0x60
	adds r5, r4, r0
	ldr r1, _08067130 @ =IWRAM_START + 0xC0
	adds r7, r4, r1
	ldr r3, _08067134 @ =IWRAM_START + 0x142
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _08067138 @ =gUnknown_080D9B70
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	ldr r3, _0806713C @ =IWRAM_START + 0x20
	adds r1, r4, r3
	strb r2, [r1]
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	bl sub_8004558
	ldr r0, _08067140 @ =IWRAM_START + 0x140
	adds r1, r4, r0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldr r1, _08067140 @ =IWRAM_START + 0x140
	adds r4, r4, r1
_080670E2:
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	eors r2, r1
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	adds r2, r5, #0
	adds r2, #0x25
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	adds r5, #0x30
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	ble _080670E2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r6, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x38
	strh r0, [r7, #0x16]
	bl sub_806B2F8
	ldr r0, _0806712C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08067144 @ =sub_8067148
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806712C: .4byte gCurTask
_08067130: .4byte IWRAM_START + 0xC0
_08067134: .4byte IWRAM_START + 0x142
_08067138: .4byte gUnknown_080D9B70
_0806713C: .4byte IWRAM_START + 0x20
_08067140: .4byte IWRAM_START + 0x140
_08067144: .4byte sub_8067148

	thumb_func_start sub_8067148
sub_8067148: @ 0x08067148
	push {r4, r5, r6, r7, lr}
	ldr r0, _080671F8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	adds r0, #0x60
	adds r5, r4, r0
	ldr r1, _080671FC @ =IWRAM_START + 0xC0
	adds r7, r4, r1
	ldr r0, _08067200 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080671C0
	movs r0, #0x6c
	bl m4aSongNumStart
	movs r2, #0
	ldr r0, _08067204 @ =IWRAM_START + 0x140
	adds r1, r4, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08067180
	movs r2, #1
_08067180:
	strb r2, [r1]
	movs r0, #0
	ldr r1, _08067204 @ =IWRAM_START + 0x140
	adds r3, r4, r1
_08067188:
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	eors r2, r1
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	adds r2, r5, #0
	adds r2, #0x25
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	adds r5, #0x30
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	ble _08067188
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x38
	strh r0, [r7, #0x16]
_080671C0:
	bl sub_806B2F8
	ldr r0, _08067200 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0806722E
	ldr r0, _08067208 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08067218
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08067210
	ldr r0, _0806720C @ =0x00000143
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xdc
	b _08067222
	.align 2, 0
_080671F8: .4byte gCurTask
_080671FC: .4byte IWRAM_START + 0xC0
_08067200: .4byte gRepeatedKeys
_08067204: .4byte IWRAM_START + 0x140
_08067208: .4byte gPressedKeys
_0806720C: .4byte 0x00000143
_08067210:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08067226
_08067218:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806722E
	movs r0, #0x6b
_08067222:
	bl m4aSongNumStart
_08067226:
	ldr r0, _08067234 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08067238 @ =sub_806B2B4
	str r0, [r1, #8]
_0806722E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067234: .4byte gCurTask
_08067238: .4byte sub_806B2B4

	thumb_func_start sub_806723C
sub_806723C: @ 0x0806723C
	push {r4, lr}
	ldr r0, _08067258 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r1, _0806725C @ =IWRAM_START + 0x130
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08067260
	bl sub_806B2F8
	b _080672AA
	.align 2, 0
_08067258: .4byte gCurTask
_0806725C: .4byte IWRAM_START + 0x130
_08067260:
	ldr r1, _08067288 @ =IWRAM_START + 0x143
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08067294
	ldr r0, _0806728C @ =IWRAM_START + 0x13C
	adds r4, r4, r0
	ldr r0, [r4]
	bl sub_8063C7C
	bl NewSaveGame
	ldr r0, [r4]
	ldr r1, _08067290 @ =0x00000784
	adds r0, r0, r1
	movs r1, #0
	b _080672A0
	.align 2, 0
_08067288: .4byte IWRAM_START + 0x143
_0806728C: .4byte IWRAM_START + 0x13C
_08067290: .4byte 0x00000784
_08067294:
	ldr r1, _080672B0 @ =IWRAM_START + 0x13C
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r1, _080672B4 @ =0x00000784
	adds r0, r0, r1
	movs r1, #2
_080672A0:
	strb r1, [r0]
	ldr r0, _080672B8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_080672AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080672B0: .4byte IWRAM_START + 0x13C
_080672B4: .4byte 0x00000784
_080672B8: .4byte gCurTask

	thumb_func_start sub_80672BC
sub_80672BC: @ 0x080672BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08067320 @ =sub_806B354
	movs r1, #0xef
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	ldr r1, _08067324 @ =IWRAM_START + 0x14C
	adds r0, r3, r1
	str r6, [r0]
	movs r2, #0xb1
	lsls r2, r2, #1
	adds r0, r6, r2
	ldrb r0, [r0]
	ldr r2, _08067328 @ =IWRAM_START + 0x3BA
	adds r1, r3, r2
	strb r0, [r1]
	adds r2, #1
	adds r0, r3, r2
	strb r4, [r0]
	ldr r2, _0806732C @ =IWRAM_START + 0x252
	adds r0, r3, r2
	strb r4, [r0]
	ldrb r2, [r1]
	cmp r2, #0
	bne _0806733C
	ldr r4, _08067330 @ =IWRAM_START + 0x3B8
	adds r0, r3, r4
	movs r1, #0
	strh r2, [r0]
	ldr r4, _08067334 @ =IWRAM_START + 0x253
	adds r0, r3, r4
	strb r1, [r0]
	ldr r1, _08067338 @ =IWRAM_START + 0x250
	adds r0, r3, r1
	strh r2, [r0]
	b _08067352
	.align 2, 0
_08067320: .4byte sub_806B354
_08067324: .4byte IWRAM_START + 0x14C
_08067328: .4byte IWRAM_START + 0x3BA
_0806732C: .4byte IWRAM_START + 0x252
_08067330: .4byte IWRAM_START + 0x3B8
_08067334: .4byte IWRAM_START + 0x253
_08067338: .4byte IWRAM_START + 0x250
_0806733C:
	ldr r2, _080673FC @ =IWRAM_START + 0x3B8
	adds r0, r3, r2
	movs r2, #0
	movs r1, #0x63
	strh r1, [r0]
	ldr r4, _08067400 @ =IWRAM_START + 0x253
	adds r0, r3, r4
	strb r2, [r0]
	ldr r2, _08067404 @ =IWRAM_START + 0x250
	adds r0, r3, r2
	strh r1, [r0]
_08067352:
	movs r4, #0
	ldr r0, _08067408 @ =gUnknown_03005B50
	mov r8, r0
	ldr r1, _0806740C @ =gUnknown_03005B54
	mov sb, r1
	movs r2, #0xeb
	lsls r2, r2, #2
	adds r7, r5, r2
	movs r0, #0xae
	lsls r0, r0, #1
	adds r6, r6, r0
	ldr r1, _08067410 @ =0x0000FFFF
	mov ip, r1
_0806736C:
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	lsls r1, r3, #1
	adds r2, r7, r1
	ldr r0, [r6]
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	beq _08067390
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806736C
_08067390:
	ldr r2, _08067414 @ =0x000003AA
	adds r0, r5, r2
	strh r4, [r0]
	lsls r2, r4, #0x10
	asrs r0, r2, #0x10
	cmp r0, #5
	bgt _080673BE
	movs r4, #0xeb
	lsls r4, r4, #2
	adds r3, r5, r4
	ldr r0, _08067410 @ =0x0000FFFF
	adds r4, r0, #0
_080673A8:
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r3, r1
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #5
	ble _080673A8
_080673BE:
	ldr r0, _08067418 @ =0x06010000
	mov r1, r8
	str r0, [r1]
	movs r0, #0
	mov r2, sb
	str r0, [r2]
	ldr r4, _0806741C @ =0x000003BA
	adds r0, r5, r4
	ldrb r0, [r0]
	bl sub_8067420
	adds r0, r5, #0
	bl sub_8067484
	adds r0, r5, #0
	bl sub_806751C
	adds r0, r5, #0
	bl sub_8067610
	adds r0, r5, #0
	bl sub_8067710
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080673FC: .4byte IWRAM_START + 0x3B8
_08067400: .4byte IWRAM_START + 0x253
_08067404: .4byte IWRAM_START + 0x250
_08067408: .4byte gUnknown_03005B50
_0806740C: .4byte gUnknown_03005B54
_08067410: .4byte 0x0000FFFF
_08067414: .4byte 0x000003AA
_08067418: .4byte 0x06010000
_0806741C: .4byte 0x000003BA

	thumb_func_start sub_8067420
sub_8067420: @ 0x08067420
	push {lr}
	ldr r2, _08067450 @ =gDispCnt
	movs r3, #0xba
	lsls r3, r3, #5
	adds r1, r3, #0
	strh r1, [r2]
	ldr r2, _08067454 @ =gBgCntRegs
	movs r3, #0
	ldr r1, _08067458 @ =0x00000701
	strh r1, [r2]
	ldr r1, _0806745C @ =0x00009606
	strh r1, [r2, #2]
	ldr r1, _08067460 @ =0x00001F0F
	strh r1, [r2, #4]
	ldr r2, _08067464 @ =gBgScrollRegs
	strh r3, [r2]
	strh r3, [r2, #2]
	ldr r1, _08067468 @ =0x0000FFE8
	strh r1, [r2, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08067470
	ldr r0, _0806746C @ =0x0000FFD9
	b _08067472
	.align 2, 0
_08067450: .4byte gDispCnt
_08067454: .4byte gBgCntRegs
_08067458: .4byte 0x00000701
_0806745C: .4byte 0x00009606
_08067460: .4byte 0x00001F0F
_08067464: .4byte gBgScrollRegs
_08067468: .4byte 0x0000FFE8
_0806746C: .4byte 0x0000FFD9
_08067470:
	movs r0, #0x69
_08067472:
	strh r0, [r2, #6]
	movs r0, #0
	strh r0, [r2, #8]
	strh r0, [r2, #0xa]
	strh r0, [r2, #0xc]
	strh r0, [r2, #0xe]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8067484
sub_8067484: @ 0x08067484
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r4, #0
	strh r4, [r1]
	movs r0, #2
	mov sb, r0
	mov r0, sb
	strh r0, [r1, #2]
	strh r4, [r1, #4]
	movs r5, #0x80
	lsls r5, r5, #1
	strh r5, [r1, #6]
	strh r4, [r1, #0xa]
	movs r0, #0xff
	strh r0, [r1, #8]
	adds r0, r7, #0
	adds r0, #0xc0
	movs r1, #0x1e
	mov r8, r1
	str r1, [sp]
	movs r6, #0x14
	str r6, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0x87
	bl sub_806B854
	adds r5, r7, r5
	mov r0, r8
	str r0, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0x1f
	movs r3, #0x89
	bl sub_806B854
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r1, #0x16
	str r1, [sp]
	movs r1, #0x2c
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0x16
	movs r3, #0x88
	bl sub_806B854
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806751C
sub_806751C: @ 0x0806751C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x30
	ldr r1, _0806754C @ =0x000003BA
	adds r0, r4, r1
	ldr r6, _08067550 @ =gUnknown_080D9DB0
	ldrb r0, [r0]
	lsls r1, r0, #3
	ldr r0, _08067554 @ =gUnknown_080D9DC0
	adds r5, r1, r0
	ldr r2, _08067558 @ =0x000003AA
	adds r0, r4, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _08067560
	ldr r0, _0806755C @ =gUnknown_080D9D80
	b _08067562
	.align 2, 0
_0806754C: .4byte 0x000003BA
_08067550: .4byte gUnknown_080D9DB0
_08067554: .4byte gUnknown_080D9DC0
_08067558: .4byte 0x000003AA
_0806755C: .4byte gUnknown_080D9D80
_08067560:
	ldr r0, _0806760C @ =gUnknown_080D9D50
_08067562:
	adds r1, r1, r0
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x15
	str r0, [sp, #8]
	movs r0, #0xd
	mov sl, r0
	str r0, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	mov sb, r1
	str r1, [sp, #0x14]
	adds r0, r4, #0
	bl sub_806A568
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	mov r0, r8
	str r0, [sp]
	movs r4, #0xdb
	str r4, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	mov r1, sl
	str r1, [sp, #0xc]
	ldrb r0, [r6, #2]
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	bl sub_806A568
	adds r7, #0x30
	adds r6, #8
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	mov r1, r8
	str r1, [sp]
	str r4, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	mov r0, sl
	str r0, [sp, #0xc]
	ldrb r0, [r6, #2]
	str r0, [sp, #0x10]
	mov r1, sb
	str r1, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	bl sub_806A568
	adds r7, #0x30
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x8f
	str r0, [sp, #8]
	mov r1, sl
	str r1, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	bl sub_806A568
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806760C: .4byte gUnknown_080D9D50

	thumb_func_start sub_8067610
sub_8067610: @ 0x08067610
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sl, r0
	movs r7, #0xa8
	lsls r7, r7, #1
	add r7, sl
	movs r0, #0xd8
	lsls r0, r0, #1
	add r0, sl
	mov sb, r0
	ldr r1, _08067708 @ =gUnknown_080D9DF0
	str r1, [sp, #0x20]
	ldr r3, _0806770C @ =0x000003BA
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r1, #0x21
	str r1, [sp, #4]
	movs r0, #0x2f
	mov r8, r0
	str r0, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	movs r6, #7
	str r6, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xa
	bl sub_806A568
	movs r7, #0xc0
	lsls r7, r7, #1
	add r7, sl
	movs r0, #0xee
	lsls r0, r0, #2
	add r0, sl
	ldrh r1, [r0]
	add r0, sp, #0x18
	bl sub_806B908
	ldr r4, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	lsls r3, r5, #0x10
	lsrs r3, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r0, #0x21
	str r0, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	lsrs r0, r5, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl sub_806A568
	ldr r1, [sp, #0x20]
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r0, #0x2c
	str r0, [sp, #8]
	movs r4, #0xd
	str r4, [sp, #0xc]
	ldr r1, [sp, #0x20]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	mov r0, sb
	movs r1, #0
	bl sub_806A568
	movs r1, #0xf0
	lsls r1, r1, #1
	add r1, sl
	mov sb, r1
	ldr r0, [sp, #0x20]
	adds r0, #8
	str r0, [sp, #0x20]
	ldrh r2, [r0, #4]
	ldrh r3, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #0x82
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r1, [sp, #0x20]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	mov r0, sb
	movs r1, #0
	bl sub_806A568
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067708: .4byte gUnknown_080D9DF0
_0806770C: .4byte 0x000003BA

	thumb_func_start sub_8067710
sub_8067710: @ 0x08067710
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	movs r0, #0xa2
	lsls r0, r0, #2
	add r0, sb
	mov r8, r0
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sb
	str r1, [sp, #0x20]
	movs r1, #0
	movs r4, #0xa0
_08067732:
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	lsls r1, r7, #1
	movs r0, #0xeb
	lsls r0, r0, #2
	add r0, sb
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080677E0 @ =0x0000FFFF
	cmp r1, r0
	bne _0806774A
	movs r1, #0x11
_0806774A:
	add r0, sp, #0x18
	bl sub_806B908
	ldr r5, [sp, #0x18]
	ldr r6, [sp, #0x1c]
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0x80
	lsls r0, r0, #5
	mov sl, r0
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	movs r1, #0x16
	str r1, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	lsrs r0, r6, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	mov r0, r8
	movs r1, #0
	adds r2, r5, #0
	bl sub_806A568
	adds r0, r7, #1
	lsls r0, r0, #0x10
	movs r1, #0x30
	add r8, r1
	adds r4, #0xc
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08067732
	ldr r3, _080677E4 @ =0x000003BA
	mov r0, sl
	str r0, [sp]
	ldr r0, _080677E8 @ =0x000003AA
	add r0, sb
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x12
	movs r1, #0xa1
	lsls r1, r1, #0x10
	adds r0, r0, r1
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x15
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #6
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	movs r1, #0
	movs r2, #2
	bl sub_806A568
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080677E0: .4byte 0x0000FFFF
_080677E4: .4byte 0x000003BA
_080677E8: .4byte 0x000003AA

	thumb_func_start sub_80677EC
sub_80677EC: @ 0x080677EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080678E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r6, r0
	str r0, [sp]
	ldr r0, _080678E8 @ =IWRAM_START + 0x258
	adds r0, r0, r6
	mov sl, r0
	bl sub_8067F84
	bl Random
	lsls r0, r0, #0x10
	eors r4, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r4, r0
	eors r7, r4
	adds r0, r5, #0
	adds r1, r7, #0
	bl SeedRng
	bl Random
	lsls r0, r0, #0x10
	eors r4, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r4, r0
	eors r5, r4
	adds r0, r5, #0
	adds r1, r7, #0
	bl SeedRng
	bl sub_8067B90
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08067854
	b _08067B72
_08067854:
	bl sub_8067C50
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08067860
	b _08067B72
_08067860:
	ldr r0, _080678EC @ =gRepeatedKeys
	ldrh r2, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0806786E
	b _08067A9C
_0806786E:
	ldr r1, _080678F0 @ =IWRAM_START + 0x252
	adds r1, r1, r6
	mov sb, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xa
	ble _0806787E
	b _08067A14
_0806787E:
	ldr r2, _080678F4 @ =IWRAM_START + 0x3B8
	adds r2, r2, r6
	mov r8, r2
	ldrh r0, [r2]
	cmp r0, #0xa
	beq _08067890
	cmp r0, #0x15
	beq _08067890
	b _080679C2
_08067890:
	movs r7, #2
	cmp r0, #0xa
	bne _08067898
	movs r7, #1
_08067898:
	ldr r3, _080678F8 @ =IWRAM_START + 0x3AA
	adds r4, r6, r3
	ldrh r0, [r4]
	cmp r0, #5
	bhi _08067976
	lsls r0, r0, #1
	ldr r1, _080678FC @ =IWRAM_START + 0x3AC
	adds r5, r6, r1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08067900 @ =0x0000FFFF
	cmp r1, r0
	bne _08067934
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r0, r7, #0
	bl sub_806BA14
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08067904
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r0, r7, #0
	bl sub_806A664
	ldrh r1, [r4]
	subs r1, #1
	b _0806795A
	.align 2, 0
_080678E4: .4byte gCurTask
_080678E8: .4byte IWRAM_START + 0x258
_080678EC: .4byte gRepeatedKeys
_080678F0: .4byte IWRAM_START + 0x252
_080678F4: .4byte IWRAM_START + 0x3B8
_080678F8: .4byte IWRAM_START + 0x3AA
_080678FC: .4byte IWRAM_START + 0x3AC
_08067900: .4byte 0x0000FFFF
_08067904:
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r2, r8
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r0, [r4]
	cmp r0, #4
	bhi _0806791C
	adds r0, #1
	strh r0, [r4]
	b _080679C2
_0806791C:
	movs r1, #6
	movs r0, #6
	strh r0, [r4]
	movs r0, #0xb
	mov r3, sb
	strb r0, [r3]
	ldr r2, _08067930 @ =IWRAM_START + 0x253
	adds r0, r6, r2
	b _080679C0
	.align 2, 0
_08067930: .4byte IWRAM_START + 0x253
_08067934:
	adds r6, r7, #0
	ldrh r1, [r2]
	adds r0, r6, #0
	bl sub_806BA14
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08067962
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	bl sub_806A664
	ldrh r1, [r4]
_0806795A:
	lsls r1, r1, #1
	adds r1, r5, r1
	strh r0, [r1]
	b _080679C2
_08067962:
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r3, r8
	ldrh r1, [r3]
	strh r1, [r0]
	b _080679C2
_08067976:
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #1
	ldr r1, _08067A0C @ =IWRAM_START + 0x3AC
	adds r5, r6, r1
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r0, r7, #0
	bl sub_806BA14
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080679B0
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r0, r7, #0
	bl sub_806A664
	ldrh r1, [r4]
	subs r1, #1
	lsls r1, r1, #1
	adds r1, r5, r1
	strh r0, [r1]
_080679B0:
	movs r1, #6
	movs r0, #6
	strh r0, [r4]
	movs r0, #0xb
	mov r2, sb
	strb r0, [r2]
	ldr r3, _08067A10 @ =IWRAM_START + 0x253
	adds r0, r6, r3
_080679C0:
	strb r1, [r0]
_080679C2:
	movs r4, #0xa9
	lsls r4, r4, #1
	add r4, sl
	ldrh r0, [r4]
	cmp r0, #5
	bls _080679D0
	b _08067B72
_080679D0:
	ldr r0, [sp]
	movs r1, #0xee
	lsls r1, r1, #2
	adds r5, r0, r1
	ldrh r0, [r5]
	cmp r0, #0xa
	bne _080679E0
	b _08067B72
_080679E0:
	cmp r0, #0x15
	bne _080679E6
	b _08067B72
_080679E6:
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrh r0, [r4]
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
	add r1, sl
	adds r1, r1, r0
	ldrh r0, [r5]
	strh r0, [r1]
	ldrh r0, [r4]
	cmp r0, #4
	bls _08067A04
	b _08067B72
_08067A04:
	adds r0, #1
	strh r0, [r4]
	b _08067B72
	.align 2, 0
_08067A0C: .4byte IWRAM_START + 0x3AC
_08067A10: .4byte IWRAM_START + 0x253
_08067A14:
	ldr r2, _08067A2C @ =IWRAM_START + 0x253
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	beq _08067A4C
	cmp r0, #5
	bgt _08067A30
	cmp r0, #4
	beq _08067A36
	b _08067B72
	.align 2, 0
_08067A2C: .4byte IWRAM_START + 0x253
_08067A30:
	cmp r0, #6
	beq _08067A88
	b _08067B72
_08067A36:
	ldr r3, _08067A48 @ =IWRAM_START + 0x3AA
	adds r1, r6, r3
	ldrh r0, [r1]
	cmp r0, #0
	bne _08067A42
	b _08067B72
_08067A42:
	subs r0, #1
	strh r0, [r1]
	b _08067A72
	.align 2, 0
_08067A48: .4byte IWRAM_START + 0x3AA
_08067A4C:
	ldr r0, _08067A7C @ =IWRAM_START + 0x3AA
	adds r2, r6, r0
	ldrh r0, [r2]
	cmp r0, #4
	bls _08067A58
	b _08067B72
_08067A58:
	lsls r0, r0, #1
	ldr r3, _08067A80 @ =IWRAM_START + 0x3AC
	adds r1, r6, r3
	adds r3, r1, r0
	ldrh r1, [r3]
	ldr r0, _08067A84 @ =0x0000FFFF
	cmp r1, r0
	bne _08067A6C
	movs r0, #0x11
	strh r0, [r3]
_08067A6C:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_08067A72:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08067B72
	.align 2, 0
_08067A7C: .4byte IWRAM_START + 0x3AA
_08067A80: .4byte IWRAM_START + 0x3AC
_08067A84: .4byte 0x0000FFFF
_08067A88:
	ldr r1, _08067A98 @ =IWRAM_START + 0x3AC
	adds r0, r6, r1
	bl sub_806B988
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08067AC2
	b _08067ADC
	.align 2, 0
_08067A98: .4byte IWRAM_START + 0x3AC
_08067A9C:
	ldr r0, _08067ACC @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08067B00
	ldr r2, _08067AD0 @ =IWRAM_START + 0x252
	adds r4, r6, r2
	ldrh r1, [r4]
	ldr r0, _08067AD4 @ =0x0000060B
	cmp r1, r0
	bne _08067AE8
	ldr r3, _08067AD8 @ =IWRAM_START + 0x3AC
	adds r0, r6, r3
	bl sub_806B988
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08067ADC
_08067AC2:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08067B72
	.align 2, 0
_08067ACC: .4byte gPressedKeys
_08067AD0: .4byte IWRAM_START + 0x252
_08067AD4: .4byte 0x0000060B
_08067AD8: .4byte IWRAM_START + 0x3AC
_08067ADC:
	movs r0, #0x6a
	bl m4aSongNumStart
	bl sub_8067E24
	b _08067B72
_08067AE8:
	movs r0, #0x6a
	bl m4aSongNumStart
	movs r0, #0xb
	strb r0, [r4]
	ldr r0, _08067AFC @ =IWRAM_START + 0x253
	adds r1, r6, r0
	movs r0, #6
	strb r0, [r1]
	b _08067B72
	.align 2, 0
_08067AFC: .4byte IWRAM_START + 0x253
_08067B00:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08067B72
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _08067B84 @ =IWRAM_START + 0x3AA
	adds r0, r6, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08067B2A
	adds r1, r2, #0
	lsls r1, r1, #1
	ldr r3, _08067B88 @ =IWRAM_START + 0x3AC
	adds r0, r6, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08067B8C @ =0x0000FFFF
	cmp r1, r0
	beq _08067B2E
_08067B2A:
	cmp r2, #5
	bls _08067B3A
_08067B2E:
	movs r1, #0xa9
	lsls r1, r1, #1
	add r1, sl
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08067B3A:
	movs r0, #0xa9
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #4
	bgt _08067B68
	movs r3, #0xaa
	lsls r3, r3, #1
	add r3, sl
_08067B50:
	asrs r1, r1, #0x10
	lsls r2, r1, #1
	adds r2, r3, r2
	adds r1, #1
	lsls r0, r1, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #4
	ble _08067B50
_08067B68:
	movs r1, #0xaf
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _08067B8C @ =0x0000FFFF
	strh r0, [r1]
_08067B72:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067B84: .4byte IWRAM_START + 0x3AA
_08067B88: .4byte IWRAM_START + 0x3AC
_08067B8C: .4byte 0x0000FFFF

	thumb_func_start sub_8067B90
sub_8067B90: @ 0x08067B90
	push {r4, r5, r6, lr}
	ldr r0, _08067BF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r0, _08067BF4 @ =gRepeatedKeys
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08067C04
	ldr r0, _08067BF8 @ =IWRAM_START + 0x3AA
	adds r6, r1, r0
	ldrh r0, [r6]
	cmp r0, #0
	beq _08067C38
	subs r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bhi _08067C32
	ldrh r2, [r6]
	adds r0, r2, #1
	lsls r0, r0, #1
	ldr r3, _08067BFC @ =IWRAM_START + 0x3AC
	adds r5, r1, r3
	adds r0, r5, r0
	ldrh r4, [r0]
	ldr r0, _08067C00 @ =0x0000FFFF
	cmp r4, r0
	bne _08067C32
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	bl sub_806B9C8
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08067C32
	ldrh r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	orrs r4, r1
	strh r4, [r0]
	b _08067C32
	.align 2, 0
_08067BF0: .4byte gCurTask
_08067BF4: .4byte gRepeatedKeys
_08067BF8: .4byte IWRAM_START + 0x3AA
_08067BFC: .4byte IWRAM_START + 0x3AC
_08067C00: .4byte 0x0000FFFF
_08067C04:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08067C48
	ldr r0, _08067C3C @ =IWRAM_START + 0x3AA
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #4
	bhi _08067C38
	lsls r0, r0, #1
	ldr r3, _08067C40 @ =IWRAM_START + 0x3AC
	adds r1, r1, r3
	adds r3, r1, r0
	ldrh r1, [r3]
	ldr r0, _08067C44 @ =0x0000FFFF
	cmp r1, r0
	bne _08067C2C
	movs r0, #0x11
	strh r0, [r3]
_08067C2C:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_08067C32:
	movs r0, #0x6c
	bl m4aSongNumStart
_08067C38:
	movs r0, #1
	b _08067C4A
	.align 2, 0
_08067C3C: .4byte IWRAM_START + 0x3AA
_08067C40: .4byte IWRAM_START + 0x3AC
_08067C44: .4byte 0x0000FFFF
_08067C48:
	movs r0, #0
_08067C4A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8067C50
sub_8067C50: @ 0x08067C50
	push {r4, r5, lr}
	ldr r0, _08067C9C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r5, _08067CA0 @ =gRepeatedKeys
	ldrh r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08067C66
	b _08067E1C
_08067C66:
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08067D00
	ldr r1, _08067CA4 @ =IWRAM_START + 0x252
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xa
	bgt _08067CE4
	ldr r2, _08067CA8 @ =IWRAM_START + 0x253
	adds r1, r4, r2
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08067CAC
	subs r0, r2, #1
	b _08067DCA
	.align 2, 0
_08067C9C: .4byte gCurTask
_08067CA0: .4byte gRepeatedKeys
_08067CA4: .4byte IWRAM_START + 0x252
_08067CA8: .4byte IWRAM_START + 0x253
_08067CAC:
	ldr r0, _08067CC8 @ =IWRAM_START + 0x250
	adds r2, r4, r0
	ldrh r0, [r2]
	cmp r0, #0
	beq _08067CD0
	ldr r0, _08067CCC @ =gBgScrollRegs
	ldrh r1, [r0, #6]
	subs r1, #0x10
	strh r1, [r0, #6]
	ldrh r0, [r2]
	subs r0, #0xb
	strh r0, [r2]
	b _08067DCC
	.align 2, 0
_08067CC8: .4byte IWRAM_START + 0x250
_08067CCC: .4byte gBgScrollRegs
_08067CD0:
	movs r0, #6
	strb r0, [r1]
	ldr r1, _08067CE0 @ =gBgScrollRegs
	movs r0, #0xc9
	strh r0, [r1, #6]
	movs r0, #0xa5
	strh r0, [r2]
	b _08067DCC
	.align 2, 0
_08067CE0: .4byte gBgScrollRegs
_08067CE4:
	ldr r2, _08067CF8 @ =IWRAM_START + 0x253
	adds r1, r4, r2
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	ble _08067CFC
	subs r0, r2, #1
	b _08067DCA
	.align 2, 0
_08067CF8: .4byte IWRAM_START + 0x253
_08067CFC:
	movs r0, #6
	b _08067DCA
_08067D00:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08067D8C
	ldr r1, _08067D2C @ =IWRAM_START + 0x252
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xa
	bgt _08067D70
	ldr r2, _08067D30 @ =IWRAM_START + 0x253
	adds r3, r4, r2
	ldrb r1, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #5
	bgt _08067D34
	adds r0, r1, #1
	strb r0, [r3]
	b _08067DCC
	.align 2, 0
_08067D2C: .4byte IWRAM_START + 0x252
_08067D30: .4byte IWRAM_START + 0x253
_08067D34:
	ldr r0, _08067D50 @ =IWRAM_START + 0x250
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0xa4
	bhi _08067D58
	ldr r0, _08067D54 @ =gBgScrollRegs
	ldrh r1, [r0, #6]
	adds r1, #0x10
	strh r1, [r0, #6]
	ldrh r0, [r4]
	adds r0, #0xb
	strh r0, [r4]
	b _08067DCC
	.align 2, 0
_08067D50: .4byte IWRAM_START + 0x250
_08067D54: .4byte gBgScrollRegs
_08067D58:
	ldr r0, _08067D68 @ =gBgScrollRegs
	movs r2, #0
	ldr r1, _08067D6C @ =0x0000FFD9
	strh r1, [r0, #6]
	strb r2, [r3]
	strh r5, [r4]
	b _08067DCC
	.align 2, 0
_08067D68: .4byte gBgScrollRegs
_08067D6C: .4byte 0x0000FFD9
_08067D70:
	ldr r2, _08067D84 @ =IWRAM_START + 0x253
	adds r1, r4, r2
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #5
	bgt _08067D88
	adds r0, r2, #1
	b _08067DCA
	.align 2, 0
_08067D84: .4byte IWRAM_START + 0x253
_08067D88:
	movs r0, #4
	b _08067DCA
_08067D8C:
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08067DD0
	ldr r0, _08067DAC @ =IWRAM_START + 0x252
	adds r1, r4, r0
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08067DB0
	subs r0, r2, #1
	b _08067DCA
	.align 2, 0
_08067DAC: .4byte IWRAM_START + 0x252
_08067DB0:
	ldr r2, _08067DC4 @ =IWRAM_START + 0x253
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bgt _08067DC8
	movs r0, #0xa
	b _08067DCA
	.align 2, 0
_08067DC4: .4byte IWRAM_START + 0x253
_08067DC8:
	movs r0, #0xb
_08067DCA:
	strb r0, [r1]
_08067DCC:
	movs r0, #1
	b _08067E1E
_08067DD0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08067E1C
	ldr r1, _08067DF8 @ =IWRAM_START + 0x253
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bgt _08067E00
	ldr r2, _08067DFC @ =IWRAM_START + 0x252
	adds r1, r4, r2
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #9
	ble _08067E0E
	b _08067E18
	.align 2, 0
_08067DF8: .4byte IWRAM_START + 0x253
_08067DFC: .4byte IWRAM_START + 0x252
_08067E00:
	ldr r0, _08067E14 @ =IWRAM_START + 0x252
	adds r1, r4, r0
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xa
	bgt _08067E18
_08067E0E:
	adds r0, r2, #1
	b _08067DCA
	.align 2, 0
_08067E14: .4byte IWRAM_START + 0x252
_08067E18:
	strb r3, [r1]
	b _08067DCC
_08067E1C:
	movs r0, #0
_08067E1E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8067E24
sub_8067E24: @ 0x08067E24
	push {r4, r5, r6, r7, lr}
	ldr r1, _08067E8C @ =gCurTask
	ldr r0, [r1]
	ldrh r2, [r0, #6]
	ldr r0, _08067E90 @ =IWRAM_START + 0x140
	adds r3, r2, r0
	ldr r4, _08067E94 @ =IWRAM_START + 0x3BB
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r7, r1, #0
	ldr r6, _08067E98 @ =sub_8067EA4
	cmp r0, #0
	bne _08067E6C
	ldr r1, _08067E9C @ =IWRAM_START + 0x14C
	adds r0, r2, r1
	ldr r0, [r0]
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r0, r4
	ldr r5, [r0]
	movs r0, #0
	ldr r1, _08067EA0 @ =IWRAM_START + 0x3AC
	adds r4, r2, r1
_08067E52:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r2, r5, r0
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _08067E52
_08067E6C:
	movs r1, #0
	strh r1, [r3]
	movs r0, #1
	strh r0, [r3, #2]
	strh r1, [r3, #4]
	adds r0, #0xff
	strh r0, [r3, #6]
	strh r1, [r3, #0xa]
	movs r0, #0xff
	strh r0, [r3, #8]
	ldr r0, [r7]
	str r6, [r0, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067E8C: .4byte gCurTask
_08067E90: .4byte IWRAM_START + 0x140
_08067E94: .4byte IWRAM_START + 0x3BB
_08067E98: .4byte sub_8067EA4
_08067E9C: .4byte IWRAM_START + 0x14C
_08067EA0: .4byte IWRAM_START + 0x3AC

	thumb_func_start sub_8067EA4
sub_8067EA4: @ 0x08067EA4
	push {r4, r5, r6, r7, lr}
	ldr r6, _08067EC8 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	ldr r1, _08067ECC @ =IWRAM_START + 0x140
	adds r0, r4, r1
	ldr r2, _08067ED0 @ =IWRAM_START + 0x3BB
	adds r1, r4, r2
	ldrb r5, [r1]
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08067ED4
	bl sub_8067F84
	b _08067F7C
	.align 2, 0
_08067EC8: .4byte gCurTask
_08067ECC: .4byte IWRAM_START + 0x140
_08067ED0: .4byte IWRAM_START + 0x3BB
_08067ED4:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r7, r0, #0
	cmp r2, #0
	bne _08067EFC
	ldr r1, _08067EF4 @ =IWRAM_START + 0x14C
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r1, _08067EF8 @ =0x00000163
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r6]
	bl TaskDestroy
	b _08067F7C
	.align 2, 0
_08067EF4: .4byte IWRAM_START + 0x14C
_08067EF8: .4byte 0x00000163
_08067EFC:
	cmp r2, #2
	bne _08067F04
	bl NewSaveGame
_08067F04:
	movs r1, #0
	ldr r5, _08067F58 @ =gLoadedSaveGame
	ldr r2, _08067F5C @ =IWRAM_START + 0x3AC
	adds r3, r4, r2
_08067F0C:
	ldr r2, [r5]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r2, #0x20
	adds r2, r2, r1
	adds r1, r3, r1
	ldrh r1, [r1]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08067F0C
	bl WriteSaveGame
	ldr r1, _08067F60 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08067F64 @ =gUnknown_03002AE4
	ldr r0, _08067F68 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08067F6C @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08067F70 @ =gUnknown_03004D5C
	ldr r0, _08067F74 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	asrs r0, r7, #0x10
	cmp r0, #1
	bne _08067F78
	bl sub_805A1CC
	b _08067F7C
	.align 2, 0
_08067F58: .4byte gLoadedSaveGame
_08067F5C: .4byte IWRAM_START + 0x3AC
_08067F60: .4byte 0x0000FFFF
_08067F64: .4byte gUnknown_03002AE4
_08067F68: .4byte gUnknown_0300287C
_08067F6C: .4byte gUnknown_03005390
_08067F70: .4byte gUnknown_03004D5C
_08067F74: .4byte gUnknown_03002A84
_08067F78:
	bl CreateTitleScreen
_08067F7C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8067F84
sub_8067F84: @ 0x08067F84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0806806C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	adds r1, #0x30
	adds r4, r0, r1
	ldr r2, _08068070 @ =IWRAM_START + 0x150
	adds r5, r0, r2
	ldr r1, _08068074 @ =IWRAM_START + 0x1B0
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _08068078 @ =IWRAM_START + 0x288
	adds r2, r2, r0
	mov sb, r2
	ldr r1, _0806807C @ =IWRAM_START + 0x258
	adds r1, r1, r0
	mov sl, r1
	adds r0, r7, #0
	bl sub_80051E8
	movs r6, #0
_08067FBE:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r4, #0x30
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08067FBE
	ldr r0, _08068080 @ =0x00000252
	adds r6, r7, r0
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0xa
	bgt _0806808C
	ldr r0, _08068084 @ =0x000003BA
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #7
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	adds r0, #0x20
	strh r0, [r5, #0x16]
	ldr r1, _08068088 @ =0x00000253
	adds r4, r7, r1
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, #0x2f
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, #0x30
	movs r0, #0x94
	lsls r0, r0, #2
	adds r2, r7, r0
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #0xb
	muls r0, r1, r0
	ldrh r2, [r2]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, r1, r0
	movs r2, #0xee
	lsls r2, r2, #2
	adds r0, r7, r2
	strh r1, [r0]
	ldrh r1, [r0]
	mov r0, sp
	bl sub_806B908
	ldr r0, [sp]
	ldr r1, [sp, #4]
	strh r1, [r5, #0xa]
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	adds r0, #0x20
	strh r0, [r5, #0x16]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, #0x2f
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	b _080680B8
	.align 2, 0
_0806806C: .4byte gCurTask
_08068070: .4byte IWRAM_START + 0x150
_08068074: .4byte IWRAM_START + 0x1B0
_08068078: .4byte IWRAM_START + 0x288
_0806807C: .4byte IWRAM_START + 0x258
_08068080: .4byte 0x00000252
_08068084: .4byte 0x000003BA
_08068088: .4byte 0x00000253
_0806808C:
	ldr r0, _08068184 @ =0x000003BA
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #8
	strb r0, [r1]
	movs r0, #0xcb
	strh r0, [r5, #0x16]
	ldr r1, _08068188 @ =0x00000253
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r0, #0x27
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_080680B8:
	mov r0, r8
	bl sub_8004558
	movs r2, #0x30
	add r8, r2
	mov r0, r8
	bl sub_8004558
	ldr r1, _0806818C @ =0x00000252
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xa
	bgt _08068104
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r2, r2, r7
	mov r8, r2
	movs r0, #0xee
	lsls r0, r0, #2
	adds r4, r7, r0
	ldrh r0, [r4]
	cmp r0, #0xa
	bls _080680F0
	mov r0, r8
	bl sub_80051E8
_080680F0:
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r1, r1, r7
	mov r8, r1
	ldrh r0, [r4]
	cmp r0, #0xe6
	bhi _08068104
	mov r0, r8
	bl sub_80051E8
_08068104:
	ldr r2, _08068190 @ =0x000003AA
	adds r1, r7, r2
	ldrh r0, [r1]
	cmp r0, #5
	bhi _08068122
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0xa1
	mov r1, sl
	strh r0, [r1, #0x16]
	mov r0, sl
	bl sub_80051E8
_08068122:
	movs r6, #0
	movs r2, #0xeb
	lsls r2, r2, #2
	adds r4, r7, r2
	ldrh r0, [r4]
	ldr r1, _08068194 @ =0x0000FFFF
	cmp r0, r1
	beq _08068174
	adds r5, r1, #0
_08068134:
	ldrh r1, [r4]
	add r0, sp, #8
	bl sub_806B908
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r2, sb
	strh r1, [r2, #0xa]
	lsrs r1, r1, #0x10
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	movs r2, #0x30
	add sb, r2
	adds r4, #2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bgt _08068174
	ldrh r0, [r4]
	cmp r0, r5
	bne _08068134
_08068174:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068184: .4byte 0x000003BA
_08068188: .4byte 0x00000253
_0806818C: .4byte 0x00000252
_08068190: .4byte 0x000003AA
_08068194: .4byte 0x0000FFFF

	thumb_func_start sub_8068198
sub_8068198: @ 0x08068198
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08068280 @ =sub_806B3F0
	ldr r1, _08068284 @ =0x00000714
	movs r2, #0x80
	lsls r2, r2, #6
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r2, #1
	ldr r1, _08068288 @ =gLoadedSaveGame
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	asrs r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080681E8
	adds r5, r1, #0
	movs r3, #1
_080681CC:
	lsls r0, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #4
	bgt _080681E8
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	bne _080681CC
_080681E8:
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r0, r4, r3
	str r6, [r0]
	ldr r1, _0806828C @ =0x00000704
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	ldr r3, _08068290 @ =0x00000705
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _08068294 @ =0x00000709
	adds r0, r4, r1
	strb r2, [r0]
	movs r2, #0
	ldr r7, _08068298 @ =gUnknown_03005B50
	ldr r3, _0806829C @ =gUnknown_03005B54
	mov ip, r3
	ldr r0, _080682A0 @ =0x0000070A
	adds r3, r4, r0
	ldr r5, _08068288 @ =gLoadedSaveGame
_08068224:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r1
	ldr r0, [r5]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _08068224
	movs r1, #0xb1
	lsls r1, r1, #1
	adds r0, r6, r1
	ldrb r2, [r0]
	ldr r3, _080682A4 @ =0x0000070F
	adds r0, r4, r3
	movs r1, #0
	strb r2, [r0]
	movs r2, #0xe2
	lsls r2, r2, #3
	adds r0, r4, r2
	strb r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _080682A8 @ =0x06010000
	str r0, [r7]
	mov r0, ip
	str r1, [r0]
	bl sub_80682AC
	adds r0, r4, #0
	bl sub_80682EC
	adds r0, r4, #0
	bl sub_806834C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068280: .4byte sub_806B3F0
_08068284: .4byte 0x00000714
_08068288: .4byte gLoadedSaveGame
_0806828C: .4byte 0x00000704
_08068290: .4byte 0x00000705
_08068294: .4byte 0x00000709
_08068298: .4byte gUnknown_03005B50
_0806829C: .4byte gUnknown_03005B54
_080682A0: .4byte 0x0000070A
_080682A4: .4byte 0x0000070F
_080682A8: .4byte 0x06010000

	thumb_func_start sub_80682AC
sub_80682AC: @ 0x080682AC
	ldr r1, _080682D8 @ =gDispCnt
	movs r2, #0x9a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080682DC @ =gBgCntRegs
	movs r1, #0
	ldr r0, _080682E0 @ =0x00000703
	strh r0, [r2]
	ldr r0, _080682E4 @ =0x00000F06
	strh r0, [r2, #2]
	ldr r0, _080682E8 @ =gBgScrollRegs
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	bx lr
	.align 2, 0
_080682D8: .4byte gDispCnt
_080682DC: .4byte gBgCntRegs
_080682E0: .4byte 0x00000703
_080682E4: .4byte 0x00000F06
_080682E8: .4byte gBgScrollRegs

	thumb_func_start sub_80682EC
sub_80682EC: @ 0x080682EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	strh r4, [r7]
	movs r0, #2
	strh r0, [r7, #2]
	strh r4, [r7, #4]
	adds r0, #0xfe
	strh r0, [r7, #6]
	strh r4, [r7, #0xa]
	movs r0, #0xff
	strh r0, [r7, #8]
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r6, #0x1e
	str r6, [sp]
	movs r5, #0x14
	str r5, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0x89
	bl sub_806B854
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0xf
	movs r3, #0x8a
	bl sub_806B854
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806834C
sub_806834C: @ 0x0806834C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	movs r1, #0x86
	lsls r1, r1, #1
	adds r0, r7, r1
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r2, r7, r2
	str r2, [sp, #0x18]
	adds r6, r7, #0
	adds r6, #0x4c
	ldr r5, _08068464 @ =0x0000070F
	adds r1, r7, r5
	ldrb r4, [r1]
	lsls r1, r4, #3
	str r1, [sp, #0x20]
	ldr r1, _08068468 @ =gUnknown_080D9EB0
	ldr r2, [sp, #0x20]
	adds r1, r2, r1
	str r1, [sp, #0x1c]
	lsls r4, r4, #4
	ldr r1, _0806846C @ =gUnknown_080D9EE0
	adds r4, r4, r1
	ldr r5, [sp, #0x1c]
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r5, #5
	mov sl, r5
	str r5, [sp, #0xc]
	ldr r5, [sp, #0x1c]
	ldrb r1, [r5, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0x14]
	bl sub_806A568
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	movs r0, #0x54
	mov sb, r0
	str r0, [sp, #8]
	mov r1, sl
	str r1, [sp, #0xc]
	ldrb r0, [r4, #2]
	str r0, [sp, #0x10]
	mov r5, r8
	str r5, [sp, #0x14]
	adds r0, r6, #0
	movs r1, #0
	bl sub_806A568
	adds r6, #0x30
	adds r4, #8
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0x86
	str r0, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	mov r5, sl
	str r5, [sp, #0xc]
	ldrb r0, [r4, #2]
	str r0, [sp, #0x10]
	mov r0, r8
	str r0, [sp, #0x14]
	adds r0, r6, #0
	movs r1, #0
	bl sub_806A568
	ldr r1, _08068470 @ =0x000003B6
	mov sb, r1
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	movs r5, #0x4b
	str r5, [sp, #8]
	movs r4, #6
	str r4, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	mov r0, r8
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #0
	movs r2, #2
	mov r3, sb
	bl sub_806A568
	movs r1, #0xb6
	lsls r1, r1, #1
	adds r1, r7, r1
	str r1, [sp, #0x18]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp]
	movs r0, #0x8c
	str r0, [sp, #4]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #9
	str r0, [sp, #0x10]
	mov r5, r8
	str r5, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #2
	mov r3, sb
	bl sub_806A568
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068464: .4byte 0x0000070F
_08068468: .4byte gUnknown_080D9EB0
_0806846C: .4byte gUnknown_080D9EE0
_08068470: .4byte 0x000003B6

	thumb_func_start sub_8068474
sub_8068474: @ 0x08068474
	push {r4, lr}
	ldr r0, _080684B4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _080684B8 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080684D4
	movs r0, #0x6c
	bl m4aSongNumStart
	movs r1, #0
	ldr r0, _080684BC @ =gUnknown_03000710
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #0
	bne _0806849C
	movs r1, #1
_0806849C:
	strb r1, [r2]
	adds r2, r1, #0
	cmp r2, #0
	bne _080684C4
	ldr r1, _080684C0 @ =IWRAM_START + 0x71
	adds r0, r4, r1
	strb r2, [r0]
	adds r1, #0x30
	adds r0, r4, r1
	strb r2, [r0]
	b _080684D4
	.align 2, 0
_080684B4: .4byte gCurTask
_080684B8: .4byte gRepeatedKeys
_080684BC: .4byte gUnknown_03000710
_080684C0: .4byte IWRAM_START + 0x71
_080684C4:
	ldr r0, _080684FC @ =IWRAM_START + 0x71
	adds r1, r4, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08068500 @ =IWRAM_START + 0xA1
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
_080684D4:
	bl sub_806B4F8
	ldr r0, _08068504 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0806851E
	ldr r0, _08068508 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806850C
	movs r0, #0x6a
	bl m4aSongNumStart
	bl sub_806B498
	b _0806851E
	.align 2, 0
_080684FC: .4byte IWRAM_START + 0x71
_08068500: .4byte IWRAM_START + 0xA1
_08068504: .4byte gRepeatedKeys
_08068508: .4byte gPressedKeys
_0806850C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806851E
	movs r0, #0x6b
	bl m4aSongNumStart
	bl sub_806B424
_0806851E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8068524
sub_8068524: @ 0x08068524
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08068614 @ =sub_806B5A4
	ldr r1, _08068618 @ =0x00000714
	movs r2, #0x80
	lsls r2, r2, #6
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r2, #1
	ldr r1, _0806861C @ =gLoadedSaveGame
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	asrs r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08068574
	adds r5, r1, #0
	movs r3, #1
_08068558:
	lsls r0, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #4
	bgt _08068574
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	bne _08068558
_08068574:
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r0, r4, r3
	str r6, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #0
	str r1, [r0]
	ldr r3, _08068620 @ =0x00000704
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _08068624 @ =0x00000709
	adds r0, r4, r1
	strb r2, [r0]
	movs r2, #0
	ldr r7, _08068628 @ =gUnknown_03005B50
	ldr r3, _0806862C @ =gUnknown_03005B54
	mov ip, r3
	ldr r0, _08068630 @ =0x0000070A
	adds r3, r4, r0
	ldr r5, _0806861C @ =gLoadedSaveGame
_080685B8:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r1
	ldr r0, [r5]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080685B8
	movs r1, #0xb1
	lsls r1, r1, #1
	adds r0, r6, r1
	ldrb r1, [r0]
	ldr r2, _08068634 @ =0x0000070F
	adds r0, r4, r2
	movs r2, #0
	strb r1, [r0]
	movs r3, #0xe2
	lsls r3, r3, #3
	adds r0, r4, r3
	strb r2, [r0]
	ldr r0, _08068638 @ =0x00000711
	adds r1, r4, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806863C @ =0x06010000
	str r0, [r7]
	mov r1, ip
	str r2, [r1]
	bl sub_8068640
	adds r0, r4, #0
	bl sub_8068700
	adds r0, r4, #0
	bl sub_80687BC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068614: .4byte sub_806B5A4
_08068618: .4byte 0x00000714
_0806861C: .4byte gLoadedSaveGame
_08068620: .4byte 0x00000704
_08068624: .4byte 0x00000709
_08068628: .4byte gUnknown_03005B50
_0806862C: .4byte gUnknown_03005B54
_08068630: .4byte 0x0000070A
_08068634: .4byte 0x0000070F
_08068638: .4byte 0x00000711
_0806863C: .4byte 0x06010000

	thumb_func_start sub_8068640
sub_8068640: @ 0x08068640
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r1, _080686CC @ =gDispCnt
	movs r2, #0xba
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080686D0 @ =gBgCntRegs
	movs r4, #0
	movs r3, #0
	ldr r0, _080686D4 @ =0x00000703
	strh r0, [r1]
	ldr r0, _080686D8 @ =0x00005606
	strh r0, [r1, #2]
	ldr r0, _080686DC @ =0x00005E09
	strh r0, [r1, #4]
	ldr r0, _080686E0 @ =gBgScrollRegs
	strh r3, [r0]
	strh r3, [r0, #2]
	ldr r1, _080686E4 @ =0x0000FF58
	strh r1, [r0, #4]
	strh r3, [r0, #6]
	strh r1, [r0, #8]
	movs r1, #0x10
	strh r1, [r0, #0xa]
	strh r3, [r0, #0xc]
	strh r3, [r0, #0xe]
	ldr r0, _080686E8 @ =gUnknown_03004D80
	mov r8, r0
	strb r4, [r0, #1]
	ldr r2, _080686EC @ =gUnknown_03002280
	strb r4, [r2, #4]
	strb r4, [r2, #5]
	movs r0, #0xff
	strb r0, [r2, #6]
	movs r6, #0x40
	strb r6, [r2, #7]
	str r3, [sp]
	ldr r1, _080686F0 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080686F4 @ =0x06004000
	str r0, [r1, #4]
	ldr r5, _080686F8 @ =0x85000010
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, r8
	strb r4, [r0, #2]
	strb r4, [r2, #8]
	strb r4, [r2, #9]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r2, #0xa]
	strb r6, [r2, #0xb]
	str r3, [sp]
	mov r2, sp
	str r2, [r1]
	ldr r0, _080686FC @ =0x06008000
	str r0, [r1, #4]
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080686CC: .4byte gDispCnt
_080686D0: .4byte gBgCntRegs
_080686D4: .4byte 0x00000703
_080686D8: .4byte 0x00005606
_080686DC: .4byte 0x00005E09
_080686E0: .4byte gBgScrollRegs
_080686E4: .4byte 0x0000FF58
_080686E8: .4byte gUnknown_03004D80
_080686EC: .4byte gUnknown_03002280
_080686F0: .4byte 0x040000D4
_080686F4: .4byte 0x06004000
_080686F8: .4byte 0x85000010
_080686FC: .4byte 0x06008000

	thumb_func_start sub_8068700
sub_8068700: @ 0x08068700
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _080687B4 @ =0x00000704
	adds r1, r7, r0
	ldrb r0, [r1]
	movs r6, #0
	cmp r0, #0xff
	beq _0806871C
	adds r6, r0, #0
_0806871C:
	movs r4, #0
	strh r4, [r7]
	movs r1, #2
	mov sl, r1
	mov r0, sl
	strh r0, [r7, #2]
	strh r4, [r7, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #6]
	strh r4, [r7, #0xa]
	movs r0, #0xff
	strh r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0x1e
	str r1, [sp]
	movs r1, #0x14
	mov r8, r1
	str r1, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0x8b
	bl sub_806B854
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r5, _080687B8 @ =gUnknown_080D9590
	lsls r6, r6, #2
	adds r1, r6, r5
	ldrb r3, [r1]
	movs r1, #9
	mov sb, r1
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0x16
	bl sub_806B854
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r5, #2
	adds r6, r6, r5
	ldrb r3, [r6]
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	mov r1, sl
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #2
	movs r2, #0x1e
	bl sub_806B854
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080687B4: .4byte 0x00000704
_080687B8: .4byte gUnknown_080D9590

	thumb_func_start sub_80687BC
sub_80687BC: @ 0x080687BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r7, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #2
	adds r5, r7, r0
	adds r1, r7, #0
	adds r1, #0x4c
	str r1, [sp, #0x18]
	adds r2, r7, #0
	adds r2, #0xac
	str r2, [sp, #0x1c]
	movs r0, #0x86
	lsls r0, r0, #1
	adds r0, r7, r0
	str r0, [sp, #0x20]
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r1, r7, r2
	ldr r2, _080689DC @ =0x0000070F
	adds r0, r7, r2
	ldrb r0, [r0]
	str r0, [sp, #0x24]
	subs r2, #0xa
	adds r0, r7, r2
	ldrb r0, [r0]
	str r0, [sp, #0x28]
	adds r2, #1
	adds r0, r7, r2
	ldrb r0, [r0]
	str r0, [sp, #0x2c]
	ldr r0, _080689E0 @ =0x0000041A
	mov sl, r0
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r2, #0x20
	str r2, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	movs r6, #0
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #2
	mov r3, sl
	bl sub_806A568
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r2, #0x80
	lsls r2, r2, #5
	mov sb, r2
	str r2, [sp]
	movs r0, #0x9c
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #2
	mov r3, sl
	bl sub_806A568
	movs r2, #0xce
	lsls r2, r2, #1
	adds r1, r7, r2
	mov r0, sb
	str r0, [sp]
	movs r4, #0xd0
	str r4, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	movs r2, #3
	str r2, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #2
	mov r3, sl
	bl sub_806A568
	movs r2, #0xe6
	lsls r2, r2, #1
	adds r1, r7, r2
	movs r0, #0xc0
	lsls r0, r0, #5
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x8c
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r2, #1
	str r2, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #2
	mov r3, sl
	bl sub_806A568
	ldr r0, _080689E4 @ =0x00000417
	mov sl, r0
	mov r1, sb
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0x50
	str r0, [sp, #8]
	movs r4, #5
	str r4, [sp, #0xc]
	movs r0, #0xb
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	mov r3, sl
	bl sub_806A568
	movs r2, #0xad
	lsls r2, r2, #2
	adds r5, r7, r2
	mov r0, sb
	str r0, [sp]
	movs r1, #0xc
	mov r8, r1
	str r1, [sp, #4]
	movs r0, #0x68
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	mov r3, sl
	bl sub_806A568
	movs r2, #0xb9
	lsls r2, r2, #2
	adds r5, r7, r2
	mov r0, sb
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0xd
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	mov r3, sl
	bl sub_806A568
	ldr r0, _080689E8 @ =gUnknown_080D9F40
	movs r1, #7
	bl sub_806B8D4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0x83
	lsls r5, r5, #3
	mov r1, sb
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #0
	movs r2, #0x14
	adds r3, r5, #0
	bl sub_806A568
	adds r1, r7, #0
	adds r1, #0x7c
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x28]
	lsls r2, r2, #3
	str r2, [sp, #0x30]
	ldr r0, _080689E8 @ =gUnknown_080D9F40
	adds r1, r2, r0
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	ldrh r3, [r1]
	mov r2, sb
	str r2, [sp]
	movs r0, #0x5e
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	movs r2, #3
	str r2, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #0
	adds r2, r4, #0
	bl sub_806A568
	movs r1, #0xe2
	lsls r1, r1, #3
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080689EC
	mov r2, sb
	str r2, [sp]
	movs r0, #0x4e
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	movs r1, #3
	str r1, [sp, #0xc]
	movs r2, #1
	str r2, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	movs r2, #0x10
	adds r3, r5, #0
	bl sub_806A568
	adds r0, r7, #0
	adds r0, #0xdc
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #3
	ldr r2, _080689E8 @ =gUnknown_080D9F40
	adds r1, r0, r2
	ldrh r3, [r1]
	mov r0, sb
	str r0, [sp]
	movs r0, #0x88
	str r0, [sp, #4]
	movs r2, #0x20
	str r2, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	adds r2, r4, #0
	bl sub_806A568
	b _08068A0E
	.align 2, 0
_080689DC: .4byte 0x0000070F
_080689E0: .4byte 0x0000041A
_080689E4: .4byte 0x00000417
_080689E8: .4byte gUnknown_080D9F40
_080689EC:
	mov r1, sb
	str r1, [sp]
	movs r0, #0x4e
	str r0, [sp, #4]
	movs r2, #0x20
	str r2, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #9
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	movs r2, #0x14
	adds r3, r5, #0
	bl sub_806A568
_08068A0E:
	movs r1, #0xe2
	lsls r1, r1, #3
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068A34
	ldr r0, [sp, #0x24]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #3
	subs r1, #0xb
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _08068A30 @ =gUnknown_080D9FD0
	b _08068A46
	.align 2, 0
_08068A30: .4byte gUnknown_080D9FD0
_08068A34:
	ldr r0, [sp, #0x24]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #3
	ldr r1, _08068A8C @ =0x00000705
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _08068A90 @ =gUnknown_080DA120
_08068A46:
	adds r0, r0, r1
	adds r4, r2, r0
	adds r0, r4, #0
	movs r1, #7
	bl sub_806B8D4
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0x9a
	str r0, [sp, #4]
	movs r0, #0x44
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldrb r0, [r4, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl sub_806A568
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068A8C: .4byte 0x00000705
_08068A90: .4byte gUnknown_080DA120

	thumb_func_start sub_8068A94
sub_8068A94: @ 0x08068A94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r3, r0, #0
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, _08068AC4 @ =gUnknown_080D9F78
	adds r0, #0x54
	ldrh r5, [r0]
	movs r1, #0xe2
	lsls r1, r1, #3
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068ACC
	ldr r2, _08068AC8 @ =0x00000706
	adds r0, r3, r2
	ldrb r4, [r0]
	b _08068ACE
	.align 2, 0
_08068AC4: .4byte gUnknown_080D9F78
_08068AC8: .4byte 0x00000706
_08068ACC:
	movs r4, #2
_08068ACE:
	ldr r1, _08068AF8 @ =0x00000711
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _08068AFC
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r0, r3, r2
	ldr r2, [r0]
	movs r0, #0xae
	lsls r0, r0, #1
	adds r2, r2, r0
	subs r1, #0xd
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #6
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #0xc
	b _08068B0E
	.align 2, 0
_08068AF8: .4byte 0x00000711
_08068AFC:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r2, r3, r0
	ldr r1, _08068BB0 @ =0x00000704
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #6
	subs r0, r0, r1
	lsls r0, r0, #1
_08068B0E:
	ldr r2, [r2]
	adds r2, r2, r0
	ldr r1, _08068BB4 @ =0x00000705
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #0x28]
	movs r1, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_08068B32:
	ldr r5, [sp, #0x18]
	adds r2, r5, #0
	adds r2, #0x60
	str r2, [sp, #0x1c]
	adds r0, r5, #0
	adds r0, #0x90
	str r0, [sp, #0x20]
	adds r2, #0x90
	str r2, [sp, #0x24]
	lsls r0, r1, #0x10
	asrs r1, r0, #0xf
	ldr r2, [sp, #0x28]
	adds r1, r1, r2
	ldrh r4, [r1]
	ldr r1, _08068BB8 @ =0x00008C9F
	adds r6, r0, #0
	cmp r4, r1
	bhi _08068BC4
	adds r0, r4, #0
	movs r1, #0x3c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r3, r4, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	ldr r2, _08068BBC @ =gUnknown_080D6B80
	adds r1, r0, r2
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldr r2, _08068BC0 @ =gUnknown_080D6B81
	adds r0, r0, r2
	lsls r1, r1, #1
	ldrb r0, [r0]
	adds r0, r1, r0
	str r0, [sp, #0x2c]
	adds r0, r3, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x3c
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov sb, r1
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #0x30]
	b _08068BD0
	.align 2, 0
_08068BB0: .4byte 0x00000704
_08068BB4: .4byte 0x00000705
_08068BB8: .4byte 0x00008C9F
_08068BBC: .4byte gUnknown_080D6B80
_08068BC0: .4byte gUnknown_080D6B81
_08068BC4:
	movs r2, #0x63
	str r2, [sp, #0x2c]
	movs r0, #0x3b
	str r0, [sp, #0x30]
	movs r1, #9
	mov sb, r1
_08068BD0:
	ldr r7, _08068D8C @ =gUnknown_080D9FC8
	ldrh r3, [r7]
	movs r2, #0xc0
	lsls r2, r2, #6
	str r2, [sp]
	asrs r6, r6, #0x10
	lsls r0, r6, #3
	mov r8, r0
	adds r0, #0x30
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #0x13
	movs r1, #0xa8
	lsls r1, r1, #0xf
	adds r4, r4, r1
	asrs r4, r4, #0x10
	str r4, [sp, #8]
	movs r2, #8
	str r2, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0
	mov r2, sl
	bl sub_806A568
	adds r5, #0x30
	ldrh r3, [r7]
	movs r1, #0xc0
	lsls r1, r1, #6
	str r1, [sp]
	mov r0, r8
	adds r0, #0x60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r2, #8
	str r2, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0
	mov r2, sl
	bl sub_806A568
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08068D90 @ =gUnknown_080D9F78
	adds r7, r0, r2
	ldrh r3, [r7]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	mov r0, r8
	adds r0, #0x20
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	mov r2, sl
	bl sub_806A568
	ldr r0, [sp, #0x30]
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _08068D90 @ =gUnknown_080D9F78
	adds r7, r0, r1
	ldrh r3, [r7]
	movs r2, #0xc0
	lsls r2, r2, #6
	str r2, [sp]
	mov r0, r8
	adds r0, #0x40
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r2, sl
	bl sub_806A568
	ldr r2, [sp, #0x20]
	adds r2, #0x30
	str r2, [sp, #0x20]
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _08068D90 @ =gUnknown_080D9F78
	adds r7, r0, r1
	ldrh r3, [r7]
	movs r2, #0xc0
	lsls r2, r2, #6
	str r2, [sp]
	mov r0, r8
	adds r0, #0x50
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r2, sl
	bl sub_806A568
	ldr r5, [sp, #0x2c]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08068D90 @ =gUnknown_080D9F78
	adds r7, r0, r2
	ldrh r3, [r7]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	mov r0, r8
	adds r0, #0x70
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x24]
	movs r1, #0
	mov r2, sl
	bl sub_806A568
	ldr r0, [sp, #0x24]
	adds r0, #0x30
	str r0, [sp, #0x24]
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _08068D90 @ =gUnknown_080D9F78
	adds r7, r0, r1
	ldrh r3, [r7]
	movs r2, #0xc0
	lsls r2, r2, #6
	str r2, [sp]
	mov r0, r8
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x24]
	mov r2, sl
	bl sub_806A568
	adds r6, #1
	lsls r6, r6, #0x10
	ldr r2, [sp, #0x18]
	movs r0, #0xa8
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #0x18]
	lsrs r1, r6, #0x10
	asrs r6, r6, #0x10
	cmp r6, #2
	bgt _08068D7C
	b _08068B32
_08068D7C:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068D8C: .4byte gUnknown_080D9FC8
_08068D90: .4byte gUnknown_080D9F78

	thumb_func_start sub_8068D94
sub_8068D94: @ 0x08068D94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r3, r0, #0
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r0, r3, r0
	str r0, [sp]
	movs r1, #0xe2
	lsls r1, r1, #3
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068DC4
	ldr r2, _08068DC0 @ =0x00000706
	adds r0, r3, r2
	ldrb r4, [r0]
	b _08068DC6
	.align 2, 0
_08068DC0: .4byte 0x00000706
_08068DC4:
	movs r4, #2
_08068DC6:
	ldr r1, _08068DF0 @ =0x00000711
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _08068DF4
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r0, r3, r2
	ldr r2, [r0]
	movs r0, #0xae
	lsls r0, r0, #1
	adds r2, r2, r0
	subs r1, #0xd
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #6
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #0xc
	b _08068E06
	.align 2, 0
_08068DF0: .4byte 0x00000711
_08068DF4:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r2, r3, r0
	ldr r1, _08068EA8 @ =0x00000704
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #6
	subs r0, r0, r1
	lsls r0, r0, #1
_08068E06:
	ldr r2, [r2]
	adds r2, r2, r0
	ldr r1, _08068EAC @ =0x00000705
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #8]
	movs r0, #0
	ldr r2, [sp]
	adds r2, #0x6a
	mov sl, r2
_08068E2A:
	ldr r1, [sp]
	adds r1, #0x60
	str r1, [sp, #4]
	ldr r6, [sp]
	adds r6, #0x90
	ldr r2, [sp]
	adds r2, #0xf0
	mov r8, r2
	ldr r1, [sp]
	mov sb, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0xf
	ldr r2, [sp, #8]
	adds r1, r1, r2
	ldrh r4, [r1]
	ldr r1, _08068EB0 @ =0x00008C9F
	adds r5, r0, #0
	cmp r4, r1
	bhi _08068EBC
	adds r0, r4, #0
	movs r1, #0x3c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r3, r4, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	ldr r2, _08068EB4 @ =gUnknown_080D6B80
	adds r1, r0, r2
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldr r2, _08068EB8 @ =gUnknown_080D6B81
	adds r0, r0, r2
	lsls r1, r1, #1
	ldrb r0, [r0]
	adds r0, r1, r0
	str r0, [sp, #0xc]
	adds r0, r3, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x3c
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	b _08068EC4
	.align 2, 0
_08068EA8: .4byte 0x00000704
_08068EAC: .4byte 0x00000705
_08068EB0: .4byte 0x00008C9F
_08068EB4: .4byte gUnknown_080D6B80
_08068EB8: .4byte gUnknown_080D6B81
_08068EBC:
	movs r0, #0x63
	str r0, [sp, #0xc]
	movs r4, #0x3b
	movs r2, #9
_08068EC4:
	lsls r0, r2, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08068FE4 @ =gUnknown_080D9F78
	adds r1, r0, r2
	ldrh r0, [r1]
	mov r2, sl
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x16]
	asrs r5, r5, #0x10
	lsls r7, r5, #3
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r0, [r2, #0xc]
	ldr r0, [sp, #4]
	bl sub_8004558
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r7, r2
	mov r1, sb
	strh r0, [r1, #0x16]
	movs r2, #0x30
	add sb, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08068FE4 @ =gUnknown_080D9F78
	adds r1, r0, r2
	ldrh r0, [r1]
	strh r0, [r6, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r1, #0x98
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r0, [r6, #0x16]
	adds r0, r6, #0
	bl sub_8004558
	adds r6, #0x30
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08068FE4 @ =gUnknown_080D9F78
	adds r1, r0, r2
	ldrh r0, [r1]
	strh r0, [r6, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r0, [r6, #0x16]
	adds r0, r6, #0
	bl sub_8004558
	movs r2, #0xa8
	lsls r2, r2, #1
	adds r0, r7, r2
	mov r1, sb
	strh r0, [r1, #0x16]
	ldr r4, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08068FE4 @ =gUnknown_080D9F78
	adds r1, r0, r2
	ldrh r0, [r1]
	mov r2, r8
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	mov r0, r8
	adds r0, #0x20
	strb r1, [r0]
	movs r1, #0xb0
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r0, [r2, #0x16]
	mov r0, r8
	bl sub_8004558
	movs r2, #0x30
	add r8, r2
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08068FE4 @ =gUnknown_080D9F78
	adds r1, r0, r2
	ldrh r0, [r1]
	mov r2, r8
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	mov r0, r8
	adds r0, #0x20
	strb r1, [r0]
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r0, [r2, #0x16]
	mov r0, r8
	bl sub_8004558
	adds r5, #1
	lsls r5, r5, #0x10
	movs r2, #0xa8
	lsls r2, r2, #1
	add sl, r2
	ldr r0, [sp]
	adds r0, r0, r2
	str r0, [sp]
	lsrs r0, r5, #0x10
	asrs r5, r5, #0x10
	cmp r5, #2
	bgt _08068FD2
	b _08068E2A
_08068FD2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068FE4: .4byte gUnknown_080D9F78

	thumb_func_start sub_8068FE8
sub_8068FE8: @ 0x08068FE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08069084 @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	ldr r0, _08069088 @ =gUnknown_03000704
	adds r1, r7, r0
	ldrb r0, [r1]
	movs r6, #0
	cmp r0, #0xff
	beq _0806900A
	adds r6, r0, #0
_0806900A:
	movs r0, #1
	bl sub_806979C
	ldr r1, _0806908C @ =gBgScrollRegs
	movs r4, #0
	ldr r0, _08069090 @ =0x0000FF10
	strh r0, [r1, #4]
	strh r4, [r1, #6]
	strh r0, [r1, #8]
	movs r0, #0x10
	strh r0, [r1, #0xa]
	ldr r1, _08069094 @ =IWRAM_START + 0x204
	adds r0, r7, r1
	ldr r5, _08069098 @ =gUnknown_080D9590
	lsls r6, r6, #2
	adds r1, r6, r5
	ldrb r3, [r1]
	movs r1, #9
	mov sb, r1
	str r1, [sp]
	movs r1, #0x14
	mov r8, r1
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0x16
	bl sub_806B854
	ldr r1, _0806909C @ =IWRAM_START + 0x244
	adds r0, r7, r1
	adds r5, #2
	adds r6, r6, r5
	ldrb r3, [r6]
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0x1e
	bl sub_806B854
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080690A0 @ =sub_80690A4
	str r0, [r1, #8]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069084: .4byte gCurTask
_08069088: .4byte gUnknown_03000704
_0806908C: .4byte gBgScrollRegs
_08069090: .4byte 0x0000FF10
_08069094: .4byte IWRAM_START + 0x204
_08069098: .4byte gUnknown_080D9590
_0806909C: .4byte IWRAM_START + 0x244
_080690A0: .4byte sub_80690A4

	thumb_func_start sub_80690A4
sub_80690A4: @ 0x080690A4
	push {r4, r5, lr}
	ldr r5, _08069100 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _08069104 @ =gUnknown_03000707
	adds r4, r0, r1
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080690CC
	ldr r2, _08069108 @ =gBgScrollRegs
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #0xf0
	strh r0, [r2, #4]
_080690CC:
	ldrb r0, [r4]
	cmp r0, #6
	bls _080690E2
	ldr r2, _08069108 @ =gBgScrollRegs
	adds r1, r0, #0
	subs r1, #6
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #0xf0
	strh r0, [r2, #8]
_080690E2:
	movs r0, #1
	bl sub_806979C
	ldrb r0, [r4]
	cmp r0, #9
	bls _080690F8
	movs r0, #0
	strb r0, [r4]
	ldr r1, [r5]
	ldr r0, _0806910C @ =sub_8069110
	str r0, [r1, #8]
_080690F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069100: .4byte gCurTask
_08069104: .4byte gUnknown_03000707
_08069108: .4byte gBgScrollRegs
_0806910C: .4byte sub_8069110

	thumb_func_start sub_8069110
sub_8069110: @ 0x08069110
	push {r4, r5, lr}
	ldr r0, _08069170 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _08069174 @ =gUnknown_03000707
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
_0806912A:
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	ldr r1, _08069178 @ =0x00000707
	adds r0, r5, r1
	ldrb r1, [r0]
	lsls r0, r4, #3
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_8069180
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #2
	ble _0806912A
	movs r0, #0
	bl sub_806979C
	ldr r0, _08069178 @ =0x00000707
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0x1f
	bls _0806916A
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08069170 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806917C @ =sub_8069208
	str r0, [r1, #8]
_0806916A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069170: .4byte gCurTask
_08069174: .4byte gUnknown_03000707
_08069178: .4byte 0x00000707
_0806917C: .4byte sub_8069208

	thumb_func_start sub_8069180
sub_8069180: @ 0x08069180
	push {r4, r5, lr}
	ldr r2, _080691FC @ =gCurTask
	ldr r2, [r2]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r3
	lsls r0, r0, #4
	ldrh r2, [r2, #6]
	adds r0, r0, r2
	ldr r2, _08069200 @ =IWRAM_START + 0x314
	adds r2, r2, r0
	mov ip, r2
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	ldr r2, _08069204 @ =0xFFFF0000
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	cmp r1, #7
	bhi _080691F4
	mov r2, ip
	adds r2, #0x60
	mov r4, ip
	adds r4, #0x90
	mov r5, ip
	adds r5, #0xf0
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x20
	strh r0, [r2, #0x16]
	adds r0, #0x10
	mov r1, ip
	strh r0, [r1, #0x16]
	adds r1, #0x30
	adds r0, #0x30
	strh r0, [r1, #0x16]
	subs r0, #0x20
	strh r0, [r4, #0x16]
	adds r4, #0x30
	adds r0, #0x10
	strh r0, [r4, #0x16]
	adds r0, #0x20
	strh r0, [r5, #0x16]
	movs r5, #0x90
	lsls r5, r5, #1
	add r5, ip
	adds r0, #0x10
	strh r0, [r5, #0x16]
_080691F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080691FC: .4byte gCurTask
_08069200: .4byte IWRAM_START + 0x314
_08069204: .4byte 0xFFFF0000

	thumb_func_start sub_8069208
sub_8069208: @ 0x08069208
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080692A0 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r1, _080692A4 @ =gUnknown_03000704
	adds r5, r4, r1
	ldr r2, _080692A8 @ =gUnknown_0300070A
	adds r0, r4, r2
	ldrb r1, [r5]
	adds r0, r0, r1
	ldrb r6, [r0]
	cmp r6, #0
	bne _08069234
	movs r6, #1
_08069234:
	cmp r6, #0x1b
	ble _0806923A
	movs r6, #0x1b
_0806923A:
	movs r0, #0
	bl sub_806979C
	ldr r7, _080692AC @ =gRepeatedKeys
	ldrh r1, [r7]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0806924E
	b _08069430
_0806924E:
	ldr r2, _080692B0 @ =gUnknown_03000711
	adds r5, r4, r2
	ldrb r0, [r5]
	cmp r0, #2
	bne _0806925E
	cmp r6, #1
	bne _0806925E
	b _080694E6
_0806925E:
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrh r1, [r7]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08069324
	ldr r1, _080692B4 @ =gUnknown_03000710
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806930E
	ldrb r0, [r5]
	cmp r0, #2
	bne _080692E0
	ldr r2, _080692B8 @ =gUnknown_03000706
	adds r3, r4, r2
	ldrb r0, [r3]
	cmp r0, #0
	bne _080692DA
	ldr r0, _080692BC @ =gUnknown_03000705
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080692C0
	subs r0, #1
	strb r0, [r2]
	movs r0, #1
	b _080692D6
	.align 2, 0
_080692A0: .4byte gCurTask
_080692A4: .4byte gUnknown_03000704
_080692A8: .4byte gUnknown_0300070A
_080692AC: .4byte gRepeatedKeys
_080692B0: .4byte gUnknown_03000711
_080692B4: .4byte gUnknown_03000710
_080692B8: .4byte gUnknown_03000706
_080692BC: .4byte gUnknown_03000705
_080692C0:
	lsls r1, r6, #0x10
	asrs r0, r1, #0x12
	strb r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #1
	eors r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
_080692D6:
	strb r0, [r3]
	b _0806940A
_080692DA:
	subs r0, #1
	strb r0, [r3]
	b _0806941C
_080692E0:
	ldr r2, _080692FC @ =gUnknown_03000706
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08069308
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08069300 @ =gUnknown_03000705
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08069304
	subs r0, #1
	b _080693FE
	.align 2, 0
_080692FC: .4byte gUnknown_03000706
_08069300: .4byte gUnknown_03000705
_08069304:
	movs r0, #6
	b _080693FE
_08069308:
	subs r0, #1
	strb r0, [r1]
	b _0806941C
_0806930E:
	ldr r2, _0806931C @ =gUnknown_03000705
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _08069320
	subs r0, #1
	b _080693FE
	.align 2, 0
_0806931C: .4byte gUnknown_03000705
_08069320:
	movs r0, #6
	b _080693FE
_08069324:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0806932E
	b _0806941C
_0806932E:
	ldr r1, _08069374 @ =gUnknown_03000710
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080693F2
	ldrb r0, [r5]
	cmp r0, #2
	bne _080693CC
	lsls r1, r6, #0x10
	asrs r0, r1, #0x12
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #1
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	ldr r0, _08069378 @ =gUnknown_03000706
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080693A4
	strb r3, [r2]
	ldr r2, _0806937C @ =gUnknown_03000705
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, #5
	bhi _08069380
	adds r0, #1
	strb r0, [r1]
	b _08069382
	.align 2, 0
_08069374: .4byte gUnknown_03000710
_08069378: .4byte gUnknown_03000706
_0806937C: .4byte gUnknown_03000705
_08069380:
	strb r3, [r1]
_08069382:
	ldr r2, _0806939C @ =0x00000705
	add r2, r8
	ldrb r1, [r2]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0806940A
	movs r1, #0
	strb r1, [r2]
	ldr r0, _080693A0 @ =0x00000706
	add r0, r8
	strb r1, [r0]
	b _0806940A
	.align 2, 0
_0806939C: .4byte 0x00000705
_080693A0: .4byte 0x00000706
_080693A4:
	adds r0, #1
	strb r0, [r2]
	ldr r0, _080693C8 @ =gUnknown_03000705
	adds r4, r4, r0
	ldrb r1, [r4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	blt _0806941C
	ldrb r0, [r2]
	cmp r0, r5
	ble _0806941C
	strb r3, [r4]
	strb r3, [r2]
	mov r2, sb
	ldr r1, [r2]
	b _0806940E
	.align 2, 0
_080693C8: .4byte gUnknown_03000705
_080693CC:
	ldr r0, _080693E4 @ =gUnknown_03000706
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080693EC
	strb r3, [r1]
	ldr r2, _080693E8 @ =gUnknown_03000705
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, #5
	bls _080693FC
	b _08069408
	.align 2, 0
_080693E4: .4byte gUnknown_03000706
_080693E8: .4byte gUnknown_03000705
_080693EC:
	adds r0, #1
	strb r0, [r1]
	b _0806941C
_080693F2:
	ldr r0, _08069404 @ =gUnknown_03000705
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #5
	bhi _08069408
_080693FC:
	adds r0, #1
_080693FE:
	strb r0, [r1]
	b _0806940A
	.align 2, 0
_08069404: .4byte gUnknown_03000705
_08069408:
	strb r3, [r1]
_0806940A:
	ldr r0, _08069414 @ =gCurTask
	ldr r1, [r0]
_0806940E:
	ldr r0, _08069418 @ =sub_806955C
	str r0, [r1, #8]
	b _080694E6
	.align 2, 0
_08069414: .4byte gCurTask
_08069418: .4byte sub_806955C
_0806941C:
	ldr r0, _08069428 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806942C @ =sub_806B60C
	str r0, [r1, #8]
	b _080694E6
	.align 2, 0
_08069428: .4byte gCurTask
_0806942C: .4byte sub_806B60C
_08069430:
	ldr r2, _08069474 @ =gUnknown_03000711
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #2
	beq _080694B4
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080694D0
	ldr r1, _08069478 @ =gUnknown_03000709
	adds r0, r4, r1
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _080694E6
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrh r1, [r7]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08069480
	ldrb r0, [r5]
	cmp r0, #0
	beq _0806947C
	subs r0, #1
	strb r0, [r5]
	b _08069496
	.align 2, 0
_08069474: .4byte gUnknown_03000711
_08069478: .4byte gUnknown_03000709
_0806947C:
	strb r6, [r5]
	b _08069496
_08069480:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08069496
	ldrb r0, [r5]
	cmp r0, r4
	bge _08069494
	adds r0, #1
	strb r0, [r5]
	b _08069496
_08069494:
	strb r2, [r5]
_08069496:
	ldr r1, _080694A8 @ =0x00000707
	add r1, r8
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080694AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080694B0 @ =sub_80694F8
	str r0, [r1, #8]
	b _080694E6
	.align 2, 0
_080694A8: .4byte 0x00000707
_080694AC: .4byte gCurTask
_080694B0: .4byte sub_80694F8
_080694B4:
	ldr r0, _080694CC @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080694D0
	movs r0, #0x6a
	bl m4aSongNumStart
	bl sub_806B684
	b _080694E6
	.align 2, 0
_080694CC: .4byte gPressedKeys
_080694D0:
	ldr r0, _080694F4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080694E6
	movs r0, #0x6b
	bl m4aSongNumStart
	bl sub_806B730
_080694E6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080694F4: .4byte gPressedKeys

	thumb_func_start sub_80694F8
sub_80694F8: @ 0x080694F8
	push {r4, r5, lr}
	ldr r5, _0806954C @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r2, _08069550 @ =gUnknown_03000707
	adds r4, r1, r2
	ldrb r1, [r4]
	subs r1, #1
	strb r1, [r4]
	ldr r3, _08069554 @ =gBgScrollRegs
	ldrb r2, [r4]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #1
	subs r1, #0xf0
	strh r1, [r3, #4]
	ldrb r2, [r4]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #1
	subs r1, #0xf0
	strh r1, [r3, #8]
	bl sub_8068D94
	movs r0, #1
	bl sub_806979C
	ldrb r0, [r4]
	cmp r0, #0
	bne _08069544
	movs r0, #0
	strb r0, [r4]
	ldr r1, [r5]
	ldr r0, _08069558 @ =sub_8068FE8
	str r0, [r1, #8]
_08069544:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806954C: .4byte gCurTask
_08069550: .4byte gUnknown_03000707
_08069554: .4byte gBgScrollRegs
_08069558: .4byte sub_8068FE8

	thumb_func_start sub_806955C
sub_806955C: @ 0x0806955C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080695F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r1, _080695F4 @ =IWRAM_START + 0x7C
	adds r0, r4, r1
	ldr r2, _080695F8 @ =IWRAM_START + 0xDC
	adds r2, r2, r4
	mov sb, r2
	ldr r3, _080695FC @ =IWRAM_START + 0x10C
	adds r7, r4, r3
	ldr r2, _08069600 @ =gUnknown_0300070F
	adds r1, r4, r2
	ldrb r5, [r1]
	ldr r3, _08069604 @ =gUnknown_03000705
	adds r3, r4, r3
	str r3, [sp]
	ldrb r1, [r3]
	lsls r1, r1, #3
	ldr r2, _08069608 @ =gUnknown_080D9F40
	mov sl, r2
	adds r2, r1, r2
	ldrh r1, [r2]
	strh r1, [r0, #0xa]
	ldrh r2, [r2, #2]
	ldr r3, _0806960C @ =IWRAM_START + 0x9C
	adds r1, r4, r3
	strb r2, [r1]
	bl sub_8004558
	ldr r0, _08069610 @ =gUnknown_03000710
	adds r6, r4, r0
	ldrb r0, [r6]
	cmp r0, #0
	bne _08069620
	ldr r1, _08069614 @ =gUnknown_03000706
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	mov r3, sl
	adds r2, r0, r3
	ldrh r0, [r2]
	mov r1, sb
	strh r0, [r1, #0xa]
	ldrh r1, [r2, #2]
	ldr r2, _08069618 @ =IWRAM_START + 0xFC
	adds r0, r4, r2
	strb r1, [r0]
	mov r0, sb
	bl sub_8004558
	ldrb r0, [r6]
	cmp r0, #0
	bne _08069620
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	ldr r3, [sp]
	ldrb r1, [r3]
	lsls r1, r1, #3
	ldr r2, _0806961C @ =gUnknown_080D9FD0
	adds r1, r1, r2
	adds r2, r0, r1
	b _08069634
	.align 2, 0
_080695F0: .4byte gCurTask
_080695F4: .4byte IWRAM_START + 0x7C
_080695F8: .4byte IWRAM_START + 0xDC
_080695FC: .4byte IWRAM_START + 0x10C
_08069600: .4byte gUnknown_0300070F
_08069604: .4byte gUnknown_03000705
_08069608: .4byte gUnknown_080D9F40
_0806960C: .4byte IWRAM_START + 0x9C
_08069610: .4byte gUnknown_03000710
_08069614: .4byte gUnknown_03000706
_08069618: .4byte IWRAM_START + 0xFC
_0806961C: .4byte gUnknown_080D9FD0
_08069620:
	lsls r2, r5, #3
	subs r2, r2, r5
	lsls r2, r2, #3
	ldr r0, _08069674 @ =0x00000705
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _08069678 @ =gUnknown_080DA120
	adds r0, r0, r1
	adds r2, r2, r0
_08069634:
	ldrh r0, [r2]
	movs r4, #0
	strh r0, [r7, #0xa]
	ldrh r1, [r2, #2]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_8004558
	mov r0, r8
	bl sub_8068D94
	movs r0, #0
	bl sub_806979C
	ldr r0, _0806967C @ =0x00000707
	add r0, r8
	strb r4, [r0]
	ldr r0, _08069680 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08069684 @ =sub_8069110
	str r0, [r1, #8]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069674: .4byte 0x00000705
_08069678: .4byte gUnknown_080DA120
_0806967C: .4byte 0x00000707
_08069680: .4byte gCurTask
_08069684: .4byte sub_8069110

	thumb_func_start sub_8069688
sub_8069688: @ 0x08069688
	push {r4, r5, r6, r7, lr}
	ldr r7, _080696B0 @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r1, _080696B4 @ =IWRAM_START + 0x1FC
	adds r0, r4, r1
	ldr r6, [r0]
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080696B8
	movs r0, #0
	bl sub_806979C
	b _08069772
	.align 2, 0
_080696B0: .4byte gCurTask
_080696B4: .4byte IWRAM_START + 0x1FC
_080696B8:
	ldr r3, _080696CC @ =gUnknown_03000711
	adds r1, r4, r3
	ldrb r2, [r1]
	cmp r2, #1
	beq _0806971C
	cmp r2, #1
	bgt _080696D0
	cmp r2, #0
	beq _080696D6
	b _08069772
	.align 2, 0
_080696CC: .4byte gUnknown_03000711
_080696D0:
	cmp r2, #2
	beq _08069730
	b _08069772
_080696D6:
	ldr r3, _08069708 @ =gUnknown_03000707
	adds r0, r4, r3
	strb r2, [r0]
	adds r3, #9
	adds r0, r4, r3
	strb r2, [r0]
	strb r2, [r1]
	ldr r1, _0806970C @ =gUnknown_03005B50
	ldr r0, _08069710 @ =0x06010000
	str r0, [r1]
	ldr r0, _08069714 @ =gUnknown_03005B54
	str r2, [r0]
	bl sub_80682AC
	adds r0, r5, #0
	bl sub_80682EC
	adds r0, r5, #0
	bl sub_806834C
	ldr r1, [r7]
	ldr r0, _08069718 @ =sub_806B3F0
	str r0, [r1, #8]
	b _08069772
	.align 2, 0
_08069708: .4byte gUnknown_03000707
_0806970C: .4byte gUnknown_03005B50
_08069710: .4byte 0x06010000
_08069714: .4byte gUnknown_03005B54
_08069718: .4byte sub_806B3F0
_0806971C:
	ldr r0, _0806972C @ =0x00000163
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r7]
	bl TaskDestroy
	b _08069772
	.align 2, 0
_0806972C: .4byte 0x00000163
_08069730:
	movs r5, #0
	ldr r1, _08069778 @ =gUnknown_03000709
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0806973E
	movs r5, #1
_0806973E:
	ldr r3, _0806977C @ =IWRAM_START + 0x200
	adds r0, r4, r3
	ldr r0, [r0]
	bl EwramFree
	ldr r1, _08069780 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08069784 @ =gUnknown_03002AE4
	ldr r0, _08069788 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0806978C @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08069790 @ =gUnknown_03004D5C
	ldr r0, _08069794 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08069798 @ =gUnknown_03000704
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	bl sub_803143C
_08069772:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069778: .4byte gUnknown_03000709
_0806977C: .4byte IWRAM_START + 0x200
_08069780: .4byte 0x0000FFFF
_08069784: .4byte gUnknown_03002AE4
_08069788: .4byte gUnknown_0300287C
_0806978C: .4byte gUnknown_03005390
_08069790: .4byte gUnknown_03004D5C
_08069794: .4byte gUnknown_03002A84
_08069798: .4byte gUnknown_03000704

	thumb_func_start sub_806979C
sub_806979C: @ 0x0806979C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, _08069860 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	str r1, [sp, #4]
	ldr r1, _08069864 @ =IWRAM_START + 0x314
	adds r1, r1, r0
	mov sl, r1
	ldr r2, _08069868 @ =IWRAM_START + 0x284
	adds r4, r0, r2
	ldr r3, _0806986C @ =IWRAM_START + 0x4C
	adds r5, r0, r3
	ldr r1, _08069870 @ =IWRAM_START + 0xAC
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _08069874 @ =IWRAM_START + 0x10C
	adds r2, r0, r2
	str r2, [sp, #8]
	adds r3, #0xf0
	adds r6, r0, r3
	ldr r2, _08069878 @ =gUnknown_03000704
	adds r1, r0, r2
	ldr r3, _0806987C @ =gUnknown_0300070A
	adds r0, r0, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	cmp r0, #0
	bne _080697F2
	movs r0, #1
	mov sb, r0
_080697F2:
	movs r7, #0
_080697F4:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r7, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080697F4
	movs r7, #0
_0806980E:
	adds r0, r5, #0
	bl sub_80051E8
	lsls r0, r7, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r5, #0x30
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806980E
	ldr r3, [sp, #4]
	ldr r1, _08069880 @ =0x00000711
	adds r0, r3, r1
	ldrb r0, [r0]
	movs r1, #2
	cmp r0, #2
	beq _08069846
	ldr r2, [sp]
	cmp r2, #0
	bne _08069846
	ldr r2, _08069884 @ =0x00000709
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #1
	bls _08069846
	movs r1, #4
_08069846:
	adds r4, r1, #0
	ldr r3, [sp, #4]
	ldr r1, _08069880 @ =0x00000711
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0806985A
	mov r2, sb
	cmp r2, #1
	ble _08069888
_0806985A:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	b _0806988A
	.align 2, 0
_08069860: .4byte gCurTask
_08069864: .4byte IWRAM_START + 0x314
_08069868: .4byte IWRAM_START + 0x284
_0806986C: .4byte IWRAM_START + 0x4C
_08069870: .4byte IWRAM_START + 0xAC
_08069874: .4byte IWRAM_START + 0x10C
_08069878: .4byte gUnknown_03000704
_0806987C: .4byte gUnknown_0300070A
_08069880: .4byte 0x00000711
_08069884: .4byte 0x00000709
_08069888:
	movs r0, #0
_0806988A:
	movs r7, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r7, r0
	bge _080698B4
	adds r4, r0, #0
_08069896:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r7, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r6, #0x30
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	blt _08069896
_080698B4:
	ldr r1, [sp, #4]
	movs r2, #0xe2
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080698E0
	movs r7, #0
_080698C4:
	mov r0, r8
	bl sub_80051E8
	lsls r0, r7, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	movs r1, #0x30
	add r8, r1
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _080698C4
	b _080698E6
_080698E0:
	mov r0, r8
	bl sub_80051E8
_080698E6:
	ldr r0, [sp, #8]
	bl sub_80051E8
	movs r7, #0
_080698EE:
	mov r5, sl
	movs r2, #0x60
	add r2, sl
	mov sb, r2
	mov r6, sl
	adds r6, #0x90
	movs r3, #0xf0
	add r3, sl
	mov r8, r3
	movs r4, #0
	lsls r7, r7, #0x10
_08069904:
	adds r0, r5, #0
	bl sub_80051E8
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r5, #0x30
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08069904
	mov r0, sb
	bl sub_80051E8
	movs r4, #0
_08069924:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r4, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r6, #0x30
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08069924
	movs r4, #0
_0806993E:
	mov r0, r8
	bl sub_80051E8
	lsls r0, r4, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	movs r1, #0x30
	add r8, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806993E
	adds r0, r7, r3
	movs r2, #0xa8
	lsls r2, r2, #1
	add sl, r2
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080698EE
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8069978
sub_8069978: @ 0x08069978
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _08069B04 @ =sub_806B760
	movs r1, #0xea
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	str r0, [sp, #4]
	movs r0, #0xb9
	lsls r0, r0, #5
	bl EwramMalloc
	ldr r1, _08069B08 @ =IWRAM_START + 0x390
	adds r2, r4, r1
	str r0, [r2]
	ldr r3, _08069B0C @ =IWRAM_START + 0x38C
	adds r0, r4, r3
	str r6, [r0]
	adds r1, #4
	adds r0, r4, r1
	strb r5, [r0]
	adds r3, #0x18
	adds r0, r4, r3
	strb r5, [r0]
	adds r1, #0x11
	adds r0, r4, r1
	strb r5, [r0]
	adds r3, #2
	adds r0, r4, r3
	strb r5, [r0]
	movs r5, #0xb1
	lsls r5, r5, #1
	adds r0, r6, r5
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	subs r5, #6
	adds r6, r6, r5
	ldr r7, [r6]
	ldr r6, _08069B10 @ =IWRAM_START + 0x398
	adds r1, r4, r6
	adds r0, r7, #0
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	movs r1, #0xd3
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r1, [r0]
	ldr r3, _08069B14 @ =IWRAM_START + 0x395
	adds r0, r4, r3
	strb r1, [r0]
	ldr r5, _08069B18 @ =0x0000034D
	adds r0, r7, r5
	ldrb r1, [r0]
	ldr r6, _08069B1C @ =IWRAM_START + 0x396
	adds r0, r4, r6
	strb r1, [r0]
	ldr r1, _08069B20 @ =0x0000034E
	adds r0, r7, r1
	ldrb r0, [r0]
	adds r3, #2
	adds r4, r4, r3
	strb r0, [r4]
	ldr r2, [r2]
	mov ip, r2
	movs r0, #0
	ldr r4, _08069B24 @ =0x0000FFFF
	mov sl, r4
	mov sb, r4
	subs r5, #0xc5
	adds r5, r5, r7
	mov r8, r5
_08069A26:
	movs r2, #0
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	mov r4, ip
	adds r6, r1, r4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r5, r1, #2
_08069A40:
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #1
	adds r1, r6, r0
	adds r0, r0, r5
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, sb
	beq _08069A64
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08069A40
_08069A64:
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #5
	bgt _08069A94
	asrs r1, r3, #0x10
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r5, ip
	adds r4, r0, r5
_08069A7C:
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r4, r1
	ldrh r0, [r1]
	mov r6, sl
	orrs r0, r6
	strh r0, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #5
	ble _08069A7C
_08069A94:
	asrs r3, r3, #0x10
	lsls r2, r3, #3
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r3
	lsls r2, r2, #4
	add r2, ip
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r7, r1
	movs r4, #0xa5
	lsls r4, r4, #2
	adds r0, r1, r4
	ldrb r0, [r0]
	strb r0, [r2, #0xc]
	ldr r5, _08069B28 @ =0x00000295
	adds r0, r1, r5
	ldrb r0, [r0]
	strb r0, [r2, #0xd]
	ldr r6, _08069B2C @ =0x00000296
	adds r0, r1, r6
	ldrb r0, [r0]
	strb r0, [r2, #0xe]
	ldr r0, _08069B30 @ =0x00000297
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2, #0xf]
	adds r3, #1
	lsls r3, r3, #0x10
	lsrs r0, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #9
	ble _08069A26
	ldr r0, _08069B34 @ =0x06010000
	ldr r1, _08069B38 @ =gUnknown_03005B50
	str r0, [r1]
	movs r0, #0
	ldr r3, _08069B3C @ =gUnknown_03005B54
	str r0, [r3]
	bl sub_8069B40
	ldr r0, [sp, #4]
	bl sub_8069B88
	ldr r0, [sp, #4]
	bl sub_8069BF0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069B04: .4byte sub_806B760
_08069B08: .4byte IWRAM_START + 0x390
_08069B0C: .4byte IWRAM_START + 0x38C
_08069B10: .4byte IWRAM_START + 0x398
_08069B14: .4byte IWRAM_START + 0x395
_08069B18: .4byte 0x0000034D
_08069B1C: .4byte IWRAM_START + 0x396
_08069B20: .4byte 0x0000034E
_08069B24: .4byte 0x0000FFFF
_08069B28: .4byte 0x00000295
_08069B2C: .4byte 0x00000296
_08069B30: .4byte 0x00000297
_08069B34: .4byte 0x06010000
_08069B38: .4byte gUnknown_03005B50
_08069B3C: .4byte gUnknown_03005B54

	thumb_func_start sub_8069B40
sub_8069B40: @ 0x08069B40
	ldr r1, _08069B70 @ =gDispCnt
	movs r2, #0xba
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _08069B74 @ =gBgCntRegs
	movs r1, #0
	ldr r0, _08069B78 @ =0x00000701
	strh r0, [r2]
	ldr r0, _08069B7C @ =0x00009606
	strh r0, [r2, #2]
	ldr r0, _08069B80 @ =0x00001F0F
	strh r0, [r2, #4]
	ldr r0, _08069B84 @ =gBgScrollRegs
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	bx lr
	.align 2, 0
_08069B70: .4byte gDispCnt
_08069B74: .4byte gBgCntRegs
_08069B78: .4byte 0x00000701
_08069B7C: .4byte 0x00009606
_08069B80: .4byte 0x00001F0F
_08069B84: .4byte gBgScrollRegs

	thumb_func_start sub_8069B88
sub_8069B88: @ 0x08069B88
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	adds r5, r0, #0
	movs r4, #0
	strh r4, [r5]
	movs r0, #2
	strh r0, [r5, #2]
	strh r4, [r5, #4]
	adds r0, #0xfe
	strh r0, [r5, #6]
	strh r4, [r5, #0xa]
	movs r0, #0xff
	strh r0, [r5, #8]
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #0x1e
	mov r8, r1
	str r1, [sp]
	movs r6, #0x14
	str r6, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0x98
	bl sub_806B854
	adds r5, #0x4c
	mov r0, r8
	str r0, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x16
	movs r3, #0x89
	bl sub_806B854
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8069BF0
sub_8069BF0: @ 0x08069BF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov sl, r0
	adds r0, #0x8c
	mov r1, sl
	adds r1, #0xbc
	str r1, [sp, #0x20]
	mov r7, sl
	adds r7, #0xec
	movs r6, #0xa6
	lsls r6, r6, #1
	add r6, sl
	movs r2, #0x9b
	lsls r2, r2, #2
	add r2, sl
	str r2, [sp, #0x24]
	movs r1, #0xb3
	lsls r1, r1, #2
	add r1, sl
	str r1, [sp, #0x28]
	movs r2, #0xcb
	lsls r2, r2, #2
	add r2, sl
	str r2, [sp, #0x2c]
	ldr r1, _08069EA4 @ =0x000003A7
	add r1, sl
	ldrb r4, [r1]
	lsls r4, r4, #4
	ldr r1, _08069EA8 @ =gUnknown_080D9E00
	adds r4, r4, r1
	ldr r5, _08069EAC @ =gUnknown_080D9DF0
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #9
	str r1, [sp, #4]
	movs r1, #0x12
	str r1, [sp, #8]
	movs r1, #5
	mov sb, r1
	str r1, [sp, #0xc]
	ldrb r1, [r4, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0x14]
	bl sub_806A568
	adds r4, #8
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0x76
	str r0, [sp, #4]
	movs r0, #0x26
	str r0, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r0, [r4, #2]
	str r0, [sp, #0x10]
	mov r0, r8
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl sub_806A568
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r0, #8
	mov sb, r0
	str r0, [sp, #4]
	movs r0, #0x4e
	str r0, [sp, #8]
	movs r4, #0xd
	str r4, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	mov r1, r8
	str r1, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	bl sub_806A568
	movs r7, #0x8e
	lsls r7, r7, #1
	add r7, sl
	adds r5, #8
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	mov r1, sb
	str r1, [sp, #4]
	movs r0, #0x88
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	mov r0, r8
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	bl sub_806A568
	movs r1, #0
	movs r4, #0x22
	movs r2, #0x3a
	mov r8, r2
_08069CE0:
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	lsls r1, r7, #1
	movs r0, #0xe6
	lsls r0, r0, #2
	add r0, sl
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08069EB0 @ =0x0000FFFF
	cmp r1, r0
	bne _08069CF8
	movs r1, #0x11
_08069CF8:
	add r0, sp, #0x18
	bl sub_806B908
	ldr r0, [sp, #0x1c]
	lsls r3, r0, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	lsrs r0, r2, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r6, #0
	movs r1, #0
	ldr r2, [sp, #0x18]
	bl sub_806A568
	adds r0, r7, #1
	lsls r0, r0, #0x10
	adds r6, #0x30
	adds r4, #0xc
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08069CE0
	ldr r1, _08069EB4 @ =0x00000395
	add r1, sl
	ldr r0, _08069EB8 @ =0x00000396
	add r0, sl
	ldrb r4, [r0]
	ldr r0, _08069EBC @ =0x00000397
	add r0, sl
	ldrb r0, [r0]
	str r0, [sp, #0x30]
	ldrb r1, [r1]
	mov sb, r1
	mov r0, sb
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08069EC0 @ =gUnknown_080D9E60
	adds r1, r2, r0
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x7c
	str r0, [sp, #4]
	movs r7, #0x40
	str r7, [sp, #8]
	movs r5, #0xd
	str r5, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x24]
	bl sub_806A568
	ldr r2, [sp, #0x24]
	adds r2, #0x30
	str r2, [sp, #0x24]
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08069EC0 @ =gUnknown_080D9E60
	adds r1, r2, r0
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x84
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r5, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x24]
	bl sub_806A568
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08069EC0 @ =gUnknown_080D9E60
	adds r1, r2, r0
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xa4
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r5, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	bl sub_806A568
	ldr r2, [sp, #0x28]
	adds r2, #0x30
	str r2, [sp, #0x28]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08069EC0 @ =gUnknown_080D9E60
	adds r1, r2, r0
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xac
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r5, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	bl sub_806A568
	ldr r4, [sp, #0x30]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08069EC0 @ =gUnknown_080D9E60
	adds r1, r2, r0
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xcc
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r5, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	bl sub_806A568
	ldr r2, [sp, #0x2c]
	adds r2, #0x30
	str r2, [sp, #0x2c]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r2, _08069EC0 @ =gUnknown_080D9E60
	adds r1, r2, r0
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd4
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r5, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	bl sub_806A568
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069EA4: .4byte 0x000003A7
_08069EA8: .4byte gUnknown_080D9E00
_08069EAC: .4byte gUnknown_080D9DF0
_08069EB0: .4byte 0x0000FFFF
_08069EB4: .4byte 0x00000395
_08069EB8: .4byte 0x00000396
_08069EBC: .4byte 0x00000397
_08069EC0: .4byte gUnknown_080D9E60

	thumb_func_start sub_8069EC4
sub_8069EC4: @ 0x08069EC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _0806A0E4 @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	ldr r1, _0806A0E8 @ =IWRAM_START + 0x390
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #3
	adds r3, r1, r0
	lsls r1, r3, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	mov sl, r0
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08069EF6
	b _0806A0D4
_08069EF6:
	lsls r0, r3, #0x11
	movs r1, #0xb4
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r5, sl
	adds r5, #0x10
	movs r1, #0
	movs r4, #0x22
_08069F0A:
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	lsls r0, r6, #1
	add r0, sl
	ldrh r1, [r0]
	ldr r0, _0806A0EC @ =0x0000FFFF
	cmp r1, r0
	bne _08069F1C
	movs r1, #0x11
_08069F1C:
	add r0, sp, #0x18
	bl sub_806B908
	ldr r0, [sp, #0x1c]
	lsls r3, r0, #0x10
	lsrs r3, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	str r7, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	lsrs r0, r1, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0
	ldr r2, [sp, #0x18]
	bl sub_806A568
	adds r0, r6, #1
	lsls r0, r0, #0x10
	adds r5, #0x30
	adds r4, #0xc
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08069F0A
	mov r1, sl
	ldrb r1, [r1, #0xe]
	str r1, [sp, #0x20]
	mov r0, sl
	ldrb r0, [r0, #0xf]
	str r0, [sp, #0x24]
	adds r0, r7, #6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r1, sl
	ldrb r1, [r1, #0xd]
	mov r8, r1
	mov r0, r8
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806A0F0 @ =gUnknown_080D9E60
	adds r7, r1, r0
	movs r0, #0x98
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp]
	movs r1, #0x7c
	str r1, [sp, #4]
	mov r1, sb
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806A568
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806A0F0 @ =gUnknown_080D9E60
	adds r7, r1, r0
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp]
	movs r1, #0x84
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806A568
	ldr r0, [sp, #0x20]
	mov r8, r0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806A0F0 @ =gUnknown_080D9E60
	adds r7, r1, r0
	movs r0, #0xc8
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp]
	movs r1, #0xa4
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806A568
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806A0F0 @ =gUnknown_080D9E60
	adds r7, r1, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp]
	movs r1, #0xac
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806A568
	ldr r5, [sp, #0x24]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806A0F0 @ =gUnknown_080D9E60
	adds r7, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp]
	movs r1, #0xcc
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806A568
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806A0F0 @ =gUnknown_080D9E60
	adds r7, r1, r0
	movs r0, #0x88
	lsls r0, r0, #2
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp]
	movs r1, #0xd4
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806A568
_0806A0D4:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A0E4: .4byte gCurTask
_0806A0E8: .4byte IWRAM_START + 0x390
_0806A0EC: .4byte 0x0000FFFF
_0806A0F0: .4byte gUnknown_080D9E60

	thumb_func_start sub_806A0F4
sub_806A0F4: @ 0x0806A0F4
	push {r4, r5, r6, r7, lr}
	ldr r7, _0806A140 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	ldr r1, _0806A144 @ =IWRAM_START + 0x390
	adds r0, r5, r1
	ldr r6, [r0]
	bl sub_806A348
	ldr r0, _0806A148 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0806A1B0
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806A154
	ldr r2, _0806A14C @ =IWRAM_START + 0x3A6
	adds r4, r5, r2
	ldrb r0, [r4]
	cmp r0, #0
	beq _0806A1B0
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrb r1, [r4]
	ldr r2, _0806A150 @ =IWRAM_START + 0x3A5
	adds r0, r5, r2
	strb r1, [r0]
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	subs r2, #1
	adds r1, r5, r2
	strb r0, [r1]
	b _0806A19A
	.align 2, 0
_0806A140: .4byte gCurTask
_0806A144: .4byte IWRAM_START + 0x390
_0806A148: .4byte gRepeatedKeys
_0806A14C: .4byte IWRAM_START + 0x3A6
_0806A150: .4byte IWRAM_START + 0x3A5
_0806A154:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806A1B0
	ldr r0, _0806A1A4 @ =IWRAM_START + 0x3A6
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #5
	bhi _0806A1C6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	movs r2, #0x94
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r6, r6, r1
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	beq _0806A1B0
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrb r1, [r4]
	ldr r2, _0806A1A8 @ =IWRAM_START + 0x3A4
	adds r0, r5, r2
	strb r1, [r0]
	ldrb r1, [r4]
	adds r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0806A19A:
	ldr r1, [r7]
	ldr r0, _0806A1AC @ =sub_806A1D0
	str r0, [r1, #8]
	b _0806A1C6
	.align 2, 0
_0806A1A4: .4byte IWRAM_START + 0x3A6
_0806A1A8: .4byte IWRAM_START + 0x3A4
_0806A1AC: .4byte sub_806A1D0
_0806A1B0:
	ldr r0, _0806A1CC @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806A1C6
	movs r0, #0x6b
	bl m4aSongNumStart
	bl sub_806B7D0
_0806A1C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1CC: .4byte gRepeatedKeys

	thumb_func_start sub_806A1D0
sub_806A1D0: @ 0x0806A1D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806A20C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	movs r3, #5
	ldr r0, _0806A210 @ =IWRAM_START + 0x394
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _0806A214 @ =IWRAM_START + 0x3A6
	adds r0, r1, r4
	subs r4, #1
	adds r1, r1, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0806A218
	ldrb r0, [r2]
	lsls r0, r0, #0x11
	movs r1, #0x90
	lsls r1, r1, #0xf
	adds r0, r0, r1
	b _0806A222
	.align 2, 0
_0806A20C: .4byte gCurTask
_0806A210: .4byte IWRAM_START + 0x394
_0806A214: .4byte IWRAM_START + 0x3A6
_0806A218:
	ldrb r1, [r2]
	lsls r1, r1, #1
	movs r0, #0x5a
	subs r0, r0, r1
	lsls r0, r0, #0x10
_0806A222:
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	movs r2, #0xe5
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r0, #8
	bls _0806A240
	movs r5, #0x5a
	ldr r4, _0806A338 @ =0x000003A6
	adds r0, r7, r4
	ldrb r1, [r0]
	adds r2, #0x10
	adds r0, r7, r2
	strb r1, [r0]
_0806A240:
	movs r4, #0xe9
	lsls r4, r4, #2
	adds r1, r7, r4
	ldrb r0, [r1]
	cmp r0, #6
	bne _0806A254
	lsls r0, r3, #0x10
	ldr r2, _0806A33C @ =0xFFFF0000
	adds r0, r0, r2
	lsrs r3, r0, #0x10
_0806A254:
	movs r4, #0xe4
	lsls r4, r4, #2
	adds r2, r7, r4
	ldrb r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [r2]
	adds r1, r1, r0
	mov ip, r1
	movs r6, #0
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r6, r0
	bge _0806A312
	mov r8, r0
_0806A278:
	mov r2, ip
	adds r2, #0x10
	movs r3, #0
	lsls r4, r5, #0x10
	lsls r6, r6, #0x10
_0806A282:
	strh r5, [r2, #0x18]
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r2, #0x30
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806A282
	movs r2, #0x98
	lsls r2, r2, #1
	add r2, ip
	movs r3, #0
	asrs r0, r4, #0x10
	adds r1, r0, #6
_0806A2A2:
	strh r1, [r2, #0x18]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r2, #0x30
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806A2A2
	movs r2, #0xc8
	lsls r2, r2, #1
	add r2, ip
	movs r3, #0
	asrs r0, r4, #0x10
	adds r1, r0, #6
_0806A2C2:
	strh r1, [r2, #0x18]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r2, #0x30
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806A2C2
	movs r2, #0xf8
	lsls r2, r2, #1
	add r2, ip
	movs r3, #0
	asrs r0, r4, #0x10
	adds r1, r0, #6
_0806A2E2:
	strh r1, [r2, #0x18]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r2, #0x30
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806A2E2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r1, r6, r0
	movs r2, #0x90
	lsls r2, r2, #0xd
	adds r0, r4, r2
	lsrs r5, r0, #0x10
	movs r3, #0x94
	lsls r3, r3, #2
	add ip, r3
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r8
	blt _0806A278
_0806A312:
	bl sub_806A348
	movs r4, #0xe5
	lsls r4, r4, #2
	adds r1, r7, r4
	ldrb r0, [r1]
	cmp r0, #8
	bls _0806A32E
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0806A340 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806A344 @ =sub_806A0F4
	str r0, [r1, #8]
_0806A32E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A338: .4byte 0x000003A6
_0806A33C: .4byte 0xFFFF0000
_0806A340: .4byte gCurTask
_0806A344: .4byte sub_806A0F4

	thumb_func_start sub_806A348
sub_806A348: @ 0x0806A348
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0806A538 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	str r0, [sp]
	ldr r1, _0806A53C @ =IWRAM_START + 0x8C
	adds r0, r5, r1
	ldr r2, _0806A540 @ =IWRAM_START + 0xBC
	adds r4, r5, r2
	ldr r3, _0806A544 @ =IWRAM_START + 0x14C
	adds r6, r5, r3
	ldr r1, _0806A548 @ =IWRAM_START + 0x26C
	adds r7, r5, r1
	ldr r2, _0806A54C @ =IWRAM_START + 0x2CC
	adds r2, r2, r5
	mov r8, r2
	ldr r3, _0806A550 @ =IWRAM_START + 0x32C
	adds r3, r3, r5
	mov sb, r3
	ldr r1, _0806A554 @ =IWRAM_START + 0x390
	adds r1, r1, r5
	mov sl, r1
	movs r2, #5
	str r2, [sp, #4]
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_80051E8
	ldr r4, _0806A558 @ =IWRAM_START + 0xEC
	adds r3, r5, r4
	adds r0, r3, #0
	bl sub_8004558
	ldr r0, _0806A55C @ =IWRAM_START + 0x11C
	adds r3, r5, r0
	adds r0, r3, #0
	bl sub_8004558
	adds r3, r5, r4
	ldr r1, _0806A560 @ =IWRAM_START + 0x3A6
	adds r4, r5, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _0806A3B8
	adds r0, r3, #0
	bl sub_80051E8
_0806A3B8:
	ldr r2, _0806A55C @ =IWRAM_START + 0x11C
	adds r3, r5, r2
	ldrb r0, [r4]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	movs r4, #0x94
	lsls r4, r4, #4
	adds r1, r1, r4
	mov r4, sl
	ldr r2, [r4]
	adds r4, r2, r1
	cmp r0, #5
	bhi _0806A3E4
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _0806A3E4
	adds r0, r3, #0
	bl sub_80051E8
_0806A3E4:
	movs r5, #0
_0806A3E6:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806A3E6
	movs r5, #0
_0806A400:
	adds r0, r7, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r7, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806A400
	movs r5, #0
_0806A41A:
	mov r0, r8
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	movs r4, #0x30
	add r8, r4
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806A41A
	movs r5, #0
_0806A436:
	mov r0, sb
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	movs r2, #0x30
	add sb, r2
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806A436
	ldr r3, [sp]
	movs r4, #0xe9
	lsls r4, r4, #2
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, #6
	bne _0806A46A
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	ldr r3, _0806A564 @ =0xFFFF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
_0806A46A:
	ldr r4, [sp]
	movs r0, #0xe4
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	movs r5, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _0806A528
_0806A48E:
	ldrb r0, [r4, #0xc]
	lsls r5, r5, #0x10
	str r5, [sp, #0x10]
	cmp r0, #0
	beq _0806A512
	adds r6, r4, #0
	adds r6, #0x10
	movs r5, #0
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r2, r2, r4
	mov sl, r2
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r3, r4, r3
	str r3, [sp, #8]
	movs r0, #0x88
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [sp, #0xc]
_0806A4B6:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806A4B6
	movs r2, #0x98
	lsls r2, r2, #1
	adds r7, r4, r2
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r3, r3, r4
	mov r8, r3
	movs r0, #0xf8
	lsls r0, r0, #1
	adds r0, r0, r4
	mov sb, r0
	adds r0, r7, #0
	bl sub_80051E8
	mov r7, sl
	adds r0, r7, #0
	bl sub_80051E8
	mov r0, r8
	bl sub_80051E8
	ldr r1, [sp, #8]
	mov r8, r1
	mov r0, r8
	bl sub_80051E8
	mov r0, sb
	bl sub_80051E8
	ldr r2, [sp, #0xc]
	mov sb, r2
	mov r0, sb
	bl sub_80051E8
_0806A512:
	ldr r3, [sp, #0x10]
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	movs r2, #0x94
	lsls r2, r2, #2
	adds r4, r4, r2
	lsrs r5, r0, #0x10
	ldr r3, [sp, #0x14]
	cmp r0, r3
	blt _0806A48E
_0806A528:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A538: .4byte gCurTask
_0806A53C: .4byte IWRAM_START + 0x8C
_0806A540: .4byte IWRAM_START + 0xBC
_0806A544: .4byte IWRAM_START + 0x14C
_0806A548: .4byte IWRAM_START + 0x26C
_0806A54C: .4byte IWRAM_START + 0x2CC
_0806A550: .4byte IWRAM_START + 0x32C
_0806A554: .4byte IWRAM_START + 0x390
_0806A558: .4byte IWRAM_START + 0xEC
_0806A55C: .4byte IWRAM_START + 0x11C
_0806A560: .4byte IWRAM_START + 0x3A6
_0806A564: .4byte 0xFFFF0000

	thumb_func_start sub_806A568
sub_806A568: @ 0x0806A568
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	mov sb, r2
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x54]
	ldr r4, [sp, #0x58]
	ldr r5, [sp, #0x5c]
	ldr r6, [sp, #0x60]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov ip, sp
	cmp r7, #0
	beq _0806A5A6
	mov ip, r7
_0806A5A6:
	lsls r0, r1, #0x18
	adds r7, r0, #0
	cmp r7, #0
	beq _0806A5C8
	ldr r1, _0806A5C0 @ =gUnknown_03005B54
	ldr r0, [r1]
	cmp r0, #0
	bne _0806A5BC
	ldr r0, _0806A5C4 @ =gUnknown_03005B50
	ldr r0, [r0]
	str r0, [r1]
_0806A5BC:
	ldr r0, [r1]
	b _0806A5CC
	.align 2, 0
_0806A5C0: .4byte gUnknown_03005B54
_0806A5C4: .4byte gUnknown_03005B50
_0806A5C8:
	ldr r0, _0806A620 @ =gUnknown_03005B50
	ldr r0, [r0]
_0806A5CC:
	mov r1, ip
	str r0, [r1, #4]
	movs r1, #0
	mov r0, ip
	strh r1, [r0, #8]
	strh r3, [r0, #0xa]
	ldr r0, [sp, #0x4c]
	mov r3, ip
	str r0, [r3, #0x10]
	mov r0, r8
	strh r0, [r3, #0x16]
	strh r2, [r3, #0x18]
	lsls r0, r4, #6
	strh r0, [r3, #0x1a]
	strh r1, [r3, #0x1c]
	ldr r0, _0806A624 @ =0x0000FFFF
	strh r0, [r3, #0x1e]
	mov r0, ip
	adds r0, #0x20
	strb r5, [r0]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	mov r0, ip
	bl sub_8004558
	asrs r3, r7, #0x18
	cmp r3, #0
	beq _0806A628
	cmp r3, #1
	beq _0806A644
	b _0806A650
	.align 2, 0
_0806A620: .4byte gUnknown_03005B50
_0806A624: .4byte 0x0000FFFF
_0806A628:
	ldr r2, _0806A63C @ =gUnknown_03005B50
	mov r0, sb
	lsls r1, r0, #5
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0806A640 @ =gUnknown_03005B54
	str r3, [r0]
	b _0806A650
	.align 2, 0
_0806A63C: .4byte gUnknown_03005B50
_0806A640: .4byte gUnknown_03005B54
_0806A644:
	ldr r2, _0806A660 @ =gUnknown_03005B54
	mov r3, sb
	lsls r1, r3, #5
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_0806A650:
	add sp, #0x30
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A660: .4byte gUnknown_03005B54

	thumb_func_start sub_806A664
sub_806A664: @ 0x0806A664
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r1, _0806A6B4 @ =gUnknown_080D95D2
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r5, sp, #4
	ldr r1, _0806A6B8 @ =gUnknown_080D95D6
	adds r0, r5, #0
	movs r2, #0x10
	bl memcpy
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldr r1, _0806A6BC @ =gUnknown_080D95C4
	add r0, sp, #0x14
	movs r2, #4
	bl memcpy
	ldr r1, _0806A6C0 @ =gUnknown_080D95C8
	add r0, sp, #0x18
	movs r2, #0xa
	bl memcpy
	add r1, sp, #0x14
	cmp r4, #1
	bne _0806A6C4
	add r1, sp, #0x18
	cmp r4, #1
	bne _0806A6C4
	cmp r6, #2
	bne _0806A6C4
_0806A6AE:
	movs r0, #1
	b _0806A6E2
	.align 2, 0
_0806A6B4: .4byte gUnknown_080D95D2
_0806A6B8: .4byte gUnknown_080D95D6
_0806A6BC: .4byte gUnknown_080D95C4
_0806A6C0: .4byte gUnknown_080D95C8
_0806A6C4:
	ldrh r0, [r1]
	ldr r2, _0806A6F4 @ =0x0000FFFF
	cmp r0, r2
	beq _0806A6E0
_0806A6CC:
	cmp r6, r0
	blo _0806A6D8
	ldrh r0, [r1]
	adds r0, #4
	cmp r6, r0
	ble _0806A6AE
_0806A6D8:
	adds r1, #2
	ldrh r0, [r1]
	cmp r0, r2
	bne _0806A6CC
_0806A6E0:
	movs r0, #0
_0806A6E2:
	cmp r0, #0
	beq _0806A74C
	cmp r7, #1
	bne _0806A722
	cmp r6, #2
	bne _0806A6FC
	ldr r0, _0806A6F8 @ =0x0000010B
	b _0806A74E
	.align 2, 0
_0806A6F4: .4byte 0x0000FFFF
_0806A6F8: .4byte 0x0000010B
_0806A6FC:
	movs r1, #0
_0806A6FE:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r3, r2, #2
	adds r0, r5, r3
	ldrh r1, [r0]
	cmp r6, r1
	blo _0806A714
	ldrh r1, [r0]
	adds r0, r1, #4
	cmp r6, r0
	ble _0806A73A
_0806A714:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0806A6FE
	b _0806A74C
_0806A722:
	mov r0, sp
	ldrh r0, [r0]
	cmp r6, r0
	blo _0806A74C
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r1, #4
	cmp r6, r0
	bgt _0806A74C
	mov r0, sp
	ldrh r0, [r0, #2]
	b _0806A742
_0806A73A:
	mov r0, sp
	adds r0, #6
	adds r0, r0, r3
	ldrh r0, [r0]
_0806A742:
	adds r0, r6, r0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0806A74E
_0806A74C:
	adds r0, r6, #0
_0806A74E:
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806A758
sub_806A758: @ 0x0806A758
	bx lr
	.align 2, 0

	thumb_func_start sub_806A75C
sub_806A75C: @ 0x0806A75C
	push {r4, r5, lr}
	ldr r5, _0806A78C @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8063D20
	adds r0, r4, #0
	bl sub_806A794
	adds r0, r4, #0
	movs r1, #0
	bl sub_8063DCC
	ldr r1, [r5]
	ldr r0, _0806A790 @ =sub_806A7E0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A78C: .4byte gCurTask
_0806A790: .4byte sub_806A7E0

	thumb_func_start sub_806A794
sub_806A794: @ 0x0806A794
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	movs r1, #0xd9
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r6, #0x1e
	str r6, [sp]
	movs r5, #0x14
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0x85
	bl sub_806B854
	movs r1, #0xe9
	lsls r1, r1, #2
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0xe
	movs r3, #0x86
	bl sub_806B854
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806A7E0
sub_806A7E0: @ 0x0806A7E0
	push {r4, r5, lr}
	ldr r5, _0806A808 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806A80C @ =gUnknown_03000774
	adds r4, r4, r0
	bl sub_80649A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806A802
	ldr r1, [r5]
	ldr r0, _0806A810 @ =sub_80641B0
	str r0, [r1, #8]
_0806A802:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A808: .4byte gCurTask
_0806A80C: .4byte gUnknown_03000774
_0806A810: .4byte sub_80641B0

	thumb_func_start sub_806A814
sub_806A814: @ 0x0806A814
	push {r4, lr}
	ldr r0, _0806A83C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r1, _0806A840 @ =gUnknown_03000780
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	bhi _0806A886
	lsls r0, r0, #2
	ldr r1, _0806A844 @ =_0806A848
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A83C: .4byte gCurTask
_0806A840: .4byte gUnknown_03000780
_0806A844: .4byte _0806A848
_0806A848: @ jump table
	.4byte _0806A868 @ case 0
	.4byte _0806A870 @ case 1
	.4byte _0806A878 @ case 2
	.4byte _0806A886 @ case 3
	.4byte _0806A880 @ case 4
	.4byte _0806A886 @ case 5
	.4byte _0806A886 @ case 6
	.4byte _0806A886 @ case 7
_0806A868:
	adds r0, r4, #0
	bl sub_8064A40
	b _0806A886
_0806A870:
	adds r0, r4, #0
	bl sub_806ADF4
	b _0806A886
_0806A878:
	adds r0, r4, #0
	bl sub_806AEB0
	b _0806A886
_0806A880:
	adds r0, r4, #0
	bl sub_8065B04
_0806A886:
	ldr r0, _0806A89C @ =0x00000783
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0806A8A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806A8A4 @ =sub_80644C4
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A89C: .4byte 0x00000783
_0806A8A0: .4byte gCurTask
_0806A8A4: .4byte sub_80644C4

	thumb_func_start sub_806A8A8
sub_806A8A8: @ 0x0806A8A8
	push {r4, r5, r6, lr}
	ldr r6, _0806A8DC @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	ldr r0, _0806A8E0 @ =gUnknown_03000784
	adds r4, r5, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bgt _0806A8C0
	bl sub_80649A4
_0806A8C0:
	movs r1, #0
	ldrsb r1, [r4, r1]
	cmp r1, #0
	bne _0806A8D4
	ldr r2, _0806A8E4 @ =gUnknown_03000783
	adds r0, r5, r2
	strb r1, [r0]
	ldr r1, [r6]
	ldr r0, _0806A8E8 @ =sub_80645E0
	str r0, [r1, #8]
_0806A8D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8DC: .4byte gCurTask
_0806A8E0: .4byte gUnknown_03000784
_0806A8E4: .4byte gUnknown_03000783
_0806A8E8: .4byte sub_80645E0

	thumb_func_start sub_806A8EC
sub_806A8EC: @ 0x0806A8EC
	ldr r0, _0806A910 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldr r1, _0806A914 @ =gUnknown_03000774
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806A918 @ =sub_806A91C
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806A910: .4byte gCurTask
_0806A914: .4byte gUnknown_03000774
_0806A918: .4byte sub_806A91C

	thumb_func_start sub_806A91C
sub_806A91C: @ 0x0806A91C
	push {r4, r5, r6, r7, lr}
	ldr r7, _0806A958 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0806A95C @ =gUnknown_03000774
	adds r4, r5, r0
	bl sub_80649A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806A952
	adds r0, r6, #0
	bl sub_806B02C
	ldr r0, _0806A960 @ =gUnknown_03000784
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0806A964 @ =sub_80646FC
	str r0, [r1, #8]
_0806A952:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A958: .4byte gCurTask
_0806A95C: .4byte gUnknown_03000774
_0806A960: .4byte gUnknown_03000784
_0806A964: .4byte sub_80646FC

	thumb_func_start sub_806A968
sub_806A968: @ 0x0806A968
	push {r4, r5, lr}
	ldr r5, _0806A990 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806A994 @ =gUnknown_03000774
	adds r4, r4, r0
	bl sub_80649A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806A98A
	ldr r1, [r5]
	ldr r0, _0806A998 @ =sub_80641B0
	str r0, [r1, #8]
_0806A98A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A990: .4byte gCurTask
_0806A994: .4byte gUnknown_03000774
_0806A998: .4byte sub_80641B0

	thumb_func_start sub_806A99C
sub_806A99C: @ 0x0806A99C
	ldr r0, _0806A9C0 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldr r1, _0806A9C4 @ =gUnknown_03000774
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806A9C8 @ =sub_806A9CC
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806A9C0: .4byte gCurTask
_0806A9C4: .4byte gUnknown_03000774
_0806A9C8: .4byte sub_806A9CC

	thumb_func_start sub_806A9CC
sub_806A9CC: @ 0x0806A9CC
	push {r4, r5, r6, r7, lr}
	ldr r7, _0806AA08 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0806AA0C @ =gUnknown_03000774
	adds r4, r5, r0
	bl sub_80649A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806AA02
	adds r0, r6, #0
	bl sub_808A258
	ldr r0, _0806AA10 @ =gUnknown_03000784
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0806AA14 @ =sub_80647C8
	str r0, [r1, #8]
_0806AA02:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AA08: .4byte gCurTask
_0806AA0C: .4byte gUnknown_03000774
_0806AA10: .4byte gUnknown_03000784
_0806AA14: .4byte sub_80647C8

	thumb_func_start sub_806AA18
sub_806AA18: @ 0x0806AA18
	push {r4, r5, lr}
	ldr r5, _0806AA40 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806AA44 @ =gUnknown_03000774
	adds r4, r4, r0
	bl sub_80649A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806AA3A
	ldr r1, [r5]
	ldr r0, _0806AA48 @ =sub_80641B0
	str r0, [r1, #8]
_0806AA3A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AA40: .4byte gCurTask
_0806AA44: .4byte gUnknown_03000774
_0806AA48: .4byte sub_80641B0

	thumb_func_start sub_806AA4C
sub_806AA4C: @ 0x0806AA4C
	ldr r0, _0806AA70 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldr r1, _0806AA74 @ =gUnknown_03000774
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806AA78 @ =sub_806AA7C
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806AA70: .4byte gCurTask
_0806AA74: .4byte gUnknown_03000774
_0806AA78: .4byte sub_806AA7C

	thumb_func_start sub_806AA7C
sub_806AA7C: @ 0x0806AA7C
	push {r4, r5, r6, r7, lr}
	ldr r7, _0806AAB8 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0806AABC @ =gUnknown_03000774
	adds r4, r5, r0
	bl sub_80649A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806AAB2
	adds r0, r6, #0
	bl sub_8066CFC
	ldr r0, _0806AAC0 @ =gUnknown_03000784
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0806AAC4 @ =sub_806489C
	str r0, [r1, #8]
_0806AAB2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AAB8: .4byte gCurTask
_0806AABC: .4byte gUnknown_03000774
_0806AAC0: .4byte gUnknown_03000784
_0806AAC4: .4byte sub_806489C

	thumb_func_start sub_806AAC8
sub_806AAC8: @ 0x0806AAC8
	push {r4, r5, lr}
	ldr r5, _0806AAF0 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806AAF4 @ =gUnknown_03000774
	adds r4, r4, r0
	bl sub_80649A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806AAEA
	ldr r1, [r5]
	ldr r0, _0806AAF8 @ =sub_80641B0
	str r0, [r1, #8]
_0806AAEA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AAF0: .4byte gCurTask
_0806AAF4: .4byte gUnknown_03000774
_0806AAF8: .4byte sub_80641B0

	thumb_func_start sub_806AAFC
sub_806AAFC: @ 0x0806AAFC
	ldr r0, _0806AB20 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldr r1, _0806AB24 @ =IWRAM_START + 0x150
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806AB28 @ =sub_806AB2C
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806AB20: .4byte gCurTask
_0806AB24: .4byte IWRAM_START + 0x150
_0806AB28: .4byte sub_806AB2C

	thumb_func_start sub_806AB2C
sub_806AB2C: @ 0x0806AB2C
	push {r4, r5, r6, r7, lr}
	ldr r7, _0806AB78 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0806AB7C @ =IWRAM_START + 0x150
	adds r4, r5, r0
	bl sub_806AD98
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806AB70
	adds r0, r6, #0
	bl sub_80672BC
	ldr r0, _0806AB80 @ =IWRAM_START + 0x163
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0806AB84 @ =IWRAM_START + 0x15C
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _0806AB88 @ =0x00000784
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, _0806AB8C @ =sub_8064F1C
	str r0, [r1, #8]
_0806AB70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB78: .4byte gCurTask
_0806AB7C: .4byte IWRAM_START + 0x150
_0806AB80: .4byte IWRAM_START + 0x163
_0806AB84: .4byte IWRAM_START + 0x15C
_0806AB88: .4byte 0x00000784
_0806AB8C: .4byte sub_8064F1C

	thumb_func_start sub_806AB90
sub_806AB90: @ 0x0806AB90
	push {r4, r5, lr}
	ldr r5, _0806ABB8 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806ABBC @ =IWRAM_START + 0x150
	adds r4, r4, r0
	bl sub_806AD98
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806ABB2
	ldr r1, [r5]
	ldr r0, _0806ABC0 @ =sub_8064C44
	str r0, [r1, #8]
_0806ABB2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ABB8: .4byte gCurTask
_0806ABBC: .4byte IWRAM_START + 0x150
_0806ABC0: .4byte sub_8064C44

	thumb_func_start sub_806ABC4
sub_806ABC4: @ 0x0806ABC4
	ldr r0, _0806ABE8 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldr r1, _0806ABEC @ =IWRAM_START + 0x150
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806ABF0 @ =sub_8065004
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806ABE8: .4byte gCurTask
_0806ABEC: .4byte IWRAM_START + 0x150
_0806ABF0: .4byte sub_8065004

	thumb_func_start sub_806ABF4
sub_806ABF4: @ 0x0806ABF4
	push {r4, r5, lr}
	ldr r5, _0806AC1C @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806AC20 @ =IWRAM_START + 0x150
	adds r4, r4, r0
	bl sub_806AD98
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806AC16
	ldr r1, [r5]
	ldr r0, _0806AC24 @ =sub_8064C44
	str r0, [r1, #8]
_0806AC16:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AC1C: .4byte gCurTask
_0806AC20: .4byte IWRAM_START + 0x150
_0806AC24: .4byte sub_8064C44

	thumb_func_start sub_806AC28
sub_806AC28: @ 0x0806AC28
	ldr r0, _0806AC4C @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldr r1, _0806AC50 @ =IWRAM_START + 0x150
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806AC54 @ =sub_806AC58
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806AC4C: .4byte gCurTask
_0806AC50: .4byte IWRAM_START + 0x150
_0806AC54: .4byte sub_806AC58

	thumb_func_start sub_806AC58
sub_806AC58: @ 0x0806AC58
	push {r4, r5, r6, r7, lr}
	ldr r7, _0806ACA4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0806ACA8 @ =IWRAM_START + 0x150
	adds r4, r5, r0
	bl sub_806AD98
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806AC9C
	adds r0, r6, #0
	bl sub_8069978
	ldr r0, _0806ACAC @ =IWRAM_START + 0x163
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0806ACB0 @ =IWRAM_START + 0x15C
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _0806ACB4 @ =0x00000784
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, _0806ACB8 @ =sub_8065174
	str r0, [r1, #8]
_0806AC9C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ACA4: .4byte gCurTask
_0806ACA8: .4byte IWRAM_START + 0x150
_0806ACAC: .4byte IWRAM_START + 0x163
_0806ACB0: .4byte IWRAM_START + 0x15C
_0806ACB4: .4byte 0x00000784
_0806ACB8: .4byte sub_8065174

	thumb_func_start sub_806ACBC
sub_806ACBC: @ 0x0806ACBC
	push {r4, r5, lr}
	ldr r5, _0806ACE4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806ACE8 @ =IWRAM_START + 0x150
	adds r4, r4, r0
	bl sub_806AD98
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806ACDE
	ldr r1, [r5]
	ldr r0, _0806ACEC @ =sub_8064C44
	str r0, [r1, #8]
_0806ACDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ACE4: .4byte gCurTask
_0806ACE8: .4byte IWRAM_START + 0x150
_0806ACEC: .4byte sub_8064C44

	thumb_func_start sub_806ACF0
sub_806ACF0: @ 0x0806ACF0
	ldr r0, _0806AD14 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldr r1, _0806AD18 @ =gUnknown_03000774
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806AD1C @ =sub_806AD20
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806AD14: .4byte gCurTask
_0806AD18: .4byte gUnknown_03000774
_0806AD1C: .4byte sub_806AD20

	thumb_func_start sub_806AD20
sub_806AD20: @ 0x0806AD20
	push {r4, lr}
	ldr r0, _0806AD44 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r1, _0806AD48 @ =gUnknown_03000774
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806AD4C
	bl sub_80649A4
	b _0806AD78
	.align 2, 0
_0806AD44: .4byte gCurTask
_0806AD48: .4byte gUnknown_03000774
_0806AD4C:
	adds r0, r4, #0
	bl sub_8063C7C
	bl WriteSaveGame
	ldr r1, _0806AD80 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0806AD84 @ =gUnknown_03002AE4
	ldr r0, _0806AD88 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0806AD8C @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0806AD90 @ =gUnknown_03004D5C
	ldr r0, _0806AD94 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTitleScreenAtSinglePlayerMenu
_0806AD78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AD80: .4byte 0x0000FFFF
_0806AD84: .4byte gUnknown_03002AE4
_0806AD88: .4byte gUnknown_0300287C
_0806AD8C: .4byte gUnknown_03005390
_0806AD90: .4byte gUnknown_03004D5C
_0806AD94: .4byte gUnknown_03002A84

	thumb_func_start sub_806AD98
sub_806AD98: @ 0x0806AD98
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806ADF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x60
	adds r6, r0, r1
	adds r1, #0xc0
	adds r7, r0, r1
	movs r5, #0
_0806ADB0:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806ADB0
	movs r5, #0
_0806ADCA:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0806ADCA
	adds r0, r7, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ADF0: .4byte gCurTask

	thumb_func_start sub_806ADF4
sub_806ADF4: @ 0x0806ADF4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0806AE40 @ =sub_80653E4
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r1, #0xf8
	movs r3, #4
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	str r4, [r0]
	ldr r3, _0806AE44 @ =0x00000359
	adds r1, r4, r3
	ldrb r3, [r1]
	ldr r6, _0806AE48 @ =IWRAM_START + 0xF4
	adds r1, r2, r6
	strb r3, [r1]
	ldr r1, _0806AE4C @ =0x0000035B
	adds r4, r4, r1
	ldrb r3, [r4]
	ldr r4, _0806AE50 @ =IWRAM_START + 0xF6
	adds r1, r2, r4
	strb r3, [r1]
	adds r6, #1
	adds r2, r2, r6
	strb r5, [r2]
	bl sub_806525C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AE40: .4byte sub_80653E4
_0806AE44: .4byte 0x00000359
_0806AE48: .4byte IWRAM_START + 0xF4
_0806AE4C: .4byte 0x0000035B
_0806AE50: .4byte IWRAM_START + 0xF6

	thumb_func_start sub_806AE54
sub_806AE54: @ 0x0806AE54
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806AEA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0806AEAC @ =IWRAM_START+4
	adds r4, r0, r1
	adds r1, #0x60
	adds r6, r0, r1
	adds r1, #0x60
	adds r7, r0, r1
	movs r5, #0
_0806AE6A:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806AE6A
	movs r5, #0
_0806AE84:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806AE84
	adds r0, r7, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AEA8: .4byte gCurTask
_0806AEAC: .4byte IWRAM_START+4

	thumb_func_start sub_806AEB0
sub_806AEB0: @ 0x0806AEB0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0806AEFC @ =sub_8065838
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r1, #0xf8
	movs r3, #4
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	str r4, [r0]
	ldr r3, _0806AF00 @ =0x0000035A
	adds r1, r4, r3
	ldrb r3, [r1]
	ldr r6, _0806AF04 @ =IWRAM_START + 0xF4
	adds r1, r2, r6
	strb r3, [r1]
	ldr r1, _0806AF08 @ =0x0000035B
	adds r4, r4, r1
	ldrb r3, [r4]
	ldr r4, _0806AF0C @ =IWRAM_START + 0xF6
	adds r1, r2, r4
	strb r3, [r1]
	adds r6, #1
	adds r2, r2, r6
	strb r5, [r2]
	bl sub_80656B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AEFC: .4byte sub_8065838
_0806AF00: .4byte 0x0000035A
_0806AF04: .4byte IWRAM_START + 0xF4
_0806AF08: .4byte 0x0000035B
_0806AF0C: .4byte IWRAM_START + 0xF6

	thumb_func_start sub_806AF10
sub_806AF10: @ 0x0806AF10
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806AF64 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0806AF68 @ =IWRAM_START+4
	adds r4, r0, r1
	adds r1, #0x60
	adds r6, r0, r1
	adds r1, #0x60
	adds r7, r0, r1
	movs r5, #0
_0806AF26:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806AF26
	movs r5, #0
_0806AF40:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806AF40
	adds r0, r7, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF64: .4byte gCurTask
_0806AF68: .4byte IWRAM_START+4

	thumb_func_start sub_806AF6C
sub_806AF6C: @ 0x0806AF6C
	push {r4, lr}
	ldr r4, _0806AF9C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _0806AFA0 @ =IWRAM_START + 0x1B4
	adds r3, r1, r0
	adds r0, #0x60
	adds r2, r1, r0
	movs r0, #0x2a
	strh r0, [r2, #0x18]
	movs r0, #0x35
	strh r0, [r3, #0x18]
	ldr r2, _0806AFA4 @ =IWRAM_START + 0x1E4
	adds r3, r1, r2
	strh r0, [r3, #0x18]
	bl sub_8066818
	ldr r1, [r4]
	ldr r0, _0806AFA8 @ =sub_8066004
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF9C: .4byte gCurTask
_0806AFA0: .4byte IWRAM_START + 0x1B4
_0806AFA4: .4byte IWRAM_START + 0x1E4
_0806AFA8: .4byte sub_8066004

	thumb_func_start sub_806AFAC
sub_806AFAC: @ 0x0806AFAC
	push {r4, lr}
	ldr r4, _0806AFDC @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _0806AFE0 @ =IWRAM_START + 0x1B4
	adds r3, r1, r0
	adds r0, #0x60
	adds r2, r1, r0
	movs r0, #0x42
	strh r0, [r2, #0x18]
	movs r0, #0x4d
	strh r0, [r3, #0x18]
	ldr r2, _0806AFE4 @ =IWRAM_START + 0x1E4
	adds r3, r1, r2
	strh r0, [r3, #0x18]
	bl sub_8066818
	ldr r1, [r4]
	ldr r0, _0806AFE8 @ =sub_8066220
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AFDC: .4byte gCurTask
_0806AFE0: .4byte IWRAM_START + 0x1B4
_0806AFE4: .4byte IWRAM_START + 0x1E4
_0806AFE8: .4byte sub_8066220

	thumb_func_start sub_806AFEC
sub_806AFEC: @ 0x0806AFEC
	push {r4, lr}
	ldr r4, _0806B01C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _0806B020 @ =IWRAM_START + 0x1B4
	adds r3, r1, r0
	adds r0, #0x60
	adds r2, r1, r0
	movs r0, #0x5a
	strh r0, [r2, #0x18]
	movs r0, #0xb4
	strh r0, [r3, #0x18]
	ldr r2, _0806B024 @ =IWRAM_START + 0x1E4
	adds r3, r1, r2
	strh r0, [r3, #0x18]
	bl sub_8066818
	ldr r1, [r4]
	ldr r0, _0806B028 @ =sub_8066478
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B01C: .4byte gCurTask
_0806B020: .4byte IWRAM_START + 0x1B4
_0806B024: .4byte IWRAM_START + 0x1E4
_0806B028: .4byte sub_8066478

	thumb_func_start sub_806B02C
sub_806B02C: @ 0x0806B02C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0806B08C @ =sub_806B0D8
	movs r1, #0x81
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	movs r6, #0
	str r6, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r1, r4
	ldr r2, _0806B090 @ =IWRAM_START + 0x1FC
	adds r0, r1, r2
	str r5, [r0]
	ldr r3, _0806B094 @ =0x0000035B
	adds r5, r5, r3
	ldrb r2, [r5]
	ldr r3, _0806B098 @ =IWRAM_START + 0x200
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0806B09C @ =IWRAM_START + 0x201
	adds r1, r1, r0
	strb r6, [r1]
	ldr r1, _0806B0A0 @ =gUnknown_03005B50
	ldr r0, _0806B0A4 @ =0x06010000
	str r0, [r1]
	ldr r0, _0806B0A8 @ =gUnknown_03005B54
	str r6, [r0]
	adds r0, r4, #0
	bl sub_80668A8
	adds r0, r4, #0
	bl sub_806B0AC
	adds r0, r4, #0
	bl sub_8066930
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B08C: .4byte sub_806B0D8
_0806B090: .4byte IWRAM_START + 0x1FC
_0806B094: .4byte 0x0000035B
_0806B098: .4byte IWRAM_START + 0x200
_0806B09C: .4byte IWRAM_START + 0x201
_0806B0A0: .4byte gUnknown_03005B50
_0806B0A4: .4byte 0x06010000
_0806B0A8: .4byte gUnknown_03005B54

	thumb_func_start sub_806B0AC
sub_806B0AC: @ 0x0806B0AC
	push {lr}
	sub sp, #0x18
	movs r1, #0xd8
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [sp]
	movs r1, #0x14
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r2, #7
	movs r3, #0x86
	bl sub_806B854
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806B0D8
sub_806B0D8: @ 0x0806B0D8
	push {r4, r5, lr}
	ldr r5, _0806B104 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806B108 @ =IWRAM_START + 0x1F0
	adds r4, r4, r0
	bl sub_806B1F8
	bl sub_806B1B8
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806B0FE
	ldr r1, [r5]
	ldr r0, _0806B10C @ =sub_8066B0C
	str r0, [r1, #8]
_0806B0FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B104: .4byte gCurTask
_0806B108: .4byte IWRAM_START + 0x1F0
_0806B10C: .4byte sub_8066B0C

	thumb_func_start sub_806B110
sub_806B110: @ 0x0806B110
	push {r4, lr}
	ldr r4, _0806B140 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r1, _0806B144 @ =IWRAM_START + 0x1F0
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	bl sub_802D4CC
	ldr r1, [r4]
	ldr r0, _0806B148 @ =sub_806B14C
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B140: .4byte gCurTask
_0806B144: .4byte IWRAM_START + 0x1F0
_0806B148: .4byte sub_806B14C

	thumb_func_start sub_806B14C
sub_806B14C: @ 0x0806B14C
	push {r4, r5, lr}
	ldr r0, _0806B170 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	ldr r0, _0806B174 @ =IWRAM_START + 0x1F0
	adds r4, r5, r0
	bl sub_806B1B8
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806B178
	bl sub_806B1F8
	b _0806B1A6
	.align 2, 0
_0806B170: .4byte gCurTask
_0806B174: .4byte IWRAM_START + 0x1F0
_0806B178:
	ldr r1, _0806B18C @ =IWRAM_START + 0x201
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0806B190
	movs r0, #1
	bl sub_8063A00
	b _0806B19E
	.align 2, 0
_0806B18C: .4byte IWRAM_START + 0x201
_0806B190:
	ldr r1, _0806B1AC @ =IWRAM_START + 0x1FC
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _0806B1B0 @ =0x00000784
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_0806B19E:
	ldr r0, _0806B1B4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0806B1A6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B1AC: .4byte IWRAM_START + 0x1FC
_0806B1B0: .4byte 0x00000784
_0806B1B4: .4byte gCurTask

	thumb_func_start sub_806B1B8
sub_806B1B8: @ 0x0806B1B8
	push {r4, r5, r6, lr}
	bl Random
	lsls r0, r0, #0x10
	eors r4, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r4, r0
	eors r6, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl SeedRng
	bl Random
	lsls r0, r0, #0x10
	eors r4, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r4, r0
	eors r5, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl SeedRng
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_806B1F8
sub_806B1F8: @ 0x0806B1F8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806B250 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x60
	adds r6, r0, r1
	ldr r1, _0806B254 @ =IWRAM_START + 0x180
	adds r7, r0, r1
	movs r5, #0
_0806B210:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806B210
	movs r5, #0
_0806B22A:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806B22A
	adds r0, r7, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B250: .4byte gCurTask
_0806B254: .4byte IWRAM_START + 0x180

	thumb_func_start sub_806B258
sub_806B258: @ 0x0806B258
	push {lr}
	sub sp, #0x18
	adds r0, #0xf0
	movs r1, #0x1e
	str r1, [sp]
	movs r1, #0x14
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r2, #7
	movs r3, #0x86
	bl sub_806B854
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806B280
sub_806B280: @ 0x0806B280
	push {r4, r5, lr}
	ldr r5, _0806B2A8 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806B2AC @ =IWRAM_START + 0x130
	adds r4, r4, r0
	bl sub_806B2F8
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806B2A2
	ldr r1, [r5]
	ldr r0, _0806B2B0 @ =sub_8066FAC
	str r0, [r1, #8]
_0806B2A2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B2A8: .4byte gCurTask
_0806B2AC: .4byte IWRAM_START + 0x130
_0806B2B0: .4byte sub_8066FAC

	thumb_func_start sub_806B2B4
sub_806B2B4: @ 0x0806B2B4
	push {r4, r5, lr}
	ldr r5, _0806B2EC @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r0, _0806B2F0 @ =IWRAM_START + 0x130
	adds r4, r4, r0
	bl sub_806B2F8
	movs r1, #0
	strh r1, [r4]
	movs r0, #1
	strh r0, [r4, #2]
	strh r1, [r4, #4]
	adds r0, #0xff
	strh r0, [r4, #6]
	strh r1, [r4, #0xa]
	movs r0, #0xff
	strh r0, [r4, #8]
	adds r0, r4, #0
	bl sub_802D4CC
	ldr r1, [r5]
	ldr r0, _0806B2F4 @ =sub_806723C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B2EC: .4byte gCurTask
_0806B2F0: .4byte IWRAM_START + 0x130
_0806B2F4: .4byte sub_806723C

	thumb_func_start sub_806B2F8
sub_806B2F8: @ 0x0806B2F8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806B350 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x60
	adds r6, r0, r1
	adds r1, #0x60
	adds r7, r0, r1
	movs r5, #0
_0806B310:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806B310
	movs r5, #0
_0806B32A:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806B32A
	adds r0, r7, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B350: .4byte gCurTask

	thumb_func_start sub_806B354
sub_806B354: @ 0x0806B354
	push {r4, r5, r6, lr}
	ldr r6, _0806B384 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	ldr r0, _0806B388 @ =IWRAM_START + 0x140
	adds r4, r5, r0
	bl sub_8067F84
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806B37E
	ldr r0, _0806B38C @ =IWRAM_START + 0x3B8
	adds r1, r5, r0
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r6]
	ldr r0, _0806B390 @ =sub_80677EC
	str r0, [r1, #8]
_0806B37E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B384: .4byte gCurTask
_0806B388: .4byte IWRAM_START + 0x140
_0806B38C: .4byte IWRAM_START + 0x3B8
_0806B390: .4byte sub_80677EC

	thumb_func_start sub_806B394
sub_806B394: @ 0x0806B394
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806B3D8 @ =0x00000707
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r2, #0xe2
	lsls r2, r2, #3
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	ldr r2, _0806B3DC @ =gUnknown_03005B50
	ldr r0, _0806B3E0 @ =0x06010000
	str r0, [r2]
	ldr r0, _0806B3E4 @ =gUnknown_03005B54
	str r1, [r0]
	bl sub_80682AC
	adds r0, r4, #0
	bl sub_80682EC
	adds r0, r4, #0
	bl sub_806834C
	ldr r0, _0806B3E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806B3EC @ =sub_806B3F0
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B3D8: .4byte 0x00000707
_0806B3DC: .4byte gUnknown_03005B50
_0806B3E0: .4byte 0x06010000
_0806B3E4: .4byte gUnknown_03005B54
_0806B3E8: .4byte gCurTask
_0806B3EC: .4byte sub_806B3F0

	thumb_func_start sub_806B3F0
sub_806B3F0: @ 0x0806B3F0
	push {r4, r5, lr}
	ldr r5, _0806B41C @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	bl sub_806B4F8
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806B414
	ldr r1, [r5]
	ldr r0, _0806B420 @ =sub_8068474
	str r0, [r1, #8]
_0806B414:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B41C: .4byte gCurTask
_0806B420: .4byte sub_8068474

	thumb_func_start sub_806B424
sub_806B424: @ 0x0806B424
	ldr r0, _0806B44C @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806B450 @ =sub_806B454
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806B44C: .4byte gCurTask
_0806B450: .4byte sub_806B454

	thumb_func_start sub_806B454
sub_806B454: @ 0x0806B454
	push {r4, r5, lr}
	ldr r5, _0806B478 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r2, _0806B47C @ =IWRAM_START + 0x1FC
	adds r1, r1, r2
	ldr r4, [r1]
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806B480
	bl sub_806B4F8
	b _0806B48E
	.align 2, 0
_0806B478: .4byte gCurTask
_0806B47C: .4byte IWRAM_START + 0x1FC
_0806B480:
	ldr r0, _0806B494 @ =0x00000163
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r5]
	bl TaskDestroy
_0806B48E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B494: .4byte 0x00000163

	thumb_func_start sub_806B498
sub_806B498: @ 0x0806B498
	ldr r0, _0806B4C0 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806B4C4 @ =sub_806B4C8
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806B4C0: .4byte gCurTask
_0806B4C4: .4byte sub_806B4C8

	thumb_func_start sub_806B4C8
sub_806B4C8: @ 0x0806B4C8
	push {r4, lr}
	ldr r0, _0806B4E8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806B4EC
	bl sub_806B4F8
	b _0806B4F2
	.align 2, 0
_0806B4E8: .4byte gCurTask
_0806B4EC:
	adds r0, r4, #0
	bl sub_806B558
_0806B4F2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_806B4F8
sub_806B4F8: @ 0x0806B4F8
	push {r4, r5, r6, lr}
	ldr r0, _0806B550 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0806B554 @ =IWRAM_START + 0x10C
	adds r0, r1, r2
	adds r2, #0x30
	adds r5, r1, r2
	subs r2, #0xf0
	adds r4, r1, r2
	bl sub_80051E8
	movs r6, #0
_0806B512:
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #0x30
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806B512
	movs r6, #0
_0806B52C:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	lsls r0, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r5, #0x30
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806B52C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B550: .4byte gCurTask
_0806B554: .4byte IWRAM_START + 0x10C

	thumb_func_start sub_806B558
sub_806B558: @ 0x0806B558
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806B58C @ =0x00000711
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	ldr r1, _0806B590 @ =gUnknown_03005B50
	ldr r0, _0806B594 @ =0x06010000
	str r0, [r1]
	ldr r0, _0806B598 @ =gUnknown_03005B54
	str r2, [r0]
	bl sub_8068640
	adds r0, r4, #0
	bl sub_8068700
	adds r0, r4, #0
	bl sub_80687BC
	ldr r0, _0806B59C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806B5A0 @ =sub_806B5A4
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B58C: .4byte 0x00000711
_0806B590: .4byte gUnknown_03005B50
_0806B594: .4byte 0x06010000
_0806B598: .4byte gUnknown_03005B54
_0806B59C: .4byte gCurTask
_0806B5A0: .4byte sub_806B5A4

	thumb_func_start sub_806B5A4
sub_806B5A4: @ 0x0806B5A4
	push {r4, lr}
	ldr r4, _0806B5C4 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_8068A94
	ldr r1, [r4]
	ldr r0, _0806B5C8 @ =sub_806B5CC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B5C4: .4byte gCurTask
_0806B5C8: .4byte sub_806B5CC

	thumb_func_start sub_806B5CC
sub_806B5CC: @ 0x0806B5CC
	push {r4, r5, r6, lr}
	ldr r6, _0806B600 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #0
	bl sub_806979C
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806B5FA
	ldr r0, _0806B604 @ =gUnknown_03000707
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r6]
	ldr r0, _0806B608 @ =sub_8069208
	str r0, [r1, #8]
_0806B5FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B600: .4byte gCurTask
_0806B604: .4byte gUnknown_03000707
_0806B608: .4byte sub_8069208

	thumb_func_start sub_806B60C
sub_806B60C: @ 0x0806B60C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _0806B668 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r1, _0806B66C @ =IWRAM_START + 0xDC
	adds r0, r4, r1
	ldr r2, _0806B670 @ =gUnknown_03000706
	adds r1, r4, r2
	ldrb r1, [r1]
	lsls r1, r1, #3
	ldr r2, _0806B674 @ =gUnknown_080D9F40
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r6, #0
	strh r2, [r0, #0xa]
	ldrh r2, [r1, #2]
	ldr r3, _0806B678 @ =IWRAM_START + 0xFC
	adds r1, r4, r3
	strb r2, [r1]
	bl sub_8004558
	adds r0, r5, #0
	bl sub_8068D94
	movs r0, #0
	bl sub_806979C
	ldr r0, _0806B67C @ =gUnknown_03000707
	adds r4, r4, r0
	strb r6, [r4]
	mov r2, r8
	ldr r1, [r2]
	ldr r0, _0806B680 @ =sub_8069110
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B668: .4byte gCurTask
_0806B66C: .4byte IWRAM_START + 0xDC
_0806B670: .4byte gUnknown_03000706
_0806B674: .4byte gUnknown_080D9F40
_0806B678: .4byte IWRAM_START + 0xFC
_0806B67C: .4byte gUnknown_03000707
_0806B680: .4byte sub_8069110

	thumb_func_start sub_806B684
sub_806B684: @ 0x0806B684
	ldr r0, _0806B6AC @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806B6B0 @ =sub_806B6B4
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806B6AC: .4byte gCurTask
_0806B6B0: .4byte sub_806B6B4

	thumb_func_start sub_806B6B4
sub_806B6B4: @ 0x0806B6B4
	push {r4, r5, lr}
	ldr r0, _0806B6D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806B6DC
	movs r0, #0
	bl sub_806979C
	b _0806B724
	.align 2, 0
_0806B6D8: .4byte gCurTask
_0806B6DC:
	ldr r2, _0806B6FC @ =gSelectedZone
	ldr r1, _0806B700 @ =gUnknown_03000705
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r1, r0, #2
	ldr r3, _0806B704 @ =gUnknown_03000710
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806B708
	subs r3, #0xa
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	b _0806B70A
	.align 2, 0
_0806B6FC: .4byte gSelectedZone
_0806B700: .4byte gUnknown_03000705
_0806B704: .4byte gUnknown_03000710
_0806B708:
	adds r0, r1, #2
_0806B70A:
	strb r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r0, [r0]
	bl EwramFree
	ldr r0, _0806B72C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_801A770
_0806B724:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B72C: .4byte gCurTask

	thumb_func_start sub_806B730
sub_806B730: @ 0x0806B730
	ldr r0, _0806B758 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806B75C @ =sub_8069688
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806B758: .4byte gCurTask
_0806B75C: .4byte sub_8069688

	thumb_func_start sub_806B760
sub_806B760: @ 0x0806B760
	push {r4, r5, lr}
	ldr r5, _0806B790 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _0806B794 @ =IWRAM_START + 0x394
	adds r4, r0, r1
	ldrb r0, [r4]
	bl sub_8069EC4
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bls _0806B78A
	movs r0, #0
	strb r0, [r4]
	ldr r1, [r5]
	ldr r0, _0806B798 @ =sub_806B79C
	str r0, [r1, #8]
_0806B78A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B790: .4byte gCurTask
_0806B794: .4byte IWRAM_START + 0x394
_0806B798: .4byte sub_806B79C

	thumb_func_start sub_806B79C
sub_806B79C: @ 0x0806B79C
	push {r4, r5, lr}
	ldr r5, _0806B7C8 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	bl sub_806A348
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806B7C0
	ldr r1, [r5]
	ldr r0, _0806B7CC @ =sub_806A0F4
	str r0, [r1, #8]
_0806B7C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B7C8: .4byte gCurTask
_0806B7CC: .4byte sub_806A0F4

	thumb_func_start sub_806B7D0
sub_806B7D0: @ 0x0806B7D0
	ldr r0, _0806B7F8 @ =gCurTask
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	adds r1, #0xff
	strh r1, [r0, #6]
	strh r2, [r0, #0xa]
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r0, _0806B7FC @ =sub_806B800
	str r0, [r3, #8]
	bx lr
	.align 2, 0
_0806B7F8: .4byte gCurTask
_0806B7FC: .4byte sub_806B800

	thumb_func_start sub_806B800
sub_806B800: @ 0x0806B800
	push {r4, r5, r6, lr}
	ldr r6, _0806B824 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r2, _0806B828 @ =IWRAM_START + 0x38C
	adds r1, r4, r2
	ldr r5, [r1]
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806B82C
	bl sub_806A348
	b _0806B844
	.align 2, 0
_0806B824: .4byte gCurTask
_0806B828: .4byte IWRAM_START + 0x38C
_0806B82C:
	ldr r1, _0806B84C @ =IWRAM_START + 0x390
	adds r0, r4, r1
	ldr r0, [r0]
	bl EwramFree
	ldr r2, _0806B850 @ =0x00000163
	adds r1, r5, r2
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r6]
	bl TaskDestroy
_0806B844:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B84C: .4byte IWRAM_START + 0x390
_0806B850: .4byte 0x00000163

	thumb_func_start sub_806B854
sub_806B854: @ 0x0806B854
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r6, [sp, #0x20]
	ldr r0, [sp, #0x24]
	mov r8, r0
	ldr r0, [sp, #0x28]
	mov sb, r0
	ldr r5, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov sl, r0
	ldr r0, [sp, #0x34]
	mov ip, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0xe
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	str r1, [r7, #4]
	movs r1, #0
	movs r0, #0
	strh r0, [r7, #0xa]
	lsls r2, r2, #0xb
	adds r2, r2, r4
	str r2, [r7, #0xc]
	strh r0, [r7, #0x18]
	strh r0, [r7, #0x1a]
	strh r3, [r7, #0x1c]
	strh r0, [r7, #0x1e]
	strh r0, [r7, #0x20]
	strh r0, [r7, #0x22]
	strh r0, [r7, #0x24]
	strh r6, [r7, #0x26]
	mov r2, r8
	strh r2, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	mov r2, sb
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r5, [r7, #0x2e]
	mov r0, sl
	strh r0, [r7, #0x30]
	mov r2, ip
	strh r2, [r7, #0x32]
	adds r0, r7, #0
	bl sub_8002A3C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806B8D4
sub_806B8D4: @ 0x0806B8D4
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	movs r4, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r3, r1
	bge _0806B8FE
_0806B8E4:
	ldrh r0, [r2, #4]
	cmp r0, r3
	ble _0806B8EC
	adds r3, r0, #0
_0806B8EC:
	lsls r0, r4, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r0, r4
	adds r2, #8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	blt _0806B8E4
_0806B8FE:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806B908
sub_806B908: @ 0x0806B908
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _0806B928 @ =0x0000010B
	cmp r4, r0
	bls _0806B938
	ldr r0, _0806B92C @ =0xFFFF0000
	ands r0, r3
	ldr r1, _0806B930 @ =0x000003BB
	orrs r0, r1
	ldr r1, _0806B934 @ =0x0000FFFF
	ands r0, r1
	movs r1, #0x88
	lsls r1, r1, #0xd
	b _0806B968
	.align 2, 0
_0806B928: .4byte 0x0000010B
_0806B92C: .4byte 0xFFFF0000
_0806B930: .4byte 0x000003BB
_0806B934: .4byte 0x0000FFFF
_0806B938:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0806B954
	ldr r0, _0806B94C @ =0xFFFF0000
	ands r0, r3
	ldr r1, _0806B950 @ =0x000003C3
	b _0806B95A
	.align 2, 0
_0806B94C: .4byte 0xFFFF0000
_0806B950: .4byte 0x000003C3
_0806B954:
	ldr r0, _0806B97C @ =0xFFFF0000
	ands r0, r3
	ldr r1, _0806B980 @ =0x000003BB
_0806B95A:
	adds r3, r0, #0
	orrs r3, r1
	movs r1, #0xff
	ands r1, r4
	lsls r1, r1, #0x10
	ldr r0, _0806B984 @ =0x0000FFFF
	ands r0, r3
_0806B968:
	adds r3, r0, #0
	orrs r3, r1
	movs r2, #4
	str r2, [r5]
	str r3, [r5, #4]
	adds r0, r5, #0
	pop {r4, r5}
	pop {r2}
	bx r2
	.align 2, 0
_0806B97C: .4byte 0xFFFF0000
_0806B980: .4byte 0x000003BB
_0806B984: .4byte 0x0000FFFF

	thumb_func_start sub_806B988
sub_806B988: @ 0x0806B988
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	ldr r6, _0806B9B0 @ =0x0000FFFF
_0806B990:
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #1
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r6
	beq _0806B9C0
	ldrh r0, [r1]
	bl sub_806B9C8
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0806B9B4
	movs r0, #1
	b _0806B9C2
	.align 2, 0
_0806B9B0: .4byte 0x0000FFFF
_0806B9B4:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806B990
_0806B9C0:
	movs r0, #0
_0806B9C2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_806B9C8
sub_806B9C8: @ 0x0806B9C8
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _0806B9FC @ =gUnknown_080D95A4
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	mov r1, sp
	ldrh r0, [r1]
	ldr r2, _0806BA00 @ =0x0000FFFF
	cmp r0, r2
	beq _0806B9F0
_0806B9E4:
	cmp r4, r0
	beq _0806BA08
	adds r1, #2
	ldrh r0, [r1]
	cmp r0, r2
	bne _0806B9E4
_0806B9F0:
	ldr r0, _0806BA04 @ =0x0000010B
	cmp r4, r0
	bhi _0806BA08
	movs r0, #1
	b _0806BA0A
	.align 2, 0
_0806B9FC: .4byte gUnknown_080D95A4
_0806BA00: .4byte 0x0000FFFF
_0806BA04: .4byte 0x0000010B
_0806BA08:
	movs r0, #0
_0806BA0A:
	add sp, #0x20
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806BA14
sub_806BA14: @ 0x0806BA14
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r1, _0806BA50 @ =gUnknown_080D95C4
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r6, sp, #4
	ldr r1, _0806BA54 @ =gUnknown_080D95C8
	adds r0, r6, #0
	movs r2, #0xa
	bl memcpy
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sp
	cmp r4, #1
	bne _0806BA44
	adds r1, r6, #0
_0806BA44:
	cmp r4, #1
	bne _0806BA58
	cmp r5, #2
	bne _0806BA58
_0806BA4C:
	movs r0, #1
	b _0806BA76
	.align 2, 0
_0806BA50: .4byte gUnknown_080D95C4
_0806BA54: .4byte gUnknown_080D95C8
_0806BA58:
	ldrh r0, [r1]
	ldr r2, _0806BA80 @ =0x0000FFFF
	cmp r0, r2
	beq _0806BA74
_0806BA60:
	cmp r5, r0
	blo _0806BA6C
	ldrh r0, [r1]
	adds r0, #4
	cmp r5, r0
	ble _0806BA4C
_0806BA6C:
	adds r1, #2
	ldrh r0, [r1]
	cmp r0, r2
	bne _0806BA60
_0806BA74:
	movs r0, #0
_0806BA76:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806BA80: .4byte 0x0000FFFF

	thumb_func_start sub_806BA84
sub_806BA84: @ 0x0806BA84
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	bl m4aMPlayAllStop
	lsls r2, r5, #0x10
	asrs r1, r2, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806BAA4
	asrs r0, r2, #0x12
	b _0806BAAC
_0806BAA4:
	ldr r0, _0806BACC @ =gSelectedZone
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
_0806BAAC:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r0, #0
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806BAD4
	ldr r0, _0806BAD0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0806BAD6
	.align 2, 0
_0806BACC: .4byte gSelectedZone
_0806BAD0: .4byte gSelectedCharacter
_0806BAD4:
	lsrs r4, r2, #0x10
_0806BAD6:
	bl sub_806CEA8
	ldr r0, _0806BB30 @ =sub_806C970
	movs r1, #0xbb
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r3, _0806BB34 @ =sub_806C950
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r1, _0806BB38 @ =gUnknown_03000594
	adds r0, r2, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	str r1, [r0]
	ldr r3, _0806BB3C @ =gUnknown_03000598
	adds r0, r2, r3
	str r1, [r0]
	ldr r0, _0806BB40 @ =gUnknown_0300059C
	adds r1, r2, r0
	movs r0, #0
	str r0, [r1]
	adds r3, #8
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _0806BB48
	ldr r1, _0806BB44 @ =gUnknown_030005B6
	adds r0, r2, r1
	strb r4, [r0]
	adds r3, #0x17
	adds r1, r2, r3
	movs r0, #0
	b _0806BB56
	.align 2, 0
_0806BB30: .4byte sub_806C970
_0806BB34: .4byte sub_806C950
_0806BB38: .4byte gUnknown_03000594
_0806BB3C: .4byte gUnknown_03000598
_0806BB40: .4byte gUnknown_0300059C
_0806BB44: .4byte gUnknown_030005B6
_0806BB48:
	ldr r0, _0806BC78 @ =gUnknown_030005B6
	adds r1, r2, r0
	movs r0, #2
	strb r0, [r1]
	ldr r3, _0806BC7C @ =gUnknown_030005B7
	adds r1, r2, r3
	movs r0, #1
_0806BB56:
	strb r0, [r1]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r0, r7, r1
	movs r2, #0
	strb r6, [r0]
	ldr r3, _0806BC80 @ =0x000005B9
	adds r0, r7, r3
	strb r5, [r0]
	subs r1, #0x16
	adds r0, r7, r1
	movs r4, #0
	strh r2, [r0]
	adds r3, #2
	adds r1, r7, r3
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806BC84 @ =0x000005BC
	adds r1, r7, r0
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0806BC88 @ =0x000005BD
	adds r0, r7, r1
	strb r4, [r0]
	adds r3, #3
	adds r0, r7, r3
	strb r4, [r0]
	subs r1, #0x19
	adds r0, r7, r1
	strh r2, [r0]
	ldr r1, _0806BC8C @ =gUnknown_080DFA02
	lsls r0, r6, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r3, #0x18
	adds r6, r7, r3
	strh r0, [r6]
	ldr r1, _0806BC90 @ =0x000005B4
	adds r0, r7, r1
	strh r2, [r0]
	ldr r2, _0806BC94 @ =0x000005BA
	adds r0, r7, r2
	strb r4, [r0]
	adds r3, #0x19
	adds r0, r7, r3
	strb r4, [r0]
	adds r1, #0xc
	adds r0, r7, r1
	strb r4, [r0]
	adds r2, #7
	adds r0, r7, r2
	strb r4, [r0]
	movs r3, #0
	ldrsh r0, [r6, r3]
	movs r1, #0x64
	bl Div
	ldr r1, _0806BC98 @ =0x000005C2
	adds r5, r7, r1
	strb r0, [r5]
	movs r2, #0
	ldrsh r0, [r6, r2]
	movs r1, #0xa
	bl Div
	movs r2, #0
	ldrsb r2, [r5, r2]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #1
	subs r0, r0, r1
	ldr r3, _0806BC9C @ =0x000005C3
	adds r1, r7, r3
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #0xa
	bl DivRem
	ldr r2, _0806BCA0 @ =0x000005C4
	adds r1, r7, r2
	strb r0, [r1]
	ldr r3, _0806BCA4 @ =0x000005C5
	adds r0, r7, r3
	strb r4, [r0]
	ldr r1, _0806BCA8 @ =0x000005C6
	adds r0, r7, r1
	strb r4, [r0]
	adds r2, #3
	adds r0, r7, r2
	strb r4, [r0]
	adds r3, #3
	adds r0, r7, r3
	strb r4, [r0]
	ldr r0, _0806BCAC @ =0x000005CA
	adds r1, r7, r0
	movs r0, #0x78
	strh r0, [r1]
	adds r2, #5
	adds r1, r7, r2
	movs r0, #0x8c
	strh r0, [r1]
	adds r3, #6
	adds r1, r7, r3
	movs r0, #0x40
	strh r0, [r1]
	movs r0, #0xba
	lsls r0, r0, #3
	adds r1, r7, r0
	movs r0, #0x28
	strb r0, [r1]
	adds r2, #5
	adds r1, r7, r2
	movs r0, #0x3c
	strb r0, [r1]
	movs r1, #0x31
	adds r3, #4
	adds r0, r7, r3
	strb r1, [r0]
	movs r1, #1
	movs r2, #0x31
_0806BC4A:
	lsls r0, r1, #0x11
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _0806BC4A
	ldr r2, _0806BCB0 @ =0x000005D2
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _0806BCB4 @ =0x000005D1
	adds r0, r7, r3
	ldrb r1, [r0]
	movs r0, #0x9f
	subs r0, r0, r1
	asrs r0, r0, #1
	adds r1, r1, r0
	adds r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BC78: .4byte gUnknown_030005B6
_0806BC7C: .4byte gUnknown_030005B7
_0806BC80: .4byte 0x000005B9
_0806BC84: .4byte 0x000005BC
_0806BC88: .4byte 0x000005BD
_0806BC8C: .4byte gUnknown_080DFA02
_0806BC90: .4byte 0x000005B4
_0806BC94: .4byte 0x000005BA
_0806BC98: .4byte 0x000005C2
_0806BC9C: .4byte 0x000005C3
_0806BCA0: .4byte 0x000005C4
_0806BCA4: .4byte 0x000005C5
_0806BCA8: .4byte 0x000005C6
_0806BCAC: .4byte 0x000005CA
_0806BCB0: .4byte 0x000005D2
_0806BCB4: .4byte 0x000005D1

	thumb_func_start sub_806BCB8
sub_806BCB8: @ 0x0806BCB8
	ldr r1, _0806BD04 @ =gDispCnt
	ldr r2, _0806BD08 @ =0x00001641
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0806BD0C @ =gBgCntRegs
	movs r3, #0
	movs r2, #0
	ldr r0, _0806BD10 @ =0x00000703
	strh r0, [r1, #2]
	ldr r0, _0806BD14 @ =0x0000D086
	strh r0, [r1, #4]
	ldr r1, _0806BD18 @ =gBldRegs
	movs r0, #0xaf
	strh r0, [r1]
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r0, _0806BD1C @ =gBgScrollRegs
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r2, _0806BD20 @ =gUnknown_03004D80
	strb r3, [r2, #1]
	ldr r0, _0806BD24 @ =gUnknown_03002280
	strb r3, [r0, #4]
	strb r3, [r0, #5]
	movs r1, #0xff
	strb r1, [r0, #6]
	movs r1, #0x20
	strb r1, [r0, #7]
	strb r3, [r2, #2]
	strb r3, [r0, #8]
	strb r3, [r0, #9]
	subs r1, #0x21
	strb r1, [r0, #0xa]
	movs r1, #0x80
	strb r1, [r0, #0xb]
	bx lr
	.align 2, 0
_0806BD04: .4byte gDispCnt
_0806BD08: .4byte 0x00001641
_0806BD0C: .4byte gBgCntRegs
_0806BD10: .4byte 0x00000703
_0806BD14: .4byte 0x0000D086
_0806BD18: .4byte gBldRegs
_0806BD1C: .4byte gBgScrollRegs
_0806BD20: .4byte gUnknown_03004D80
_0806BD24: .4byte gUnknown_03002280

	thumb_func_start sub_806BD28
sub_806BD28: @ 0x0806BD28
	push {r4, r5, r6, lr}
	ldr r6, _0806BD7C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	ldr r0, _0806BD80 @ =IWRAM_START + 0x88
	adds r5, r4, r0
	ldr r1, _0806BD84 @ =IWRAM_START + 0x18
	adds r0, r4, r1
	bl sub_80051E8
	ldr r2, _0806BD88 @ =gBldRegs
	movs r3, #0
	movs r0, #0xaf
	strh r0, [r2]
	ldr r0, _0806BD8C @ =gUnknown_030005A2
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x8b
	ble _0806BD76
	movs r1, #0xbf
	strh r1, [r2]
	movs r0, #0x10
	strh r0, [r2, #4]
	strh r3, [r5]
	movs r0, #2
	strh r0, [r5, #2]
	strh r3, [r5, #4]
	adds r0, #0xfe
	strh r0, [r5, #6]
	strh r3, [r5, #0xa]
	strh r1, [r5, #8]
	strh r3, [r4]
	ldr r1, [r6]
	ldr r0, _0806BD90 @ =sub_806BD94
	str r0, [r1, #8]
_0806BD76:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806BD7C: .4byte gCurTask
_0806BD80: .4byte IWRAM_START + 0x88
_0806BD84: .4byte IWRAM_START + 0x18
_0806BD88: .4byte gBldRegs
_0806BD8C: .4byte gUnknown_030005A2
_0806BD90: .4byte sub_806BD94

	thumb_func_start sub_806BD94
sub_806BD94: @ 0x0806BD94
	push {r4, r5, lr}
	ldr r0, _0806BDC0 @ =gCurTask
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0806BDC4 @ =gUnknown_030005B4
	adds r1, r5, r0
	movs r0, #2
	strh r0, [r1]
	ldr r3, _0806BDC8 @ =gUnknown_030005A2
	adds r0, r5, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #1
	beq _0806BE04
	cmp r0, #1
	bgt _0806BDCC
	cmp r0, #0
	beq _0806BDD6
	b _0806BE2C
	.align 2, 0
_0806BDC0: .4byte gCurTask
_0806BDC4: .4byte gUnknown_030005B4
_0806BDC8: .4byte gUnknown_030005A2
_0806BDCC:
	cmp r0, #2
	beq _0806BE0E
	cmp r0, #3
	beq _0806BE20
	b _0806BE2C
_0806BDD6:
	adds r0, r4, #0
	bl sub_806F910
	str r0, [r4]
	adds r0, r4, #0
	bl sub_806CF78
	str r0, [r4, #0xc]
	ldr r0, _0806BDFC @ =gUnknown_030005D4
	adds r1, r5, r0
	ldr r0, _0806BE00 @ =gUnknown_03005B5C
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8071438
	str r0, [r4, #0x14]
	b _0806BE2C
	.align 2, 0
_0806BDFC: .4byte gUnknown_030005D4
_0806BE00: .4byte gUnknown_03005B5C
_0806BE04:
	adds r0, r4, #0
	bl sub_806E684
	str r0, [r4, #8]
	b _0806BE2C
_0806BE0E:
	adds r0, r4, #0
	bl sub_806E6E8
	str r0, [r4, #4]
	adds r0, r4, #0
	bl sub_8070B90
	str r0, [r4, #0x10]
	b _0806BE2C
_0806BE20:
	strh r0, [r1]
	ldr r0, _0806BE28 @ =sub_806C9CC
	str r0, [r2, #8]
	b _0806BE36
	.align 2, 0
_0806BE28: .4byte sub_806C9CC
_0806BE2C:
	ldr r3, _0806BE3C @ =0x000005A2
	adds r1, r4, r3
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0806BE36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BE3C: .4byte 0x000005A2

	thumb_func_start sub_806BE40
sub_806BE40: @ 0x0806BE40
	push {r4, r5, lr}
	ldr r5, _0806BE88 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	bl sub_806C864
	ldr r1, _0806BE8C @ =gUnknown_030005BA
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806BE64
	bl sub_806C7B8
	ldr r2, _0806BE90 @ =gUnknown_030005A2
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0806BE64:
	ldr r0, _0806BE90 @ =gUnknown_030005A2
	adds r1, r4, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x3b
	ble _0806BE82
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0806BE94 @ =gUnknown_030005B4
	adds r1, r4, r0
	movs r0, #5
	strh r0, [r1]
	ldr r1, [r5]
	ldr r0, _0806BE98 @ =sub_806BE9C
	str r0, [r1, #8]
_0806BE82:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BE88: .4byte gCurTask
_0806BE8C: .4byte gUnknown_030005BA
_0806BE90: .4byte gUnknown_030005A2
_0806BE94: .4byte gUnknown_030005B4
_0806BE98: .4byte sub_806BE9C

	thumb_func_start sub_806BE9C
sub_806BE9C: @ 0x0806BE9C
	push {r4, r5, r6, lr}
	ldr r3, _0806BF08 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	ldr r0, [r5, #0xc]
	ldrh r4, [r0, #6]
	adds r6, r4, r1
	ldr r0, _0806BF0C @ =gUnknown_030005B4
	adds r2, r2, r0
	ldrh r0, [r2]
	cmp r0, #6
	bne _0806BED2
	ldr r0, _0806BF10 @ =IWRAM_START + 0xB4
	adds r1, r4, r0
	ldrh r0, [r1]
	subs r0, #0xe
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0806BECE
	movs r0, #0xb
	strh r0, [r1]
_0806BECE:
	movs r0, #7
	strh r0, [r2]
_0806BED2:
	ldr r1, _0806BF14 @ =0x000005B4
	adds r0, r5, r1
	ldrh r0, [r0]
	subs r0, #6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0xb4
	cmp r0, #1
	bhi _0806BEF6
	ldrh r0, [r1]
	subs r0, #0xb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _0806BEF6
	movs r0, #0xb
	strh r0, [r1]
_0806BEF6:
	ldrh r0, [r1]
	cmp r0, #0xe
	beq _0806BF38
	cmp r0, #0xe
	bgt _0806BF18
	cmp r0, #0xd
	beq _0806BF1C
	b _0806BF34
	.align 2, 0
_0806BF08: .4byte gCurTask
_0806BF0C: .4byte gUnknown_030005B4
_0806BF10: .4byte IWRAM_START + 0xB4
_0806BF14: .4byte 0x000005B4
_0806BF18:
	cmp r0, #0xf
	bne _0806BF34
_0806BF1C:
	ldr r0, _0806BF2C @ =0x000005B4
	adds r1, r5, r0
	movs r0, #8
	strh r0, [r1]
	ldr r1, [r3]
	ldr r0, _0806BF30 @ =sub_806BFD0
	str r0, [r1, #8]
	b _0806BFC2
	.align 2, 0
_0806BF2C: .4byte 0x000005B4
_0806BF30: .4byte sub_806BFD0
_0806BF34:
	bl sub_806C864
_0806BF38:
	ldr r1, _0806BF8C @ =0x000005BA
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806BFC2
	bl sub_806C7B8
	ldr r0, _0806BF90 @ =0x000005C7
	adds r2, r5, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0806BFA0
	movs r0, #0xb9
	lsls r0, r0, #3
	adds r1, r5, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806BFC2
	strb r0, [r2]
	ldr r1, _0806BF94 @ =0x000005BB
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806BF98
	adds r1, #1
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bgt _0806BF98
	movs r0, #0x34
	bl m4aSongNumStart
	b _0806BFC2
	.align 2, 0
_0806BF8C: .4byte 0x000005BA
_0806BF90: .4byte 0x000005C7
_0806BF94: .4byte 0x000005BB
_0806BF98:
	movs r0, #0x33
	bl m4aSongNumStart
	b _0806BFC2
_0806BFA0:
	ldr r1, _0806BFC8 @ =0x000005BB
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806BFC2
	adds r1, #1
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _0806BFCC @ =0x00FFFFFF
	ands r0, r1
	cmp r0, #3
	bne _0806BFC2
	movs r0, #0x34
	bl m4aSongNumStart
_0806BFC2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806BFC8: .4byte 0x000005BB
_0806BFCC: .4byte 0x00FFFFFF

	thumb_func_start sub_806BFD0
sub_806BFD0: @ 0x0806BFD0
	push {r4, r5, lr}
	ldr r5, _0806C030 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r4, r0, r3
	ldr r1, _0806C034 @ =IWRAM_START + 0x88
	adds r0, r0, r1
	ldr r1, [r4, #0x14]
	ldrh r2, [r1, #6]
	adds r2, r2, r3
	ldr r1, [r4, #0xc]
	ldrh r4, [r1, #6]
	movs r3, #0
	strh r3, [r2, #0x3c]
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r3, [r0, #4]
	movs r1, #0x40
	strh r1, [r0, #6]
	strh r3, [r0, #0xa]
	movs r1, #0xbf
	strh r1, [r0, #8]
	bl sub_802D4CC
	ldr r1, _0806C038 @ =gDispCnt
	ldr r2, _0806C03C @ =0x00009641
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0806C040 @ =gWinRegs
	ldr r0, _0806C044 @ =0x0000103F
	strh r0, [r1, #0xa]
	ldr r0, _0806C048 @ =IWRAM_START + 0xB4
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0xd
	bne _0806C024
	movs r0, #0x36
	bl m4aSongNumStart
_0806C024:
	ldr r1, [r5]
	ldr r0, _0806C04C @ =sub_806C050
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C030: .4byte gCurTask
_0806C034: .4byte IWRAM_START + 0x88
_0806C038: .4byte gDispCnt
_0806C03C: .4byte 0x00009641
_0806C040: .4byte gWinRegs
_0806C044: .4byte 0x0000103F
_0806C048: .4byte IWRAM_START + 0xB4
_0806C04C: .4byte sub_806C050

	thumb_func_start sub_806C050
sub_806C050: @ 0x0806C050
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r6, _0806C084 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _0806C088 @ =IWRAM_START + 0x88
	adds r0, r5, r1
	ldr r1, [r4, #0xc]
	ldrh r7, [r1, #6]
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806C09C
	ldr r1, _0806C08C @ =gDispCnt
	ldr r2, _0806C090 @ =0x00009641
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0806C094 @ =gWinRegs
	ldr r0, _0806C098 @ =0x0000103F
	strh r0, [r1, #0xa]
	b _0806C14A
	.align 2, 0
_0806C084: .4byte gCurTask
_0806C088: .4byte IWRAM_START + 0x88
_0806C08C: .4byte gDispCnt
_0806C090: .4byte 0x00009641
_0806C094: .4byte gWinRegs
_0806C098: .4byte 0x0000103F
_0806C09C:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0806C0AA
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #0x14]
_0806C0AA:
	ldr r0, [r4]
	cmp r0, #0
	beq _0806C0B8
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
_0806C0B8:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0806C0C6
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #4]
_0806C0C6:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0806C0D4
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #8]
_0806C0D4:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0806C0E2
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #0x10]
_0806C0E2:
	ldr r1, _0806C12C @ =IWRAM_START + 0x48
	adds r0, r5, r1
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0x8b
	bl sub_806CEC4
	ldr r0, _0806C130 @ =gBgScrollRegs
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r1, _0806C134 @ =gDispCnt
	movs r2, #0x92
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0806C138 @ =IWRAM_START + 0xB4
	adds r1, r7, r0
	ldrh r0, [r1]
	cmp r0, #0xd
	bne _0806C144
	ldr r2, _0806C13C @ =gUnknown_030005A2
	adds r0, r5, r2
	strh r4, [r0]
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, [r6]
	ldr r0, _0806C140 @ =sub_806CA18
	b _0806C148
	.align 2, 0
_0806C12C: .4byte IWRAM_START + 0x48
_0806C130: .4byte gBgScrollRegs
_0806C134: .4byte gDispCnt
_0806C138: .4byte IWRAM_START + 0xB4
_0806C13C: .4byte gUnknown_030005A2
_0806C140: .4byte sub_806CA18
_0806C144:
	ldr r1, [r6]
	ldr r0, _0806C154 @ =sub_806C158
_0806C148:
	str r0, [r1, #8]
_0806C14A:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C154: .4byte sub_806C158

	thumb_func_start sub_806C158
sub_806C158: @ 0x0806C158
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806C1E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r0, [r6, #0xc]
	ldrh r7, [r0, #6]
	ldr r0, _0806C1E8 @ =gBldRegs
	movs r1, #0
	mov r8, r1
	movs r5, #0
	strh r5, [r0, #4]
	strh r5, [r0]
	strh r5, [r0, #2]
	adds r0, r6, #0
	bl sub_8070BF0
	str r0, [r6, #0x10]
	ldr r3, _0806C1EC @ =gUnknown_030005A8
	adds r2, r4, r3
	ldr r1, _0806C1F0 @ =gUnknown_030005A4
	adds r0, r4, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x64
	muls r0, r1, r0
	str r0, [r2]
	ldr r1, _0806C1F4 @ =0x0001863C
	cmp r0, r1
	ble _0806C19E
	str r1, [r2]
_0806C19E:
	ldr r0, _0806C1F8 @ =gUnknown_030005AC
	adds r2, r4, r0
	ldr r1, _0806C1FC @ =gUnknown_030005C5
	adds r3, r4, r1
	movs r0, #0
	ldrsb r0, [r3, r0]
	movs r1, #0
	cmp r0, #0
	beq _0806C1B2
	ldr r1, _0806C200 @ =0x00002710
_0806C1B2:
	str r1, [r2]
	ldr r1, _0806C204 @ =gUnknown_030005B0
	adds r0, r4, r1
	str r5, [r0]
	ldr r1, _0806C208 @ =IWRAM_START + 0xB4
	adds r0, r7, r1
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _0806C230
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0806C214
	movs r0, #0x38
	bl m4aSongNumStart
	ldr r3, _0806C20C @ =gUnknown_030005C7
	adds r1, r4, r3
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806C210 @ =gUnknown_030005C8
	adds r1, r4, r0
	movs r0, #0x96
	strb r0, [r1]
	b _0806C236
	.align 2, 0
_0806C1E4: .4byte gCurTask
_0806C1E8: .4byte gBldRegs
_0806C1EC: .4byte gUnknown_030005A8
_0806C1F0: .4byte gUnknown_030005A4
_0806C1F4: .4byte 0x0001863C
_0806C1F8: .4byte gUnknown_030005AC
_0806C1FC: .4byte gUnknown_030005C5
_0806C200: .4byte 0x00002710
_0806C204: .4byte gUnknown_030005B0
_0806C208: .4byte IWRAM_START + 0xB4
_0806C20C: .4byte gUnknown_030005C7
_0806C210: .4byte gUnknown_030005C8
_0806C214:
	movs r0, #0x37
	bl m4aSongNumStart
	ldr r1, _0806C22C @ =gUnknown_030005C7
	adds r0, r4, r1
	mov r3, r8
	strb r3, [r0]
	adds r1, #1
	adds r0, r4, r1
	strb r3, [r0]
	b _0806C236
	.align 2, 0
_0806C22C: .4byte gUnknown_030005C7
_0806C230:
	movs r0, #0x39
	bl m4aSongNumStart
_0806C236:
	ldr r3, _0806C250 @ =0x000005A2
	adds r1, r6, r3
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0806C254 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C258 @ =sub_806CA54
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C250: .4byte 0x000005A2
_0806C254: .4byte gCurTask
_0806C258: .4byte sub_806CA54

	thumb_func_start sub_806C25C
sub_806C25C: @ 0x0806C25C
	push {r4, r5, r6, lr}
	ldr r0, _0806C2A4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0806C2A8 @ =gUnknown_030005C7
	adds r6, r1, r0
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #1
	bne _0806C290
	ldr r0, _0806C2AC @ =gUnknown_030005C8
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0806C290
	movs r0, #0x37
	bl m4aSongNumStart
	strb r4, [r6]
_0806C290:
	ldr r0, _0806C2B0 @ =gPressedKeys
	ldrh r0, [r0]
	movs r4, #1
	ands r4, r0
	cmp r4, #0
	beq _0806C2B8
	ldr r0, _0806C2A4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C2B4 @ =sub_806C42C
	b _0806C320
	.align 2, 0
_0806C2A4: .4byte gCurTask
_0806C2A8: .4byte gUnknown_030005C7
_0806C2AC: .4byte gUnknown_030005C8
_0806C2B0: .4byte gPressedKeys
_0806C2B4: .4byte sub_806C42C
_0806C2B8:
	movs r1, #0xb5
	lsls r1, r1, #3
	adds r2, r5, r1
	ldr r3, [r2]
	cmp r3, #0x63
	bgt _0806C2D4
	movs r0, #0xb6
	lsls r0, r0, #3
	adds r1, r5, r0
	ldr r0, [r1]
	adds r0, r0, r3
	str r0, [r1]
	str r4, [r2]
	b _0806C2E6
_0806C2D4:
	movs r1, #0xb6
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	adds r1, #0x64
	str r1, [r0]
	ldr r0, [r2]
	subs r0, #0x64
	str r0, [r2]
_0806C2E6:
	movs r0, #0xb6
	lsls r0, r0, #3
	adds r1, r5, r0
	ldr r0, [r1]
	ldr r2, _0806C328 @ =0x0001863C
	cmp r0, r2
	ble _0806C2F6
	str r2, [r1]
_0806C2F6:
	ldr r1, _0806C32C @ =0x000005A2
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _0806C30E
	movs r0, #0x8c
	bl m4aSongNumStart
_0806C30E:
	movs r1, #0xb5
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r2, [r0]
	cmp r2, #0
	bne _0806C322
	ldr r0, _0806C330 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C334 @ =sub_806C338
_0806C320:
	str r0, [r1, #8]
_0806C322:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C328: .4byte 0x0001863C
_0806C32C: .4byte 0x000005A2
_0806C330: .4byte gCurTask
_0806C334: .4byte sub_806C338

	thumb_func_start sub_806C338
sub_806C338: @ 0x0806C338
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806C380 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _0806C384 @ =gUnknown_030005C7
	adds r5, r1, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0806C36C
	ldr r0, _0806C388 @ =gUnknown_030005C8
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0806C36C
	movs r0, #0x37
	bl m4aSongNumStart
	strb r4, [r5]
_0806C36C:
	ldr r0, _0806C38C @ =gPressedKeys
	ldrh r0, [r0]
	movs r4, #1
	ands r4, r0
	cmp r4, #0
	beq _0806C394
	ldr r0, _0806C380 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C390 @ =sub_806C42C
	b _0806C40E
	.align 2, 0
_0806C380: .4byte gCurTask
_0806C384: .4byte gUnknown_030005C7
_0806C388: .4byte gUnknown_030005C8
_0806C38C: .4byte gPressedKeys
_0806C390: .4byte sub_806C42C
_0806C394:
	ldr r1, _0806C3B0 @ =0x000005AC
	adds r2, r7, r1
	ldr r3, [r2]
	cmp r3, #0x63
	bgt _0806C3B4
	movs r0, #0xb6
	lsls r0, r0, #3
	adds r1, r7, r0
	ldr r0, [r1]
	adds r0, r0, r3
	str r0, [r1]
	str r4, [r2]
	b _0806C3C6
	.align 2, 0
_0806C3B0: .4byte 0x000005AC
_0806C3B4:
	movs r1, #0xb6
	lsls r1, r1, #3
	adds r0, r7, r1
	ldr r1, [r0]
	adds r1, #0x64
	str r1, [r0]
	ldr r0, [r2]
	subs r0, #0x64
	str r0, [r2]
_0806C3C6:
	movs r0, #0xb6
	lsls r0, r0, #3
	adds r5, r7, r0
	ldr r0, [r5]
	ldr r1, _0806C418 @ =0x0001863C
	cmp r0, r1
	ble _0806C3D6
	str r1, [r5]
_0806C3D6:
	ldr r1, _0806C41C @ =0x000005A2
	adds r6, r7, r1
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0806C3EE
	movs r0, #0x8c
	bl m4aSongNumStart
_0806C3EE:
	ldr r0, _0806C420 @ =0x000005AC
	adds r7, r7, r0
	ldr r4, [r7]
	cmp r4, #0
	bne _0806C410
	ldr r0, [r5]
	cmp r0, #0
	beq _0806C404
	movs r0, #0x8d
	bl m4aSongNumStart
_0806C404:
	str r4, [r7]
	strh r4, [r6]
	ldr r0, _0806C424 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C428 @ =sub_806C49C
_0806C40E:
	str r0, [r1, #8]
_0806C410:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C418: .4byte 0x0001863C
_0806C41C: .4byte 0x000005A2
_0806C420: .4byte 0x000005AC
_0806C424: .4byte gCurTask
_0806C428: .4byte sub_806C49C

	thumb_func_start sub_806C42C
sub_806C42C: @ 0x0806C42C
	push {r4, r5, r6, lr}
	ldr r6, _0806C480 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	ldr r0, _0806C484 @ =gUnknown_030005B0
	adds r3, r4, r0
	ldr r1, _0806C488 @ =gUnknown_030005A8
	adds r2, r4, r1
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	movs r5, #0
	str r5, [r2]
	ldr r0, _0806C48C @ =gUnknown_030005AC
	adds r2, r4, r0
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	str r5, [r2]
	ldr r0, [r3]
	ldr r1, _0806C490 @ =0x0001863C
	cmp r0, r1
	ble _0806C460
	str r1, [r3]
_0806C460:
	ldr r0, [r3]
	cmp r0, #0
	beq _0806C46C
	movs r0, #0x8d
	bl m4aSongNumStart
_0806C46C:
	ldr r1, _0806C494 @ =gUnknown_030005A2
	adds r0, r4, r1
	strh r5, [r0]
	ldr r1, [r6]
	ldr r0, _0806C498 @ =sub_806C49C
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C480: .4byte gCurTask
_0806C484: .4byte gUnknown_030005B0
_0806C488: .4byte gUnknown_030005A8
_0806C48C: .4byte gUnknown_030005AC
_0806C490: .4byte 0x0001863C
_0806C494: .4byte gUnknown_030005A2
_0806C498: .4byte sub_806C49C

	thumb_func_start sub_806C49C
sub_806C49C: @ 0x0806C49C
	push {r4, r5, r6, lr}
	ldr r0, _0806C528 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r2, r0
	adds r0, #0x88
	adds r4, r2, r0
	ldr r0, _0806C52C @ =gUnknown_030005A2
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0806C530 @ =gUnknown_030005C7
	adds r5, r2, r1
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0806C4DE
	ldr r0, _0806C534 @ =gUnknown_030005C8
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806C4DE
	movs r0, #0x37
	bl m4aSongNumStart
	movs r0, #0
	strb r0, [r5]
_0806C4DE:
	ldr r0, _0806C538 @ =gPressedKeys
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0806C4F8
	ldr r1, _0806C53C @ =0x000005A2
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x3c
	ble _0806C550
_0806C4F8:
	movs r1, #0
	strh r1, [r4]
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	movs r0, #0x40
	strh r0, [r4, #6]
	strh r1, [r4, #0xa]
	movs r0, #0xbf
	strh r0, [r4, #8]
	ldr r2, _0806C53C @ =0x000005A2
	adds r0, r6, r2
	strh r1, [r0]
	ldr r1, _0806C540 @ =0x000005C5
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806C548
	ldr r0, _0806C528 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C544 @ =sub_806C560
	b _0806C54E
	.align 2, 0
_0806C528: .4byte gCurTask
_0806C52C: .4byte gUnknown_030005A2
_0806C530: .4byte gUnknown_030005C7
_0806C534: .4byte gUnknown_030005C8
_0806C538: .4byte gPressedKeys
_0806C53C: .4byte 0x000005A2
_0806C540: .4byte 0x000005C5
_0806C544: .4byte sub_806C560
_0806C548:
	ldr r0, _0806C558 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C55C @ =sub_806C6A4
_0806C54E:
	str r0, [r1, #8]
_0806C550:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C558: .4byte gCurTask
_0806C55C: .4byte sub_806C6A4

	thumb_func_start sub_806C560
sub_806C560: @ 0x0806C560
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806C5E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r2, _0806C5E4 @ =gUnknown_030005B6
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _0806C5E8 @ =gLoadedSaveGame
	ldr r0, [r0]
	adds r0, #0xc
	add r0, r8
	ldrb r5, [r0]
	ldr r0, _0806C5EC @ =gUnknown_030005C7
	adds r7, r1, r0
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #1
	bne _0806C5AA
	adds r2, #0x12
	adds r1, r1, r2
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0806C5AA
	movs r0, #0x37
	bl m4aSongNumStart
	strb r4, [r7]
_0806C5AA:
	movs r0, #0xb7
	lsls r0, r0, #3
	adds r4, r6, r0
	ldrb r1, [r4]
	asrs r5, r1
	movs r7, #1
	ands r5, r7
	cmp r5, #0
	bne _0806C5F4
	adds r0, r6, #0
	bl sub_8070C30
	ldr r0, _0806C5E8 @ =gLoadedSaveGame
	ldr r1, [r0]
	adds r1, #0xc
	add r1, r8
	adds r0, r7, #0
	ldrb r4, [r4]
	lsls r0, r4
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _0806C5F0 @ =0x000005A2
	adds r1, r6, r2
	movs r0, #0x78
	b _0806C5FA
	.align 2, 0
_0806C5E0: .4byte gCurTask
_0806C5E4: .4byte gUnknown_030005B6
_0806C5E8: .4byte gLoadedSaveGame
_0806C5EC: .4byte gUnknown_030005C7
_0806C5F0: .4byte 0x000005A2
_0806C5F4:
	ldr r0, _0806C628 @ =0x000005A2
	adds r1, r6, r0
	movs r0, #0xc
_0806C5FA:
	strh r0, [r1]
	ldr r0, _0806C62C @ =gLoadedSaveGame
	ldr r0, [r0]
	adds r0, #0xc
	mov r1, r8
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x7f
	bne _0806C614
	movs r0, #0xff
	strb r0, [r2]
_0806C614:
	ldr r0, _0806C630 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C634 @ =sub_806C638
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C628: .4byte 0x000005A2
_0806C62C: .4byte gLoadedSaveGame
_0806C630: .4byte gCurTask
_0806C634: .4byte sub_806C638

	thumb_func_start sub_806C638
sub_806C638: @ 0x0806C638
	push {r4, r5, r6, lr}
	ldr r0, _0806C690 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0806C694 @ =gUnknown_030005C7
	adds r5, r1, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0806C66C
	ldr r0, _0806C698 @ =gUnknown_030005C8
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0806C66C
	movs r0, #0x37
	bl m4aSongNumStart
	strb r4, [r5]
_0806C66C:
	ldr r0, _0806C69C @ =0x000005A2
	adds r1, r6, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0806C688
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0806C690 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806C6A0 @ =sub_806C6A4
	str r0, [r1, #8]
_0806C688:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C690: .4byte gCurTask
_0806C694: .4byte gUnknown_030005C7
_0806C698: .4byte gUnknown_030005C8
_0806C69C: .4byte 0x000005A2
_0806C6A0: .4byte sub_806C6A4

	thumb_func_start sub_806C6A4
sub_806C6A4: @ 0x0806C6A4
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806C778 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r1, _0806C77C @ =IWRAM_START + 0x88
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806C770
	ldr r2, _0806C780 @ =gUnknown_030005A2
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, #1
	movs r5, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _0806C770
	ldr r3, _0806C784 @ =gUnknown_030005B0
	adds r0, r4, r3
	ldr r4, [r0]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _0806C6E6
	bl TaskDestroy
	str r5, [r7, #0xc]
_0806C6E6:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _0806C6F2
	bl TaskDestroy
	str r5, [r7, #0x10]
_0806C6F2:
	ldr r1, _0806C788 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r0, r5, r4
	str r0, [r1]
	ldr r4, _0806C78C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0806C732
	ldr r0, _0806C790 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806C732
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _0806C794 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0806C730
	movs r0, #0xff
_0806C730:
	strb r0, [r1]
_0806C732:
	ldr r0, _0806C798 @ =gLoadedSaveGame
	ldr r1, [r0]
	movs r3, #0xdd
	lsls r3, r3, #2
	adds r1, r1, r3
	ldr r2, _0806C79C @ =0x000005A4
	adds r0, r7, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r1, _0806C7A0 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0806C7A4 @ =gUnknown_03002AE4
	ldr r0, _0806C7A8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0806C7AC @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0806C7B0 @ =gUnknown_03004D5C
	ldr r0, _0806C7B4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl WriteSaveGame
	bl sub_801A770
_0806C770:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C778: .4byte gCurTask
_0806C77C: .4byte IWRAM_START + 0x88
_0806C780: .4byte gUnknown_030005A2
_0806C784: .4byte gUnknown_030005B0
_0806C788: .4byte gUnknown_03005450
_0806C78C: .4byte 0x0000C350
_0806C790: .4byte gGameMode
_0806C794: .4byte gUnknown_03005448
_0806C798: .4byte gLoadedSaveGame
_0806C79C: .4byte 0x000005A4
_0806C7A0: .4byte 0x0000FFFF
_0806C7A4: .4byte gUnknown_03002AE4
_0806C7A8: .4byte gUnknown_0300287C
_0806C7AC: .4byte gUnknown_03005390
_0806C7B0: .4byte gUnknown_03004D5C
_0806C7B4: .4byte gUnknown_03002A84

	thumb_func_start sub_806C7B8
sub_806C7B8: @ 0x0806C7B8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806C7DC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _0806C7E0 @ =gUnknown_030005BE
	adds r6, r1, r0
	ldrb r2, [r6]
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _0806C7E4
	subs r0, r2, #1
	strb r0, [r6]
	b _0806C85A
	.align 2, 0
_0806C7DC: .4byte gCurTask
_0806C7E0: .4byte gUnknown_030005BE
_0806C7E4:
	ldr r0, _0806C7F8 @ =gUnknown_030005BD
	adds r4, r1, r0
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _0806C7FC
	subs r0, r2, #1
	b _0806C850
	.align 2, 0
_0806C7F8: .4byte gUnknown_030005BD
_0806C7FC:
	ldr r0, _0806C814 @ =gUnknown_030005BC
	adds r3, r1, r0
	ldrb r2, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	ble _0806C818
	subs r0, r2, #1
	strb r0, [r3]
	movs r0, #9
	b _0806C850
	.align 2, 0
_0806C814: .4byte gUnknown_030005BC
_0806C818:
	ldr r0, _0806C840 @ =gUnknown_030005BB
	adds r2, r1, r0
	ldrb r5, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bgt _0806C848
	movs r0, #0
	strb r0, [r2]
	strb r0, [r3]
	strb r0, [r4]
	strb r0, [r6]
	ldr r0, _0806C844 @ =gUnknown_030005B4
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #7
	beq _0806C85A
	movs r0, #6
	strh r0, [r1]
	b _0806C85A
	.align 2, 0
_0806C840: .4byte gUnknown_030005BB
_0806C844: .4byte gUnknown_030005B4
_0806C848:
	subs r0, r5, #1
	strb r0, [r2]
	movs r0, #9
	strb r0, [r3]
_0806C850:
	strb r0, [r4]
	ldr r0, _0806C860 @ =0x000005BE
	adds r1, r7, r0
	movs r0, #0x3b
	strb r0, [r1]
_0806C85A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C860: .4byte 0x000005BE

	thumb_func_start sub_806C864
sub_806C864: @ 0x0806C864
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806C8B4 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r0, _0806C8B8 @ =gUnknown_030005BA
	adds r6, r2, r0
	ldrb r3, [r6]
	ldr r5, _0806C8BC @ =gPressedKeys
	cmp r3, #1
	bne _0806C920
	ldrh r1, [r5]
	movs r4, #0xc0
	ands r4, r1
	cmp r4, #0
	beq _0806C8C0
	adds r0, #0xc
	adds r2, r2, r0
	ldrb r4, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806C89A
	movs r0, #0
	strb r0, [r2]
_0806C89A:
	ldrh r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806C8A6
	strb r3, [r2]
_0806C8A6:
	ldrb r2, [r2]
	cmp r4, r2
	beq _0806C942
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0806C942
	.align 2, 0
_0806C8B4: .4byte gCurTask
_0806C8B8: .4byte gUnknown_030005BA
_0806C8BC: .4byte gPressedKeys
_0806C8C0:
	ands r3, r1
	cmp r3, #0
	beq _0806C920
	ldr r1, _0806C8DC @ =gUnknown_030005C6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806C8E4
	strb r4, [r6]
	ldrh r1, [r5]
	ldr r0, _0806C8E0 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r5]
	b _0806C942
	.align 2, 0
_0806C8DC: .4byte gUnknown_030005C6
_0806C8E0: .4byte 0x0000FFFE
_0806C8E4:
	ldr r1, _0806C908 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0806C90C @ =gUnknown_03002AE4
	ldr r0, _0806C910 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0806C914 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0806C918 @ =gUnknown_03004D5C
	ldr r0, _0806C91C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTitleScreenAndSkipIntro
	b _0806C942
	.align 2, 0
_0806C908: .4byte 0x0000FFFF
_0806C90C: .4byte gUnknown_03002AE4
_0806C910: .4byte gUnknown_0300287C
_0806C914: .4byte gUnknown_03005390
_0806C918: .4byte gUnknown_03004D5C
_0806C91C: .4byte gUnknown_03002A84
_0806C920:
	ldrh r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806C942
	movs r3, #0
	ldr r0, _0806C948 @ =0x000005BA
	adds r2, r7, r0
	ldrb r0, [r2]
	cmp r0, #0
	bne _0806C938
	movs r3, #1
_0806C938:
	movs r1, #0
	strb r3, [r2]
	ldr r2, _0806C94C @ =0x000005C6
	adds r0, r7, r2
	strb r1, [r0]
_0806C942:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C948: .4byte 0x000005BA
_0806C94C: .4byte 0x000005C6

	thumb_func_start sub_806C950
sub_806C950: @ 0x0806C950
	ldr r0, _0806C964 @ =gUnknown_03004D54
	ldr r1, _0806C968 @ =gUnknown_03001B60
	str r1, [r0]
	ldr r0, _0806C96C @ =gUnknown_030022C0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r1, r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0806C964: .4byte gUnknown_03004D54
_0806C968: .4byte gUnknown_03001B60
_0806C96C: .4byte gUnknown_030022C0

	thumb_func_start sub_806C970
sub_806C970: @ 0x0806C970
	push {r4, r5, lr}
	sub sp, #0x18
	ldr r5, _0806C9BC @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	bl sub_806BCB8
	ldr r1, _0806C9C0 @ =IWRAM_START + 0x18
	adds r0, r4, r1
	movs r3, #0xdf
	lsls r3, r3, #2
	movs r2, #0
	str r2, [sp]
	movs r1, #0x78
	str r1, [sp, #4]
	movs r1, #0x50
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r1, #0
	movs r2, #0x28
	bl sub_806CA88
	ldr r0, _0806C9C4 @ =gUnknown_030005B4
	adds r4, r4, r0
	movs r0, #1
	strh r0, [r4]
	movs r0, #0x32
	bl m4aSongNumStart
	ldr r1, [r5]
	ldr r0, _0806C9C8 @ =sub_806BD28
	str r0, [r1, #8]
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9BC: .4byte gCurTask
_0806C9C0: .4byte IWRAM_START + 0x18
_0806C9C4: .4byte gUnknown_030005B4
_0806C9C8: .4byte sub_806BD28

	thumb_func_start sub_806C9CC
sub_806C9CC: @ 0x0806C9CC
	push {r4, r5, lr}
	ldr r5, _0806CA04 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r1, _0806CA08 @ =IWRAM_START + 0x88
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806C9FE
	ldr r0, _0806CA0C @ =gUnknown_030005A2
	adds r1, r4, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0806CA10 @ =gUnknown_030005B4
	adds r1, r4, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x33
	bl m4aSongNumStart
	ldr r1, [r5]
	ldr r0, _0806CA14 @ =sub_806BE40
	str r0, [r1, #8]
_0806C9FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CA04: .4byte gCurTask
_0806CA08: .4byte IWRAM_START + 0x88
_0806CA0C: .4byte gUnknown_030005A2
_0806CA10: .4byte gUnknown_030005B4
_0806CA14: .4byte sub_806BE40

	thumb_func_start sub_806CA18
sub_806CA18: @ 0x0806CA18
	push {lr}
	ldr r0, _0806CA44 @ =gCurTask
	ldr r3, [r0]
	ldrh r2, [r3, #6]
	ldr r1, _0806CA48 @ =gBldRegs
	movs r0, #0
	strh r0, [r1, #4]
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r0, _0806CA4C @ =gUnknown_030005A2
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb3
	ble _0806CA40
	ldr r0, _0806CA50 @ =sub_806C158
	str r0, [r3, #8]
_0806CA40:
	pop {r0}
	bx r0
	.align 2, 0
_0806CA44: .4byte gCurTask
_0806CA48: .4byte gBldRegs
_0806CA4C: .4byte gUnknown_030005A2
_0806CA50: .4byte sub_806C158

	thumb_func_start sub_806CA54
sub_806CA54: @ 0x0806CA54
	push {lr}
	ldr r0, _0806CA7C @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	ldr r3, _0806CA80 @ =gUnknown_030005A2
	adds r1, r0, r3
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _0806CA76
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0806CA84 @ =sub_806C25C
	str r0, [r2, #8]
_0806CA76:
	pop {r0}
	bx r0
	.align 2, 0
_0806CA7C: .4byte gCurTask
_0806CA80: .4byte gUnknown_030005A2
_0806CA84: .4byte sub_806C25C

	thumb_func_start sub_806CA88
sub_806CA88: @ 0x0806CA88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	mov sb, r2
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x54]
	ldr r4, [sp, #0x58]
	ldr r5, [sp, #0x5c]
	ldr r6, [sp, #0x60]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov ip, sp
	cmp r7, #0
	beq _0806CAC6
	mov ip, r7
_0806CAC6:
	lsls r0, r1, #0x18
	adds r7, r0, #0
	cmp r7, #0
	beq _0806CAE8
	ldr r1, _0806CAE0 @ =gUnknown_03005B58
	ldr r0, [r1]
	cmp r0, #0
	bne _0806CADC
	ldr r0, _0806CAE4 @ =gUnknown_03005B5C
	ldr r0, [r0]
	str r0, [r1]
_0806CADC:
	ldr r0, [r1]
	b _0806CAEC
	.align 2, 0
_0806CAE0: .4byte gUnknown_03005B58
_0806CAE4: .4byte gUnknown_03005B5C
_0806CAE8:
	ldr r0, _0806CB40 @ =gUnknown_03005B5C
	ldr r0, [r0]
_0806CAEC:
	mov r1, ip
	str r0, [r1, #4]
	movs r1, #0
	mov r0, ip
	strh r1, [r0, #8]
	strh r3, [r0, #0xa]
	ldr r0, [sp, #0x4c]
	mov r3, ip
	str r0, [r3, #0x10]
	mov r0, r8
	strh r0, [r3, #0x16]
	strh r2, [r3, #0x18]
	lsls r0, r4, #6
	strh r0, [r3, #0x1a]
	strh r1, [r3, #0x1c]
	ldr r0, _0806CB44 @ =0x0000FFFF
	strh r0, [r3, #0x1e]
	mov r0, ip
	adds r0, #0x20
	strb r5, [r0]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	mov r0, ip
	bl sub_8004558
	asrs r3, r7, #0x18
	cmp r3, #0
	beq _0806CB48
	cmp r3, #1
	beq _0806CB64
	b _0806CB70
	.align 2, 0
_0806CB40: .4byte gUnknown_03005B5C
_0806CB44: .4byte 0x0000FFFF
_0806CB48:
	ldr r2, _0806CB5C @ =gUnknown_03005B5C
	mov r0, sb
	lsls r1, r0, #5
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0806CB60 @ =gUnknown_03005B58
	str r3, [r0]
	b _0806CB70
	.align 2, 0
_0806CB5C: .4byte gUnknown_03005B5C
_0806CB60: .4byte gUnknown_03005B58
_0806CB64:
	ldr r2, _0806CB80 @ =gUnknown_03005B58
	mov r3, sb
	lsls r1, r3, #5
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_0806CB70:
	add sp, #0x30
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB80: .4byte gUnknown_03005B58

	thumb_func_start sub_806CB84
sub_806CB84: @ 0x0806CB84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sl, r1
	adds r6, r2, #0
	ldr r0, [r6, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp]
	movs r1, #0xb4
	lsls r1, r1, #3
	adds r0, r6, r1
	ldrh r1, [r0]
	rsbs r1, r1, #0
	ldr r2, _0806CC2C @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldr r3, _0806CC30 @ =gSineTable
	lsls r0, r1, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r2, [r0, r4]
	lsls r2, r2, #2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r5, [r1, r3]
	mov r4, sl
	ldr r1, [r4]
	ldr r3, _0806CC34 @ =0x00000594
	adds r0, r6, r3
	ldr r4, [r0]
	subs r4, r4, r1
	mov r0, sl
	ldr r1, [r0, #4]
	adds r3, #4
	adds r0, r6, r3
	ldr r3, [r0]
	subs r3, r3, r1
	asrs r0, r2, #8
	asrs r3, r3, #8
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r5, r5, #6
	asrs r4, r4, #8
	adds r0, r5, #0
	muls r0, r4, r0
	adds r1, r1, r0
	asrs r1, r1, #2
	mov sb, r1
	rsbs r2, r2, #0
	asrs r2, r2, #8
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r5, #0
	muls r1, r3, r1
	adds r0, r0, r1
	asrs r4, r0, #1
	movs r1, #0xb2
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r2, [r0]
	ldr r0, _0806CC38 @ =0x000005D1
	adds r3, r6, r0
	ldrb r1, [r3]
	lsls r1, r1, #3
	adds r0, r6, #0
	adds r0, #0x98
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r4, r2
	ble _0806CCDA
	cmp r4, r0
	blt _0806CC40
	b _0806CCDA
	.align 2, 0
_0806CC2C: .4byte 0x000003FF
_0806CC30: .4byte gSineTable
_0806CC34: .4byte 0x00000594
_0806CC38: .4byte 0x000005D1
_0806CC3C:
	adds r5, r2, #0
	b _0806CCB4
_0806CC40:
	ldr r1, _0806CC70 @ =0x000005D2
	adds r0, r6, r1
	ldrb r2, [r0]
	adds r1, #1
	adds r0, r6, r1
	ldrb r5, [r0]
	lsls r1, r2, #0x10
	movs r0, #0x94
	adds r0, r0, r6
	mov ip, r0
	cmp r1, #0
	beq _0806CCB4
	mov r8, r3
_0806CC5A:
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0x9f
	ble _0806CC74
	asrs r0, r1, #0x11
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r2, #0x10
	b _0806CCA8
	.align 2, 0
_0806CC70: .4byte 0x000005D2
_0806CC74:
	mov r1, r8
	ldrb r1, [r1]
	cmp r3, r1
	bge _0806CC84
	lsls r1, r2, #0x10
	asrs r0, r1, #0x11
	adds r0, r3, r0
	b _0806CCA4
_0806CC84:
	lsls r1, r3, #3
	adds r0, r6, #0
	adds r0, #0x98
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r4
	ble _0806CC9A
	lsls r1, r2, #0x10
	asrs r0, r1, #0x11
	adds r0, r3, r0
	b _0806CCA4
_0806CC9A:
	cmp r0, r4
	bge _0806CC3C
	lsls r1, r2, #0x10
	asrs r0, r1, #0x11
	subs r0, r3, r0
_0806CCA4:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0806CCA8:
	asrs r0, r1, #0x11
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r2, #0x10
	cmp r1, #0
	bne _0806CC5A
_0806CCB4:
	lsls r3, r5, #0x10
	asrs r6, r3, #0x10
	lsls r0, r6, #3
	add r0, ip
	ldr r1, [r0]
	asrs r1, r1, #1
	rsbs r0, r1, #0
	lsls r2, r0, #3
	adds r2, r2, r0
	asrs r2, r2, #3
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #3
	mov r8, r0
	str r3, [sp, #4]
	cmp sb, r2
	ble _0806CCDA
	cmp sb, r8
	blt _0806CCDE
_0806CCDA:
	movs r0, #0
	b _0806CD56
_0806CCDE:
	strh r5, [r7, #0xa]
	mov r2, sl
	ldrh r4, [r2, #0xe]
	subs r4, r5, r4
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	lsls r0, r0, #0x10
	ldr r2, [sp]
	ldr r1, [r2, #0xc]
	lsls r5, r6, #2
	adds r1, r5, r1
	ldr r1, [r1]
	bl __divsi3
	subs r4, r4, r0
	strh r4, [r7, #4]
	mov r3, sb
	lsls r0, r3, #4
	add r0, sb
	lsls r0, r0, #3
	subs r0, r0, r3
	mov r1, r8
	bl __divsi3
	movs r1, #0x78
	subs r1, r1, r0
	strh r1, [r7, #8]
	mov r4, sl
	ldrh r0, [r4, #0xc]
	subs r1, r1, r0
	strh r1, [r7, #2]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0806CD3A
	lsls r0, r0, #3
	ldr r2, [sp]
	ldr r1, [r2, #0xc]
	adds r1, r5, r1
	ldr r1, [r1]
	bl __divsi3
	lsls r1, r0, #3
	adds r1, r1, r0
	asrs r1, r1, #2
	strh r1, [r7, #6]
	b _0806CD3C
_0806CD3A:
	strh r0, [r7, #6]
_0806CD3C:
	ldr r3, [sp]
	ldr r1, [r3, #0xc]
	ldr r4, [sp, #4]
	asrs r0, r4, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	movs r1, #0
	strh r0, [r7, #0xc]
	strh r0, [r7, #0x12]
	strh r1, [r7, #0x10]
	strh r1, [r7, #0xe]
	movs r0, #1
_0806CD56:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806CD68
sub_806CD68: @ 0x0806CD68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r8, r0
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
	mov r1, r8
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	movs r3, #0x16
	ldrsh r2, [r5, r3]
	lsrs r0, r0, #1
	subs r2, r2, r0
	str r2, [sp]
	movs r7, #0x18
	ldrsh r0, [r5, r7]
	lsrs r1, r1, #1
	subs r0, r0, r1
	str r0, [sp, #4]
	movs r6, #0
	mov r0, r8
	ldrh r0, [r0, #2]
	str r0, [sp, #8]
	mov r1, r8
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bge _0806CE7C
	ldr r3, _0806CE8C @ =0x040000D4
	mov sb, r3
	ldr r7, _0806CE90 @ =0x000001FF
	mov sl, r7
_0806CDB6:
	ldr r0, _0806CE94 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r5, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
	ldrh r0, [r5, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r4, r0, #0
	ldr r0, _0806CE98 @ =iwram_end
	ldr r0, [r0]
	cmp r4, r0
	beq _0806CE7C
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
	cmp r6, #0
	bne _0806CDF2
	ldr r0, _0806CE9C @ =gUnknown_030018F0
	ldrb r0, [r0]
	subs r0, #1
	adds r1, r5, #0
	adds r1, #0x23
	strb r0, [r1]
_0806CDF2:
	mov r3, r8
	ldrb r1, [r3, #1]
	adds r1, r1, r6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r7, r0
	mov r7, sb
	str r0, [r7]
	str r4, [r7, #4]
	ldr r0, _0806CEA0 @ =0x80000003
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldrh r3, [r4, #2]
	mov r2, sl
	ands r2, r3
	movs r1, #0xff
	ldrb r0, [r4]
	ldr r7, [sp, #4]
	adds r0, r7, r0
	ands r0, r1
	movs r7, #0xc0
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r4]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldr r0, [r5, #0x10]
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #9
	orrs r0, r3
	ldr r3, [sp]
	adds r2, r3, r2
	mov r7, sl
	ands r2, r7
	orrs r0, r2
	strh r0, [r4, #2]
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r2, [r0]
	lsls r2, r2, #0xc
	ldrh r0, [r4, #4]
	adds r2, r2, r0
	strh r2, [r4, #4]
	ldr r1, [r5, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r1, r0
	lsrs r1, r1, #2
	orrs r1, r2
	strh r1, [r4, #4]
	ldr r0, [r5, #4]
	ldr r2, _0806CEA4 @ =0xF9FF0000
	adds r0, r0, r2
	lsrs r0, r0, #5
	adds r1, r1, r0
	strh r1, [r4, #4]
	adds r1, r6, #1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	cmp r1, r0
	blt _0806CDB6
_0806CE7C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CE8C: .4byte 0x040000D4
_0806CE90: .4byte 0x000001FF
_0806CE94: .4byte gUnknown_03002794
_0806CE98: .4byte iwram_end
_0806CE9C: .4byte gUnknown_030018F0
_0806CEA0: .4byte 0x80000003
_0806CEA4: .4byte 0xF9FF0000

	thumb_func_start sub_806CEA8
sub_806CEA8: @ 0x0806CEA8
	ldr r1, _0806CEB8 @ =gUnknown_03005B5C
	ldr r0, _0806CEBC @ =0x06010000
	str r0, [r1]
	ldr r1, _0806CEC0 @ =gUnknown_03005B58
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0806CEB8: .4byte gUnknown_03005B5C
_0806CEBC: .4byte 0x06010000
_0806CEC0: .4byte gUnknown_03005B58

	thumb_func_start sub_806CEC4
sub_806CEC4: @ 0x0806CEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r6, [sp, #0x20]
	ldr r0, [sp, #0x24]
	mov r8, r0
	ldr r0, [sp, #0x28]
	mov sb, r0
	ldr r5, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov sl, r0
	ldr r0, [sp, #0x34]
	mov ip, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0xe
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	str r1, [r7, #4]
	movs r1, #0
	movs r0, #0
	strh r0, [r7, #0xa]
	lsls r2, r2, #0xb
	adds r2, r2, r4
	str r2, [r7, #0xc]
	strh r0, [r7, #0x18]
	strh r0, [r7, #0x1a]
	strh r3, [r7, #0x1c]
	strh r0, [r7, #0x1e]
	strh r0, [r7, #0x20]
	strh r0, [r7, #0x22]
	strh r0, [r7, #0x24]
	strh r6, [r7, #0x26]
	mov r2, r8
	strh r2, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	mov r2, sb
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r5, [r7, #0x2e]
	mov r0, sl
	strh r0, [r7, #0x30]
	mov r2, ip
	strh r2, [r7, #0x32]
	adds r0, r7, #0
	bl sub_8002A3C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806CF44
sub_806CF44: @ 0x0806CF44
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	ldrh r0, [r2]
	ldr r1, _0806CF74 @ =0x0000FFFF
	cmp r0, r1
	beq _0806CF68
	adds r4, r1, #0
_0806CF54:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r2, #4]
	cmp r0, r1
	bge _0806CF60
	adds r3, r1, #0
_0806CF60:
	adds r2, #8
	ldrh r0, [r2]
	cmp r0, r4
	bne _0806CF54
_0806CF68:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806CF74: .4byte 0x0000FFFF

	thumb_func_start sub_806CF78
sub_806CF78: @ 0x0806CF78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sb, r0
	add r1, sp, #4
	ldr r0, _0806D1C4 @ =gUnknown_080DF670
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r0, #0xb7
	lsls r0, r0, #3
	add r0, sb
	ldrb r4, [r0]
	ldr r0, _0806D1C8 @ =sub_806D2C8
	movs r1, #0x84
	lsls r1, r1, #1
	movs r2, #0x90
	lsls r2, r2, #8
	movs r3, #0
	mov sl, r3
	str r3, [sp]
	bl TaskCreate
	str r0, [sp, #0x18]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r7, r0
	mov r6, sb
	str r6, [r0]
	mov r1, sl
	str r1, [r0, #4]
	ldr r2, _0806D1CC @ =IWRAM_START + 0xA8
	adds r3, r7, r2
	ldr r2, _0806D1D0 @ =gUnknown_080DF9D8
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r0, r1, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #0x10
	str r0, [r3]
	ldr r6, _0806D1D4 @ =IWRAM_START + 0xAC
	adds r3, r7, r6
	adds r0, r2, #2
	adds r0, r1, r0
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #0x10
	str r0, [r3]
	adds r6, #4
	adds r0, r7, r6
	mov r3, sl
	strh r3, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	ldr r4, _0806D1D8 @ =IWRAM_START + 0xB2
	adds r0, r7, r4
	strh r1, [r0]
	adds r6, #4
	adds r0, r7, r6
	strh r3, [r0]
	ldr r0, _0806D1DC @ =IWRAM_START + 0xB6
	adds r1, r7, r0
	movs r0, #0x96
	strh r0, [r1]
	ldr r1, _0806D1E0 @ =IWRAM_START + 0xBC
	adds r0, r7, r1
	strh r3, [r0]
	ldr r2, _0806D1E4 @ =IWRAM_START + 0xBE
	adds r0, r7, r2
	strh r3, [r0]
	ldr r3, _0806D1E8 @ =IWRAM_START + 0xC0
	adds r1, r7, r3
	movs r0, #1
	strh r0, [r1]
	adds r4, #0x12
	adds r4, r4, r7
	mov r8, r4
	ldr r0, _0806D1EC @ =0x000005B6
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	str r0, [r4]
	bl sub_806CF44
	subs r6, #0x1c
	adds r3, r7, r6
	ldr r2, _0806D1F0 @ =gUnknown_03005B5C
	ldr r1, [r2]
	str r1, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xb
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0806D1F4 @ =IWRAM_START + 0x9C
	adds r5, r7, r0
	str r1, [r5]
	ldr r4, _0806D1F8 @ =IWRAM_START + 0xA0
	adds r4, r7, r4
	str r4, [sp, #0x1c]
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r4]
	adds r1, #0xc0
	str r1, [r2]
	subs r6, #0x90
	adds r0, r7, r6
	ldr r1, [r3]
	ldr r4, _0806D1FC @ =0x000005CC
	add r4, sb
	movs r3, #0
	ldrsh r2, [r4, r3]
	mov r6, r8
	ldr r6, [r6]
	str r6, [sp]
	movs r3, #9
	bl sub_806D548
	ldr r1, _0806D200 @ =IWRAM_START + 0x38
	adds r0, r7, r1
	ldr r1, [r5]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, _0806D204 @ =gUnknown_080DF668
	str r3, [sp]
	movs r3, #0xa
	bl sub_806D548
	ldr r4, _0806D208 @ =IWRAM_START + 0x68
	adds r2, r7, r4
	ldr r4, _0806D20C @ =gUnknown_03005156
	ldr r6, [sp, #0x1c]
	ldr r0, [r6]
	str r0, [r2, #4]
	mov r0, sl
	strh r0, [r2, #8]
	ldr r0, _0806D210 @ =0x0000037A
	strh r0, [r2, #0xa]
	ldr r0, _0806D214 @ =0x0000107E
	str r0, [r2, #0x10]
	movs r0, #0x78
	strh r0, [r2, #0x16]
	movs r0, #0x50
	strh r0, [r2, #0x18]
	mov r1, sl
	strh r1, [r2, #0x1a]
	strh r1, [r2, #0x1c]
	ldr r0, _0806D218 @ =0x0000FFFF
	strh r0, [r2, #0x1e]
	ldr r3, _0806D21C @ =IWRAM_START + 0x88
	adds r0, r7, r3
	movs r6, #2
	strb r6, [r0]
	ldr r0, _0806D220 @ =IWRAM_START + 0x89
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r3, #2
	adds r1, r7, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r6, _0806D224 @ =IWRAM_START + 0x8D
	adds r0, r7, r6
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	ldr r0, _0806D228 @ =0x000005BA
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806D0EC
	adds r0, r2, #0
	bl sub_8004558
_0806D0EC:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r4]
	adds r4, #8
	mov r3, sl
	strh r3, [r4]
	adds r4, #8
	strh r3, [r4]
	strh r0, [r4, #8]
	ldr r0, _0806D22C @ =0x000005B7
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806D10C
	b _0806D268
_0806D10C:
	ldr r4, _0806D230 @ =IWRAM_START + 0xC8
	adds r0, r7, r4
	mov r6, sl
	str r6, [r0]
	ldr r0, _0806D234 @ =IWRAM_START + 0xCC
	adds r1, r7, r0
	movs r0, #6
	str r0, [r1]
	ldr r1, _0806D238 @ =IWRAM_START + 0xD0
	adds r0, r7, r1
	movs r1, #0x80
	lsls r1, r1, #9
	str r1, [r0]
	ldr r2, _0806D23C @ =IWRAM_START + 0xD4
	adds r0, r7, r2
	str r1, [r0]
	ldr r3, _0806D240 @ =IWRAM_START + 0xD8
	adds r1, r7, r3
	movs r0, #0x28
	str r0, [r1]
	adds r4, #0x14
	adds r1, r7, r4
	subs r0, #0x53
	str r0, [r1]
	ldr r6, _0806D244 @ =IWRAM_START + 0xE0
	adds r1, r7, r6
	ldr r0, _0806D248 @ =0xFFFFFEA2
	str r0, [r1]
	ldr r0, _0806D24C @ =IWRAM_START + 0xE4
	adds r1, r7, r0
	movs r0, #0xb2
	lsls r0, r0, #6
	str r0, [r1]
	adds r2, #0x14
	adds r1, r7, r2
	movs r0, #0xfe
	lsls r0, r0, #6
	str r0, [r1]
	adds r3, #0x14
	adds r1, r7, r3
	ldr r0, _0806D250 @ =0x00000502
	strh r0, [r1]
	adds r4, #0x12
	adds r1, r7, r4
	movs r0, #0x8c
	lsls r0, r0, #4
	strh r0, [r1]
	adds r6, #0x10
	adds r1, r7, r6
	movs r0, #0x14
	strh r0, [r1]
	ldr r0, _0806D254 @ =IWRAM_START + 0xF2
	adds r1, r7, r0
	ldr r0, _0806D258 @ =0x0000FFD8
	strh r0, [r1]
	adds r2, #0xc
	adds r1, r7, r2
	subs r0, #0xe
	strh r0, [r1]
	adds r3, #0xa
	adds r1, r7, r3
	subs r0, #0x12
	strh r0, [r1]
	adds r4, #0x12
	adds r1, r7, r4
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [r1]
	adds r6, #0x14
	adds r1, r7, r6
	adds r0, #8
	str r0, [r1]
	ldr r0, _0806D25C @ =IWRAM_START + 0xF8
	adds r1, r7, r0
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r1]
	adds r2, #6
	adds r1, r7, r2
	ldr r0, _0806D260 @ =0x0000FF80
	strh r0, [r1]
	adds r3, #6
	adds r1, r7, r3
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1]
	subs r4, #2
	adds r1, r7, r4
	ldr r0, _0806D264 @ =0x0000FFC0
	strh r0, [r1]
	b _0806D29C
	.align 2, 0
_0806D1C4: .4byte gUnknown_080DF670
_0806D1C8: .4byte sub_806D2C8
_0806D1CC: .4byte IWRAM_START + 0xA8
_0806D1D0: .4byte gUnknown_080DF9D8
_0806D1D4: .4byte IWRAM_START + 0xAC
_0806D1D8: .4byte IWRAM_START + 0xB2
_0806D1DC: .4byte IWRAM_START + 0xB6
_0806D1E0: .4byte IWRAM_START + 0xBC
_0806D1E4: .4byte IWRAM_START + 0xBE
_0806D1E8: .4byte IWRAM_START + 0xC0
_0806D1EC: .4byte 0x000005B6
_0806D1F0: .4byte gUnknown_03005B5C
_0806D1F4: .4byte IWRAM_START + 0x9C
_0806D1F8: .4byte IWRAM_START + 0xA0
_0806D1FC: .4byte 0x000005CC
_0806D200: .4byte IWRAM_START + 0x38
_0806D204: .4byte gUnknown_080DF668
_0806D208: .4byte IWRAM_START + 0x68
_0806D20C: .4byte gUnknown_03005156
_0806D210: .4byte 0x0000037A
_0806D214: .4byte 0x0000107E
_0806D218: .4byte 0x0000FFFF
_0806D21C: .4byte IWRAM_START + 0x88
_0806D220: .4byte IWRAM_START + 0x89
_0806D224: .4byte IWRAM_START + 0x8D
_0806D228: .4byte 0x000005BA
_0806D22C: .4byte 0x000005B7
_0806D230: .4byte IWRAM_START + 0xC8
_0806D234: .4byte IWRAM_START + 0xCC
_0806D238: .4byte IWRAM_START + 0xD0
_0806D23C: .4byte IWRAM_START + 0xD4
_0806D240: .4byte IWRAM_START + 0xD8
_0806D244: .4byte IWRAM_START + 0xE0
_0806D248: .4byte 0xFFFFFEA2
_0806D24C: .4byte IWRAM_START + 0xE4
_0806D250: .4byte 0x00000502
_0806D254: .4byte IWRAM_START + 0xF2
_0806D258: .4byte 0x0000FFD8
_0806D25C: .4byte IWRAM_START + 0xF8
_0806D260: .4byte 0x0000FF80
_0806D264: .4byte 0x0000FFC0
_0806D268:
	ldr r6, _0806D2B0 @ =IWRAM_START + 0xC8
	adds r0, r7, r6
	mov r1, sl
	str r1, [r0]
	ldr r2, _0806D2B4 @ =IWRAM_START + 0xCC
	adds r0, r7, r2
	str r1, [r0]
	ldr r3, _0806D2B8 @ =IWRAM_START + 0xD0
	adds r1, r7, r3
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r1]
	ldr r4, _0806D2BC @ =IWRAM_START + 0xD4
	adds r1, r7, r4
	ldr r0, _0806D2C0 @ =0x00007FFF
	str r0, [r1]
	adds r6, #0x10
	adds r1, r7, r6
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r1]
	ldr r0, _0806D2C4 @ =IWRAM_START + 0xDC
	adds r1, r7, r0
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [r1]
_0806D29C:
	ldr r0, [sp, #0x18]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806D2B0: .4byte IWRAM_START + 0xC8
_0806D2B4: .4byte IWRAM_START + 0xCC
_0806D2B8: .4byte IWRAM_START + 0xD0
_0806D2BC: .4byte IWRAM_START + 0xD4
_0806D2C0: .4byte 0x00007FFF
_0806D2C4: .4byte IWRAM_START + 0xDC

	thumb_func_start sub_806D2C8
sub_806D2C8: @ 0x0806D2C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	ldr r0, _0806D308 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r6, [r4]
	ldr r1, _0806D30C @ =gUnknown_080DF684
	mov r0, sp
	movs r2, #0x48
	bl memcpy
	ldr r1, _0806D310 @ =0x000005BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806D318
	ldr r7, _0806D314 @ =IWRAM_START + 0xB4
	adds r0, r5, r7
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_806D788
	b _0806D31E
	.align 2, 0
_0806D308: .4byte gCurTask
_0806D30C: .4byte gUnknown_080DF684
_0806D310: .4byte 0x000005BA
_0806D314: .4byte IWRAM_START + 0xB4
_0806D318:
	ldr r0, [sp]
	bl _call_via_r0
_0806D31E:
	adds r3, r4, #0
	adds r3, #8
	adds r5, r4, #0
	adds r5, #0x38
	adds r1, r4, #0
	adds r1, #0xb6
	ldrh r2, [r1]
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, #0
	beq _0806D368
	ldr r7, _0806D364 @ =0x000005BA
	adds r0, r6, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806D368
	subs r0, r2, #1
	strh r0, [r1]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0806D37E
	adds r0, r3, #0
	bl sub_80051E8
	adds r0, r4, #0
	adds r0, #0xb4
	ldrh r0, [r0]
	cmp r0, #0xd
	bhi _0806D37E
	adds r0, r5, #0
	bl sub_80051E8
	b _0806D37E
	.align 2, 0
_0806D364: .4byte 0x000005BA
_0806D368:
	adds r0, r3, #0
	bl sub_80051E8
	adds r0, r4, #0
	adds r0, #0xb4
	ldrh r0, [r0]
	cmp r0, #0xd
	bhi _0806D37E
	adds r0, r5, #0
	bl sub_80051E8
_0806D37E:
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D388
sub_806D388: @ 0x0806D388
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806D3B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r5, [r3]
	movs r1, #0
	ldr r2, _0806D3BC @ =0x000005B4
	adds r0, r5, r2
	ldrh r0, [r0]
	cmp r0, #8
	beq _0806D3CE
	ldr r0, _0806D3C0 @ =gInput
	ldrh r2, [r0]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0806D3C4
	movs r1, #1
	b _0806D3CE
	.align 2, 0
_0806D3B8: .4byte gCurTask
_0806D3BC: .4byte 0x000005B4
_0806D3C0: .4byte gInput
_0806D3C4:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806D3CE
	movs r1, #2
_0806D3CE:
	adds r0, r3, #0
	adds r0, #0xc4
	lsls r1, r1, #3
	ldr r0, [r0]
	adds r7, r0, r1
	adds r4, r3, #0
	adds r4, #8
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	ldr r1, _0806D41C @ =0x000005CC
	adds r6, r5, r1
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r4, #0
	mov r1, r8
	adds r3, r7, #0
	bl sub_806D7D0
	ldr r1, _0806D420 @ =0x000005B4
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, #8
	bne _0806D412
	adds r0, r4, #0
	bl sub_80051E8
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r4, #0
	mov r1, r8
	adds r3, r7, #0
	bl sub_806D830
_0806D412:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D41C: .4byte 0x000005CC
_0806D420: .4byte 0x000005B4

	thumb_func_start sub_806D424
sub_806D424: @ 0x0806D424
	push {r4, lr}
	ldr r0, _0806D448 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	ldr r2, [r1]
	movs r1, #3
	ldr r0, _0806D44C @ =gInput
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0806D450
	movs r1, #4
	b _0806D45A
	.align 2, 0
_0806D448: .4byte gCurTask
_0806D44C: .4byte gInput
_0806D450:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0806D45A
	movs r1, #5
_0806D45A:
	mov r0, ip
	adds r0, #0xc4
	lsls r1, r1, #3
	ldr r3, [r0]
	adds r3, r3, r1
	subs r0, #0xbc
	mov r1, ip
	adds r1, #0xa4
	movs r4, #0
	ldrsh r1, [r1, r4]
	ldr r4, _0806D480 @ =0x000005CC
	adds r2, r2, r4
	movs r4, #0
	ldrsh r2, [r2, r4]
	bl sub_806D7D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D480: .4byte 0x000005CC

	thumb_func_start sub_806D484
sub_806D484: @ 0x0806D484
	push {r4, lr}
	ldr r0, _0806D4A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	ldr r2, [r1]
	movs r1, #6
	ldr r0, _0806D4AC @ =gInput
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0806D4B0
	movs r1, #7
	b _0806D4BA
	.align 2, 0
_0806D4A8: .4byte gCurTask
_0806D4AC: .4byte gInput
_0806D4B0:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0806D4BA
	movs r1, #8
_0806D4BA:
	mov r0, ip
	adds r0, #0xc4
	lsls r1, r1, #3
	ldr r3, [r0]
	adds r3, r3, r1
	subs r0, #0xbc
	mov r1, ip
	adds r1, #0xa4
	movs r4, #0
	ldrsh r1, [r1, r4]
	ldr r4, _0806D4E0 @ =0x000005CC
	adds r2, r2, r4
	movs r4, #0
	ldrsh r2, [r2, r4]
	bl sub_806D7D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4E0: .4byte 0x000005CC

	thumb_func_start sub_806D4E4
sub_806D4E4: @ 0x0806D4E4
	push {r4, lr}
	ldr r0, _0806D508 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	ldr r2, [r1]
	movs r1, #9
	ldr r0, _0806D50C @ =gInput
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0806D510
	movs r1, #0xa
	b _0806D51A
	.align 2, 0
_0806D508: .4byte gCurTask
_0806D50C: .4byte gInput
_0806D510:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0806D51A
	movs r1, #0xb
_0806D51A:
	mov r0, ip
	adds r0, #0xc4
	lsls r1, r1, #3
	ldr r3, [r0]
	adds r3, r3, r1
	subs r0, #0xbc
	mov r1, ip
	adds r1, #0xa4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldr r4, _0806D544 @ =0x000005CC
	adds r2, r2, r4
	movs r4, #0
	ldrsh r2, [r2, r4]
	bl sub_806D7D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D544: .4byte 0x000005CC

	thumb_func_start sub_806D548
sub_806D548: @ 0x0806D548
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r4, [sp, #0x14]
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r3, #0x80
	lsls r3, r3, #5
	ldrb r2, [r4, #7]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D56A
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r3, r0
_0806D56A:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0806D578
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r3, r0
_0806D578:
	mov r0, ip
	str r1, [r0, #4]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #8]
	ldrh r0, [r4]
	mov r7, ip
	strh r0, [r7, #0xa]
	str r3, [r7, #0x10]
	movs r0, #0x78
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	lsls r0, r5, #6
	strh r0, [r7, #0x1a]
	strh r1, [r7, #0x1c]
	ldr r0, _0806D5C8 @ =0x0000FFFF
	strh r0, [r7, #0x1e]
	ldrh r1, [r4, #2]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldrb r0, [r4, #6]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	mov r0, ip
	bl sub_8004558
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D5C8: .4byte 0x0000FFFF

	thumb_func_start sub_806D5CC
sub_806D5CC: @ 0x0806D5CC
	bx lr
	.align 2, 0

	thumb_func_start sub_806D5D0
sub_806D5D0: @ 0x0806D5D0
	push {r4, r5, lr}
	ldr r0, _0806D620 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r5, [r1]
	ldr r2, _0806D624 @ =IWRAM_START + 0xC4
	adds r1, r0, r2
	ldr r3, [r1]
	adds r3, #0x60
	ldr r4, _0806D628 @ =IWRAM_START + 0xB0
	adds r2, r0, r4
	adds r4, #8
	adds r1, r0, r4
	ldrh r4, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	ldrh r1, [r2]
	adds r4, r4, r1
	strh r4, [r2]
	ldr r2, _0806D62C @ =IWRAM_START + 0x8
	adds r0, r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _0806D630 @ =0x000005CC
	adds r5, r5, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	adds r4, #0xf
	ldrh r2, [r5]
	subs r2, r2, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_806D7D0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D620: .4byte gCurTask
_0806D624: .4byte IWRAM_START + 0xC4
_0806D628: .4byte IWRAM_START + 0xB0
_0806D62C: .4byte IWRAM_START + 0x8
_0806D630: .4byte 0x000005CC

	thumb_func_start sub_806D634
sub_806D634: @ 0x0806D634
	push {r4, r5, lr}
	ldr r0, _0806D684 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r5, [r1]
	ldr r2, _0806D688 @ =IWRAM_START + 0xC4
	adds r1, r0, r2
	ldr r3, [r1]
	adds r3, #0x78
	ldr r4, _0806D68C @ =IWRAM_START + 0xB0
	adds r2, r0, r4
	adds r4, #8
	adds r1, r0, r4
	ldrh r4, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	ldrh r1, [r2]
	adds r4, r4, r1
	strh r4, [r2]
	ldr r2, _0806D690 @ =IWRAM_START + 0x8
	adds r0, r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _0806D694 @ =0x000005CC
	adds r5, r5, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	adds r4, #0xa
	ldrh r2, [r5]
	subs r2, r2, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_806D7D0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D684: .4byte gCurTask
_0806D688: .4byte IWRAM_START + 0xC4
_0806D68C: .4byte IWRAM_START + 0xB0
_0806D690: .4byte IWRAM_START + 0x8
_0806D694: .4byte 0x000005CC

	thumb_func_start sub_806D698
sub_806D698: @ 0x0806D698
	push {r4, lr}
	ldr r0, _0806D6CC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r3, _0806D6D0 @ =IWRAM_START + 0xC4
	adds r1, r0, r3
	ldr r3, [r1]
	adds r3, #0x90
	ldr r4, _0806D6D4 @ =IWRAM_START + 0x8
	adds r0, r0, r4
	movs r1, #1
	rsbs r1, r1, #0
	ldr r4, _0806D6D8 @ =0x000005CC
	adds r2, r2, r4
	movs r4, #0
	ldrsh r2, [r2, r4]
	bl sub_806D7D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D6CC: .4byte gCurTask
_0806D6D0: .4byte IWRAM_START + 0xC4
_0806D6D4: .4byte IWRAM_START + 0x8
_0806D6D8: .4byte 0x000005CC

	thumb_func_start sub_806D6DC
sub_806D6DC: @ 0x0806D6DC
	push {r4, r5, lr}
	ldr r0, _0806D72C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r5, [r1]
	ldr r2, _0806D730 @ =IWRAM_START + 0xC4
	adds r1, r0, r2
	ldr r3, [r1]
	adds r3, #0x98
	ldr r4, _0806D734 @ =IWRAM_START + 0xB0
	adds r2, r0, r4
	adds r4, #8
	adds r1, r0, r4
	ldrh r4, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	ldrh r1, [r2]
	adds r4, r4, r1
	strh r4, [r2]
	ldr r2, _0806D738 @ =IWRAM_START + 0x8
	adds r0, r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _0806D73C @ =0x000005CC
	adds r5, r5, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	adds r4, #0xa
	ldrh r2, [r5]
	subs r2, r2, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_806D7D0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D72C: .4byte gCurTask
_0806D730: .4byte IWRAM_START + 0xC4
_0806D734: .4byte IWRAM_START + 0xB0
_0806D738: .4byte IWRAM_START + 0x8
_0806D73C: .4byte 0x000005CC

	thumb_func_start sub_806D740
sub_806D740: @ 0x0806D740
	push {r4, lr}
	ldr r0, _0806D778 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r3, _0806D77C @ =IWRAM_START + 0xC4
	adds r1, r0, r3
	ldr r3, [r1]
	adds r3, #0xa0
	ldr r4, _0806D780 @ =IWRAM_START + 0x8
	adds r0, r0, r4
	movs r1, #1
	rsbs r1, r1, #0
	ldr r4, _0806D784 @ =0x000005CC
	adds r2, r2, r4
	ldrh r2, [r2]
	subs r2, #0xc
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_806D7D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D778: .4byte gCurTask
_0806D77C: .4byte IWRAM_START + 0xC4
_0806D780: .4byte IWRAM_START + 0x8
_0806D784: .4byte 0x000005CC

	thumb_func_start sub_806D788
sub_806D788: @ 0x0806D788
	push {r4, lr}
	ldr r0, _0806D7C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r0, _0806D7C4 @ =IWRAM_START + 0xBC
	adds r2, r1, r0
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0806D7B8
	subs r0, r3, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _0806D7B8
	ldr r3, _0806D7C8 @ =IWRAM_START + 0xBE
	adds r0, r1, r3
	strh r2, [r0]
	ldr r4, _0806D7CC @ =IWRAM_START + 0xC0
	adds r1, r1, r4
	movs r0, #1
	strh r0, [r1]
_0806D7B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D7C0: .4byte gCurTask
_0806D7C4: .4byte IWRAM_START + 0xBC
_0806D7C8: .4byte IWRAM_START + 0xBE
_0806D7CC: .4byte IWRAM_START + 0xC0

	thumb_func_start sub_806D7D0
sub_806D7D0: @ 0x0806D7D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r2, #0x80
	lsls r2, r2, #5
	ldrb r1, [r3, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D7F0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_0806D7F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806D7FE
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
_0806D7FE:
	ldrh r0, [r3]
	strh r0, [r4, #0xa]
	str r2, [r4, #0x10]
	strh r5, [r4, #0x18]
	ldrh r1, [r3, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	movs r2, #0x10
	cmp r0, r1
	beq _0806D81E
	adds r2, r6, #0
_0806D81E:
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_8004558
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_806D830
sub_806D830: @ 0x0806D830
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r2, #0x88
	lsls r2, r2, #5
	ldrb r1, [r3, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D850
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_0806D850:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806D85E
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
_0806D85E:
	ldrh r0, [r3]
	strh r0, [r4, #0xa]
	str r2, [r4, #0x10]
	strh r5, [r4, #0x18]
	ldrh r1, [r3, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	movs r2, #0x10
	cmp r0, r1
	beq _0806D87E
	adds r2, r6, #0
_0806D87E:
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_8004558
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_806D890
sub_806D890: @ 0x0806D890
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0806D914 @ =0x000005A4
	adds r2, r4, r0
	ldrh r0, [r2]
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	adds r0, r3, r0
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0806D918 @ =0x000003E7
	cmp r0, r1
	ble _0806D8AE
	strh r1, [r2]
_0806D8AE:
	movs r6, #0
	cmp r6, r3
	bge _0806D90C
	ldr r2, _0806D91C @ =0x000005C1
	adds r1, r4, r2
	movs r7, #0
	movs r5, #9
	mov ip, r3
_0806D8BE:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	ble _0806D8FC
	strb r7, [r1]
	movs r0, #0xb8
	lsls r0, r0, #3
	adds r3, r4, r0
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	ble _0806D8FC
	strb r7, [r3]
	ldr r0, _0806D920 @ =0x000005BF
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	ble _0806D8FC
	strb r5, [r2]
	strb r5, [r3]
	strb r5, [r1]
_0806D8FC:
	lsls r0, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	blt _0806D8BE
_0806D90C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D914: .4byte 0x000005A4
_0806D918: .4byte 0x000003E7
_0806D91C: .4byte 0x000005C1
_0806D920: .4byte 0x000005BF

	thumb_func_start sub_806D924
sub_806D924: @ 0x0806D924
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_806E3B8
	ldr r0, _0806D9A4 @ =0x000005A4
	adds r2, r5, r0
	ldrh r0, [r2]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0806D94C
	movs r0, #0
	strh r0, [r2]
_0806D94C:
	lsrs r6, r4, #0x10
	cmp r4, #0
	ble _0806D99E
	ldr r1, _0806D9A8 @ =0x000005C1
	adds r3, r5, r1
	movs r4, #0
_0806D958:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806D992
	movs r1, #9
	strb r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #3
	adds r2, r5, r0
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806D992
	strb r1, [r2]
	ldr r0, _0806D9AC @ =0x000005BF
	adds r1, r5, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806D992
	strb r4, [r1]
	strb r4, [r2]
	strb r4, [r3]
_0806D992:
	lsls r0, r6, #0x10
	ldr r1, _0806D9B0 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	cmp r0, #0
	bgt _0806D958
_0806D99E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D9A4: .4byte 0x000005A4
_0806D9A8: .4byte 0x000005C1
_0806D9AC: .4byte 0x000005BF
_0806D9B0: .4byte 0xFFFF0000

	thumb_func_start sub_806D9B4
sub_806D9B4: @ 0x0806D9B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0806DB30 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	movs r2, #0
	ldr r0, _0806DB34 @ =IWRAM_START + 0x914
	adds r3, r1, r0
	movs r5, #1
	movs r4, #0xa1
	lsls r4, r4, #1
_0806D9D8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, r0
	strb r5, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	ble _0806D9D8
	ldr r1, _0806DB38 @ =0x00000A5A
	adds r0, r7, r1
	movs r5, #0
	strh r5, [r0]
	adds r0, r7, #4
	ldr r1, _0806DB3C @ =0x00000372
	mov sb, r1
	movs r6, #0xc0
	lsls r6, r6, #6
	str r6, [sp]
	movs r4, #0x14
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0xe
	mov r8, r1
	str r1, [sp, #0xc]
	movs r1, #1
	mov sl, r1
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	mov r3, sb
	bl sub_806CA88
	adds r0, r7, #0
	adds r0, #0x34
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #0x10
	mov r3, sb
	bl sub_806CA88
	adds r0, r7, #0
	adds r0, #0x64
	movs r3, #0xdd
	lsls r3, r3, #2
	str r6, [sp]
	str r4, [sp, #4]
	movs r1, #0x1e
	str r1, [sp, #8]
	movs r1, #0xf
	str r1, [sp, #0xc]
	mov r1, sl
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	bl sub_806CA88
	adds r0, r7, #0
	adds r0, #0x94
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	movs r1, #6
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	mov r3, sb
	bl sub_806CA88
	adds r0, r7, #0
	adds r0, #0xc4
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	movs r1, #5
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	mov r3, sb
	bl sub_806CA88
	adds r0, r7, #0
	adds r0, #0xf4
	ldr r1, _0806DB40 @ =0x0000037B
	mov sb, r1
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	mov r3, sb
	bl sub_806CA88
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r7, r1
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	mov r1, sl
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	mov r3, sb
	bl sub_806CA88
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r7, r1
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	mov r3, sb
	bl sub_806CA88
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r0, r7, r1
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	movs r1, #3
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #4
	mov r3, sb
	bl sub_806CA88
	ldr r0, _0806DB30 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806DB44 @ =sub_806DB48
	str r0, [r1, #8]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DB30: .4byte gCurTask
_0806DB34: .4byte IWRAM_START + 0x914
_0806DB38: .4byte 0x00000A5A
_0806DB3C: .4byte 0x00000372
_0806DB40: .4byte 0x0000037B
_0806DB44: .4byte sub_806DB48

	thumb_func_start sub_806DB48
sub_806DB48: @ 0x0806DB48
	push {r4, r5, r6, lr}
	ldr r0, _0806DC60 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r6, [r5]
	ldr r1, _0806DC64 @ =0x000005BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806DC54
	ldr r1, _0806DC68 @ =IWRAM_START+4
	adds r0, r4, r1
	bl sub_8004558
	ldr r1, _0806DC6C @ =IWRAM_START + 0x64
	adds r0, r4, r1
	bl sub_8004558
	ldr r1, _0806DC70 @ =IWRAM_START + 0x34
	adds r0, r4, r1
	bl sub_8004558
	ldr r1, _0806DC74 @ =IWRAM_START + 0x94
	adds r0, r4, r1
	bl sub_8004558
	ldr r1, _0806DC78 @ =IWRAM_START + 0xC4
	adds r0, r4, r1
	bl sub_8004558
	bl sub_806DC98
	bl sub_806DE10
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806DBA6
	ldr r0, _0806DC7C @ =0x000005B4
	adds r1, r6, r0
	ldrh r0, [r1]
	cmp r0, #7
	beq _0806DBA6
	movs r0, #6
	strh r0, [r1]
_0806DBA6:
	adds r0, r6, #0
	bl sub_806E4FC
	ldr r1, _0806DC80 @ =0x00000A5A
	adds r4, r5, r1
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r5, r1
	ldr r6, _0806DC84 @ =0x00000886
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _0806DBDC
	ldr r0, _0806DC88 @ =0x00000874
	adds r1, r1, r0
	adds r1, r5, r1
	movs r0, #0
	bl sub_806E584
_0806DBDC:
	movs r1, #0
	ldrsh r2, [r4, r1]
	adds r0, r2, #2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r5, r1
	adds r1, r1, r6
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806DC04
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _0806DC8C @ =0x0000089C
	adds r1, r1, r0
	adds r1, r5, r1
	movs r0, #1
	bl sub_806E584
_0806DC04:
	movs r1, #0
	ldrsh r2, [r4, r1]
	adds r0, r2, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r5, r1
	adds r1, r1, r6
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806DC2C
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _0806DC90 @ =0x000008C4
	adds r1, r1, r0
	adds r1, r5, r1
	movs r0, #2
	bl sub_806E584
_0806DC2C:
	movs r1, #0
	ldrsh r2, [r4, r1]
	adds r0, r2, #6
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r5, r1
	adds r1, r1, r6
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806DC54
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _0806DC94 @ =0x000008EC
	adds r1, r1, r0
	adds r1, r5, r1
	movs r0, #3
	bl sub_806E584
_0806DC54:
	bl sub_806DEA4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC60: .4byte gCurTask
_0806DC64: .4byte 0x000005BA
_0806DC68: .4byte IWRAM_START+4
_0806DC6C: .4byte IWRAM_START + 0x64
_0806DC70: .4byte IWRAM_START + 0x34
_0806DC74: .4byte IWRAM_START + 0x94
_0806DC78: .4byte IWRAM_START + 0xC4
_0806DC7C: .4byte 0x000005B4
_0806DC80: .4byte 0x00000A5A
_0806DC84: .4byte 0x00000886
_0806DC88: .4byte 0x00000874
_0806DC8C: .4byte 0x0000089C
_0806DC90: .4byte 0x000008C4
_0806DC94: .4byte 0x000008EC

	thumb_func_start sub_806DC98
sub_806DC98: @ 0x0806DC98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0806DD00 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r0, r0, r3
	mov sl, r0
	ldr r0, [r0]
	mov sb, r0
	ldr r1, _0806DD04 @ =gUnknown_08C878E8
	movs r0, #0xb7
	lsls r0, r0, #3
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r2, [r0, #6]
	adds r3, r3, r2
	mov r8, r3
	ldr r3, _0806DD08 @ =IWRAM_START + 0xA8
	adds r0, r2, r3
	ldr r1, [r0]
	asrs r0, r1, #0x10
	str r0, [sp]
	adds r3, #4
	adds r0, r2, r3
	ldr r3, [r0]
	asrs r0, r3, #0x10
	str r0, [sp, #4]
	ldr r0, _0806DD0C @ =IWRAM_START + 0xB0
	adds r2, r2, r0
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	str r0, [sp, #8]
	asrs r1, r1, #0x17
	lsls r1, r1, #3
	asrs r3, r3, #0x17
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r5, [r1]
	b _0806DDEE
	.align 2, 0
_0806DD00: .4byte gCurTask
_0806DD04: .4byte gUnknown_08C878E8
_0806DD08: .4byte IWRAM_START + 0xA8
_0806DD0C: .4byte IWRAM_START + 0xB0
_0806DD10:
	movs r3, #0
	ldrsh r0, [r5, r3]
	ldr r1, _0806DD84 @ =0x00000914
	add r1, sl
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0806DDEC
	ldrh r2, [r5, #4]
	movs r0, #6
	ldrsb r0, [r5, r0]
	lsls r0, r0, #0x14
	lsrs r3, r0, #0x10
	movs r0, #2
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	subs r0, #5
	cmp r1, r0
	ble _0806DDEC
	ldr r0, [sp]
	adds r0, #5
	cmp r1, r0
	bge _0806DDEC
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	ldr r0, [sp, #4]
	subs r0, #5
	cmp r1, r0
	ble _0806DDEC
	ldr r0, [sp, #4]
	adds r0, #5
	cmp r1, r0
	bge _0806DDEC
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	ldr r0, [sp, #8]
	subs r0, #0xc
	cmp r1, r0
	blt _0806DDEC
	ldr r0, [sp, #8]
	adds r0, #0x14
	cmp r1, r0
	bgt _0806DDEC
	mov r0, r8
	adds r0, #0xc0
	ldrh r7, [r0]
	movs r1, #7
	ldrsb r1, [r5, r1]
	adds r4, r0, #0
	cmp r1, #0
	bne _0806DD88
	movs r2, #0
	ldrsh r1, [r4, r2]
	mov r0, sb
	bl sub_806D890
	b _0806DD9A
	.align 2, 0
_0806DD84: .4byte 0x00000914
_0806DD88:
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sb
	bl sub_806D890
_0806DD9A:
	adds r6, r4, #0
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #8
	bgt _0806DDC2
	mov r1, r8
	adds r1, #0xbc
	movs r0, #0x3c
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #6
	bl __divsi3
	adds r0, #1
	strh r0, [r6]
_0806DDC2:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r3, #0
	ldrsh r1, [r4, r3]
	cmp r0, r1
	beq _0806DDD8
	movs r0, #0x89
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _0806DDDE
_0806DDD8:
	movs r0, #0x75
	bl m4aSongNumStart
_0806DDDE:
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r1, _0806DE0C @ =0x00000914
	add r1, sl
	adds r1, r1, r0
	movs r0, #3
	strb r0, [r1]
_0806DDEC:
	adds r5, #8
_0806DDEE:
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806DD10
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DE0C: .4byte 0x00000914

	thumb_func_start sub_806DE10
sub_806DE10: @ 0x0806DE10
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _0806DE98 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r4, [r0]
	movs r6, #0
	ldr r1, _0806DE9C @ =gUnknown_080DF6CC
	mov r0, sp
	movs r2, #0xe
	bl memcpy
	movs r0, #0xb7
	lsls r0, r0, #3
	adds r4, r4, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	add r0, sp
	movs r1, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r6, r0
	bge _0806DE8E
	ldr r2, _0806DEA0 @ =IWRAM_START + 0x914
	adds r5, r5, r2
	adds r7, r0, #0
_0806DE4A:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r5, r1
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r4, r0, #0
	cmp r1, #2
	ble _0806DE6C
	adds r0, r3, #1
	movs r1, #0
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x11
	ble _0806DE6C
	strb r1, [r2]
_0806DE6C:
	cmp r6, #0
	bne _0806DE80
	asrs r0, r4, #0x10
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806DE80
	movs r6, #1
_0806DE80:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r7
	blt _0806DE4A
_0806DE8E:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806DE98: .4byte gCurTask
_0806DE9C: .4byte gUnknown_080DF6CC
_0806DEA0: .4byte IWRAM_START + 0x914

	thumb_func_start sub_806DEA4
sub_806DEA4: @ 0x0806DEA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x144
	ldr r0, _0806E02C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #6]
	adds r4, r0, r2
	ldr r2, _0806E030 @ =gUnknown_08C878E8
	movs r0, #0xb7
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r0
	movs r3, #0
	movs r1, #0
	mov r5, sp
	movs r2, #0
_0806DEDE:
	strh r2, [r5]
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r5, #0x14
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0806DEDE
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r2, [r0]
	asrs r2, r2, #0x17
	lsls r2, r2, #0x10
	adds r0, #4
	ldr r1, [r0]
	asrs r1, r1, #0x17
	lsls r1, r1, #0x10
	lsrs r0, r2, #0x10
	mov sl, r0
	asrs r7, r2, #0x10
	lsls r0, r7, #3
	lsrs r2, r1, #0x10
	str r2, [sp, #0x140]
	asrs r5, r1, #0x10
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov sb, r1
	asrs r6, r0, #0x10
	lsls r0, r6, #2
	mov r2, r8
	adds r4, r0, r2
	ldr r1, [r4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r5, #7
	beq _0806DF46
	ldr r1, [r4, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806DF46:
	cmp r5, #0
	beq _0806DF5C
	subs r0, r4, #4
	ldr r1, [r0]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806DF5C:
	cmp r7, #7
	beq _0806DFA4
	adds r0, r6, #0
	adds r0, #8
	lsls r0, r0, #2
	mov r1, r8
	adds r4, r0, r1
	ldr r1, [r4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r5, #7
	beq _0806DF8E
	ldr r1, [r4, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806DF8E:
	cmp r5, #0
	beq _0806DFA4
	subs r0, r4, #4
	ldr r1, [r0]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806DFA4:
	mov r2, sl
	cmp r2, #0
	beq _0806DFF8
	mov r1, sb
	lsls r0, r1, #0x10
	ldr r2, _0806E034 @ =0xFFF80000
	adds r0, r0, r2
	asrs r0, r0, #0xe
	mov r1, r8
	adds r4, r0, r1
	ldr r1, [r4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, [sp, #0x140]
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	cmp r5, #7
	beq _0806DFE2
	ldr r1, [r4, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806DFE2:
	cmp r5, #0
	beq _0806DFF8
	subs r0, r4, #4
	ldr r1, [r0]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r2, sp
	bl sub_806E038
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806DFF8:
	mov r5, sp
	lsls r0, r3, #0x10
	movs r1, #0
	adds r6, r0, #0
	cmp r6, #0
	ble _0806E01C
_0806E004:
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_806E1AC
	adds r4, #1
	lsls r4, r4, #0x10
	adds r5, #0x14
	lsrs r1, r4, #0x10
	cmp r4, r6
	blt _0806E004
_0806E01C:
	add sp, #0x144
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E02C: .4byte gCurTask
_0806E030: .4byte gUnknown_08C878E8
_0806E034: .4byte 0xFFF80000

	thumb_func_start sub_806E038
sub_806E038: @ 0x0806E038
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	str r2, [sp, #0x28]
	ldr r2, _0806E118 @ =gCurTask
	ldr r2, [r2]
	ldrh r3, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	str r2, [sp, #0x2c]
	adds r5, r1, #0
	movs r1, #0
	str r1, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806E06E
	b _0806E196
_0806E06E:
	ldr r4, _0806E11C @ =IWRAM_START + 0x914
	adds r4, r4, r3
	mov sl, r4
	mov r7, sp
_0806E076:
	movs r6, #0
	ldrsh r0, [r5, r6]
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #8
	adds r1, r1, r5
	mov sb, r1
	cmp r0, #0
	bne _0806E08E
	b _0806E186
_0806E08E:
	movs r2, #2
	ldrsh r0, [r5, r2]
	lsls r0, r0, #0x10
	str r0, [sp]
	movs r3, #4
	ldrsh r0, [r5, r3]
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #6
	ldrsb r0, [r5, r0]
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r1, #0
	movs r0, #8
	strh r0, [r7, #0xc]
	strh r0, [r7, #0xe]
	strh r1, [r7, #0x10]
	movs r0, #5
	strh r0, [r7, #0x12]
	add r4, sp, #0x14
	ldr r6, [sp, #0x2c]
	ldr r2, [r6]
	adds r0, r4, #0
	mov r1, sp
	bl sub_806CB84
	lsls r0, r0, #0x10
	adds r6, r4, #0
	cmp r0, #0
	beq _0806E186
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xf
	bgt _0806E120
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, [sp, #0x28]
	adds r2, r0, r3
	adds r1, r2, #0
	adds r0, r6, #0
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldm r0!, {r4, r6}
	stm r1!, {r4, r6}
	movs r1, #0
	ldrsh r0, [r5, r1]
	mov r3, sl
	adds r1, r3, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #2
	bgt _0806E100
	movs r0, #7
	ldrsb r0, [r5, r0]
	adds r0, #1
_0806E100:
	strh r0, [r2]
	mov r4, r8
	lsls r0, r4, #0x10
	movs r6, #0x80
	lsls r6, r6, #9
	adds r0, r0, r6
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r5, #8
	mov sb, r5
	b _0806E186
	.align 2, 0
_0806E118: .4byte gCurTask
_0806E11C: .4byte IWRAM_START + 0x914
_0806E120:
	movs r3, #0
	ldr r2, [sp, #0x28]
	ldr r4, _0806E178 @ =0x00007FFF
_0806E126:
	movs r0, #4
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _0806E136
	ldrh r4, [r2, #4]
	str r2, [sp, #0x30]
_0806E136:
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r2, #0x14
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0806E126
	movs r2, #4
	ldrsh r1, [r6, r2]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0806E186
	ldr r1, [sp, #0x30]
	adds r0, r6, #0
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r4, #0
	ldrsh r0, [r5, r4]
	mov r6, sl
	adds r1, r6, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #2
	ble _0806E17C
	ldr r1, [sp, #0x30]
	strh r0, [r1]
	b _0806E186
	.align 2, 0
_0806E178: .4byte 0x00007FFF
_0806E17C:
	movs r0, #7
	ldrsb r0, [r5, r0]
	adds r0, #1
	ldr r2, [sp, #0x30]
	strh r0, [r2]
_0806E186:
	mov r5, sb
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806E196
	b _0806E076
_0806E196:
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806E1AC
sub_806E1AC: @ 0x0806E1AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0806E268 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov sl, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, sl
	adds r3, r1, r0
	ldr r2, [r3]
	mov r8, r2
	mov r5, sb
	lsls r5, r5, #0x10
	mov ip, r5
	asrs r2, r5, #0x10
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r7, #0xda
	lsls r7, r7, #1
	adds r1, r0, r7
	adds r6, r3, r1
	ldr r1, _0806E26C @ =0x000004B4
	adds r0, r0, r1
	adds r0, r3, r0
	str r0, [sp]
	ldrh r7, [r4]
	mov r5, sp
	strh r7, [r5, #4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #2
	ble _0806E274
	adds r0, r7, #0
	subs r0, #3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r3
	adds r0, r6, #0
	adds r1, #0xf4
	ldm r1!, {r3, r5, r7}
	stm r0!, {r3, r5, r7}
	ldm r1!, {r3, r5, r7}
	stm r0!, {r3, r5, r7}
	ldm r1!, {r3, r5, r7}
	stm r0!, {r3, r5, r7}
	ldm r1!, {r3, r5, r7}
	stm r0!, {r3, r5, r7}
	movs r0, #0x83
	lsls r0, r0, #5
	adds r1, r0, #0
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r6, #0x10]
	ldrh r0, [r4, #2]
	strh r0, [r6, #0x16]
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	movs r2, #4
	ldrsh r1, [r4, r2]
	ldr r0, _0806E270 @ =0x000005CC
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r0, #0xf
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r3, r5, #0
	cmp r1, r0
	bge _0806E260
	movs r7, #0xd0
	lsls r7, r7, #2
	adds r3, r7, #0
_0806E260:
	strh r3, [r6, #0x1a]
	mov r5, ip
	b _0806E374
	.align 2, 0
_0806E268: .4byte gCurTask
_0806E26C: .4byte 0x000004B4
_0806E270: .4byte 0x000005CC
_0806E274:
	movs r3, #6
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0806E298
	ldr r2, _0806E290 @ =IWRAM_START + 0x94
	add r2, sl
	cmp r1, #1
	bne _0806E288
	ldr r2, _0806E294 @ =IWRAM_START+4
	add r2, sl
_0806E288:
	ldrh r5, [r4, #2]
	mov sl, r5
	ldrh r3, [r4, #4]
	b _0806E324
	.align 2, 0
_0806E290: .4byte IWRAM_START + 0x94
_0806E294: .4byte IWRAM_START+4
_0806E298:
	ldr r1, [sp]
	ldr r0, _0806E3A4 @ =IWRAM_START + 0x64
	add r0, sl
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	movs r7, #0x83
	lsls r7, r7, #5
	adds r1, r7, #0
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xc
	orrs r0, r1
	ldr r1, [sp]
	str r0, [r1, #0x10]
	ldrh r0, [r4, #2]
	strh r0, [r1, #0x16]
	movs r2, #4
	ldrsh r0, [r4, r2]
	movs r1, #0x78
	subs r1, r1, r0
	asrs r1, r1, #5
	movs r0, #0xd
	subs r0, r0, r1
	asrs r0, r0, #1
	ldrh r3, [r4, #4]
	adds r0, r0, r3
	ldr r5, [sp]
	strh r0, [r5, #0x18]
	movs r7, #4
	ldrsh r1, [r4, r7]
	ldr r0, _0806E3A8 @ =0x000005CC
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #0xf
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r2, r3, #0
	cmp r1, r0
	bge _0806E2FC
	movs r5, #0xe0
	lsls r5, r5, #2
	adds r2, r5, #0
_0806E2FC:
	ldr r7, [sp]
	strh r2, [r7, #0x1a]
	ldr r0, [sp]
	bl sub_806CD68
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r2, _0806E3AC @ =IWRAM_START + 0xC4
	add r2, sl
	cmp r0, #1
	bne _0806E316
	ldr r2, _0806E3B0 @ =IWRAM_START + 0x34
	add r2, sl
_0806E316:
	ldrh r3, [r4, #2]
	mov sl, r3
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806E324:
	adds r1, r6, #0
	adds r0, r2, #0
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	mov r5, sb
	lsls r2, r5, #0x10
	movs r0, #0x83
	lsls r0, r0, #0x15
	orrs r0, r2
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r6, #0x10]
	mov r7, sl
	strh r7, [r6, #0x16]
	strh r3, [r6, #0x18]
	movs r0, #4
	ldrsh r1, [r4, r0]
	ldr r0, _0806E3A8 @ =0x000005CC
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r0, #0xf
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r3, r5, #0
	adds r5, r2, #0
	cmp r1, r0
	bge _0806E372
	movs r7, #0xd0
	lsls r7, r7, #2
	adds r3, r7, #0
_0806E372:
	strh r3, [r6, #0x1a]
_0806E374:
	adds r0, r6, #0
	bl sub_806CD68
	asrs r0, r5, #0xb
	ldr r1, _0806E3B4 @ =gUnknown_03004D96
	adds r0, r0, r1
	ldrh r1, [r4, #0xc]
	strh r1, [r0]
	adds r0, #8
	ldrh r1, [r4, #0xe]
	strh r1, [r0]
	adds r0, #8
	ldrh r1, [r4, #0x10]
	strh r1, [r0]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #8]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E3A4: .4byte IWRAM_START + 0x64
_0806E3A8: .4byte 0x000005CC
_0806E3AC: .4byte IWRAM_START + 0xC4
_0806E3B0: .4byte IWRAM_START + 0x34
_0806E3B4: .4byte gUnknown_03004D96

	thumb_func_start sub_806E3B8
sub_806E3B8: @ 0x0806E3B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r3, r0, #0
	ldr r0, [r3, #8]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	mov r8, r2
	ldr r0, [r3, #0xc]
	ldrh r0, [r0, #6]
	ldr r4, _0806E410 @ =IWRAM_START + 0xA8
	adds r2, r0, r4
	ldr r2, [r2]
	str r2, [sp]
	ldr r7, _0806E414 @ =IWRAM_START + 0xAC
	adds r2, r0, r7
	ldr r2, [r2]
	str r2, [sp, #4]
	ldr r2, _0806E418 @ =IWRAM_START + 0xB0
	adds r0, r0, r2
	movs r7, #0
	ldrsh r4, [r0, r7]
	str r4, [sp, #8]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806E420
	ldr r1, _0806E41C @ =0x000005A4
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #8
	ble _0806E40C
	movs r1, #8
_0806E40C:
	adds r0, r1, #0
	b _0806E422
	.align 2, 0
_0806E410: .4byte IWRAM_START + 0xA8
_0806E414: .4byte IWRAM_START + 0xAC
_0806E418: .4byte IWRAM_START + 0xB0
_0806E41C: .4byte 0x000005A4
_0806E420:
	lsrs r0, r2, #0x10
_0806E422:
	lsls r0, r0, #0x10
	movs r1, #0
	str r0, [sp, #0x10]
	cmp r0, #0
	ble _0806E4B8
	ldr r4, _0806E4EC @ =0x000003FF
	mov sl, r4
	ldr r7, _0806E4F0 @ =gSineTable
	mov sb, r7
_0806E434:
	lsls r3, r1, #0x10
	asrs r3, r3, #0x10
	lsls r5, r3, #2
	adds r5, r5, r3
	lsls r5, r5, #2
	ldr r0, _0806E4F4 @ =0x00000874
	adds r5, r5, r0
	add r5, r8
	ldr r1, [sp]
	str r1, [r5]
	ldr r2, [sp, #4]
	str r2, [r5, #4]
	mov r4, sp
	ldrh r4, [r4, #8]
	strh r4, [r5, #8]
	str r3, [sp, #0xc]
	bl Random
	mov r4, sl
	ands r4, r0
	bl Random
	movs r6, #0x7f
	ands r6, r0
	adds r6, #0x40
	bl Random
	mov r2, sl
	ands r2, r0
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r2, r0
	lsls r0, r4, #1
	add r0, sb
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r1, r1, #2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #1
	add r4, sb
	movs r7, #0
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	muls r1, r6, r1
	asrs r1, r1, #0x10
	muls r0, r6, r0
	asrs r0, r0, #0x10
	strh r1, [r5, #0xa]
	strh r0, [r5, #0xc]
	strh r2, [r5, #0xe]
	ldr r0, _0806E4F8 @ =0x0000FF80
	strh r0, [r5, #0x10]
	movs r0, #1
	strb r0, [r5, #0x12]
	movs r0, #0
	strb r0, [r5, #0x13]
	ldr r3, [sp, #0xc]
	adds r3, #1
	lsls r3, r3, #0x10
	lsrs r1, r3, #0x10
	ldr r2, [sp, #0x10]
	cmp r3, r2
	blt _0806E434
_0806E4B8:
	lsls r3, r1, #0x10
	asrs r0, r3, #0x10
	cmp r0, #7
	bgt _0806E4DC
	ldr r4, _0806E4F4 @ =0x00000874
	movs r2, #0
_0806E4C4:
	asrs r0, r3, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	add r1, r8
	strb r2, [r1, #0x12]
	adds r0, #1
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	cmp r0, #7
	ble _0806E4C4
_0806E4DC:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E4EC: .4byte 0x000003FF
_0806E4F0: .4byte gSineTable
_0806E4F4: .4byte 0x00000874
_0806E4F8: .4byte 0x0000FF80

	thumb_func_start sub_806E4FC
sub_806E4FC: @ 0x0806E4FC
	push {r4, r5, lr}
	ldr r0, [r0, #8]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r2, #0
_0806E50A:
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0806E580 @ =0x00000874
	adds r0, r0, r1
	adds r3, r5, r0
	ldrb r0, [r3, #0x12]
	cmp r0, #0
	beq _0806E56C
	movs r0, #0xa
	ldrsh r1, [r3, r0]
	lsls r1, r1, #8
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	lsls r1, r1, #8
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0xe]
	ldrh r1, [r3, #8]
	adds r0, r0, r1
	movs r4, #0
	movs r1, #0
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0806E554
	strh r1, [r3, #8]
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	strh r0, [r3, #0xe]
_0806E554:
	ldrh r0, [r3, #0x10]
	ldrh r1, [r3, #0xe]
	adds r0, r0, r1
	strh r0, [r3, #0xe]
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _0806E56C
	strb r4, [r3, #0x12]
_0806E56C:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r2, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0806E50A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E580: .4byte 0x00000874

	thumb_func_start sub_806E584
sub_806E584: @ 0x0806E584
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r2, _0806E66C @ =gCurTask
	ldr r2, [r2]
	ldrh r2, [r2, #6]
	mov sb, r2
	movs r2, #0xc0
	lsls r2, r2, #0x12
	add r2, sb
	ldr r3, [r2]
	mov r8, r3
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	ldr r7, _0806E670 @ =0x000007B4
	adds r0, r0, r7
	adds r5, r2, r0
	ldr r0, [r1]
	str r0, [sp]
	ldr r0, [r1, #4]
	str r0, [sp, #4]
	movs r3, #8
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	str r0, [sp, #8]
	mov r0, sp
	movs r3, #0
	movs r1, #8
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r3, [r0, #0x10]
	mov r1, sp
	movs r0, #5
	strh r0, [r1, #0x12]
	add r4, sp, #0x14
	ldr r2, [r2]
	adds r0, r4, #0
	bl sub_806CB84
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0806E65C
	movs r0, #2
	ldrsh r7, [r4, r0]
	mov ip, r7
	movs r1, #4
	ldrsh r2, [r4, r1]
	movs r3, #6
	ldrsh r0, [r4, r3]
	subs r2, r2, r0
	mov sl, r2
	adds r1, r5, #0
	ldr r0, _0806E674 @ =IWRAM_START + 0x34
	add r0, sb
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	adds r6, #0x10
	ldr r0, _0806E678 @ =0x000C1060
	orrs r0, r6
	str r0, [r5, #0x10]
	mov r7, ip
	strh r7, [r5, #0x16]
	mov r0, sl
	strh r0, [r5, #0x18]
	movs r2, #4
	ldrsh r1, [r4, r2]
	ldr r0, _0806E67C @ =0x000005CC
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r0, #0xf
	movs r7, #0xc0
	lsls r7, r7, #1
	adds r2, r7, #0
	cmp r1, r0
	bge _0806E63A
	movs r0, #0xd0
	lsls r0, r0, #2
	adds r2, r0, #0
_0806E63A:
	strh r2, [r5, #0x1a]
	adds r0, r5, #0
	bl sub_806CD68
	lsls r0, r6, #5
	ldr r1, _0806E680 @ =gUnknown_03004D96
	adds r0, r0, r1
	ldrh r1, [r4, #0xc]
	strh r1, [r0]
	adds r0, #8
	ldrh r1, [r4, #0xe]
	strh r1, [r0]
	adds r0, #8
	ldrh r1, [r4, #0x10]
	strh r1, [r0]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #8]
_0806E65C:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E66C: .4byte gCurTask
_0806E670: .4byte 0x000007B4
_0806E674: .4byte IWRAM_START + 0x34
_0806E678: .4byte 0x000C1060
_0806E67C: .4byte 0x000005CC
_0806E680: .4byte gUnknown_03004D96

	thumb_func_start sub_806E684
sub_806E684: @ 0x0806E684
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r1, _0806E6D4 @ =gUnknown_080DF6CC
	add r0, sp, #4
	movs r2, #0xe
	bl memcpy
	ldr r0, _0806E6D8 @ =sub_806D9B4
	ldr r1, _0806E6DC @ =0x00000A5C
	movs r2, #0xb0
	lsls r2, r2, #8
	movs r5, #0
	str r5, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	str r4, [r1]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r4, r4, r1
	ldrb r1, [r4]
	lsls r1, r1, #1
	add r1, sp
	adds r1, #4
	ldrh r3, [r1]
	ldr r4, _0806E6E0 @ =gUnknown_03000A58
	adds r1, r2, r4
	strh r3, [r1]
	ldr r1, _0806E6E4 @ =gUnknown_03000A5A
	adds r2, r2, r1
	strh r5, [r2]
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806E6D4: .4byte gUnknown_080DF6CC
_0806E6D8: .4byte sub_806D9B4
_0806E6DC: .4byte 0x00000A5C
_0806E6E0: .4byte gUnknown_03000A58
_0806E6E4: .4byte gUnknown_03000A5A

	thumb_func_start sub_806E6E8
sub_806E6E8: @ 0x0806E6E8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x38
	mov sb, r0
	ldr r1, _0806E7A8 @ =gUnknown_080DF768
	add r0, sp, #0x18
	movs r2, #0xe
	bl memcpy
	add r6, sp, #0x28
	ldr r1, _0806E7AC @ =gUnknown_080DF776
	adds r0, r6, #0
	movs r2, #0xe
	bl memcpy
	ldr r0, _0806E7B0 @ =sub_806EA04
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #8
	ldr r3, _0806E7B4 @ =sub_806EBF4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	mov sl, r0
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r5, #0xc0
	lsls r5, r5, #0x12
	add r5, r8
	mov r1, sb
	str r1, [r5]
	movs r4, #0
	str r4, [r5, #4]
	str r4, [r5, #8]
	str r4, [r5, #0xc]
	ldr r0, _0806E7B8 @ =IWRAM_START + 0x10
	add r0, r8
	movs r2, #0xb7
	lsls r2, r2, #3
	add sb, r2
	mov r2, sb
	ldrb r1, [r2]
	lsls r1, r1, #1
	adds r6, r6, r1
	ldrb r3, [r6]
	movs r1, #0x80
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #1
	movs r2, #0x10
	bl sub_806CEC4
	ldr r0, _0806E7BC @ =IWRAM_START + 0x50
	add r8, r0
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, sp
	adds r0, #0x18
	ldrb r3, [r0]
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r0, r8
	movs r1, #0
	movs r2, #7
	bl sub_806CEC4
	adds r0, r5, #0
	bl sub_806E7C0
	mov r0, sl
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806E7A8: .4byte gUnknown_080DF768
_0806E7AC: .4byte gUnknown_080DF776
_0806E7B0: .4byte sub_806EA04
_0806E7B4: .4byte sub_806EBF4
_0806E7B8: .4byte IWRAM_START + 0x10
_0806E7BC: .4byte IWRAM_START + 0x50

	thumb_func_start sub_806E7C0
sub_806E7C0: @ 0x0806E7C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldr r7, [r0]
	ldr r1, _0806E808 @ =0x000005CC
	adds r0, r7, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r3, #0xba
	lsls r3, r3, #3
	adds r1, r7, r3
	ldrb r1, [r1]
	subs r0, r0, r1
	lsls r6, r0, #0x10
	movs r0, #0xa0
	lsls r0, r0, #2
	bl EwramMalloc
	mov r1, r8
	str r0, [r1, #0xc]
	movs r5, #0
	adds r4, r0, #0
_0806E7F2:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xba
	lsls r2, r2, #3
	adds r1, r7, r2
	ldrb r1, [r1]
	subs r1, r0, r1
	cmp r1, #0
	bne _0806E80C
	str r1, [r4]
	b _0806E814
	.align 2, 0
_0806E808: .4byte 0x000005CC
_0806E80C:
	adds r0, r6, #0
	bl __divsi3
	str r0, [r4]
_0806E814:
	lsls r0, r5, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r4, #4
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0806E7F2
	movs r0, #0xa0
	lsls r0, r0, #2
	bl EwramMalloc
	mov r1, r8
	str r0, [r1, #8]
	movs r5, #0
	adds r4, r0, #0
_0806E836:
	lsls r2, r5, #0x10
	asrs r1, r2, #0x10
	movs r3, #0xba
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrb r0, [r0]
	subs r0, r1, r0
	adds r5, r2, #0
	cmp r6, #0
	bne _0806E84E
	str r6, [r4]
	b _0806E856
_0806E84E:
	adds r1, r6, #0
	bl __divsi3
	str r0, [r4]
_0806E856:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	adds r4, #4
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0806E836
	ldr r2, _0806E930 @ =0x000005D1
	adds r0, r7, r2
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, #0x94
	adds r5, r7, r0
	ldr r3, _0806E934 @ =0x000005CE
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r3, r1, #0x10
	cmp r1, #0x9f
	bgt _0806E8D6
	mov r1, r8
	ldr r1, [r1, #0xc]
	mov sb, r1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r2, #7
	adds r2, r2, r7
	mov ip, r2
	ldr r0, _0806E938 @ =0x000005CC
	adds r6, r7, r0
_0806E892:
	asrs r3, r3, #0x10
	lsls r0, r3, #2
	add r0, sb
	ldr r0, [r0]
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #8
	mov r1, ip
	movs r7, #0
	ldrsh r0, [r1, r7]
	rsbs r0, r0, #0
	adds r1, r0, #0
	muls r1, r2, r1
	movs r7, #0
	ldrsh r0, [r6, r7]
	subs r0, r3, r0
	muls r2, r0, r2
	lsls r1, r1, #1
	rsbs r1, r1, #0
	asrs r1, r1, #8
	adds r0, r1, #0
	muls r0, r4, r0
	stm r5!, {r0}
	lsls r2, r2, #2
	rsbs r2, r2, #0
	asrs r2, r2, #8
	adds r0, r2, #0
	muls r0, r4, r0
	stm r5!, {r0}
	adds r3, #1
	lsls r3, r3, #0x10
	asrs r0, r3, #0x10
	cmp r0, #0x9f
	ble _0806E892
_0806E8D6:
	movs r0, #0xa0
	lsls r0, r0, #4
	bl EwramMalloc
	mov r1, r8
	str r0, [r1, #4]
	ldr r1, _0806E93C @ =gUnknown_03001884
	str r0, [r1]
	ldr r1, _0806E940 @ =gUnknown_03004D54
	str r0, [r1]
	ldr r1, _0806E944 @ =gUnknown_030022C0
	str r0, [r1]
	adds r4, r0, #0
	ldr r1, _0806E948 @ =gUnknown_080DF784
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	movs r5, #0
_0806E8FC:
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0x10
	bl memcpy
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #8
	strh r1, [r4, #4]
	adds r0, #1
	lsls r0, r0, #0x10
	adds r4, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0806E8FC
	mov r0, r8
	bl sub_806E94C
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E930: .4byte 0x000005D1
_0806E934: .4byte 0x000005CE
_0806E938: .4byte 0x000005CC
_0806E93C: .4byte gUnknown_03001884
_0806E940: .4byte gUnknown_03004D54
_0806E944: .4byte gUnknown_030022C0
_0806E948: .4byte gUnknown_080DF784

	thumb_func_start sub_806E94C
sub_806E94C: @ 0x0806E94C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r2, _0806E9F4 @ =gUnknown_08C87920
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _0806E9F8 @ =gUnknown_080DF6DC
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r2, r0
	bge _0806E9E8
	movs r1, #0
	mov sb, r1
	movs r5, #0
	adds r7, r0, #0
_0806E982:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x90
	adds r2, r6, r0
	ldr r0, _0806E9FC @ =gUnknown_03005B5C
	ldr r0, [r0]
	str r0, [r2, #4]
	strh r5, [r2, #8]
	lsls r1, r4, #2
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #0xc
	str r0, [r2, #0x10]
	strh r5, [r2, #0x16]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	strh r5, [r2, #0x1c]
	ldr r0, _0806EA00 @ =0x0000FFFF
	strh r0, [r2, #0x1e]
	ldrh r1, [r1, #2]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	mov r3, sb
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	bl sub_80036E0
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, r7
	blt _0806E982
_0806E9E8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E9F4: .4byte gUnknown_08C87920
_0806E9F8: .4byte gUnknown_080DF6DC
_0806E9FC: .4byte gUnknown_03005B5C
_0806EA00: .4byte 0x0000FFFF

	thumb_func_start sub_806EA04
sub_806EA04: @ 0x0806EA04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0806EB44 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r7, [r4]
	ldr r1, _0806EB48 @ =gUnknown_03002A80
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0806EB4C @ =gUnknown_03002878
	ldr r0, _0806EB50 @ =0x04000020
	str r0, [r1]
	ldr r0, _0806EB54 @ =gUnknown_03001884
	ldr r3, [r4, #4]
	str r3, [r0]
	movs r1, #0xb4
	lsls r1, r1, #3
	adds r0, r7, r1
	ldrh r1, [r0]
	ldr r2, _0806EB58 @ =gSineTable
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #2
	mov ip, r0
	ldr r5, _0806EB5C @ =0x000005CE
	adds r0, r7, r5
	ldrh r0, [r0]
	mov r8, r0
	ldr r2, _0806EB60 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0806EB64 @ =0x000005D1
	adds r0, r7, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r6, r3, r0
	lsls r5, r1, #0x10
	cmp r1, #0x9f
	bgt _0806EB2E
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r3, _0806EB68 @ =0x000005CA
	adds r3, r7, r3
	str r3, [sp, #4]
	mov r0, sb
	rsbs r0, r0, #0
	mov r8, r0
	ldr r4, [r4, #0xc]
	str r4, [sp, #0xc]
	ldr r1, _0806EB6C @ =0x000005CC
	adds r1, r7, r1
	str r1, [sp, #8]
	ldr r2, _0806EB70 @ =0x00000594
	adds r2, r2, r7
	mov sl, r2
_0806EA9E:
	asrs r5, r5, #0x10
	lsls r0, r5, #2
	ldr r3, [sp, #0xc]
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r4, [sp]
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r1, r2, #8
	ldr r3, [sp, #4]
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	adds r3, r0, #0
	muls r3, r1, r3
	str r3, [sp, #0x10]
	ldr r4, [sp, #8]
	movs r3, #0
	ldrsh r0, [r4, r3]
	subs r0, r5, r0
	adds r3, r0, #0
	muls r3, r1, r3
	lsls r3, r3, #1
	asrs r2, r2, #0x10
	mov r1, ip
	muls r1, r2, r1
	asrs r1, r1, #0x10
	strh r1, [r6]
	adds r6, #2
	mov r0, sb
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r6]
	adds r6, #2
	mov r0, r8
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r6]
	adds r6, #2
	strh r1, [r6]
	adds r6, #2
	asrs r3, r3, #0x10
	mov r2, sb
	muls r2, r3, r2
	ldr r0, [sp, #0x10]
	asrs r4, r0, #0x10
	mov r0, ip
	muls r0, r4, r0
	adds r2, r2, r0
	mov r1, sl
	ldr r0, [r1]
	adds r2, r2, r0
	mov r1, r8
	muls r1, r4, r1
	mov r0, ip
	muls r0, r3, r0
	adds r1, r1, r0
	movs r3, #0xb3
	lsls r3, r3, #3
	adds r0, r7, r3
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r2, r2, #8
	str r2, [r6]
	asrs r1, r1, #8
	str r1, [r6, #4]
	adds r6, #8
	adds r5, #1
	lsls r5, r5, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0x9f
	ble _0806EA9E
_0806EB2E:
	bl sub_806EB74
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB44: .4byte gCurTask
_0806EB48: .4byte gUnknown_03002A80
_0806EB4C: .4byte gUnknown_03002878
_0806EB50: .4byte 0x04000020
_0806EB54: .4byte gUnknown_03001884
_0806EB58: .4byte gSineTable
_0806EB5C: .4byte 0x000005CE
_0806EB60: .4byte gFlags
_0806EB64: .4byte 0x000005D1
_0806EB68: .4byte 0x000005CA
_0806EB6C: .4byte 0x000005CC
_0806EB70: .4byte 0x00000594

	thumb_func_start sub_806EB74
sub_806EB74: @ 0x0806EB74
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806EBE4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r1, [r7]
	movs r2, #0xb7
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r2, _0806EBE8 @ =gUnknown_080DF6DC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r3, [r0]
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r2, _0806EBEC @ =gBgScrollRegs
	ldrb r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r2, #4]
	movs r0, #0x30
	strh r0, [r2, #6]
	ldr r0, _0806EBF0 @ =0x000005BA
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EBDE
	lsls r0, r3, #0x10
	movs r1, #0
	adds r6, r0, #0
	cmp r6, #0
	ble _0806EBDE
_0806EBBA:
	lsls r5, r1, #0x10
	asrs r5, r5, #0x10
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	adds r4, #0x90
	adds r4, r7, r4
	adds r0, r4, #0
	bl sub_80036E0
	adds r0, r4, #0
	bl sub_8003914
	adds r5, #1
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	cmp r5, r6
	blt _0806EBBA
_0806EBDE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EBE4: .4byte gCurTask
_0806EBE8: .4byte gUnknown_080DF6DC
_0806EBEC: .4byte gBgScrollRegs
_0806EBF0: .4byte 0x000005BA

	thumb_func_start sub_806EBF4
sub_806EBF4: @ 0x0806EBF4
	push {r4, lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0806EC08
	bl EwramFree
_0806EC08:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0806EC12
	bl EwramFree
_0806EC12:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0806EC1C
	bl EwramFree
_0806EC1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EC24
sub_806EC24: @ 0x0806EC24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	ldr r0, _0806EC5C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r0, [r6, #0xc]
	ldrh r4, [r0, #6]
	adds r5, r4, r1
	ldr r1, _0806EC60 @ =gUnknown_080DF7A0
	mov r0, sp
	movs r2, #0x48
	bl memcpy
	ldr r1, _0806EC64 @ =0x000005B4
	adds r0, r6, r1
	ldrh r0, [r0]
	cmp r0, #4
	blt _0806ECB6
	cmp r0, #6
	ble _0806EC68
	cmp r0, #7
	beq _0806EC90
	b _0806ECB6
	.align 2, 0
_0806EC5C: .4byte gCurTask
_0806EC60: .4byte gUnknown_080DF7A0
_0806EC64: .4byte 0x000005B4
_0806EC68:
	ldr r2, _0806EC88 @ =0x000005BA
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806ECB6
	ldr r3, _0806EC8C @ =IWRAM_START + 0xB4
	adds r0, r4, r3
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl _call_via_r0
	b _0806ECB6
	.align 2, 0
_0806EC88: .4byte 0x000005BA
_0806EC8C: .4byte IWRAM_START + 0xB4
_0806EC90:
	ldr r7, _0806ED20 @ =IWRAM_START + 0xB4
	adds r1, r4, r7
	ldrh r0, [r1]
	cmp r0, #0xa
	bhi _0806EC9E
	movs r0, #0xb
	strh r0, [r1]
_0806EC9E:
	ldr r2, _0806ED24 @ =0x000005BA
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806ECB6
	ldrh r0, [r1]
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl _call_via_r0
_0806ECB6:
	adds r0, r5, #0
	adds r0, #0xb4
	ldrh r0, [r0]
	cmp r0, #0xa
	bhi _0806ED62
	adds r0, r6, #0
	bl sub_806F69C
	lsls r0, r0, #0x10
	ldr r3, _0806ED28 @ =gSineTable
	lsrs r4, r0, #0x10
	mov ip, r4
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r3
	movs r7, #0
	ldrsh r2, [r1, r7]
	lsls r4, r2, #2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r3, r1, #2
	lsls r2, r2, #4
	adds r2, r2, r4
	lsls r1, r1, #4
	adds r1, r1, r3
	asrs r2, r2, #0xe
	adds r2, #0x70
	asrs r1, r1, #0xf
	rsbs r1, r1, #0
	adds r1, #0x78
	adds r3, r5, #0
	adds r3, #0x7e
	strh r2, [r3]
	adds r2, r5, #0
	adds r2, #0x80
	strh r1, [r2]
	ldr r4, _0806ED2C @ =0xFFFFFEFF
	adds r0, r0, r4
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0806ED30
	adds r1, r5, #0
	adds r1, #0x82
	movs r0, #0
	b _0806ED38
	.align 2, 0
_0806ED20: .4byte IWRAM_START + 0xB4
_0806ED24: .4byte 0x000005BA
_0806ED28: .4byte gSineTable
_0806ED2C: .4byte 0xFFFFFEFF
_0806ED30:
	adds r1, r5, #0
	adds r1, #0x82
	movs r0, #0xa0
	lsls r0, r0, #2
_0806ED38:
	strh r0, [r1]
	mov r0, ip
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	movs r3, #0x1e
	bl sub_80047A0
	ldr r7, _0806EDA8 @ =0x000005BA
	adds r0, r6, r7
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x68
	cmp r0, #0
	bne _0806ED5C
	adds r0, r4, #0
	bl sub_8004558
_0806ED5C:
	adds r0, r4, #0
	bl sub_80051E8
_0806ED62:
	bl sub_806FAA0
	ldr r0, _0806EDAC @ =0x00000594
	adds r1, r6, r0
	adds r3, r5, #0
	adds r3, #0xa8
	ldr r0, [r3]
	str r0, [r1]
	movs r2, #0xb3
	lsls r2, r2, #3
	adds r1, r6, r2
	adds r2, r5, #0
	adds r2, #0xac
	ldr r0, [r2]
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xb2
	ldrh r1, [r0]
	movs r4, #0xb4
	lsls r4, r4, #3
	adds r0, r6, r4
	strh r1, [r0]
	ldr r1, _0806EDB0 @ =gBgScrollRegs
	movs r7, #2
	ldrsh r0, [r2, r7]
	rsbs r0, r0, #0
	strh r0, [r1, #0xa]
	movs r2, #2
	ldrsh r0, [r3, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #8]
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDA8: .4byte 0x000005BA
_0806EDAC: .4byte 0x00000594
_0806EDB0: .4byte gBgScrollRegs

	thumb_func_start sub_806EDB4
sub_806EDB4: @ 0x0806EDB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806EE30 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	adds r1, r1, r4
	mov ip, r1
	ldr r0, _0806EE34 @ =IWRAM_START + 0xC8
	adds r5, r4, r0
	ldr r3, [r5]
	ldr r1, _0806EE38 @ =IWRAM_START + 0xE4
	adds r0, r4, r1
	ldr r6, [r0]
	ldr r2, _0806EE3C @ =IWRAM_START + 0xB2
	adds r0, r4, r2
	ldrh r1, [r0]
	ldr r2, _0806EE40 @ =gSineTable
	lsls r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	movs r7, #0
	ldrsh r0, [r0, r7]
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r7, [r1, r2]
	ldr r0, _0806EE44 @ =gInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0806EE74
	ldr r1, _0806EE48 @ =IWRAM_START + 0xD8
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r3, r6
	bge _0806EE56
	adds r0, r3, r0
	cmp r0, r6
	bge _0806EE50
	str r0, [r5]
	adds r3, r0, #0
	movs r0, #0x8c
	lsls r0, r0, #6
	cmp r3, r0
	bgt _0806EE62
	ldr r0, _0806EE4C @ =IWRAM_START + 0xB4
	adds r1, r4, r0
	b _0806EF0C
	.align 2, 0
_0806EE30: .4byte gCurTask
_0806EE34: .4byte IWRAM_START + 0xC8
_0806EE38: .4byte IWRAM_START + 0xE4
_0806EE3C: .4byte IWRAM_START + 0xB2
_0806EE40: .4byte gSineTable
_0806EE44: .4byte gInput
_0806EE48: .4byte IWRAM_START + 0xD8
_0806EE4C: .4byte IWRAM_START + 0xB4
_0806EE50:
	str r6, [r5]
	adds r3, r6, #0
	b _0806EE62
_0806EE56:
	ldr r1, _0806EE6C @ =IWRAM_START + 0xDC
	adds r0, r4, r1
	ldr r0, [r0]
	adds r0, r3, r0
	str r0, [r5]
	adds r3, r0, #0
_0806EE62:
	ldr r2, _0806EE70 @ =IWRAM_START + 0xB4
	adds r1, r4, r2
	movs r0, #2
	b _0806EF0E
	.align 2, 0
_0806EE6C: .4byte IWRAM_START + 0xDC
_0806EE70: .4byte IWRAM_START + 0xB4
_0806EE74:
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0806EECE
	ldr r1, _0806EE98 @ =IWRAM_START + 0xE0
	adds r0, r4, r1
	ldr r6, [r0]
	ldr r0, _0806EE9C @ =IWRAM_START + 0xB4
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806EEA0
	movs r0, #7
	strh r0, [r1]
	b _0806EF38
	.align 2, 0
_0806EE98: .4byte IWRAM_START + 0xE0
_0806EE9C: .4byte IWRAM_START + 0xB4
_0806EEA0:
	adds r0, r3, r6
	cmp r0, #0
	ble _0806EEAC
	str r0, [r5]
	adds r3, r0, #0
	b _0806EEB0
_0806EEAC:
	str r2, [r5]
	movs r3, #0
_0806EEB0:
	cmp r3, #0
	bne _0806EEC4
	mov r0, ip
	adds r0, #0xa4
	strh r3, [r0]
	mov r1, ip
	adds r1, #0xb4
	movs r0, #8
	strh r0, [r1]
	b _0806EF18
_0806EEC4:
	mov r1, ip
	adds r1, #0xb4
	movs r0, #3
	strh r0, [r1]
	b _0806EF18
_0806EECE:
	ldr r2, _0806EEE0 @ =IWRAM_START + 0xDC
	adds r0, r4, r2
	ldr r0, [r0]
	adds r0, r3, r0
	cmp r0, #0
	ble _0806EEE4
	str r0, [r5]
	adds r3, r0, #0
	b _0806EEE8
	.align 2, 0
_0806EEE0: .4byte IWRAM_START + 0xDC
_0806EEE4:
	str r1, [r5]
	movs r3, #0
_0806EEE8:
	cmp r3, #0
	bne _0806EEF8
	mov r0, ip
	adds r0, #0xa4
	strh r3, [r0]
	adds r0, #0x10
	strh r3, [r0]
	b _0806EF18
_0806EEF8:
	movs r0, #0x8c
	lsls r0, r0, #6
	cmp r3, r0
	ble _0806EF08
	mov r1, ip
	adds r1, #0xb4
	movs r0, #2
	b _0806EF0E
_0806EF08:
	mov r1, ip
	adds r1, #0xb4
_0806EF0C:
	movs r0, #1
_0806EF0E:
	strh r0, [r1]
	asrs r1, r3, #9
	mov r0, ip
	adds r0, #0xa4
	strh r1, [r0]
_0806EF18:
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r7, #0
	muls r2, r3, r2
	asrs r2, r2, #0xa
	mov r3, ip
	adds r3, #0xa8
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	mov r1, ip
	adds r1, #0xac
	ldr r0, [r1]
	subs r0, r0, r2
	str r0, [r1]
_0806EF38:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EF44
sub_806EF44: @ 0x0806EF44
	push {r4, r5, lr}
	ldr r0, _0806EFA0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r3, [r0, #6]
	ldr r0, _0806EFA4 @ =IWRAM_START + 0xB2
	adds r4, r3, r0
	ldrh r1, [r4]
	ldr r0, _0806EFA8 @ =gInput
	ldrh r2, [r0]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	beq _0806EF98
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0806EF7E
	ldr r5, _0806EFAC @ =IWRAM_START + 0xCC
	adds r0, r3, r5
	ldr r0, [r0]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0806EF7E:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806EF92
	ldr r2, _0806EFAC @ =IWRAM_START + 0xCC
	adds r0, r3, r2
	ldr r0, [r0]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0806EF92:
	ldr r0, _0806EFB0 @ =0x000003FF
	ands r1, r0
	strh r1, [r4]
_0806EF98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EFA0: .4byte gCurTask
_0806EFA4: .4byte IWRAM_START + 0xB2
_0806EFA8: .4byte gInput
_0806EFAC: .4byte IWRAM_START + 0xCC
_0806EFB0: .4byte 0x000003FF

	thumb_func_start sub_806EFB4
sub_806EFB4: @ 0x0806EFB4
	push {r4, lr}
	ldr r0, _0806F018 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	bl sub_806EF44
	bl sub_806F56C
	ldr r0, _0806F01C @ =IWRAM_START + 0xBA
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _0806F020 @ =IWRAM_START + 0xB8
	adds r2, r4, r3
	adds r3, #0x3a
	adds r0, r4, r3
	ldrh r0, [r0]
	ldrh r3, [r2]
	adds r0, r0, r3
	strh r0, [r2]
	ldr r2, _0806F024 @ =IWRAM_START + 0xF0
	adds r0, r4, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _0806F008
	ldr r0, _0806F028 @ =gInput
	ldr r1, _0806F02C @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0806F010
_0806F008:
	ldr r3, _0806F030 @ =IWRAM_START + 0xB4
	adds r1, r4, r3
	movs r0, #5
	strh r0, [r1]
_0806F010:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F018: .4byte gCurTask
_0806F01C: .4byte IWRAM_START + 0xBA
_0806F020: .4byte IWRAM_START + 0xB8
_0806F024: .4byte IWRAM_START + 0xF0
_0806F028: .4byte gInput
_0806F02C: .4byte gUnknown_03005B38
_0806F030: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F034
sub_806F034: @ 0x0806F034
	push {r4, lr}
	ldr r0, _0806F084 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	bl sub_806EF44
	bl sub_806F56C
	ldr r0, _0806F088 @ =IWRAM_START + 0xB8
	adds r1, r4, r0
	ldr r2, _0806F08C @ =IWRAM_START + 0xF4
	adds r0, r4, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	ldr r0, _0806F090 @ =IWRAM_START + 0xB0
	adds r2, r4, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0806F0B8
	ldr r1, _0806F094 @ =IWRAM_START + 0xC8
	adds r0, r4, r1
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r2]
	cmp r1, #0
	bgt _0806F09C
	ldr r2, _0806F098 @ =IWRAM_START + 0xB4
	adds r1, r4, r2
	movs r0, #8
	b _0806F0B6
	.align 2, 0
_0806F084: .4byte gCurTask
_0806F088: .4byte IWRAM_START + 0xB8
_0806F08C: .4byte IWRAM_START + 0xF4
_0806F090: .4byte IWRAM_START + 0xB0
_0806F094: .4byte IWRAM_START + 0xC8
_0806F098: .4byte IWRAM_START + 0xB4
_0806F09C:
	movs r0, #0x8c
	lsls r0, r0, #6
	cmp r1, r0
	bgt _0806F0B0
	ldr r0, _0806F0AC @ =IWRAM_START + 0xB4
	adds r1, r4, r0
	movs r0, #1
	b _0806F0B6
	.align 2, 0
_0806F0AC: .4byte IWRAM_START + 0xB4
_0806F0B0:
	ldr r2, _0806F0C0 @ =IWRAM_START + 0xB4
	adds r1, r4, r2
	movs r0, #2
_0806F0B6:
	strh r0, [r1]
_0806F0B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0C0: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F0C4
sub_806F0C4: @ 0x0806F0C4
	push {r4, lr}
	ldr r0, _0806F114 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	bl sub_806EF44
	bl sub_806F604
	ldr r0, _0806F118 @ =IWRAM_START + 0xB8
	adds r1, r4, r0
	ldr r2, _0806F11C @ =IWRAM_START + 0xF6
	adds r0, r4, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	ldr r0, _0806F120 @ =IWRAM_START + 0xB0
	adds r2, r4, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0806F148
	ldr r1, _0806F124 @ =IWRAM_START + 0xC8
	adds r0, r4, r1
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r2]
	cmp r1, #0
	bgt _0806F12C
	ldr r2, _0806F128 @ =IWRAM_START + 0xB4
	adds r1, r4, r2
	movs r0, #8
	b _0806F146
	.align 2, 0
_0806F114: .4byte gCurTask
_0806F118: .4byte IWRAM_START + 0xB8
_0806F11C: .4byte IWRAM_START + 0xF6
_0806F120: .4byte IWRAM_START + 0xB0
_0806F124: .4byte IWRAM_START + 0xC8
_0806F128: .4byte IWRAM_START + 0xB4
_0806F12C:
	movs r0, #0x8c
	lsls r0, r0, #6
	cmp r1, r0
	bgt _0806F140
	ldr r0, _0806F13C @ =IWRAM_START + 0xB4
	adds r1, r4, r0
	movs r0, #1
	b _0806F146
	.align 2, 0
_0806F13C: .4byte IWRAM_START + 0xB4
_0806F140:
	ldr r2, _0806F150 @ =IWRAM_START + 0xB4
	adds r1, r4, r2
	movs r0, #2
_0806F146:
	strh r0, [r1]
_0806F148:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F150: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F154
sub_806F154: @ 0x0806F154
	push {r4, lr}
	ldr r0, _0806F1C8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	bl sub_806EF44
	bl sub_806F604
	ldr r0, _0806F1CC @ =IWRAM_START + 0xA8
	adds r2, r4, r0
	adds r0, #0x28
	adds r1, r4, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0806F1D0 @ =IWRAM_START + 0xAC
	adds r2, r4, r1
	ldr r0, _0806F1D4 @ =IWRAM_START + 0xD4
	adds r1, r4, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	ldr r2, _0806F1D8 @ =IWRAM_START + 0xB8
	adds r1, r4, r2
	adds r2, #0x3c
	adds r0, r4, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	ldr r0, _0806F1DC @ =IWRAM_START + 0xB0
	adds r2, r4, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0806F1C2
	ldr r0, _0806F1E0 @ =IWRAM_START + 0xC8
	adds r1, r4, r0
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	movs r0, #0
	strh r0, [r2]
	ldr r2, _0806F1E4 @ =IWRAM_START + 0xB4
	adds r1, r4, r2
	movs r0, #1
	strh r0, [r1]
_0806F1C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F1C8: .4byte gCurTask
_0806F1CC: .4byte IWRAM_START + 0xA8
_0806F1D0: .4byte IWRAM_START + 0xAC
_0806F1D4: .4byte IWRAM_START + 0xD4
_0806F1D8: .4byte IWRAM_START + 0xB8
_0806F1DC: .4byte IWRAM_START + 0xB0
_0806F1E0: .4byte IWRAM_START + 0xC8
_0806F1E4: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F1E8
sub_806F1E8: @ 0x0806F1E8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806F23C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	ldrh r5, [r0, #6]
	ldrh r0, [r6, #4]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #4]
	ldr r0, _0806F240 @ =IWRAM_START + 0xB8
	adds r4, r5, r0
	ldr r1, _0806F244 @ =IWRAM_START + 0xFA
	adds r0, r5, r1
	ldrh r0, [r0]
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	bl sub_806F56C
	ldr r0, _0806F248 @ =IWRAM_START + 0xB0
	adds r1, r5, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bgt _0806F25C
	strh r7, [r6, #4]
	strh r7, [r4]
	strh r7, [r1]
	ldr r1, _0806F24C @ =IWRAM_START + 0xC8
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0806F254
	ldr r2, _0806F250 @ =IWRAM_START + 0xB4
	adds r1, r5, r2
	movs r0, #0xd
	b _0806F25A
	.align 2, 0
_0806F23C: .4byte gCurTask
_0806F240: .4byte IWRAM_START + 0xB8
_0806F244: .4byte IWRAM_START + 0xFA
_0806F248: .4byte IWRAM_START + 0xB0
_0806F24C: .4byte IWRAM_START + 0xC8
_0806F250: .4byte IWRAM_START + 0xB4
_0806F254:
	ldr r0, _0806F264 @ =IWRAM_START + 0xB4
	adds r1, r5, r0
	movs r0, #0xc
_0806F25A:
	strh r0, [r1]
_0806F25C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F264: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F268
sub_806F268: @ 0x0806F268
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806F2B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, #6]
	adds r1, r1, r0
	mov ip, r1
	ldr r2, _0806F2BC @ =IWRAM_START + 0xE0
	adds r1, r0, r2
	ldr r3, [r1]
	ldr r7, _0806F2C0 @ =IWRAM_START + 0xC8
	adds r5, r0, r7
	ldr r4, [r5]
	ldr r1, _0806F2C4 @ =IWRAM_START + 0xB2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r2, _0806F2C8 @ =gSineTable
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r7, #0
	ldrsh r6, [r0, r7]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r7, #0
	ldrsh r2, [r1, r7]
	adds r0, r4, r3
	cmp r0, #0
	ble _0806F2CC
	str r0, [r5]
	adds r4, r0, #0
	b _0806F2D2
	.align 2, 0
_0806F2B8: .4byte gCurTask
_0806F2BC: .4byte IWRAM_START + 0xE0
_0806F2C0: .4byte IWRAM_START + 0xC8
_0806F2C4: .4byte IWRAM_START + 0xB2
_0806F2C8: .4byte gSineTable
_0806F2CC:
	movs r0, #0
	str r0, [r5]
	movs r4, #0
_0806F2D2:
	adds r1, r6, #0
	muls r1, r4, r1
	asrs r1, r1, #0xa
	muls r2, r4, r2
	asrs r2, r2, #0xa
	mov r3, ip
	adds r3, #0xa8
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	mov r1, ip
	adds r1, #0xac
	ldr r0, [r1]
	subs r0, r0, r2
	str r0, [r1]
	cmp r4, #0
	bne _0806F2FA
	adds r1, #8
	movs r0, #0xd
	strh r0, [r1]
_0806F2FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F300
sub_806F300: @ 0x0806F300
	push {r4, r5, r6, lr}
	ldr r0, _0806F354 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	ldrh r0, [r3, #4]
	adds r0, #1
	movs r6, #0
	strh r0, [r3, #4]
	ldr r0, _0806F358 @ =IWRAM_START + 0xB8
	adds r2, r4, r0
	ldr r1, _0806F35C @ =IWRAM_START + 0xFE
	adds r0, r4, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, _0806F360 @ =IWRAM_START + 0xB0
	adds r5, r4, r0
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, _0806F364 @ =0xFFFFC000
	cmp r1, r0
	bge _0806F34C
	strh r6, [r3, #4]
	strh r6, [r2]
	movs r0, #0xc0
	lsls r0, r0, #8
	strh r0, [r5]
	ldr r0, _0806F368 @ =IWRAM_START + 0xB4
	adds r1, r4, r0
	movs r0, #0xf
	strh r0, [r1]
_0806F34C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F354: .4byte gCurTask
_0806F358: .4byte IWRAM_START + 0xB8
_0806F35C: .4byte IWRAM_START + 0xFE
_0806F360: .4byte IWRAM_START + 0xB0
_0806F364: .4byte 0xFFFFC000
_0806F368: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F36C
sub_806F36C: @ 0x0806F36C
	push {r4, lr}
	ldr r0, _0806F3B4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ldrh r3, [r0, #6]
	ldr r0, _0806F3B8 @ =IWRAM_START + 0xB2
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, #0x10
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	movs r4, #0
	strh r0, [r1]
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0806F3AE
	strh r4, [r2, #4]
	ldr r1, _0806F3BC @ =IWRAM_START + 0xC8
	adds r0, r3, r1
	str r4, [r0]
	ldr r0, _0806F3C0 @ =IWRAM_START + 0xB4
	adds r1, r3, r0
	movs r0, #8
	strh r0, [r1]
_0806F3AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F3B4: .4byte gCurTask
_0806F3B8: .4byte IWRAM_START + 0xB2
_0806F3BC: .4byte IWRAM_START + 0xC8
_0806F3C0: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F3C4
sub_806F3C4: @ 0x0806F3C4
	push {r4, r5, r6, lr}
	ldr r0, _0806F448 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	ldr r0, _0806F44C @ =IWRAM_START + 0xA8
	adds r2, r4, r0
	ldr r0, [r2]
	movs r3, #0xc0
	lsls r3, r3, #0xe
	cmp r0, r3
	bgt _0806F3E8
	str r3, [r2]
_0806F3E8:
	ldr r0, [r2]
	ldr r1, _0806F450 @ =0x3CFFFFF
	cmp r0, r1
	ble _0806F3F6
	movs r0, #0xf4
	lsls r0, r0, #0x12
	str r0, [r2]
_0806F3F6:
	ldr r6, _0806F454 @ =IWRAM_START + 0xAC
	adds r2, r4, r6
	ldr r0, [r2]
	cmp r0, r3
	bgt _0806F402
	str r3, [r2]
_0806F402:
	ldr r0, [r2]
	cmp r0, r1
	ble _0806F40E
	movs r0, #0xf4
	lsls r0, r0, #0x12
	str r0, [r2]
_0806F40E:
	ldrh r0, [r5, #4]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #4]
	ldr r0, _0806F458 @ =IWRAM_START + 0xB8
	adds r3, r4, r0
	ldr r2, _0806F45C @ =IWRAM_START + 0xFA
	adds r0, r4, r2
	ldrh r0, [r0]
	ldrh r6, [r3]
	adds r0, r0, r6
	strh r0, [r3]
	ldr r0, _0806F460 @ =IWRAM_START + 0xB0
	adds r2, r4, r0
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r0, #0
	bge _0806F442
	strh r1, [r2]
	strh r1, [r3]
	strh r1, [r5, #4]
	strh r1, [r3]
	strh r1, [r2]
	ldr r2, _0806F464 @ =IWRAM_START + 0xB4
	adds r0, r4, r2
	strh r1, [r0]
_0806F442:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F448: .4byte gCurTask
_0806F44C: .4byte IWRAM_START + 0xA8
_0806F450: .4byte 0x3CFFFFF
_0806F454: .4byte IWRAM_START + 0xAC
_0806F458: .4byte IWRAM_START + 0xB8
_0806F45C: .4byte IWRAM_START + 0xFA
_0806F460: .4byte IWRAM_START + 0xB0
_0806F464: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806F468
sub_806F468: @ 0x0806F468
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806F4F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	ldrh r3, [r0, #6]
	adds r2, r2, r3
	mov ip, r2
	ldr r2, _0806F4F4 @ =gUnknown_08C87904
	movs r0, #0xb7
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r1, _0806F4F8 @ =IWRAM_START + 0xA8
	adds r0, r3, r1
	ldrh r4, [r0, #2]
	ldr r7, _0806F4FC @ =IWRAM_START + 0xAC
	adds r0, r3, r7
	ldrh r0, [r0, #2]
	mov r8, r0
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806F560
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	ldr r1, _0806F500 @ =IWRAM_START + 0xB4
	adds r5, r3, r1
	movs r6, #0
_0806F4B8:
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r4, r0
	blt _0806F552
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	cmp r4, r0
	bge _0806F552
	mov r7, r8
	lsls r0, r7, #0x10
	asrs r3, r0, #0x10
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r3, r0
	blt _0806F552
	movs r7, #8
	ldrsh r1, [r2, r7]
	adds r0, r0, r1
	cmp r3, r0
	bge _0806F552
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0806F504
	cmp r0, #1
	beq _0806F520
	b _0806F552
	.align 2, 0
_0806F4F0: .4byte gCurTask
_0806F4F4: .4byte gUnknown_08C87904
_0806F4F8: .4byte IWRAM_START + 0xA8
_0806F4FC: .4byte IWRAM_START + 0xAC
_0806F500: .4byte IWRAM_START + 0xB4
_0806F504:
	mov r1, ip
	adds r1, #0xc8
	mov r0, ip
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #2
	strh r0, [r5]
	ldr r0, _0806F51C @ =0x00000115
	bl m4aSongNumStart
	b _0806F560
	.align 2, 0
_0806F51C: .4byte 0x00000115
_0806F520:
	mov r1, ip
	adds r1, #0xc8
	ldr r0, [r1]
	movs r2, #0xc0
	lsls r2, r2, #3
	cmp r0, r2
	bge _0806F530
	adds r0, r2, #0
_0806F530:
	str r0, [r1]
	movs r0, #9
	strh r0, [r5]
	mov r0, ip
	adds r0, #0xb0
	strh r6, [r0]
	adds r0, #0x3e
	ldrh r1, [r0]
	subs r0, #0x36
	strh r1, [r0]
	adds r0, #2
	strh r6, [r0]
	movs r0, #0x8a
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _0806F560
_0806F552:
	adds r2, #0xc
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806F4B8
_0806F560:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806F56C
sub_806F56C: @ 0x0806F56C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806F5C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, #6]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _0806F5C4 @ =IWRAM_START + 0xC8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r2, _0806F5C8 @ =IWRAM_START + 0xB2
	adds r1, r0, r2
	ldrh r1, [r1]
	ldr r6, _0806F5CC @ =IWRAM_START + 0x100
	adds r0, r0, r6
	ldr r3, [r0]
	ldr r2, _0806F5D0 @ =gSineTable
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r7, [r0, r6]
	mov ip, r7
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r4, r3
	cmp r0, #0
	ble _0806F5D4
	str r0, [r5]
	adds r4, r0, #0
	b _0806F5DA
	.align 2, 0
_0806F5C0: .4byte gCurTask
_0806F5C4: .4byte IWRAM_START + 0xC8
_0806F5C8: .4byte IWRAM_START + 0xB2
_0806F5CC: .4byte IWRAM_START + 0x100
_0806F5D0: .4byte gSineTable
_0806F5D4:
	movs r0, #0
	str r0, [r5]
	movs r4, #0
_0806F5DA:
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	muls r2, r4, r2
	asrs r2, r2, #0xa
	mov r3, r8
	adds r3, #0xa8
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	mov r1, r8
	adds r1, #0xac
	ldr r0, [r1]
	subs r0, r0, r2
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806F604
sub_806F604: @ 0x0806F604
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806F658 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, #6]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _0806F65C @ =IWRAM_START + 0xC8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r2, _0806F660 @ =IWRAM_START + 0xB2
	adds r1, r0, r2
	ldrh r1, [r1]
	ldr r6, _0806F664 @ =IWRAM_START + 0x104
	adds r0, r0, r6
	ldr r3, [r0]
	ldr r2, _0806F668 @ =gSineTable
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r7, [r0, r6]
	mov ip, r7
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r4, r3
	cmp r0, #0
	ble _0806F66C
	str r0, [r5]
	adds r4, r0, #0
	b _0806F672
	.align 2, 0
_0806F658: .4byte gCurTask
_0806F65C: .4byte IWRAM_START + 0xC8
_0806F660: .4byte IWRAM_START + 0xB2
_0806F664: .4byte IWRAM_START + 0x104
_0806F668: .4byte gSineTable
_0806F66C:
	movs r0, #0
	str r0, [r5]
	movs r4, #0
_0806F672:
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	muls r2, r4, r2
	asrs r2, r2, #0xa
	mov r3, r8
	adds r3, #0xa8
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	mov r1, r8
	adds r1, #0xac
	ldr r0, [r1]
	subs r0, r0, r2
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806F69C
sub_806F69C: @ 0x0806F69C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, [r0, #0xc]
	ldrh r3, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r3, r1
	ldr r0, [r0, #0x14]
	ldrh r2, [r0, #6]
	adds r2, r2, r1
	adds r1, #0xb2
	adds r0, r3, r1
	ldrh r0, [r0]
	rsbs r5, r0, #0
	ldr r1, _0806F708 @ =0x000003FF
	adds r0, r1, #0
	ands r5, r0
	ldr r1, _0806F70C @ =IWRAM_START + 0xA8
	adds r0, r3, r1
	ldr r1, [r2, #0x40]
	ldr r0, [r0]
	subs r1, r1, r0
	mov r8, r1
	ldr r0, _0806F710 @ =IWRAM_START + 0xAC
	adds r3, r3, r0
	ldr r1, [r2, #0x44]
	ldr r0, [r3]
	subs r1, r1, r0
	mov ip, r1
	mov r1, r8
	lsrs r3, r1, #0x10
	mov r0, ip
	lsrs r4, r0, #0x10
	lsls r2, r3, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	adds r0, r2, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bhi _0806F714
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0806F714
	cmp r1, #0xf
	bgt _0806F714
	movs r6, #0xc
	adds r3, r2, #0
	b _0806F738
	.align 2, 0
_0806F708: .4byte 0x000003FF
_0806F70C: .4byte IWRAM_START + 0xA8
_0806F710: .4byte IWRAM_START + 0xAC
_0806F714:
	lsls r0, r3, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x10
	adds r2, r0, r1
	movs r1, #0xff
	lsls r1, r1, #0x11
	movs r6, #0x14
	adds r3, r0, #0
	cmp r2, r1
	bhi _0806F738
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	ldr r0, _0806F758 @ =0xFFFFFF00
	cmp r1, r0
	ble _0806F738
	cmp r1, #0xff
	bgt _0806F738
	movs r6, #0x10
_0806F738:
	movs r1, #0xbc
	lsls r1, r1, #0xe
	adds r0, r3, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x5e
	bhi _0806F75C
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0806F75C
	cmp r1, #0x2f
	bgt _0806F75C
	movs r2, #0
	b _0806F77C
	.align 2, 0
_0806F758: .4byte 0xFFFFFF00
_0806F75C:
	movs r1, #0xbe
	lsls r1, r1, #0xf
	adds r0, r3, r1
	lsrs r0, r0, #0x10
	movs r2, #2
	cmp r0, #0xbe
	bhi _0806F77C
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x60
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0806F77C
	cmp r1, #0x5f
	bgt _0806F77C
	movs r2, #1
_0806F77C:
	ldr r1, _0806F808 @ =gUnknown_080DF794
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0]
	adds r1, r7, #0
	adds r1, #0x88
	strb r2, [r1]
	ldrh r1, [r0, #2]
	adds r0, r7, #0
	adds r0, #0x72
	strh r1, [r0]
	adds r0, r6, #0
	mov r1, r8
	asrs r1, r0
	mov r8, r1
	mov r1, ip
	asrs r1, r0
	mov ip, r1
	ldr r3, _0806F80C @ =gSineTable
	lsls r0, r5, #1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r7, [r0, r1]
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r6, [r0, r1]
	mov r4, ip
	muls r4, r7, r4
	mov r2, r8
	muls r2, r6, r2
	rsbs r0, r7, #0
	mov r1, r8
	muls r1, r0, r1
	mov r0, ip
	muls r0, r6, r0
	adds r4, r4, r2
	mov r8, r4
	adds r1, r1, r0
	mov ip, r1
	mov r2, sb
	ldr r0, _0806F810 @ =0x000003FF
	adds r4, r0, #0
_0806F7DA:
	lsls r0, r5, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r7, r0, #0x16
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x16
	mov r1, ip
	muls r1, r7, r1
	mov r0, r8
	muls r0, r6, r0
	adds r1, r1, r0
	cmp r1, #0
	ble _0806F814
	adds r5, r5, r2
	b _0806F834
	.align 2, 0
_0806F808: .4byte gUnknown_080DF794
_0806F80C: .4byte gSineTable
_0806F810: .4byte 0x000003FF
_0806F814:
	cmp r1, #0
	blt _0806F832
	rsbs r0, r7, #0
	mov r1, r8
	muls r1, r0, r1
	mov r0, ip
	muls r0, r6, r0
	adds r0, r1, r0
	cmp r0, #0
	blt _0806F83C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	ands r0, r4
	b _0806F83E
_0806F832:
	subs r5, r5, r2
_0806F834:
	ands r5, r4
	lsrs r2, r2, #1
	cmp r2, #0
	bne _0806F7DA
_0806F83C:
	adds r0, r5, #0
_0806F83E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806F84C
sub_806F84C: @ 0x0806F84C
	push {r4, r5, lr}
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r5, #0
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r4, r0, r1
	cmp r4, #1
	bhi _0806F876
	lsls r0, r4, #0x10
	b _0806F906
_0806F86A:
	lsls r4, r4, #1
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
_0806F876:
	cmp r4, #0
	bgt _0806F86A
	lsrs r2, r4, #0x10
	mvns r2, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsrs r3, r2, #1
	adds r1, r3, #0
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x12
	adds r1, r1, r3
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x11
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x10
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x10
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x10
	ldr r0, _0806F8F0 @ =0x0000B333
	muls r0, r3, r0
	lsrs r3, r0, #0x10
	adds r1, r1, r3
	lsls r1, r1, #0x10
	ldr r0, _0806F8F4 @ =0xFFFF0000
	eors r1, r0
	lsrs r3, r1, #0x10
	adds r0, r3, #0
	muls r0, r3, r0
	subs r0, r4, r0
	asrs r0, r0, #0x11
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r5, #0x10
	asrs r0, r2, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806F8FC
	asrs r0, r2, #0x11
	asrs r3, r0
	ldr r0, _0806F8F8 @ =0x0000B505
	muls r0, r3, r0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r0, r2
	b _0806F902
	.align 2, 0
_0806F8F0: .4byte 0x0000B333
_0806F8F4: .4byte 0xFFFF0000
_0806F8F8: .4byte 0x0000B505
_0806F8FC:
	asrs r0, r2, #0x11
	asrs r3, r0
	lsls r0, r3, #0x10
_0806F902:
	lsrs r3, r0, #0x10
	lsls r0, r3, #0x10
_0806F906:
	asrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806F910
sub_806F910: @ 0x0806F910
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0806F940 @ =sub_806EC24
	movs r2, #0x80
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r5, [r1]
	strh r4, [r1, #4]
	movs r2, #0x3c
	strh r2, [r1, #6]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806F940: .4byte sub_806EC24

	thumb_func_start sub_806F944
sub_806F944: @ 0x0806F944
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r1, [r0, #0xc]
	ldrh r6, [r1, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #6]
	adds r1, r1, r2
	adds r2, #0xa8
	adds r0, r6, r2
	ldr r5, [r0]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	mov r8, r0
	ldr r0, [r1, #0x40]
	ldr r1, [r1, #0x44]
	subs r5, r5, r0
	asrs r0, r5, #4
	mov r2, r8
	subs r2, r2, r1
	mov r8, r2
	asrs r1, r2, #4
	bl sub_806F84C
	adds r4, r0, #0
	ldr r0, _0806F9C0 @ =IWRAM_START + 0xD0
	adds r0, r0, r6
	mov sb, r0
	lsls r5, r5, #5
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	mov r1, sb
	str r0, [r1]
	ldr r2, _0806F9C4 @ =IWRAM_START + 0xD4
	adds r5, r6, r2
	mov r0, r8
	lsls r0, r0, #5
	mov r8, r0
	adds r1, r4, #0
	bl __divsi3
	str r0, [r5]
	ldr r1, _0806F9C8 @ =IWRAM_START + 0xB8
	adds r6, r6, r1
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r6]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F9C0: .4byte IWRAM_START + 0xD0
_0806F9C4: .4byte IWRAM_START + 0xD4
_0806F9C8: .4byte IWRAM_START + 0xB8

	thumb_func_start sub_806F9CC
sub_806F9CC: @ 0x0806F9CC
	push {lr}
	movs r0, #0
	bl sub_806EDB4
	bl sub_806EF44
	bl sub_806FA34
	bl sub_806F468
	pop {r0}
	bx r0

	thumb_func_start sub_806F9E4
sub_806F9E4: @ 0x0806F9E4
	push {r4, lr}
	ldr r0, _0806FA28 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	movs r0, #1
	bl sub_806EDB4
	bl sub_806EF44
	bl sub_806FA34
	ldr r0, _0806FA2C @ =gInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0806FA1C
	ldr r2, _0806FA30 @ =IWRAM_START + 0xB4
	adds r0, r4, r2
	strh r1, [r0]
_0806FA1C:
	bl sub_806F468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA28: .4byte gCurTask
_0806FA2C: .4byte gInput
_0806FA30: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806FA34
sub_806FA34: @ 0x0806FA34
	push {r4, lr}
	ldr r0, _0806FA84 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r3, [r0, #6]
	ldr r0, _0806FA88 @ =gPressedKeys
	ldr r1, _0806FA8C @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0806FA7E
	ldr r0, _0806FA90 @ =IWRAM_START + 0xB4
	adds r1, r3, r0
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0806FA94 @ =IWRAM_START + 0xB0
	adds r0, r3, r1
	strh r2, [r0]
	ldr r4, _0806FA98 @ =IWRAM_START + 0xEC
	adds r0, r3, r4
	ldrh r1, [r0]
	subs r4, #0x34
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0806FA9C @ =IWRAM_START + 0xBA
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, #0x74
	bl m4aSongNumStart
_0806FA7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA84: .4byte gCurTask
_0806FA88: .4byte gPressedKeys
_0806FA8C: .4byte gUnknown_03005B38
_0806FA90: .4byte IWRAM_START + 0xB4
_0806FA94: .4byte IWRAM_START + 0xB0
_0806FA98: .4byte IWRAM_START + 0xEC
_0806FA9C: .4byte IWRAM_START + 0xBA

	thumb_func_start sub_806FAA0
sub_806FAA0: @ 0x0806FAA0
	push {r4, lr}
	ldr r0, _0806FAF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r3, [r0, #6]
	ldr r0, _0806FAF4 @ =IWRAM_START + 0xA8
	adds r1, r3, r0
	ldr r0, [r1]
	ldr r4, _0806FAF8 @ =0x002FFFFF
	cmp r0, r4
	bgt _0806FAC6
	movs r0, #0xc0
	lsls r0, r0, #0xe
	str r0, [r1]
_0806FAC6:
	ldr r0, [r1]
	movs r2, #0xf4
	lsls r2, r2, #0x12
	cmp r0, r2
	ble _0806FAD2
	str r2, [r1]
_0806FAD2:
	ldr r0, _0806FAFC @ =IWRAM_START + 0xAC
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r0, r4
	bgt _0806FAE2
	movs r0, #0xc0
	lsls r0, r0, #0xe
	str r0, [r1]
_0806FAE2:
	ldr r0, [r1]
	cmp r0, r2
	ble _0806FAEA
	str r2, [r1]
_0806FAEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FAF0: .4byte gCurTask
_0806FAF4: .4byte IWRAM_START + 0xA8
_0806FAF8: .4byte 0x002FFFFF
_0806FAFC: .4byte IWRAM_START + 0xAC

	thumb_func_start sub_806FB00
sub_806FB00: @ 0x0806FB00
	bx lr
	.align 2, 0

	thumb_func_start sub_806FB04
sub_806FB04: @ 0x0806FB04
	push {r4, r5, r6, lr}
	ldr r0, _0806FB58 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r6, [r5]
	bl sub_8070C58
	bl sub_806FFC8
	bl sub_8070D14
	ldr r0, _0806FB5C @ =IWRAM_START + 0x2A8
	adds r4, r4, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0806FB44
	ldr r1, _0806FB60 @ =0x000005B4
	adds r0, r6, r1
	ldrh r0, [r0]
	cmp r0, #4
	bne _0806FB3C
	adds r0, r5, #0
	bl sub_8070D80
_0806FB3C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0806FB80
_0806FB44:
	ldr r2, _0806FB60 @ =0x000005B4
	adds r0, r6, r2
	ldrh r0, [r0]
	cmp r0, #4
	beq _0806FB64
	adds r0, r5, #0
	bl sub_8070DE0
	b _0806FB80
	.align 2, 0
_0806FB58: .4byte gCurTask
_0806FB5C: .4byte IWRAM_START + 0x2A8
_0806FB60: .4byte 0x000005B4
_0806FB64:
	ldr r1, _0806FBB8 @ =0x000005A2
	adds r0, r6, r1
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x1d
	ble _0806FB7A
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806FB80
_0806FB7A:
	adds r0, r5, #0
	bl sub_8070DD0
_0806FB80:
	ldr r0, _0806FBBC @ =0x000002A9
	adds r4, r5, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0806FBA4
	ldr r1, _0806FBC0 @ =0x000005BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806FB9C
	adds r0, r5, #0
	bl sub_80701D4
_0806FB9C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0806FBCA
_0806FBA4:
	ldr r2, _0806FBC0 @ =0x000005BA
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806FBC4
	adds r0, r5, #0
	bl sub_8070E68
	b _0806FBCA
	.align 2, 0
_0806FBB8: .4byte 0x000005A2
_0806FBBC: .4byte 0x000002A9
_0806FBC0: .4byte 0x000005BA
_0806FBC4:
	adds r0, r5, #0
	bl sub_8070E00
_0806FBCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_806FBD0
sub_806FBD0: @ 0x0806FBD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	mov sl, r0
	ldm r0!, {r2}
	ldr r3, _0806FCE4 @ =0x000005BB
	adds r1, r2, r3
	movs r4, #0
	ldrsb r4, [r1, r4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r3, #1
	adds r1, r2, r3
	movs r5, #0
	ldrsb r5, [r1, r5]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r1, _0806FCE8 @ =0x000005BD
	adds r2, r2, r1
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	mov r3, r8
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	ldr r3, _0806FCEC @ =0x00000377
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xc0
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	movs r6, #0
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	movs r2, #1
	bl sub_806CA88
	lsls r4, r4, #0x10
	asrs r4, r4, #0xd
	ldr r3, _0806FCF0 @ =gUnknown_080DF7E8
	mov sb, r3
	adds r7, r4, r3
	mov r0, sl
	adds r0, #0x34
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xcc
	str r1, [sp, #4]
	movs r4, #0x12
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	lsls r5, r5, #0x10
	asrs r5, r5, #0xd
	mov r3, sb
	adds r7, r5, r3
	mov r0, sl
	adds r0, #0x64
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xd4
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	mov r3, r8
	lsls r3, r3, #0x10
	asrs r3, r3, #0xd
	mov r8, r3
	mov r7, r8
	add r7, sb
	mov r1, sl
	adds r1, #0x94
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0xdc
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	bl sub_806CA88
	ldr r3, _0806FCF4 @ =0x00000379
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	add r0, sp, #0x18
	movs r1, #0
	movs r2, #0
	bl sub_806CA88
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FCE4: .4byte 0x000005BB
_0806FCE8: .4byte 0x000005BD
_0806FCEC: .4byte 0x00000377
_0806FCF0: .4byte gUnknown_080DF7E8
_0806FCF4: .4byte 0x00000379

	thumb_func_start sub_806FCF8
sub_806FCF8: @ 0x0806FCF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806FD58 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	ldr r1, [r5]
	ldr r3, _0806FD5C @ =0x000005BB
	adds r0, r1, r3
	movs r3, #0
	ldrsb r3, [r0, r3]
	lsls r3, r3, #0x10
	ldr r4, _0806FD60 @ =0x000005BC
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0806FD64 @ =0x000005BD
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, _0806FD68 @ =IWRAM_START + 0x2AA
	adds r2, r2, r1
	ldrh r0, [r2]
	adds r1, r0, #1
	movs r0, #0xff
	ands r1, r0
	strh r1, [r2]
	lsrs r0, r3, #0x10
	mov ip, r0
	cmp r3, #0
	bne _0806FD7E
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	adds r7, r0, #0
	cmp r2, #0
	bne _0806FD6C
	movs r0, #8
	b _0806FD72
	.align 2, 0
_0806FD58: .4byte gCurTask
_0806FD5C: .4byte 0x000005BB
_0806FD60: .4byte 0x000005BC
_0806FD64: .4byte 0x000005BD
_0806FD68: .4byte IWRAM_START + 0x2AA
_0806FD6C:
	cmp r2, #2
	bgt _0806FD7E
	movs r0, #0x10
_0806FD72:
	ands r0, r1
	movs r6, #3
	cmp r0, #0
	beq _0806FD82
	movs r6, #0
	b _0806FD82
_0806FD7E:
	movs r6, #0
	lsls r7, r4, #0x10
_0806FD82:
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _0806FDB8
	lsls r1, r4, #3
	ldr r0, _0806FE28 @ =gUnknown_080DF7E8
	adds r1, r1, r0
	adds r3, r5, #0
	adds r3, #0x34
	ldrh r0, [r1]
	strh r0, [r3, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r3, #0x10]
	adds r0, r5, #0
	adds r0, #0x59
	strb r6, [r0]
	adds r0, r3, #0
	bl sub_8004558
_0806FDB8:
	asrs r1, r7, #0x10
	adds r0, r4, #0
	orrs r0, r1
	cmp r0, #0
	beq _0806FDEE
	lsls r1, r1, #3
	ldr r0, _0806FE28 @ =gUnknown_080DF7E8
	adds r1, r1, r0
	adds r3, r5, #0
	adds r3, #0x64
	ldrh r0, [r1]
	strh r0, [r3, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	adds r0, #0x84
	strb r1, [r0]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r3, #0x10]
	adds r0, r5, #0
	adds r0, #0x89
	strb r6, [r0]
	adds r0, r3, #0
	bl sub_8004558
_0806FDEE:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806FE28 @ =gUnknown_080DF7E8
	adds r1, r0, r1
	adds r3, r5, #0
	adds r3, #0x94
	ldrh r0, [r1]
	strh r0, [r3, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	adds r0, #0xb4
	strb r1, [r0]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r3, #0x10]
	adds r0, r5, #0
	adds r0, #0xb9
	strb r6, [r0]
	adds r0, r3, #0
	bl sub_8004558
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE28: .4byte gUnknown_080DF7E8

	thumb_func_start sub_806FE2C
sub_806FE2C: @ 0x0806FE2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	ldr r5, [r0]
	ldr r1, _0806FFB0 @ =0x000005BF
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	mov r0, sl
	adds r0, #0xc4
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r6, #0x80
	lsls r6, r6, #5
	str r6, [sp]
	movs r1, #0x64
	str r1, [sp, #4]
	movs r1, #0x10
	mov r8, r1
	str r1, [sp, #8]
	movs r1, #1
	mov sb, r1
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r4, #0
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	movs r1, #0xb8
	lsls r1, r1, #3
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	mov r0, sl
	adds r0, #0xf4
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x6c
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	ldr r1, _0806FFB8 @ =0x000005C1
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0x92
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x74
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0xde
	lsls r3, r3, #2
	str r6, [sp]
	movs r1, #0x78
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #8
	bl sub_806CA88
	ldr r1, _0806FFBC @ =0x000005C2
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0xc2
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x7c
	str r1, [sp, #4]
	movs r1, #0x18
	mov r8, r1
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	ldr r1, _0806FFC0 @ =0x000005C3
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0xda
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x84
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	ldr r0, _0806FFC4 @ =0x000005C4
	adds r5, r5, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0xf2
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x8c
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FFB0: .4byte 0x000005BF
_0806FFB4: .4byte gUnknown_080DF7E8
_0806FFB8: .4byte 0x000005C1
_0806FFBC: .4byte 0x000005C2
_0806FFC0: .4byte 0x000005C3
_0806FFC4: .4byte 0x000005C4

	thumb_func_start sub_806FFC8
sub_806FFC8: @ 0x0806FFC8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08070064 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r7, r0
	ldr r6, [r4]
	ldr r1, _08070068 @ =0x000005BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806FFE6
	bl sub_8070078
_0806FFE6:
	ldr r0, _0807006C @ =0x000005BF
	adds r5, r6, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08070002
	ldr r1, _08070070 @ =IWRAM_START + 0xC4
	adds r0, r7, r1
	bl sub_80051E8
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08070012
_08070002:
	movs r1, #0xb8
	lsls r1, r1, #3
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807001A
_08070012:
	adds r0, r4, #0
	adds r0, #0xf4
	bl sub_80051E8
_0807001A:
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
	ldr r0, _08070074 @ =0x000005C2
	adds r5, r6, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08070044
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
_08070044:
	ldrh r0, [r5]
	cmp r0, #0
	beq _08070054
	movs r1, #0xda
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
_08070054:
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070064: .4byte gCurTask
_08070068: .4byte 0x000005BA
_0807006C: .4byte 0x000005BF
_08070070: .4byte IWRAM_START + 0xC4
_08070074: .4byte 0x000005C2

	thumb_func_start sub_8070078
sub_8070078: @ 0x08070078
	push {r4, r5, r6, r7, lr}
	ldr r0, _08070148 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r6, r0
	ldr r5, [r0]
	ldr r1, _0807014C @ =0x000005BF
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r4, _08070150 @ =gUnknown_080DF7E8
	adds r1, r0, r4
	ldr r3, _08070154 @ =IWRAM_START + 0xC4
	adds r2, r6, r3
	ldrh r0, [r1]
	movs r7, #0
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	adds r3, #0x20
	adds r0, r6, r3
	strb r1, [r0]
	adds r0, r2, #0
	bl sub_8004558
	movs r1, #0xb8
	lsls r1, r1, #3
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r4
	ldr r3, _08070158 @ =IWRAM_START + 0xF4
	adds r2, r6, r3
	ldrh r0, [r1]
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	adds r3, #0x20
	adds r0, r6, r3
	strb r1, [r0]
	adds r0, r2, #0
	bl sub_8004558
	ldr r1, _0807015C @ =0x000005C1
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r4
	ldr r3, _08070160 @ =IWRAM_START + 0x124
	adds r2, r6, r3
	ldrh r0, [r1]
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	ldr r4, _08070164 @ =IWRAM_START + 0x144
	adds r0, r6, r4
	strb r1, [r0]
	adds r0, r2, #0
	bl sub_8004558
	ldr r0, _08070168 @ =0x000005C5
	adds r3, r5, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08070180
	ldr r1, _0807016C @ =0x000005A4
	adds r0, r5, r1
	ldr r2, _08070170 @ =0x000005A6
	adds r1, r5, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r2, r0
	blt _080701CA
	movs r4, #1
	strb r4, [r3]
	movs r0, #0x35
	bl m4aSongNumStart
	ldr r1, _08070174 @ =0x000005C7
	adds r0, r5, r1
	strb r4, [r0]
	movs r2, #0xb9
	lsls r2, r2, #3
	adds r1, r5, r2
	movs r0, #0x78
	strb r0, [r1]
	ldr r3, _08070178 @ =IWRAM_START + 0x154
	adds r2, r6, r3
	movs r0, #0xde
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r1, _0807017C @ =IWRAM_START + 0x174
	adds r0, r6, r1
	strb r4, [r0]
	b _080701A6
	.align 2, 0
_08070148: .4byte gCurTask
_0807014C: .4byte 0x000005BF
_08070150: .4byte gUnknown_080DF7E8
_08070154: .4byte IWRAM_START + 0xC4
_08070158: .4byte IWRAM_START + 0xF4
_0807015C: .4byte 0x000005C1
_08070160: .4byte IWRAM_START + 0x124
_08070164: .4byte IWRAM_START + 0x144
_08070168: .4byte 0x000005C5
_0807016C: .4byte 0x000005A4
_08070170: .4byte 0x000005A6
_08070174: .4byte 0x000005C7
_08070178: .4byte IWRAM_START + 0x154
_0807017C: .4byte IWRAM_START + 0x174
_08070180:
	ldr r2, _080701B0 @ =0x000005A4
	adds r0, r5, r2
	ldr r4, _080701B4 @ =0x000005A6
	adds r1, r5, r4
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r2, r0
	bge _080701C0
	strb r7, [r3]
	ldr r0, _080701B8 @ =IWRAM_START + 0x154
	adds r2, r6, r0
	movs r0, #0xde
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r1, _080701BC @ =IWRAM_START + 0x174
	adds r0, r6, r1
	strb r7, [r0]
_080701A6:
	adds r0, r2, #0
	bl sub_8004558
	b _080701CA
	.align 2, 0
_080701B0: .4byte 0x000005A4
_080701B4: .4byte 0x000005A6
_080701B8: .4byte IWRAM_START + 0x154
_080701BC: .4byte IWRAM_START + 0x174
_080701C0:
	ldr r3, _080701D0 @ =IWRAM_START + 0x154
	adds r2, r6, r3
	adds r0, r2, #0
	bl sub_8004558
_080701CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080701D0: .4byte IWRAM_START + 0x154

	thumb_func_start sub_80701D4
sub_80701D4: @ 0x080701D4
	push {r4, r5, r6, lr}
	sub sp, #0x3c
	adds r5, r0, #0
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r6, r5, r0
	ldr r0, _08070270 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r4, [r0, #6]
	subs r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _08070274 @ =gUnknown_080DF8F0
	add r0, sp, #0x18
	movs r2, #0x24
	bl memcpy
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0x18
	ldrh r2, [r0]
	mov r0, sp
	adds r0, #0x1a
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0x78
	str r0, [sp, #4]
	movs r0, #0x50
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	add r0, sp, #0x1c
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	adds r0, r6, #0
	movs r1, #1
	bl sub_806CA88
	ldr r0, _08070278 @ =0x040000D4
	ldr r2, _0807027C @ =gUnknown_03002252
	str r2, [r0]
	movs r3, #0xab
	lsls r3, r3, #2
	adds r1, r5, r3
	str r1, [r0, #4]
	ldr r3, _08070280 @ =0x80000003
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	adds r2, #6
	str r2, [r0]
	ldr r2, _08070284 @ =0x000002B2
	adds r1, r5, r2
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r3, _08070288 @ =0x000002A9
	adds r5, r5, r3
	movs r0, #1
	strb r0, [r5]
	bl m4aMPlayAllStop
	movs r0, #0x8e
	bl m4aSongNumStart
	add sp, #0x3c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070270: .4byte gLoadedSaveGame
_08070274: .4byte gUnknown_080DF8F0
_08070278: .4byte 0x040000D4
_0807027C: .4byte gUnknown_03002252
_08070280: .4byte 0x80000003
_08070284: .4byte 0x000002B2
_08070288: .4byte 0x000002A9

	thumb_func_start sub_807028C
sub_807028C: @ 0x0807028C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	ldr r2, [r7]
	ldr r0, _08070310 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r3, _08070314 @ =0x000005B6
	adds r1, r2, r3
	ldrb r4, [r1]
	adds r0, #0xc
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	ldr r1, _08070318 @ =gUnknown_03005B5C
	ldr r6, _0807031C @ =0x000005D4
	adds r0, r2, r6
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08070320 @ =gUnknown_03005B58
	movs r6, #0
	str r6, [r0]
	ldr r0, _08070324 @ =0x000005C5
	adds r2, r2, r0
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r2, #0
	beq _08070330
	adds r0, r7, #4
	ldr r3, _08070328 @ =0x0000037D
	str r6, [sp]
	movs r5, #0x98
	lsls r5, r5, #1
	str r5, [sp, #4]
	movs r1, #0x20
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r2, #0x28
	bl sub_806CA88
	adds r0, r7, #0
	adds r0, #0x34
	ldr r1, _0807032C @ =gUnknown_080DF880
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	str r6, [sp]
	str r5, [sp, #4]
	movs r1, #0x18
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r1, [r4, #2]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #1
	bl sub_806CA88
	b _0807034E
	.align 2, 0
_08070310: .4byte gLoadedSaveGame
_08070314: .4byte 0x000005B6
_08070318: .4byte gUnknown_03005B5C
_0807031C: .4byte 0x000005D4
_08070320: .4byte gUnknown_03005B58
_08070324: .4byte 0x000005C5
_08070328: .4byte 0x0000037D
_0807032C: .4byte gUnknown_080DF880
_08070330:
	adds r0, r7, #4
	ldr r3, _080704EC @ =0x0000037D
	str r2, [sp]
	movs r1, #0x98
	lsls r1, r1, #1
	str r1, [sp, #4]
	movs r1, #0x20
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r1, #1
	movs r2, #0x20
	bl sub_806CA88
_0807034E:
	movs r1, #0xda
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r6, _080704F0 @ =0x0000037E
	movs r4, #0
	str r4, [sp]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r5, r2, #0
	movs r1, #0x30
	orrs r1, r5
	str r1, [sp, #4]
	movs r1, #0x48
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #1
	movs r2, #0x16
	adds r3, r6, #0
	bl sub_806CA88
	movs r3, #0xf2
	lsls r3, r3, #1
	adds r0, r7, r3
	str r4, [sp]
	movs r1, #0x30
	orrs r1, r5
	str r1, [sp, #4]
	movs r1, #0x5c
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0x16
	adds r3, r6, #0
	bl sub_806CA88
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r7, r1
	str r4, [sp]
	movs r1, #0x30
	orrs r1, r5
	str r1, [sp, #4]
	movs r1, #0x70
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #1
	movs r2, #0x16
	adds r3, r6, #0
	bl sub_806CA88
	movs r2, #0
	movs r0, #0x9e
	lsls r0, r0, #0x10
	mov sb, r0
	movs r0, #0x9e
	lsls r0, r0, #0x10
	mov sl, r0
	movs r0, #0x9e
	lsls r0, r0, #0x10
	str r0, [sp, #0x1c]
	ldr r6, _080704F4 @ =gUnknown_080DF7E8
	movs r5, #0
	ldrb r3, [r6, #2]
	mov r8, r3
_080703DC:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r7, r0
	str r5, [sp]
	lsls r2, r4, #3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	mov r3, sb
	asrs r1, r3, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x58
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _080703DC
	movs r2, #0
	ldr r6, _080704F4 @ =gUnknown_080DF7E8
	movs r5, #0
	ldrb r3, [r6, #2]
	mov r8, r3
_08070430:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xcd
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r7, r0
	str r5, [sp]
	lsls r2, r4, #3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	mov r3, sl
	asrs r1, r3, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x6c
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _08070430
	movs r2, #0
	ldr r6, _080704F4 @ =gUnknown_080DF7E8
	movs r5, #0
	ldrb r3, [r6, #2]
	mov r8, r3
_08070484:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r1, _080704F8 @ =0x00000424
	adds r0, r0, r1
	adds r0, r7, r0
	str r5, [sp]
	lsls r2, r4, #3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	ldr r3, [sp, #0x1c]
	asrs r1, r3, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x80
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _08070484
	movs r2, #0
	movs r5, #0
_080704D0:
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	ldr r1, [sp, #0x18]
	asrs r1, r3
	movs r0, #1
	ands r1, r0
	adds r4, r2, #0
	cmp r1, #0
	beq _08070500
	lsls r1, r3, #3
	ldr r0, _080704FC @ =gUnknown_080DF8A8
	adds r2, r1, r0
	b _08070502
	.align 2, 0
_080704EC: .4byte 0x0000037D
_080704F0: .4byte 0x0000037E
_080704F4: .4byte gUnknown_080DF7E8
_080704F8: .4byte 0x00000424
_080704FC: .4byte gUnknown_080DF8A8
_08070500:
	ldr r2, _0807057C @ =gUnknown_080DF8E0
_08070502:
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	adds r0, #0x64
	adds r0, r7, r0
	ldrh r3, [r2]
	str r5, [sp]
	lsls r1, r1, #0x13
	movs r6, #0x92
	lsls r6, r6, #0x11
	adds r1, r1, r6
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x34
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	ldrb r1, [r2, #2]
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	movs r2, #9
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #6
	ble _080704D0
	ldr r0, _08070580 @ =0x00000514
	adds r1, r7, r0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08070584 @ =0x00000516
	adds r0, r7, r1
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	movs r2, #0xa3
	lsls r2, r2, #3
	adds r0, r7, r2
	strh r1, [r0]
	ldr r3, _08070588 @ =0x0000051A
	adds r0, r7, r3
	strh r1, [r0]
	ldr r6, _0807058C @ =0x0000051C
	adds r0, r7, r6
	strh r1, [r0]
	adds r2, #6
	adds r0, r7, r2
	strh r1, [r0]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807057C: .4byte gUnknown_080DF8E0
_08070580: .4byte 0x00000514
_08070584: .4byte 0x00000516
_08070588: .4byte 0x0000051A
_0807058C: .4byte 0x0000051C

	thumb_func_start sub_8070590
sub_8070590: @ 0x08070590
	push {r4, r5, lr}
	ldr r5, _08070610 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _08070614 @ =gUnknown_03000514
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xb
	bgt _080705A8
	bl sub_807061C
_080705A8:
	ldrh r0, [r4]
	subs r0, #8
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705BA
	asrs r0, r1, #0x10
	bl sub_8070680
_080705BA:
	ldrh r0, [r4]
	subs r0, #0x10
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705CC
	asrs r0, r1, #0x10
	bl sub_80706D8
_080705CC:
	ldrh r0, [r4]
	subs r0, #0x18
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705DE
	asrs r0, r1, #0x10
	bl sub_8070740
_080705DE:
	ldrh r0, [r4]
	subs r0, #0x20
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705F0
	asrs r0, r1, #0x10
	bl sub_80707A8
_080705F0:
	bl sub_807087C
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2b
	ble _08070608
	ldr r1, [r5]
	ldr r0, _08070618 @ =sub_8070EF0
	str r0, [r1, #8]
_08070608:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070610: .4byte gCurTask
_08070614: .4byte gUnknown_03000514
_08070618: .4byte sub_8070EF0

	thumb_func_start sub_807061C
sub_807061C: @ 0x0807061C
	push {r4, r5, lr}
	ldr r1, _08070660 @ =gCurTask
	ldr r1, [r1]
	ldrh r4, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r1, r0, r1
	ldr r0, _08070664 @ =gUnknown_03000516
	adds r5, r4, r0
	strh r1, [r5]
	ldr r0, _08070668 @ =IWRAM_START+4
	adds r3, r4, r0
	ldr r0, _0807066C @ =0x000005C5
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08070674
	adds r0, r1, #0
	adds r0, #0x4c
	strh r0, [r3, #0x16]
	ldr r0, _08070670 @ =IWRAM_START + 0x34
	adds r3, r4, r0
	ldrh r0, [r5]
	adds r0, #4
	b _08070678
	.align 2, 0
_08070660: .4byte gCurTask
_08070664: .4byte gUnknown_03000516
_08070668: .4byte IWRAM_START+4
_0807066C: .4byte 0x000005C5
_08070670: .4byte IWRAM_START + 0x34
_08070674:
	adds r0, r1, #0
	adds r0, #0x30
_08070678:
	strh r0, [r3, #0x16]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8070680
sub_8070680: @ 0x08070680
	push {r4, r5, lr}
	ldr r1, _080706D0 @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r1, r0, r1
	ldr r3, _080706D4 @ =gUnknown_03000518
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #0
	adds r4, r2, r3
_080706A4:
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r3, r1, #4
	adds r3, #0x64
	adds r3, r5, r3
	lsls r1, r1, #3
	ldrh r0, [r4]
	adds r0, #0x24
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r0, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #6
	ble _080706A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080706D0: .4byte gCurTask
_080706D4: .4byte gUnknown_03000518

	thumb_func_start sub_80706D8
sub_80706D8: @ 0x080706D8
	push {r4, r5, r6, lr}
	ldr r1, _08070734 @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r0, r1, r0
	ldr r3, _08070738 @ =gUnknown_0300051A
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _0807073C @ =IWRAM_START + 0x1B4
	adds r3, r2, r1
	adds r0, #0x30
	strh r0, [r3, #0x16]
	movs r0, #0
	movs r6, #0x91
	lsls r6, r6, #2
	ldr r3, _08070738 @ =gUnknown_0300051A
	adds r4, r2, r3
_0807070A:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r3, r5, r0
	lsls r2, r1, #3
	ldrh r0, [r4]
	adds r0, #0x9e
	adds r2, r2, r0
	strh r2, [r3, #0x16]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _0807070A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070734: .4byte gCurTask
_08070738: .4byte gUnknown_0300051A
_0807073C: .4byte IWRAM_START + 0x1B4

	thumb_func_start sub_8070740
sub_8070740: @ 0x08070740
	push {r4, r5, r6, lr}
	ldr r1, _0807079C @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r0, r1, r0
	ldr r3, _080707A0 @ =gUnknown_0300051C
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _080707A4 @ =IWRAM_START + 0x1E4
	adds r3, r2, r1
	adds r0, #0x30
	strh r0, [r3, #0x16]
	movs r0, #0
	movs r6, #0xcd
	lsls r6, r6, #2
	ldr r3, _080707A0 @ =gUnknown_0300051C
	adds r4, r2, r3
_08070772:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r3, r5, r0
	lsls r2, r1, #3
	ldrh r0, [r4]
	adds r0, #0x9e
	adds r2, r2, r0
	strh r2, [r3, #0x16]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _08070772
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807079C: .4byte gCurTask
_080707A0: .4byte gUnknown_0300051C
_080707A4: .4byte IWRAM_START + 0x1E4

	thumb_func_start sub_80707A8
sub_80707A8: @ 0x080707A8
	push {r4, r5, r6, lr}
	ldr r1, _08070804 @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r0, r1, r0
	ldr r3, _08070808 @ =gUnknown_0300051E
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _0807080C @ =IWRAM_START + 0x214
	adds r3, r2, r1
	adds r0, #0x30
	strh r0, [r3, #0x16]
	movs r0, #0
	ldr r6, _08070810 @ =0x00000424
	ldr r3, _08070808 @ =gUnknown_0300051E
	adds r4, r2, r3
_080707D8:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r3, r5, r0
	lsls r2, r1, #3
	ldrh r0, [r4]
	adds r0, #0x9e
	adds r2, r2, r0
	strh r2, [r3, #0x16]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080707D8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070804: .4byte gCurTask
_08070808: .4byte gUnknown_0300051E
_0807080C: .4byte IWRAM_START + 0x214
_08070810: .4byte 0x00000424

	thumb_func_start sub_8070814
sub_8070814: @ 0x08070814
	push {r4, r5, r6, r7, lr}
	ldr r7, _0807086C @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r0, [r6]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r5, [r0]
	bl sub_807087C
	ldr r0, _08070870 @ =gUnknown_03000514
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08070864
	adds r1, r5, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x64
	adds r0, r6, r0
	ldr r2, _08070874 @ =gUnknown_080DF8A8
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0, #0xa]
	ldrh r1, [r1, #2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, _08070878 @ =sub_8070EE4
	str r0, [r1, #8]
_08070864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807086C: .4byte gCurTask
_08070870: .4byte gUnknown_03000514
_08070874: .4byte gUnknown_080DF8A8
_08070878: .4byte sub_8070EE4

	thumb_func_start sub_807087C
sub_807087C: @ 0x0807087C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _08070B74 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sl, r0
	ldr r0, [r0]
	mov r8, r0
	movs r0, #0xb5
	lsls r0, r0, #3
	add r0, r8
	ldr r5, [r0]
	ldr r0, _08070B78 @ =0x000005AC
	add r0, r8
	ldr r0, [r0]
	mov sb, r0
	movs r0, #0xb6
	lsls r0, r0, #3
	add r0, r8
	ldr r0, [r0]
	str r0, [sp, #0x24]
	mov r4, sp
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	mov r5, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	mov r5, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	mov r5, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #2]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	mov r4, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r4]
	add r6, sp, #0xc
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #8]
	mov r0, sb
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #4]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #2]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6]
	add r5, sp, #0x18
	ldr r0, [sp, #0x24]
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #8]
	ldr r0, [sp, #0x24]
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #2]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5]
	ldr r1, _08070B7C @ =IWRAM_START+4
	adds r0, r7, r1
	bl sub_80051E8
	ldr r2, _08070B80 @ =0x000005C5
	add r8, r2
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	mov sb, r6
	cmp r0, #0
	beq _080709D2
	ldr r2, _08070B84 @ =IWRAM_START + 0x34
	adds r0, r7, r2
	bl sub_80051E8
_080709D2:
	movs r6, #0
_080709D4:
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	adds r4, #0x64
	add r4, sl
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r5, #1
	lsls r5, r5, #0x10
	lsrs r6, r5, #0x10
	asrs r5, r5, #0x10
	cmp r5, #6
	ble _080709D4
	movs r0, #0xda
	lsls r0, r0, #1
	add r0, sl
	bl sub_80051E8
	movs r0, #0xf2
	lsls r0, r0, #1
	add r0, sl
	bl sub_80051E8
	movs r0, #0x85
	lsls r0, r0, #2
	add r0, sl
	bl sub_80051E8
	movs r6, #0
	movs r7, #0
	ldr r0, _08070B88 @ =gUnknown_080DF7E8
	mov r8, r0
_08070A20:
	lsls r5, r6, #0x10
	cmp r7, #0
	bne _08070A38
	asrs r1, r5, #0x10
	lsls r0, r1, #1
	add r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08070A38
	cmp r1, #4
	bne _08070A76
_08070A38:
	movs r7, #1
	asrs r0, r5, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #4
	movs r2, #0x91
	lsls r2, r2, #2
	adds r0, r0, r2
	mov r2, sl
	adds r4, r2, r0
	add r1, sp
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08070A76:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08070A20
	movs r6, #0
	movs r7, #0
	ldr r2, _08070B88 @ =gUnknown_080DF7E8
	mov r8, r2
_08070A8E:
	lsls r5, r6, #0x10
	cmp r7, #0
	bne _08070AA6
	asrs r1, r5, #0x10
	lsls r0, r1, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08070AA6
	cmp r1, #4
	bne _08070AE4
_08070AA6:
	movs r7, #1
	asrs r0, r5, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #4
	movs r2, #0xcd
	lsls r2, r2, #2
	adds r0, r0, r2
	mov r2, sl
	adds r4, r2, r0
	add r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08070AE4:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08070A8E
	movs r6, #0
	movs r7, #0
	ldr r2, _08070B88 @ =gUnknown_080DF7E8
	mov r8, r2
_08070AFC:
	lsls r5, r6, #0x10
	cmp r7, #0
	bne _08070B16
	asrs r1, r5, #0x10
	lsls r0, r1, #1
	add r0, sp
	adds r0, #0x18
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08070B16
	cmp r1, #4
	bne _08070B54
_08070B16:
	movs r7, #1
	asrs r0, r5, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #4
	ldr r2, _08070B8C @ =0x00000424
	adds r0, r0, r2
	mov r2, sl
	adds r4, r2, r0
	add r1, sp
	adds r1, #0x18
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08070B54:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08070AFC
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070B74: .4byte gCurTask
_08070B78: .4byte 0x000005AC
_08070B7C: .4byte IWRAM_START+4
_08070B80: .4byte 0x000005C5
_08070B84: .4byte IWRAM_START + 0x34
_08070B88: .4byte gUnknown_080DF7E8
_08070B8C: .4byte 0x00000424

	thumb_func_start sub_8070B90
sub_8070B90: @ 0x08070B90
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08070BD8 @ =sub_806FB04
	movs r1, #0xae
	lsls r1, r1, #2
	movs r2, #0xd0
	lsls r2, r2, #8
	ldr r3, _08070BDC @ =sub_8070BEC
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	adds r4, r0, #0
	ldrh r3, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r3, r0
	str r5, [r0]
	ldr r2, _08070BE0 @ =IWRAM_START + 0x2A4
	adds r1, r3, r2
	movs r2, #0
	str r2, [r1]
	ldr r5, _08070BE4 @ =IWRAM_START + 0x2A8
	adds r1, r3, r5
	strb r2, [r1]
	ldr r1, _08070BE8 @ =IWRAM_START + 0x2A9
	adds r3, r3, r1
	strb r2, [r3]
	bl sub_8070C3C
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08070BD8: .4byte sub_806FB04
_08070BDC: .4byte sub_8070BEC
_08070BE0: .4byte IWRAM_START + 0x2A4
_08070BE4: .4byte IWRAM_START + 0x2A8
_08070BE8: .4byte IWRAM_START + 0x2A9

	thumb_func_start sub_8070BEC
sub_8070BEC: @ 0x08070BEC
	bx lr
	.align 2, 0

	thumb_func_start sub_8070BF0
sub_8070BF0: @ 0x08070BF0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08070C24 @ =sub_8070590
	movs r1, #0xa4
	lsls r1, r1, #3
	movs r2, #0xd0
	lsls r2, r2, #8
	ldr r3, _08070C28 @ =sub_8070C2C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	adds r4, r0, #0
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r5, [r0]
	bl sub_807028C
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08070C24: .4byte sub_8070590
_08070C28: .4byte sub_8070C2C

	thumb_func_start sub_8070C2C
sub_8070C2C: @ 0x08070C2C
	bx lr
	.align 2, 0

	thumb_func_start sub_8070C30
sub_8070C30: @ 0x08070C30
	ldr r1, [r0, #0x10]
	ldr r0, _08070C38 @ =sub_8070E88
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08070C38: .4byte sub_8070E88

	thumb_func_start sub_8070C3C
sub_8070C3C: @ 0x08070C3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_806FBD0
	adds r0, r4, #0
	bl sub_806FE2C
	adds r0, r4, #0
	bl sub_8070CD8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070C58
sub_8070C58: @ 0x08070C58
	push {r4, r5, r6, lr}
	ldr r0, _08070CB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r4, [r0]
	ldr r1, _08070CBC @ =0x000005BA
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070C76
	bl sub_806FCF8
_08070C76:
	ldr r1, _08070CC0 @ =IWRAM_START+4
	adds r0, r5, r1
	bl sub_80051E8
	ldr r0, _08070CC4 @ =0x000005BB
	adds r6, r4, r0
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08070C92
	ldr r1, _08070CC8 @ =IWRAM_START + 0x34
	adds r0, r5, r1
	bl sub_80051E8
_08070C92:
	ldr r1, _08070CCC @ =0x000005BC
	adds r0, r4, r1
	ldrb r1, [r6]
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	beq _08070CA8
	ldr r1, _08070CD0 @ =IWRAM_START + 0x64
	adds r0, r5, r1
	bl sub_80051E8
_08070CA8:
	ldr r1, _08070CD4 @ =IWRAM_START + 0x94
	adds r0, r5, r1
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070CB8: .4byte gCurTask
_08070CBC: .4byte 0x000005BA
_08070CC0: .4byte IWRAM_START+4
_08070CC4: .4byte 0x000005BB
_08070CC8: .4byte IWRAM_START + 0x34
_08070CCC: .4byte 0x000005BC
_08070CD0: .4byte IWRAM_START + 0x64
_08070CD4: .4byte IWRAM_START + 0x94

	thumb_func_start sub_8070CD8
sub_8070CD8: @ 0x08070CD8
	push {r4, lr}
	sub sp, #0x18
	ldr r4, _08070D10 @ =gUnknown_080DF840
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0x70
	str r1, [sp, #4]
	movs r1, #0x64
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	ldrb r1, [r4, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806CA88
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070D10: .4byte gUnknown_080DF840

	thumb_func_start sub_8070D14
sub_8070D14: @ 0x08070D14
	push {r4, r5, lr}
	ldr r0, _08070D68 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r3, [r0]
	ldr r0, [r3, #0xc]
	ldrh r0, [r0, #6]
	ldr r1, _08070D6C @ =IWRAM_START + 0xC0
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	cmp r1, #1
	ble _08070D60
	lsls r1, r1, #3
	ldr r0, _08070D70 @ =gUnknown_080DF830
	adds r1, r1, r0
	ldr r5, _08070D74 @ =IWRAM_START + 0x214
	adds r4, r2, r5
	ldr r5, _08070D78 @ =0x000005BA
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D5A
	ldrh r0, [r1]
	strh r0, [r4, #0xa]
	ldrh r1, [r1, #2]
	ldr r3, _08070D7C @ =IWRAM_START + 0x234
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
_08070D5A:
	adds r0, r4, #0
	bl sub_80051E8
_08070D60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070D68: .4byte gCurTask
_08070D6C: .4byte IWRAM_START + 0xC0
_08070D70: .4byte gUnknown_080DF830
_08070D74: .4byte IWRAM_START + 0x214
_08070D78: .4byte 0x000005BA
_08070D7C: .4byte IWRAM_START + 0x234

	thumb_func_start sub_8070D80
sub_8070D80: @ 0x08070D80
	push {r4, r5, lr}
	sub sp, #0x18
	adds r2, r0, #0
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r3, #0xaa
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r5, #0
	movs r4, #1
	strb r4, [r1]
	movs r1, #0xa9
	lsls r1, r1, #2
	adds r2, r2, r1
	ldr r1, _08070DCC @ =gUnknown_03005B5C
	ldr r1, [r1]
	str r1, [r2]
	adds r3, #0xce
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0x78
	str r1, [sp, #4]
	movs r1, #0x50
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #0x14
	bl sub_806CA88
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070DCC: .4byte gUnknown_03005B5C

	thumb_func_start sub_8070DD0
sub_8070DD0: @ 0x08070DD0
	push {lr}
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r0, r1
	bl sub_80051E8
	pop {r0}
	bx r0

	thumb_func_start sub_8070DE0
sub_8070DE0: @ 0x08070DE0
	adds r3, r0, #0
	ldr r1, _08070DFC @ =gUnknown_03005B5C
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r2, r3, r0
	ldr r0, [r2]
	str r0, [r1]
	movs r1, #0
	str r1, [r2]
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08070DFC: .4byte gUnknown_03005B5C

	thumb_func_start sub_8070E00
sub_8070E00: @ 0x08070E00
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r5, r3, r0
	ldr r0, [r3]
	ldr r1, _08070E1C @ =0x000005C6
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070E28
	ldr r2, _08070E20 @ =0x050003F8
	ldr r4, _08070E24 @ =0x050003F2
	b _08070E2C
	.align 2, 0
_08070E1C: .4byte 0x000005C6
_08070E20: .4byte 0x050003F8
_08070E24: .4byte 0x050003F2
_08070E28:
	ldr r2, _08070E54 @ =0x050003F2
	ldr r4, _08070E58 @ =0x050003F8
_08070E2C:
	ldr r0, _08070E5C @ =0x040000D4
	ldr r6, _08070E60 @ =0x000002B2
	adds r1, r3, r6
	str r1, [r0]
	str r2, [r0, #4]
	ldr r2, _08070E64 @ =0x80000003
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	subs r6, #6
	adds r1, r3, r6
	str r1, [r0]
	str r4, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070E54: .4byte 0x050003F2
_08070E58: .4byte 0x050003F8
_08070E5C: .4byte 0x040000D4
_08070E60: .4byte 0x000002B2
_08070E64: .4byte 0x80000003

	thumb_func_start sub_8070E68
sub_8070E68: @ 0x08070E68
	push {lr}
	ldr r1, _08070E80 @ =0x000002A9
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08070E84 @ =gUnknown_03005B58
	str r1, [r0]
	bl m4aMPlayAllContinue
	pop {r0}
	bx r0
	.align 2, 0
_08070E80: .4byte 0x000002A9
_08070E84: .4byte gUnknown_03005B58

	thumb_func_start sub_8070E88
sub_8070E88: @ 0x08070E88
	push {r4, r5, r6, lr}
	ldr r6, _08070ED4 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r0, [r1]
	movs r2, #0xb7
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x64
	adds r1, r1, r0
	ldr r2, _08070ED8 @ =gUnknown_080DF8A8
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r1, #0xa]
	adds r2, #0x42
	ldrh r0, [r2]
	adds r1, #0x20
	strb r0, [r1]
	bl sub_807087C
	ldr r0, _08070EDC @ =gUnknown_03000514
	adds r4, r4, r0
	strh r5, [r4]
	ldr r1, [r6]
	ldr r0, _08070EE0 @ =sub_8070814
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070ED4: .4byte gCurTask
_08070ED8: .4byte gUnknown_080DF8A8
_08070EDC: .4byte gUnknown_03000514
_08070EE0: .4byte sub_8070814

	thumb_func_start sub_8070EE4
sub_8070EE4: @ 0x08070EE4
	push {lr}
	bl sub_807087C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070EF0
sub_8070EF0: @ 0x08070EF0
	push {lr}
	bl sub_807087C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070EFC
sub_8070EFC: @ 0x08070EFC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r5, _08070F90 @ =gUnknown_080DF914
	adds r0, r5, #0
	bl sub_806CF44
	ldr r2, _08070F94 @ =gUnknown_03005B5C
	ldr r1, [r2]
	str r1, [r6, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xb
	adds r0, r1, r0
	str r0, [r2]
	adds r0, r6, #4
	movs r2, #7
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #0x78
	movs r3, #0x3c
	bl sub_8071380
	str r5, [r6, #0x38]
	movs r3, #0
	movs r0, #1
	strh r0, [r6, #0x3c]
	ldr r0, _08070F98 @ =gUnknown_080DF9A0
	lsls r4, r4, #3
	adds r1, r4, r0
	ldr r1, [r1]
	str r1, [r6, #0x40]
	adds r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r6, #0x44]
	ldr r2, _08070F9C @ =gUnknown_080DF968
	adds r0, r4, r2
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, r2, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r0, r2, #4
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x50
	strh r1, [r0]
	adds r2, #6
	adds r4, r4, r2
	ldrh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x3c
	strh r0, [r1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070F90: .4byte gUnknown_080DF914
_08070F94: .4byte gUnknown_03005B5C
_08070F98: .4byte gUnknown_080DF9A0
_08070F9C: .4byte gUnknown_080DF968

	thumb_func_start sub_8070FA0
sub_8070FA0: @ 0x08070FA0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	ldr r0, _08071090 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r6, r1, r0
	ldr r7, [r6]
	ldr r5, _08071094 @ =gUnknown_03005176
	ldr r2, _08071098 @ =0x000005BA
	adds r2, r2, r7
	mov sb, r2
	ldrb r0, [r2]
	cmp r0, #0
	bne _08070FCE
	bl sub_8071478
_08070FCE:
	ldr r0, [r6, #0x40]
	str r0, [sp, #4]
	ldr r0, [r6, #0x44]
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	add r0, sp, #4
	movs r1, #0x20
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r2, [r0, #0x10]
	adds r1, r0, #0
	movs r0, #0x1d
	strh r0, [r1, #0x12]
	add r4, sp, #0x18
	ldr r2, [r6]
	adds r0, r4, #0
	bl sub_806CB84
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08071082
	ldrh r0, [r4, #0xc]
	strh r0, [r5]
	adds r5, #8
	ldrh r0, [r4, #0xe]
	strh r0, [r5]
	adds r5, #8
	ldrh r0, [r4, #0x10]
	strh r0, [r5]
	ldrh r0, [r4, #0x12]
	strh r0, [r5, #8]
	ldr r0, _0807109C @ =IWRAM_START + 0x48
	add r0, r8
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r1, r7, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	adds r0, #0x40
	ldr r2, _080710A0 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	lsls r3, r0, #0x10
	movs r0, #4
	ldrsh r5, [r4, r0]
	ldr r1, _080710A4 @ =0x000005CC
	adds r0, r7, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #0x3c
	movs r7, #5
	cmp r5, r0
	bge _0807103E
	movs r7, #0xc
_0807103E:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _08071060
	ldr r0, _080710A8 @ =IWRAM_START+4
	add r0, r8
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsrs r3, r3, #0x17
	lsls r3, r3, #3
	ldr r2, [r6, #0x38]
	adds r2, r2, r3
	str r2, [sp]
	adds r2, r5, #0
	adds r3, r7, #0
	bl sub_8071530
_08071060:
	movs r0, #0x3c
	ldrsh r1, [r6, r0]
	cmp r1, #2
	bne _0807107C
	ldr r0, _080710AC @ =IWRAM_START + 0x4C
	add r0, r8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0807107C
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq _08071082
_0807107C:
	adds r0, r6, #4
	bl sub_80051E8
_08071082:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071090: .4byte gCurTask
_08071094: .4byte gUnknown_03005176
_08071098: .4byte 0x000005BA
_0807109C: .4byte IWRAM_START + 0x48
_080710A0: .4byte 0x000003FF
_080710A4: .4byte 0x000005CC
_080710A8: .4byte IWRAM_START+4
_080710AC: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_80710B0
sub_80710B0: @ 0x080710B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0807114C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	ldrh r1, [r0, #6]
	ldr r0, _08071150 @ =IWRAM_START + 0x48
	adds r0, r0, r5
	mov r8, r0
	ldrh r2, [r0]
	mov ip, r2
	mov r3, ip
	rsbs r2, r3, #0
	ldr r0, _08071154 @ =0x000003FF
	mov sl, r0
	mov r3, sl
	ands r2, r3
	ldr r0, _08071158 @ =gSineTable
	mov sb, r0
	lsls r0, r2, #1
	add r0, sb
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r7, r0, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r3, [r0, r2]
	ldr r2, _0807115C @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, [r6, #0x40]
	subs r2, r2, r0
	ldr r0, _08071160 @ =IWRAM_START + 0xAC
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r6, #0x44]
	subs r1, r1, r0
	asrs r0, r7, #8
	asrs r1, r1, #8
	adds r4, r0, #0
	muls r4, r1, r4
	asrs r3, r3, #6
	asrs r2, r2, #8
	adds r0, r3, #0
	muls r0, r2, r0
	adds r4, r4, r0
	rsbs r0, r7, #0
	asrs r0, r0, #8
	muls r2, r0, r2
	adds r0, r3, #0
	muls r0, r1, r0
	adds r0, r2, r0
	mov r1, sb
	cmp r4, #0
	ble _08071168
	ldr r2, _08071164 @ =IWRAM_START + 0x50
	adds r0, r5, r2
	ldrh r0, [r0]
	mov r3, ip
	subs r0, r3, r0
	mov r2, sl
	ands r0, r2
	mov r3, r8
	strh r0, [r3]
	b _08071192
	.align 2, 0
_0807114C: .4byte gCurTask
_08071150: .4byte IWRAM_START + 0x48
_08071154: .4byte 0x000003FF
_08071158: .4byte gSineTable
_0807115C: .4byte IWRAM_START + 0xA8
_08071160: .4byte IWRAM_START + 0xAC
_08071164: .4byte IWRAM_START + 0x50
_08071168:
	cmp r4, #0
	bge _0807117C
	ldr r2, _08071178 @ =IWRAM_START + 0x50
	adds r0, r5, r2
	ldrh r0, [r0]
	add r0, ip
	b _0807118A
	.align 2, 0
_08071178: .4byte IWRAM_START + 0x50
_0807117C:
	cmp r0, #0
	bge _08071192
	ldr r3, _08071208 @ =IWRAM_START + 0x50
	adds r0, r5, r3
	ldrh r0, [r0]
	mov r2, ip
	subs r0, r2, r0
_0807118A:
	mov r3, sl
	ands r0, r3
	mov r2, r8
	strh r0, [r2]
_08071192:
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r7, r0, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #2
	adds r4, r6, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r1, r7, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r6, #0x40]
	subs r0, r0, r1
	str r0, [r6, #0x40]
	ldrh r0, [r4]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r6, #0x44]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	adds r0, r6, #0
	bl sub_80714F4
	adds r0, r6, #0
	bl sub_807120C
	adds r2, r6, #0
	adds r2, #0x52
	ldrh r0, [r2]
	ldrh r3, [r4]
	adds r0, r0, r3
	strh r0, [r4]
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _080711F8
	ldrh r0, [r2]
	strh r0, [r4]
_080711F8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071208: .4byte IWRAM_START + 0x50

	thumb_func_start sub_807120C
sub_807120C: @ 0x0807120C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r7, [r5]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r5, #0x40]
	lsrs r3, r0, #0x10
	ldr r0, [r5, #0x44]
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r2, _08071270 @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	ldrh r2, [r0, #2]
	ldr r6, _08071274 @ =IWRAM_START + 0xAC
	adds r0, r1, r6
	ldrh r0, [r0, #2]
	mov sl, r0
	adds r6, #4
	adds r0, r1, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _08071278 @ =IWRAM_START + 0xB4
	adds r1, r1, r0
	ldrh r6, [r1]
	mov sb, r6
	movs r0, #0
	ldrsh r1, [r1, r0]
	cmp r1, #6
	bne _0807125E
	b _08071372
_0807125E:
	cmp r1, #6
	bgt _0807127C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807126C
	b _08071372
_0807126C:
	b _08071284
	.align 2, 0
_08071270: .4byte IWRAM_START + 0xA8
_08071274: .4byte IWRAM_START + 0xAC
_08071278: .4byte IWRAM_START + 0xB4
_0807127C:
	cmp r1, #0xa
	beq _08071372
	cmp r1, #0xe
	beq _08071372
_08071284:
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #5
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08071372
	adds r0, r3, #5
	cmp r0, r2
	ble _08071372
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #5
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08071372
	adds r0, r3, #5
	cmp r0, r2
	ble _08071372
	movs r1, #0
	mov r6, ip
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _08071372
	cmp r0, #3
	bgt _08071372
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r2, _080712F8 @ =0xFFFC0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080712D4
	cmp r1, #9
	bne _08071300
_080712D4:
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r1, [r0]
	subs r0, #8
	strh r1, [r0]
	movs r0, #2
	strh r0, [r5, #0x3c]
	adds r0, r7, #0
	bl sub_806F944
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #0xa
	strh r0, [r1]
	ldr r0, _080712FC @ =0x00000113
	bl m4aSongNumStart
	b _08071372
	.align 2, 0
_080712F8: .4byte 0xFFFC0000
_080712FC: .4byte 0x00000113
_08071300:
	ldr r6, _08071338 @ =0x000005A4
	adds r0, r7, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807133C
	adds r0, r4, #0
	adds r0, #0xb6
	movs r6, #0
	ldrsh r2, [r0, r6]
	cmp r2, #0
	bne _08071372
	adds r0, #0x46
	ldrh r1, [r0]
	subs r0, #0x44
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #0xe
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc8
	str r2, [r0]
	movs r0, #0x92
	bl m4aSongNumStart
	b _08071372
	.align 2, 0
_08071338: .4byte 0x000005A4
_0807133C:
	adds r6, r4, #0
	adds r6, #0xb6
	movs r0, #0
	ldrsh r5, [r6, r0]
	cmp r5, #0
	bne _08071372
	adds r0, r7, #0
	movs r1, #0xa
	bl sub_806D924
	adds r0, r4, #0
	adds r0, #0xf8
	ldrh r1, [r0]
	subs r0, #0x40
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #6
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc8
	str r5, [r0]
	movs r0, #0x96
	strh r0, [r6]
	movs r0, #0x76
	bl m4aSongNumStart
_08071372:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8071380
sub_8071380: @ 0x08071380
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	adds r4, r1, #0
	ldr r0, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r5, _0807142C @ =gUnknown_03005176
	ldr r1, _08071430 @ =0x0000107F
	ldrb r2, [r6, #7]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080713B4
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
_080713B4:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080713C2
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r1, r0
_080713C2:
	mov r0, ip
	str r4, [r0, #4]
	movs r2, #0
	movs r4, #0
	strh r4, [r0, #8]
	ldrh r0, [r6]
	mov r7, ip
	strh r0, [r7, #0xa]
	str r1, [r7, #0x10]
	mov r0, r8
	strh r0, [r7, #0x16]
	mov r1, sb
	strh r1, [r7, #0x18]
	lsls r0, r3, #6
	strh r0, [r7, #0x1a]
	strh r4, [r7, #0x1c]
	ldr r0, _08071434 @ =0x0000FFFF
	strh r0, [r7, #0x1e]
	ldrh r1, [r6, #2]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldrb r0, [r6, #6]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	mov r0, ip
	bl sub_8004558
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	strh r0, [r5]
	adds r5, #8
	strh r4, [r5]
	adds r5, #8
	strh r4, [r5]
	strh r0, [r5, #8]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807142C: .4byte gUnknown_03005176
_08071430: .4byte 0x0000107F
_08071434: .4byte 0x0000FFFF

	thumb_func_start sub_8071438
sub_8071438: @ 0x08071438
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0807146C @ =sub_8070FA0
	movs r2, #0xa0
	lsls r2, r2, #8
	ldr r1, _08071470 @ =sub_8071474
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	adds r4, r0, #0
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r5, [r0]
	bl sub_8070EFC
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807146C: .4byte sub_8070FA0
_08071470: .4byte sub_8071474

	thumb_func_start sub_8071474
sub_8071474: @ 0x08071474
	bx lr
	.align 2, 0

	thumb_func_start sub_8071478
sub_8071478: @ 0x08071478
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _080714B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r2, [r3]
	mov r1, sp
	ldr r0, _080714BC @ =gUnknown_080DF95C
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldr r0, _080714C0 @ =0x000005B4
	adds r2, r2, r0
	ldrh r0, [r2]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080714B0
	movs r1, #0x3c
	ldrsh r0, [r3, r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl _call_via_r0
_080714B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080714B8: .4byte gCurTask
_080714BC: .4byte gUnknown_080DF95C
_080714C0: .4byte 0x000005B4

	thumb_func_start sub_80714C4
sub_80714C4: @ 0x080714C4
	bx lr
	.align 2, 0

	thumb_func_start sub_80714C8
sub_80714C8: @ 0x080714C8
	push {lr}
	ldr r0, _080714F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	adds r0, #0x4c
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080714EA
	movs r0, #1
	strh r0, [r2, #0x3c]
_080714EA:
	pop {r0}
	bx r0
	.align 2, 0
_080714F0: .4byte gCurTask

	thumb_func_start sub_80714F4
sub_80714F4: @ 0x080714F4
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x40]
	ldr r3, _08071528 @ =0x0029FFFF
	cmp r0, r3
	bgt _08071506
	movs r0, #0xa8
	lsls r0, r0, #0xe
	str r0, [r1, #0x40]
_08071506:
	ldr r0, [r1, #0x40]
	ldr r2, _0807152C @ =0x3D60000
	cmp r0, r2
	ble _08071510
	str r2, [r1, #0x40]
_08071510:
	ldr r0, [r1, #0x44]
	cmp r0, r3
	bgt _0807151C
	movs r0, #0xa8
	lsls r0, r0, #0xe
	str r0, [r1, #0x44]
_0807151C:
	ldr r0, [r1, #0x44]
	cmp r0, r2
	ble _08071524
	str r2, [r1, #0x44]
_08071524:
	pop {r0}
	bx r0
	.align 2, 0
_08071528: .4byte 0x0029FFFF
_0807152C: .4byte 0x3D60000

	thumb_func_start sub_8071530
sub_8071530: @ 0x08071530
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _0807158C @ =0x0000107F
	ldrb r1, [r5, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08071554
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08071554:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08071562
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
_08071562:
	ldrh r0, [r5]
	strh r0, [r4, #0xa]
	str r2, [r4, #0x10]
	strh r7, [r4, #0x16]
	strh r6, [r4, #0x18]
	lsls r0, r3, #6
	strh r0, [r4, #0x1a]
	ldrh r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrb r0, [r5, #6]
	adds r1, r4, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807158C: .4byte 0x0000107F

	thumb_func_start sub_8071590
sub_8071590: @ 0x08071590
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	movs r5, #0
	ldr r0, _0807162C @ =gLoadedSaveGame
	mov sb, r0
_080715A6:
	lsls r6, r5, #0x10
	asrs r1, r6, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r2, sb
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r0, [r4]
	cmp sl, r0
	bne _08071630
	adds r1, r4, #4
	mov r0, r8
	movs r2, #6
	bl sub_807257C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08071630
	mov r1, sp
	adds r0, r4, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r2, r7}
	stm r1!, {r2, r7}
	adds r1, r6, #0
	ldr r6, _0807162C @ =gLoadedSaveGame
	cmp r1, #0
	ble _08071616
	mov r8, r6
	movs r4, #0xab
	lsls r4, r4, #2
_080715EC:
	mov r3, r8
	ldr r2, [r3]
	asrs r3, r1, #0x10
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r2, r1
	subs r3, #1
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r1, r1, r4
	adds r2, r2, r4
	ldm r2!, {r0, r5, r7}
	stm r1!, {r0, r5, r7}
	ldm r2!, {r5, r7}
	stm r1!, {r5, r7}
	lsls r1, r3, #0x10
	cmp r1, #0
	bgt _080715EC
_08071616:
	ldr r1, [r6]
	movs r0, #0xab
	lsls r0, r0, #2
	adds r1, r1, r0
	mov r0, sp
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r5, r7}
	stm r1!, {r5, r7}
	b _080716D0
	.align 2, 0
_0807162C: .4byte gLoadedSaveGame
_08071630:
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _080715A6
	movs r5, #9
	ldr r6, _080716E0 @ =gLoadedSaveGame
	mov ip, r6
	movs r4, #0xab
	lsls r4, r4, #2
_0807164A:
	mov r3, ip
	ldr r2, [r3]
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r2, r0
	subs r3, #1
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r2, r2, r1
	adds r0, r0, r4
	adds r2, r2, r4
	ldm r2!, {r1, r5, r7}
	stm r0!, {r1, r5, r7}
	ldm r2!, {r5, r7}
	stm r0!, {r5, r7}
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	cmp r3, #0
	bgt _0807164A
	ldr r0, [r6]
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r2, sl
	str r2, [r0]
	movs r5, #0
	adds r4, r6, #0
	movs r3, #0xac
	lsls r3, r3, #2
_0807168C:
	ldr r2, [r4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r2, r2, r3
	adds r2, r2, r1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0807168C
	ldr r0, [r6]
	movs r3, #0xaf
	lsls r3, r3, #2
	adds r0, r0, r3
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	ldr r4, _080716E4 @ =0x000002BD
	adds r0, r0, r4
	strb r2, [r0]
	ldr r0, [r6]
	ldr r5, _080716E8 @ =0x000002BE
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r6]
	ldr r7, _080716EC @ =0x000002BF
	adds r0, r0, r7
	strb r2, [r0]
_080716D0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080716E0: .4byte gLoadedSaveGame
_080716E4: .4byte 0x000002BD
_080716E8: .4byte 0x000002BE
_080716EC: .4byte 0x000002BF

	thumb_func_start sub_80716F0
sub_80716F0: @ 0x080716F0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071720
	cmp r0, #1
	bgt _08071704
	cmp r0, #0
	beq _0807170A
	b _08071742
_08071704:
	cmp r0, #2
	beq _08071734
	b _08071742
_0807170A:
	ldr r0, _0807171C @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #0x1c]
	cmp r0, #0x62
	bhi _08071742
	adds r0, #1
	strb r0, [r1, #0x1c]
	b _08071742
	.align 2, 0
_0807171C: .4byte gLoadedSaveGame
_08071720:
	ldr r0, _08071730 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x62
	bhi _08071742
	adds r0, #1
	strb r0, [r1, #0x1d]
	b _08071742
	.align 2, 0
_08071730: .4byte gLoadedSaveGame
_08071734:
	ldr r0, _08071748 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x62
	bhi _08071742
	adds r0, #1
	strb r0, [r1, #0x1e]
_08071742:
	pop {r0}
	bx r0
	.align 2, 0
_08071748: .4byte gLoadedSaveGame

	thumb_func_start sub_807174C
sub_807174C: @ 0x0807174C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r2, #0
	ldr r0, _080717A4 @ =gLoadedSaveGame
	mov sb, r0
_08071762:
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sb
	ldr r1, [r3]
	adds r4, r1, r0
	ldr r0, [r4]
	adds r5, r2, #0
	cmp r8, r0
	bne _080717D2
	adds r1, r4, #4
	adds r0, r7, #0
	movs r2, #6
	bl sub_807257C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080717D2
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080717BA
	cmp r0, #1
	bgt _080717A8
	cmp r0, #0
	beq _080717AE
	b _080717E0
	.align 2, 0
_080717A4: .4byte gLoadedSaveGame
_080717A8:
	cmp r0, #2
	beq _080717C6
	b _080717E0
_080717AE:
	ldrb r0, [r4, #0x11]
	cmp r0, #0x62
	bhi _080717E0
	adds r0, #1
	strb r0, [r4, #0x11]
	b _080717E0
_080717BA:
	ldrb r0, [r4, #0x12]
	cmp r0, #0x62
	bhi _080717E0
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080717E0
_080717C6:
	ldrb r0, [r4, #0x13]
	cmp r0, #0x62
	bhi _080717E0
	adds r0, #1
	strb r0, [r4, #0x13]
	b _080717E0
_080717D2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071762
_080717E0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
