.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D6736
gUnknown_080D6736:
    .incbin "baserom.gba", 0x000D6736, 0x1CC
    
.text
.syntax unified
.arm

	thumb_func_start sub_80213C0
sub_80213C0: @ 0x080213C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r2, #0
	adds r0, r5, #0
	adds r0, #0x60
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, _08021408 @ =Task_8023FC0
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _0802140C @ =TaskDestructor_802A07C
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0
	strb r4, [r0]
	str r1, [r0, #4]
	ldr r0, _08021410 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802141C
	cmp r0, #5
	beq _08021418
	ldr r1, _08021414 @ =gRingCount
	movs r0, #1
	strh r0, [r1]
	b _0802141C
	.align 2, 0
_08021408: .4byte Task_8023FC0
_0802140C: .4byte TaskDestructor_802A07C
_08021410: .4byte gGameMode
_08021414: .4byte gRingCount
_08021418:
	ldr r0, _08021474 @ =gRingCount
	strh r1, [r0]
_0802141C:
	adds r0, r5, #0
	bl sub_8021694
	ldr r1, _08021478 @ =gPlayer
	ldr r0, _0802147C @ =PlayerCB_8025318
	str r0, [r1]
	bl sub_801F754
	bl sub_801FC2C
	ldr r6, _08021480 @ =gInputRecorder
	ldrb r4, [r6, #8]
	cmp r4, #1
	beq _0802143C
	cmp r4, #2
	bne _08021442
_0802143C:
	bl InputRecorderLoadTape
	strb r4, [r6, #8]
_08021442:
	ldr r0, _08021484 @ =gUnknown_030054D0
	movs r1, #0
	str r1, [r0]
	ldr r0, _08021488 @ =gUnknown_030054FC
	str r1, [r0]
	ldr r0, _0802148C @ =gUnknown_030054E0
	str r1, [r0]
	bl sub_800E16C
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8021490
	adds r0, r5, #0
	adds r0, #0x94
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8021554
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021474: .4byte gRingCount
_08021478: .4byte gPlayer
_0802147C: .4byte PlayerCB_8025318
_08021480: .4byte gInputRecorder
_08021484: .4byte gUnknown_030054D0
_08021488: .4byte gUnknown_030054FC
_0802148C: .4byte gUnknown_030054E0

	thumb_func_start sub_8021490
sub_8021490: @ 0x08021490
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, #0x60
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r6, #0
	adds r4, #0xc
	cmp r7, #0
	bne _080214AC
	ldr r0, _080214A8 @ =0x06010000
	b _080214B2
	.align 2, 0
_080214A8: .4byte 0x06010000
_080214AC:
	movs r0, #0x40
	bl VramMalloc
_080214B2:
	str r0, [r4, #4]
	movs r2, #0
	strh r2, [r4, #8]
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r7, #0
	adds r0, #0x10
	lsls r0, r0, #6
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08021508 @ =gGameMode
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #2
	bls _08021510
	ldr r0, _0802150C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, r4, #0
	adds r1, #0x25
	b _08021516
	.align 2, 0
_08021508: .4byte gGameMode
_0802150C: .4byte 0x04000128
_08021510:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_08021516:
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r4, #0x10]
	ldrb r0, [r2]
	cmp r0, #2
	bls _0802152C
	movs r0, #0xc0
	lsls r0, r0, #0xc
	orrs r0, r1
	str r0, [r4, #0x10]
_0802152C:
	ldr r0, [r4, #0x10]
	movs r1, #0x20
	orrs r0, r1
	orrs r0, r7
	str r0, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021554
sub_8021554: @ 0x08021554
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, r1, #0
	adds r4, r0, #0
	adds r4, #0xc
	adds r6, r0, #0
	adds r0, r7, #0
	adds r0, #0x85
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #1
	bne _08021580
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x5f
	strh r0, [r4, #0xa]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r5, [r0]
	b _08021598
_08021580:
	cmp r5, #2
	bne _080215F8
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xba
	strh r0, [r4, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
_08021598:
	movs r1, #0
	strh r1, [r4, #8]
	adds r2, r4, #0
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080215D4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _080215DC
	ldr r0, _080215D8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #3
	b _080215E2
	.align 2, 0
_080215D4: .4byte gGameMode
_080215D8: .4byte 0x04000128
_080215DC:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_080215E2:
	strb r0, [r1]
	ldr r0, _08021600 @ =0x00042024
	str r0, [r4, #0x10]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
_080215F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021600: .4byte 0x00042024

@ Called by sub_80299F0
	thumb_func_start sub_8021604
sub_8021604: @ 0x08021604
	push {r4, lr}
	adds r4, r1, #0
	mov ip, r3
	mov r1, ip
	adds r1, #0x60
	strb r2, [r1]
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, _08021638 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08021640
	ldr r1, _0802163C @ =gSpawnPositions
	lsls r2, r4, #2
	adds r0, r2, r1
	ldrh r3, [r0]
	mov r0, ip
	adds r0, #0x74
	strh r3, [r0]
	adds r1, #2
	adds r2, r2, r1
	ldrh r0, [r2]
	mov r3, ip
	adds r3, #0x76
	strh r0, [r3]
	b _0802166A
	.align 2, 0
_08021638: .4byte gGameMode
_0802163C: .4byte gSpawnPositions
_08021640:
	ldr r0, _08021688 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x74
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb1
	strh r0, [r1]
	subs r0, #0xb2
	mov r1, ip
	str r0, [r1, #8]
	str r0, [r1, #0xc]
_0802166A:
	mov r1, ip
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
	mov r2, ip
	str r0, [r2, #0x78]
	subs r1, #8
	ldr r0, _0802168C @ =gUnknown_03005AF0
	str r0, [r1]
	adds r1, #4
	ldr r0, _08021690 @ =gUnknown_03005AA0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021688: .4byte 0x04000128
_0802168C: .4byte gUnknown_03005AF0
_08021690: .4byte gUnknown_03005AA0

@ In:
@  r0: Player*
	thumb_func_start sub_8021694
sub_8021694: @ 0x08021694
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080216B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080216B8
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ands r0, r1
	adds r0, #1
	cmp r0, #0
	beq _080216B8
	movs r0, #0xe6
	lsls r0, r0, #9
	b _080216C2
	.align 2, 0
_080216B4: .4byte gGameMode
_080216B8:
	adds r0, r5, #0
	adds r0, #0x74
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
_080216C2:
	str r0, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x76
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, _0802181C @ =PlayerCB_8025318
	str r0, [r5]
	ldr r0, _08021820 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r1, [r0, #2]
	orrs r2, r1
	ldrh r0, [r0, #4]
	orrs r2, r0
	adds r0, r5, #0
	adds r0, #0x5c
	movs r3, #0
	movs r4, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
	strh r4, [r5, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0xe
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	strb r3, [r0]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	strh r4, [r5, #0x26]
	adds r0, r5, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #4
	str r0, [r5, #0x40]
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r5, #0x44]
	movs r0, #8
	str r0, [r5, #0x48]
	movs r0, #0x40
	str r0, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r1, #0x2e
	ldr r0, _08021824 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	strh r4, [r5, #0x2c]
	strh r4, [r5, #0x2e]
	strh r4, [r5, #0x30]
	strh r4, [r5, #0x32]
	str r4, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r3, [r0]
	strh r4, [r5, #0x2a]
	adds r1, #8
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r3, [r0]
	subs r0, #0x23
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r5, #0
	adds r1, #0x86
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6d
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0x15
	strb r3, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #0x14
	strb r3, [r0]
	adds r0, #5
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	subs r0, #0x3a
	strb r3, [r0]
	bl sub_8015750
	bl sub_801561C
	adds r0, r5, #0
	bl sub_802989C
	adds r1, r5, #0
	adds r1, #0x99
	movs r2, #3
	adds r6, r1, #0
	adds r4, r5, #0
	adds r4, #0x60
	movs r0, #0x85
	adds r0, r0, r5
	mov ip, r0
	movs r3, #0
_080217EA:
	stm r1!, {r3}
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080217EA
	movs r0, #0x7f
	strb r0, [r6]
	movs r2, #0
	ldrsb r2, [r4, r2]
	cmp r2, #0
	bne _08021840
	ldr r0, _08021828 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08021840
	ldr r3, _0802182C @ =gCourseTime
	ldr r1, [r3]
	ldr r0, _08021830 @ =0x00008C9F
	cmp r1, r0
	bls _08021838
	ldr r0, _08021834 @ =gCheckpointTime
	str r2, [r0]
	str r2, [r3]
	str r2, [r5, #0x78]
	b _08021840
	.align 2, 0
_0802181C: .4byte PlayerCB_8025318
_08021820: .4byte gPlayerControls
_08021824: .4byte 0x0000FFFF
_08021828: .4byte gGameMode
_0802182C: .4byte gCourseTime
_08021830: .4byte 0x00008C9F
_08021834: .4byte gCheckpointTime
_08021838:
	ldr r1, _08021854 @ =gCheckpointTime
	ldr r0, [r5, #0x78]
	str r0, [r1]
	str r0, [r3]
_08021840:
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	bhi _080218C2
	lsls r0, r0, #2
	ldr r1, _08021858 @ =_0802185C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021854: .4byte gCheckpointTime
_08021858: .4byte _0802185C
_0802185C: @ jump table
	.4byte _08021870 @ case 0
	.4byte _08021882 @ case 1
	.4byte _08021896 @ case 2
	.4byte _080218A8 @ case 3
	.4byte _080218BA @ case 4
_08021870:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _080218C2
_08021882:
	adds r0, r5, #0
	adds r0, #0xae
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
	b _080218C2
_08021896:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	str r1, [r0]
	subs r0, #3
	strb r1, [r0]
	b _080218C2
_080218A8:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080218C2
_080218BA:
	adds r1, r5, #0
	adds r1, #0xac
	movs r0, #0
	strb r0, [r1]
_080218C2:
	ldr r1, _080218D8 @ =IWRAM_START + 0x5B7C
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080218DC @ =gUnknown_03005840
	movs r1, #0
	str r1, [r0]
	ldr r0, _080218E0 @ =gUnknown_0300583C
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080218D8: .4byte IWRAM_START + 0x5B7C
_080218DC: .4byte gUnknown_03005840
_080218E0: .4byte gUnknown_0300583C

	thumb_func_start sub_80218E4
sub_80218E4: @ 0x080218E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080218FA
	ldr r0, _08021950 @ =0x00000119
	bl m4aSongNumStop
_080218FA:
	ldr r0, [r4, #0x20]
	ldr r1, _08021954 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x85
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _0802192C
	movs r0, #0x78
	bl m4aSongNumStop
_0802192C:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0802193A
	movs r0, #0xe3
	bl m4aSongNumStop
_0802193A:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802194A
	ldr r0, [r4, #0x20]
	ldr r1, _08021958 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
_0802194A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021950: .4byte 0x00000119
_08021954: .4byte 0xCEF118CF
_08021958: .4byte 0xFDFFFFFF

	thumb_func_start sub_802195C
sub_802195C: @ 0x0802195C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021974
	add r6, sp, #8
_08021974:
	cmp r7, #0
	bne _0802197A
	add r7, sp, #0xc
_0802197A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021A10 @ =0x000002FF
	cmp r0, r5
	bgt _080219A6
	movs r0, #0x80
	orrs r2, r0
_080219A6:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021A14 @ =sub_801ED24
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021A10 @ =0x000002FF
	cmp r0, r3
	bgt _080219EA
	movs r0, #0x80
	orrs r2, r0
_080219EA:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021A18
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021A20
	.align 2, 0
_08021A10: .4byte 0x000002FF
_08021A14: .4byte sub_801ED24
_08021A18:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021A20:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021A34
sub_8021A34: @ 0x08021A34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021A4C
	add r6, sp, #8
_08021A4C:
	cmp r7, #0
	bne _08021A52
	add r7, sp, #0xc
_08021A52:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021AE4 @ =0x000002FF
	cmp r0, r5
	bgt _08021A7E
	movs r0, #0x80
	orrs r2, r0
_08021A7E:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021AE8 @ =sub_801ED24
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021AE4 @ =0x000002FF
	cmp r0, r3
	bgt _08021AC0
	movs r0, #0x80
	orrs r2, r0
_08021AC0:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021AEC
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021AF4
	.align 2, 0
_08021AE4: .4byte 0x000002FF
_08021AE8: .4byte sub_801ED24
_08021AEC:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021AF4:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021B08
sub_8021B08: @ 0x08021B08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021B20
	add r6, sp, #8
_08021B20:
	cmp r7, #0
	bne _08021B26
	add r7, sp, #0xc
_08021B26:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021BBC @ =0x000002FF
	cmp r0, r5
	bgt _08021B52
	movs r0, #0x80
	orrs r2, r0
_08021B52:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021BC0 @ =sub_801EE64
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021BBC @ =0x000002FF
	cmp r0, r3
	bgt _08021B96
	movs r0, #0x80
	orrs r2, r0
_08021B96:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021BC4
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021BCC
	.align 2, 0
_08021BBC: .4byte 0x000002FF
_08021BC0: .4byte sub_801EE64
_08021BC4:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021BCC:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021BE0
sub_8021BE0: @ 0x08021BE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _08021C34
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08021C08
	ldr r0, _08021C2C @ =gPlayer
	ldr r1, _08021C30 @ =PlayerCB_8025318
	str r1, [r0]
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08021C08:
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08021C22
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
_08021C22:
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _08021C3C
	.align 2, 0
_08021C2C: .4byte gPlayer
_08021C30: .4byte PlayerCB_8025318
_08021C34:
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08021C3C:
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021C4C
sub_8021C4C: @ 0x08021C4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021CF8 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _08021C7E
	movs r2, #0x80
	orrs r2, r5
_08021C7E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _08021CFC @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021CA2
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021CA2:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _08021CC0
	movs r0, #0x80
	orrs r2, r0
_08021CC0:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021CDE
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021CDE:
	add r2, sp, #0xc
	ldr r0, _08021D00 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021D04
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
	b _08021D0C
	.align 2, 0
_08021CF8: .4byte 0x000002FF
_08021CFC: .4byte sub_801ED24
_08021D00: .4byte gUnknown_03005424
_08021D04:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
_08021D0C:
	adds r2, r0, #0
	cmp r2, #0
	bge _08021DAA
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	adds r1, #6
	rsbs r1, r1, #0
	cmp r2, r1
	bge _08021D26
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _08021DAA
_08021D26:
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _08021D70 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021D3E
	rsbs r2, r2, #0
_08021D3E:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8021BE0
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08021D74
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xbd
	lsls r1, r1, #4
	cmp r0, r1
	ble _08021D8E
	strh r1, [r4, #0x12]
	b _08021D8E
	.align 2, 0
_08021D70: .4byte gUnknown_03005424
_08021D74:
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08021D86
	strh r1, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	b _08021DA8
_08021D86:
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_08021D8E:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08021D98
	rsbs r1, r1, #0
_08021D98:
	strh r1, [r4, #0x14]
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08021DAA
	rsbs r0, r1, #0
_08021DA8:
	strh r0, [r4, #0x14]
_08021DAA:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021DB8
sub_8021DB8: @ 0x08021DB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021E64 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _08021DEA
	movs r2, #0x80
	orrs r2, r5
_08021DEA:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _08021E68 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021E0E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021E0E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _08021E2C
	movs r0, #0x80
	orrs r2, r0
_08021E2C:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021E4A
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021E4A:
	add r2, sp, #0xc
	ldr r0, _08021E6C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021E70
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
	b _08021E78
	.align 2, 0
_08021E64: .4byte 0x000002FF
_08021E68: .4byte sub_801ED24
_08021E6C: .4byte gUnknown_03005424
_08021E70:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
_08021E78:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021ED4
	ldr r0, _08021ECC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021E8C
	rsbs r2, r2, #0
_08021E8C:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08021ED0
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #0x40
	cmp r0, #0
	ble _08021ED0
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_8021BE0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08021EC8
	rsbs r0, r0, #0
_08021EC8:
	strh r0, [r4, #0x14]
	b _08021ED4
	.align 2, 0
_08021ECC: .4byte gUnknown_03005424
_08021ED0:
	movs r0, #0
	strh r0, [r4, #0x12]
_08021ED4:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021EE4
sub_8021EE4: @ 0x08021EE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov ip, r0
	ldr r0, _08021F20 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08021F28
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r3, #0x88
	movs r2, #0
	str r2, [sp]
	ldr r2, _08021F24 @ =sub_801ED24
	str r2, [sp, #4]
	mov r2, ip
	b _08021F54
	.align 2, 0
_08021F20: .4byte gUnknown_03005424
_08021F24: .4byte sub_801ED24
_08021F28:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r7, r0, r1
	ldr r0, [r5, #0xc]
	asrs r6, r0, #8
	mov r2, ip
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _08021F88 @ =0x000002FF
	cmp r1, r0
	bgt _08021F46
	orrs r2, r3
_08021F46:
	movs r3, #8
	rsbs r3, r3, #0
	str r4, [sp]
	ldr r0, _08021F8C @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
_08021F54:
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021F6E
	lsls r1, r2, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
_08021F6E:
	ldr r0, _08021F90 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r4, sp, #0xc
	cmp r0, #0
	beq _08021F94
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
	b _08021F9E
	.align 2, 0
_08021F88: .4byte 0x000002FF
_08021F8C: .4byte sub_801ED24
_08021F90: .4byte gUnknown_03005424
_08021F94:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
_08021F9E:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021FCC
	ldr r0, _08021FC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021FB2
	rsbs r2, r2, #0
_08021FB2:
	lsls r0, r2, #8
	ldr r1, [r5, #0xc]
	subs r1, r1, r0
	str r1, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0802202E
	movs r0, #0
	strh r0, [r5, #0x12]
	b _0802202E
	.align 2, 0
_08021FC8: .4byte gUnknown_03005424
_08021FCC:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0802202E
	ldr r0, _08021FEC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021FF0
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
	b _08021FFA
	.align 2, 0
_08021FEC: .4byte gUnknown_03005424
_08021FF0:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
_08021FFA:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802202E
	ldr r0, _08022038 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802200E
	rsbs r2, r2, #0
_0802200E:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_0802202E:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022038: .4byte gUnknown_03005424

	thumb_func_start sub_802203C
sub_802203C: @ 0x0802203C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x38
	ldrb r7, [r0]
	ldr r0, _08022074 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	mov ip, r0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0802207C
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08022078 @ =sub_801ED24
	str r2, [sp, #4]
	adds r2, r7, #0
	b _080220A6
	.align 2, 0
_08022074: .4byte gUnknown_03005424
_08022078: .4byte sub_801ED24
_0802207C:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r6, r0, r1
	ldr r0, [r5, #0xc]
	asrs r4, r0, #8
	adds r2, r7, #0
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _080220DC @ =0x000002FF
	cmp r1, r0
	bgt _0802209C
	mov r1, ip
	orrs r2, r1
_0802209C:
	str r3, [sp]
	ldr r0, _080220E0 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
_080220A6:
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _080220C2
	lsls r1, r2, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
_080220C2:
	ldr r0, _080220E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r4, sp, #0xc
	cmp r0, #0
	beq _080220E8
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
	b _080220F2
	.align 2, 0
_080220DC: .4byte 0x000002FF
_080220E0: .4byte sub_801ED24
_080220E4: .4byte gUnknown_03005424
_080220E8:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
_080220F2:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022120
	ldr r0, _0802211C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022106
	rsbs r2, r2, #0
_08022106:
	lsls r0, r2, #8
	ldr r1, [r5, #0xc]
	subs r1, r1, r0
	str r1, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08022182
	movs r0, #0
	strh r0, [r5, #0x12]
	b _08022182
	.align 2, 0
_0802211C: .4byte gUnknown_03005424
_08022120:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _08022182
	ldr r0, _08022140 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022144
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
	b _0802214E
	.align 2, 0
_08022140: .4byte gUnknown_03005424
_08022144:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
_0802214E:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022182
	ldr r0, _0802218C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022162
	rsbs r2, r2, #0
_08022162:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_08022182:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802218C: .4byte gUnknown_03005424

	thumb_func_start sub_8022190
sub_8022190: @ 0x08022190
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r3, [r4, #0x12]
	adds r5, r3, #0
	ldr r0, _080221E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	asrs r0, r0, #0x1f
	ands r0, r2
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bne _080221B8
	cmp r3, #0
	beq _080221C6
_080221B8:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
_080221C6:
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08022202
	cmp r0, #1
	bgt _080221E8
	cmp r0, #0
	beq _080221F2
	b _08022210
	.align 2, 0
_080221E4: .4byte gUnknown_03005424
_080221E8:
	cmp r0, #2
	beq _080221FA
	cmp r0, #3
	beq _0802220A
	b _08022210
_080221F2:
	adds r0, r4, #0
	bl sub_8021C4C
	b _08022210
_080221FA:
	adds r0, r4, #0
	bl sub_8021DB8
	b _08022210
_08022202:
	adds r0, r4, #0
	bl sub_8021EE4
	b _08022210
_0802220A:
	adds r0, r4, #0
	bl sub_802203C
_08022210:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8022218
sub_8022218: @ 0x08022218
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r2, sp, #4
	ldr r0, _08022238 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802223C
	adds r0, r5, #0
	mov r1, sp
	bl sub_8029AC0
	b _08022244
	.align 2, 0
_08022238: .4byte gUnknown_03005424
_0802223C:
	adds r0, r5, #0
	mov r1, sp
	bl sub_8029B0C
_08022244:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022278
	ldr r0, _08022280 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022258
	rsbs r2, r2, #0
_08022258:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_08022278:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08022280: .4byte gUnknown_03005424

	thumb_func_start sub_8022284
sub_8022284: @ 0x08022284
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	ldr r0, _080222A4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080222A8
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029B0C
	b _080222B0
	.align 2, 0
_080222A4: .4byte gUnknown_03005424
_080222A8:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029AC0
_080222B0:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802230A
	ldr r0, _08022314 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080222C4
	rsbs r2, r2, #0
_080222C4:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8021BE0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _080222E6
	rsbs r1, r1, #0
_080222E6:
	strh r1, [r4, #0x14]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080222F8
	rsbs r0, r1, #0
	strh r0, [r4, #0x14]
_080222F8:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802230A
	ldr r0, [r4, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #0x20]
_0802230A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022314: .4byte gUnknown_03005424

	thumb_func_start sub_8022318
sub_8022318: @ 0x08022318
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08022334
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #0xe
	strb r0, [r3, #0x17]
	adds r2, r3, #0
	adds r2, #0x64
	b _0802237A
_08022334:
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3, #0x20]
	adds r2, r3, #0
	adds r2, #0x64
	movs r0, #0
	strh r0, [r2]
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	adds r4, r0, #0
	subs r4, #0xe
	ldr r0, _080223B8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802235A
	rsbs r4, r4, #0
_0802235A:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0802236A
	rsbs r4, r4, #0
_0802236A:
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #0xe
	strb r0, [r3, #0x17]
	lsls r1, r4, #8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r3, #0xc]
_0802237A:
	ldr r0, [r3, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x1e
	ands r0, r1
	adds r1, #0x10
	ands r0, r1
	subs r1, #0xf0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x84
	movs r4, #0
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x61
	strb r4, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x5b
	ble _080223B0
	strh r4, [r2]
_080223B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080223B8: .4byte gUnknown_03005424

	thumb_func_start sub_80223BC
sub_80223BC: @ 0x080223BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08022480 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _080223EE
	movs r2, #0x80
	orrs r2, r5
_080223EE:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _08022484 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802241E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0802241E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0802243C
	movs r0, #0x80
	orrs r2, r0
_0802243C:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022466
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022466:
	add r2, sp, #0xc
	ldr r0, _08022488 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802248C
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
	b _08022494
	.align 2, 0
_08022480: .4byte 0x000002FF
_08022484: .4byte sub_801ED24
_08022488: .4byte gUnknown_03005424
_0802248C:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
_08022494:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080224CA
	ldr r0, _080224D8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080224A8
	rsbs r2, r2, #0
_080224A8:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_080224CA:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080224D8: .4byte gUnknown_03005424

	thumb_func_start sub_80224DC
sub_80224DC: @ 0x080224DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _080225A0 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _0802250E
	movs r2, #0x80
	orrs r2, r5
_0802250E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _080225A4 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802253E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0802253E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0802255C
	movs r0, #0x80
	orrs r2, r0
_0802255C:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022586
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022586:
	add r2, sp, #0xc
	ldr r0, _080225A8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080225AC
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
	b _080225B4
	.align 2, 0
_080225A0: .4byte 0x000002FF
_080225A4: .4byte sub_801ED24
_080225A8: .4byte gUnknown_03005424
_080225AC:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
_080225B4:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080225D4
	ldr r0, _080225E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080225C8
	rsbs r2, r2, #0
_080225C8:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
_080225D4:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080225E4: .4byte gUnknown_03005424

	thumb_func_start sub_80225E8
sub_80225E8: @ 0x080225E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r5, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _0802265C @ =0x000002FF
	cmp r1, r0
	bgt _08022612
	movs r0, #0x80
	orrs r2, r0
_08022612:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _08022660 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022642
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022642:
	ldr r0, _08022664 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r5, sp, #0xc
	cmp r0, #0
	beq _08022668
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
	b _08022672
	.align 2, 0
_0802265C: .4byte 0x000002FF
_08022660: .4byte sub_801ED24
_08022664: .4byte gUnknown_03005424
_08022668:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
_08022672:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080226A0
	ldr r0, _0802269C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022686
	rsbs r2, r2, #0
_08022686:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08022704
	movs r0, #0
	strh r0, [r4, #0x12]
	b _08022704
	.align 2, 0
_0802269C: .4byte gUnknown_03005424
_080226A0:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08022704
	ldr r0, _080226C0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080226C4
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
	b _080226CE
	.align 2, 0
_080226C0: .4byte gUnknown_03005424
_080226C4:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
_080226CE:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022704
	ldr r0, _0802270C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080226E2
	rsbs r2, r2, #0
_080226E2:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_08022704:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802270C: .4byte gUnknown_03005424

	thumb_func_start sub_8022710
sub_8022710: @ 0x08022710
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r5, r0, r1
	ldr r0, [r4, #0xc]
	asrs r3, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _08022784 @ =0x000002FF
	cmp r1, r0
	bgt _0802273A
	movs r0, #0x80
	orrs r2, r0
_0802273A:
	movs r6, #0
	str r6, [sp]
	ldr r0, _08022788 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022768
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022768:
	ldr r0, _0802278C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r5, sp, #0xc
	cmp r0, #0
	beq _08022790
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
	b _0802279A
	.align 2, 0
_08022784: .4byte 0x000002FF
_08022788: .4byte sub_801ED24
_0802278C: .4byte gUnknown_03005424
_08022790:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
_0802279A:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080227C8
	ldr r0, _080227C4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080227AE
	rsbs r2, r2, #0
_080227AE:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0802282C
	movs r0, #0
	strh r0, [r4, #0x12]
	b _0802282C
	.align 2, 0
_080227C4: .4byte gUnknown_03005424
_080227C8:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0802282C
	ldr r0, _080227E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080227EC
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
	b _080227F6
	.align 2, 0
_080227E8: .4byte gUnknown_03005424
_080227EC:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
_080227F6:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802282C
	ldr r0, _08022834 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802280A
	rsbs r2, r2, #0
_0802280A:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_0802282C:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022834: .4byte gUnknown_03005424

	thumb_func_start sub_8022838
sub_8022838: @ 0x08022838
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x10]
	ldrh r5, [r4, #0x12]
	movs r3, #0
	ldr r0, [r4, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08022864
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	b _080228BA
_08022864:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080228AC
	cmp r0, #1
	bgt _08022892
	cmp r0, #0
	beq _0802289C
	b _080228BA
_08022892:
	cmp r0, #2
	beq _080228A4
	cmp r0, #3
	beq _080228B4
	b _080228BA
_0802289C:
	adds r0, r4, #0
	bl sub_80223BC
	b _080228BA
_080228A4:
	adds r0, r4, #0
	bl sub_80224DC
	b _080228BA
_080228AC:
	adds r0, r4, #0
	bl sub_80225E8
	b _080228BA
_080228B4:
	adds r0, r4, #0
	bl sub_8022710
_080228BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80228C0
sub_80228C0: @ 0x080228C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	mov r1, sl
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	adds r2, r7, #0
	adds r2, #0x28
	str r2, [sp, #8]
	str r2, [sp]
	ldr r3, _08022954 @ =sub_801EE64
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _08022954 @ =sub_801EE64
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022936
	adds r1, r6, #0
_08022936:
	cmp r1, #0
	beq _08022996
	cmp r1, #0
	bge _0802295E
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080229D6
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _08022958
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	b _080229A4
	.align 2, 0
_08022954: .4byte sub_801EE64
_08022958:
	mov r3, sb
	ldrb r0, [r3]
	b _080229A4
_0802295E:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022968
	rsbs r0, r0, #0
_08022968:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022972
	movs r0, #0xb
_08022972:
	cmp r1, r0
	bgt _08022988
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _08022982
	ldr r1, [sp, #8]
	b _080229A2
_08022982:
	mov r2, sb
	ldrb r0, [r2]
	b _080229A4
_08022988:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _080229D6
_08022996:
	cmp r6, r2
	bge _080229A0
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	b _080229A4
_080229A0:
	mov r1, sb
_080229A2:
	ldrb r0, [r1]
_080229A4:
	adds r1, r0, #0
	mov r2, sl
	str r2, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080229D6
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _080229E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080229D6
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_080229D6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080229E8: .4byte gUnknown_03005424

	thumb_func_start sub_80229EC
sub_80229EC: @ 0x080229EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _08022A84 @ =sub_801EE64
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _08022A84 @ =sub_801EE64
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022A66
	adds r1, r6, #0
_08022A66:
	cmp r1, #0
	beq _08022AC4
	cmp r1, #0
	bge _08022A88
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022B04
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022AC8
	b _08022ACE
	.align 2, 0
_08022A84: .4byte sub_801EE64
_08022A88:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022A92
	rsbs r0, r0, #0
_08022A92:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022A9C
	movs r0, #0xb
_08022A9C:
	cmp r1, r0
	bgt _08022AB6
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022AB0
	mov r2, r8
	b _08022AD0
_08022AB0:
	mov r3, sl
	ldrb r0, [r3]
	b _08022AD2
_08022AB6:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022B04
_08022AC4:
	cmp r6, r2
	bge _08022ACE
_08022AC8:
	mov r1, r8
	ldrb r0, [r1]
	b _08022AD2
_08022ACE:
	mov r2, sl
_08022AD0:
	ldrb r0, [r2]
_08022AD2:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022B04
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022B14 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022B04
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022B04:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022B14: .4byte gUnknown_03005424

	thumb_func_start sub_8022B18
sub_8022B18: @ 0x08022B18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _08022BB0 @ =sub_801ED24
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _08022BB0 @ =sub_801ED24
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022B92
	adds r1, r6, #0
_08022B92:
	cmp r1, #0
	beq _08022BF0
	cmp r1, #0
	bge _08022BB4
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022C30
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022BF4
	b _08022BFA
	.align 2, 0
_08022BB0: .4byte sub_801ED24
_08022BB4:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022BBE
	rsbs r0, r0, #0
_08022BBE:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022BC8
	movs r0, #0xb
_08022BC8:
	cmp r1, r0
	bgt _08022BE2
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022BDC
	mov r2, r8
	b _08022BFC
_08022BDC:
	mov r3, sl
	ldrb r0, [r3]
	b _08022BFE
_08022BE2:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022C30
_08022BF0:
	cmp r6, r2
	bge _08022BFA
_08022BF4:
	mov r1, r8
	ldrb r0, [r1]
	b _08022BFE
_08022BFA:
	mov r2, sl
_08022BFC:
	ldrb r0, [r2]
_08022BFE:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022C30
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022C40 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022C30
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022C30:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022C40: .4byte gUnknown_03005424

	thumb_func_start sub_8022C44
sub_8022C44: @ 0x08022C44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov sl, r2
	str r2, [sp]
	ldr r3, _08022CD8 @ =sub_801ED24
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _08022CD8 @ =sub_801ED24
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022CBA
	adds r1, r6, #0
_08022CBA:
	cmp r1, #0
	beq _08022D18
	cmp r1, #0
	bge _08022CDC
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022D58
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	adds r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022D1C
	b _08022D22
	.align 2, 0
_08022CD8: .4byte sub_801ED24
_08022CDC:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022CE6
	rsbs r0, r0, #0
_08022CE6:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022CF0
	movs r0, #0xb
_08022CF0:
	cmp r1, r0
	bgt _08022D0A
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	adds r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022D04
	mov r2, sl
	b _08022D24
_08022D04:
	mov r3, sb
	ldrb r0, [r3]
	b _08022D26
_08022D0A:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022D58
_08022D18:
	cmp r6, r2
	bge _08022D22
_08022D1C:
	mov r1, sl
	ldrb r0, [r1]
	b _08022D26
_08022D22:
	mov r2, sb
_08022D24:
	ldrb r0, [r2]
_08022D26:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022D58
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022D68 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022D58
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022D58:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022D68: .4byte gUnknown_03005424

	thumb_func_start sub_8022D6C
sub_8022D6C: @ 0x08022D6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r1, #0
	ldr r3, [r4, #0x20]
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08022D8C
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	b _08022F4E
_08022D8C:
	ldr r0, _08022E40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r4, #0
	adds r7, #0x24
	cmp r0, #0
	bne _08022E90
	ldr r0, _08022E44 @ =gUnknown_03005660
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _08022E90
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	asrs r5, r0, #0x10
	movs r2, #4
	rsbs r2, r2, #0
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	mov r8, r1
	mov r6, ip
	movs r1, #4
	ldrsh r0, [r6, r1]
	mov r6, r8
	subs r0, r0, r6
	ands r0, r2
	lsls r0, r0, #0x10
	ands r5, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r5, r0
	bne _08022E78
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08022E78
	ldrb r0, [r7]
	adds r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x30
	bhi _08022E78
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	bne _08022E78
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08022DF4
	rsbs r1, r1, #0
_08022DF4:
	ldr r0, _08022E48 @ =0x000005FF
	cmp r1, r0
	ble _08022E78
	adds r0, r4, #0
	bl sub_80228C0
	lsls r1, r5, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	blt _08022E54
	ldr r1, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xa
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08022E26
	orrs r1, r2
	str r1, [r4, #0x20]
	ldr r0, _08022E4C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08022E26
	bl sub_80117F0
_08022E26:
	ldr r0, _08022E50 @ =0x00000119
	bl m4aSongNumStartOrContinue
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0
	strb r0, [r7]
	ldr r0, [r4, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	b _08022E6A
	.align 2, 0
_08022E40: .4byte gCurrentLevel
_08022E44: .4byte gUnknown_03005660
_08022E48: .4byte 0x000005FF
_08022E4C: .4byte gGameMode
_08022E50: .4byte 0x00000119
_08022E54:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E66
	ldr r0, _08022E70 @ =0x00000119
	bl m4aSongNumStop
_08022E66:
	ldr r0, [r4, #0x20]
	ldr r1, _08022E74 @ =0xFFFDFFFF
_08022E6A:
	ands r0, r1
	str r0, [r4, #0x20]
	b _08022F4E
	.align 2, 0
_08022E70: .4byte 0x00000119
_08022E74: .4byte 0xFFFDFFFF
_08022E78:
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E90
	ldr r0, _08022EC0 @ =0xFFFDFFFF
	ands r1, r0
	str r1, [r4, #0x20]
	ldr r0, _08022EC4 @ =0x00000119
	bl m4aSongNumStop
_08022E90:
	ldr r0, _08022EC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022EF4
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r0, r0, #0x18
	subs r0, #0x40
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022ECC
	cmp r0, #0
	bgt _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
	.align 2, 0
_08022EC0: .4byte 0xFFFDFFFF
_08022EC4: .4byte 0x00000119
_08022EC8: .4byte gUnknown_03005424
_08022ECC:
	cmp r0, #0
	ble _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
_08022ED4:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022ED8:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	ble _08022F20
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	bne _08022F4E
	adds r0, r4, #0
	bl sub_8022C44
	b _08022F4E
_08022EF4:
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022F08
	cmp r0, #0
	bgt _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F08:
	cmp r0, #0
	ble _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F10:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022F14:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	bgt _08022F26
_08022F20:
	cmp r0, #0
	beq _08022F30
	b _08022F4E
_08022F26:
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	beq _08022F48
	b _08022F4E
_08022F30:
	adds r0, r4, #0
	bl sub_80228C0
	b _08022F4E
_08022F38:
	adds r0, r4, #0
	bl sub_80229EC
	b _08022F4E
_08022F40:
	adds r0, r4, #0
	bl sub_8022B18
	b _08022F4E
_08022F48:
	adds r0, r4, #0
	bl sub_8022C44
_08022F4E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8022F58
sub_8022F58: @ 0x08022F58
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	adds r1, #0x29
	strb r0, [r1]
	subs r1, #1
	strb r0, [r1]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r4, r0, #6
	cmp r4, #1
	beq _08022FA6
	cmp r4, #1
	bgt _08022F82
	cmp r4, #0
	beq _08022F8C
	b _0802301C
_08022F82:
	cmp r4, #2
	beq _08022FDC
	cmp r4, #3
	beq _08022FEA
	b _0802301C
_08022F8C:
	mov r4, sp
	add r2, sp, #4
	adds r0, r3, #0
	mov r1, sp
	bl sub_8029BB8
_08022F98:
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08023002
	b _08023006
_08022FA6:
	mov r5, sp
	add r2, sp, #8
	adds r0, r3, #0
	mov r1, sp
	bl sub_802195C
	adds r3, r0, #0
	ldrb r2, [r5]
	ands r4, r2
	cmp r4, #0
	beq _08022FC0
	strb r6, [r5]
	b _0802301A
_08022FC0:
	ldr r0, _08022FD8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802301A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r5]
	b _0802301A
	.align 2, 0
_08022FD8: .4byte gUnknown_03005424
_08022FDC:
	mov r4, sp
	add r2, sp, #0xc
	adds r0, r3, #0
	mov r1, sp
	bl sub_8021B08
	b _08022F98
_08022FEA:
	mov r4, sp
	add r2, sp, #0x10
	adds r0, r3, #0
	mov r1, sp
	bl sub_8021A34
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08023006
_08023002:
	strb r6, [r4]
	b _0802301A
_08023006:
	ldr r0, _08023028 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802301A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r4]
_0802301A:
	adds r6, r3, #0
_0802301C:
	adds r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023028: .4byte gUnknown_03005424

	thumb_func_start sub_802302C
sub_802302C: @ 0x0802302C
	push {r4, r5, lr}
	sub sp, #8
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r1, #8]
	asrs r5, r0, #8
	ldr r0, [r1, #0xc]
	asrs r4, r0, #8
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	lsls r0, r2, #0x18
	asrs r3, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x28
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802305E
	cmp r3, #0
	bgt _08023062
	b _08023068
_0802305E:
	cmp r3, #0
	bgt _08023068
_08023062:
	adds r0, r2, #0
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08023068:
	lsrs r2, r0, #0x18
	lsrs r3, r2, #6
	cmp r3, #1
	beq _080230CC
	cmp r3, #1
	bgt _0802307A
	cmp r3, #0
	beq _08023084
	b _0802311C
_0802307A:
	cmp r3, #2
	beq _080230A4
	cmp r3, #3
	beq _080230F4
	b _0802311C
_08023084:
	adds r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	str r3, [sp]
	ldr r1, _080230A0 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	b _0802310E
	.align 2, 0
_080230A0: .4byte sub_801EE64
_080230A4:
	subs r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230C8 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230C8: .4byte sub_801EE64
_080230CC:
	subs r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230F0 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230F0: .4byte sub_801ED24
_080230F4:
	adds r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, _08023118 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
_0802310E:
	movs r3, #8
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_08023118: .4byte sub_801ED24
_0802311C:
	movs r0, #0
_0802311E:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023128
sub_8023128: @ 0x08023128
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080231BA
	movs r1, #0x40
	cmp r0, #0
	blt _0802313C
	movs r1, #0xc0
_0802313C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _080231BA
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _08023182
	cmp r1, #1
	bgt _0802316E
	cmp r1, #0
	beq _08023178
	b _080231AE
_0802316E:
	cmp r1, #2
	beq _08023188
	cmp r1, #3
	beq _0802319A
	b _080231AE
_08023178:
	ldr r0, [r4, #0xc]
	adds r0, r0, r2
	str r0, [r4, #0xc]
	strh r1, [r4, #0x12]
	b _080231AE
_08023182:
	ldr r0, [r4, #8]
	subs r0, r0, r2
	b _0802319E
_08023188:
	ldr r0, [r4, #0xc]
	subs r0, r0, r2
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	orrs r0, r1
	str r0, [r4, #0x20]
	b _080231AE
_0802319A:
	ldr r0, [r4, #8]
	adds r0, r0, r2
_0802319E:
	str r0, [r4, #8]
	movs r2, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	strh r2, [r4, #0x14]
_080231AE:
	adds r0, r4, #0
	adds r0, #0x62
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_080231BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80231C0
sub_80231C0: @ 0x080231C0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08023258
	movs r1, #0x40
	cmp r0, #0
	blt _080231D4
	movs r1, #0xc0
_080231D4:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _08023258
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0802321A
	cmp r1, #1
	bgt _08023206
	cmp r1, #0
	beq _08023210
	b _08023258
_08023206:
	cmp r1, #2
	beq _08023220
	cmp r1, #3
	beq _08023232
	b _08023258
_08023210:
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	strh r1, [r5, #0x12]
	b _08023258
_0802321A:
	ldr r0, [r5, #8]
	subs r0, r0, r2
	b _08023236
_08023220:
	ldr r0, [r5, #0xc]
	subs r0, r0, r2
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	orrs r0, r1
	str r0, [r5, #0x20]
	b _08023258
_08023232:
	ldr r0, [r5, #8]
	adds r0, r0, r2
_08023236:
	str r0, [r5, #8]
	movs r4, #0
	strh r4, [r5, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r4, [r5, #0x14]
_08023258:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023260
sub_8023260: @ 0x08023260
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0x40]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	ble _08023276
	strh r4, [r2, #0x14]
	b _08023282
_08023276:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmn r0, r3
	bge _08023282
	rsbs r0, r4, #0
	strh r0, [r2, #0x14]
_08023282:
	movs r0, #0x14
	ldrsh r4, [r2, r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldr r5, _080232CC @ =gSineTable
	ldrb r3, [r0]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x10]
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080232B0
	strh r1, [r2, #0x12]
_080232B0:
	lsls r0, r3, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	ldrh r1, [r2, #0x12]
	adds r0, r0, r1
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080232CC: .4byte gSineTable

	thumb_func_start sub_80232D0
sub_80232D0: @ 0x080232D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r4, _080233A0 @ =gCamera
	ldr r0, [r7, #8]
	mov r8, r0
	ldr r1, [r7, #0xc]
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080232F4
	b _08023486
_080232F4:
	ldr r1, _080233A4 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _08023316
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08023312
	ldr r0, _080233A8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023316
_08023312:
	cmp r1, #0x1d
	bne _080233C4
_08023316:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023324
	b _08023486
_08023324:
	ldr r0, _080233AC @ =gUnknown_080D650C
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r0, r2, r0
	ldr r1, [r0]
	cmp r1, #0
	bge _08023336
	b _08023486
_08023336:
	lsls r0, r1, #8
	cmp r8, r0
	bge _0802333E
	b _08023486
_0802333E:
	ldr r0, _080233B0 @ =gUnknown_080D661C
	adds r1, r2, r0
	ldr r5, [r1]
	adds r0, #4
	adds r0, r2, r0
	ldr r6, [r0]
	lsls r3, r5, #8
	add r8, r3
	lsls r1, r6, #8
	add sb, r1
	ldr r0, _080233B4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023366
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_08023366:
	ldr r0, _080233B8 @ =gUnknown_030054FC
	str r3, [r0]
	ldr r0, _080233BC @ =gUnknown_030054E0
	str r1, [r0]
	adds r0, r3, #0
	bl sub_8039F14
	ldr r1, _080233C0 @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r5
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r5
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r5
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	adds r0, r0, r6
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r6
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x14]
	adds r0, r0, r6
	str r0, [r4, #0x14]
	b _08023486
	.align 2, 0
_080233A0: .4byte gCamera
_080233A4: .4byte gCurrentLevel
_080233A8: .4byte gUnknown_030054B0
_080233AC: .4byte gUnknown_080D650C
_080233B0: .4byte gUnknown_080D661C
_080233B4: .4byte gUnknown_030056A4
_080233B8: .4byte gUnknown_030054FC
_080233BC: .4byte gUnknown_030054E0
_080233C0: .4byte gUnknown_03005430
_080233C4:
	ldr r0, _080234B4 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08023486
	ldr r0, _080234B8 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08023486
	ldr r0, _080234BC @ =gUnknown_080D650C
	mov r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r1, r2, r0
	ldr r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	blt _08023432
	lsls r0, r1, #8
	cmp r8, r0
	blt _08023432
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08023432
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08023432
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, #8
	add r8, r3
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, _080234C4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023432
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
_08023432:
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r2, r0, #3
	adds r0, r5, #4
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	blt _08023486
	lsls r0, r0, #8
	cmp sb, r0
	blt _08023486
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08023486
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023486
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, #4
	adds r0, r2, r0
	ldr r0, [r0]
	lsls r1, r0, #8
	lsls r3, r0, #0x10
	add sb, r3
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0x24]
	ldr r0, _080234C4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023486
	ldr r0, [r2, #4]
	adds r0, r0, r3
	str r0, [r2, #4]
_08023486:
	ldr r1, [r7, #0x20]
	ldr r0, _080234C8 @ =0x80000080
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0x80
	bne _08023494
	b _08023604
_08023494:
	ldr r5, _080234CC @ =gCamera
	ldr r3, [r7, #0xc]
	cmp r6, #0
	blt _0802351C
	ldr r2, _080234D0 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080234D4
	ldr r0, [r5, #0x28]
	lsls r0, r0, #8
	cmp r3, r0
	bgt _080234E0
	b _080234E6
	.align 2, 0
_080234B4: .4byte gPlayer
_080234B8: .4byte gUnknown_030054F4
_080234BC: .4byte gUnknown_080D650C
_080234C0: .4byte gUnknown_080D661C
_080234C4: .4byte gUnknown_030056A4
_080234C8: .4byte 0x80000080
_080234CC: .4byte gCamera
_080234D0: .4byte gUnknown_03005424
_080234D4:
	ldr r0, [r5, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	movs r1, #1
	cmp r3, r0
	bge _080234E2
_080234E0:
	movs r1, #0
_080234E2:
	cmp r1, #0
	beq _0802351C
_080234E6:
	movs r0, #0x80
	orrs r0, r6
	str r0, [r7, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080234FC
	ldr r0, _080234F8 @ =0x0000FD60
	b _080234FE
	.align 2, 0
_080234F8: .4byte 0x0000FD60
_080234FC:
	ldr r0, _08023510 @ =0x0000FB20
_080234FE:
	strh r0, [r7, #0x12]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023514
	ldr r0, [r4, #0x28]
	lsls r0, r0, #8
	b _0802351A
	.align 2, 0
_08023510: .4byte 0x0000FB20
_08023514:
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
_0802351A:
	mov sb, r0
_0802351C:
	ldr r1, _08023548 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _0802353E
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802353A
	ldr r0, _0802354C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802353E
_0802353A:
	cmp r1, #0x1d
	bne _08023558
_0802353E:
	ldr r0, _08023550 @ =gUnknown_03005440
	ldrh r2, [r0]
	ldr r0, _08023554 @ =gUnknown_030054BC
	ldrh r3, [r0]
	b _0802355C
	.align 2, 0
_08023548: .4byte gCurrentLevel
_0802354C: .4byte gUnknown_030054B0
_08023550: .4byte gUnknown_03005440
_08023554: .4byte gUnknown_030054BC
_08023558:
	ldr r2, [r4, #0x28]
	ldr r3, [r4, #0x2c]
_0802355C:
	mov r5, r8
	mov r6, sb
	ldr r0, [r4, #0x30]
	lsls r0, r0, #8
	cmp r8, r0
	blt _08023576
	ldr r0, [r4, #0x34]
	lsls r0, r0, #8
	subs r1, r0, #1
	mov r0, r8
	cmp r0, r1
	ble _08023576
	adds r0, r1, #0
_08023576:
	mov r8, r0
	lsls r0, r2, #8
	cmp sb, r0
	blt _0802358A
	lsls r0, r3, #8
	subs r1, r0, #1
	mov r0, sb
	cmp r0, r1
	ble _0802358A
	adds r0, r1, #0
_0802358A:
	mov sb, r0
	cmp r8, r5
	beq _08023596
	movs r0, #0
	strh r0, [r7, #0x10]
	strh r0, [r7, #0x14]
_08023596:
	cmp sb, r6
	beq _080235A0
	movs r0, #0
	strh r0, [r7, #0x12]
	strh r0, [r7, #0x14]
_080235A0:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080235C0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080235BC
	ldr r0, _080235E4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080235C0
_080235BC:
	cmp r1, #0x1d
	bne _080235FC
_080235C0:
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	cmp r8, r1
	bge _080235E8
	mov r8, r1
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x20]
	b _080235FC
	.align 2, 0
_080235E4: .4byte gUnknown_030054B0
_080235E8:
	movs r1, #0x9c
	lsls r1, r1, #9
	adds r0, r0, r1
	cmp r8, r0
	ble _080235FC
	mov r8, r0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
_080235FC:
	mov r2, r8
	str r2, [r7, #8]
	mov r0, sb
	str r0, [r7, #0xc]
_08023604:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8023610
sub_8023610: @ 0x08023610
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, [r0, #0x48]
	lsls r5, r0, #1
	mov r0, ip
	ldr r6, [r0, #0x44]
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r4, #0x14
	beq _080236C0
	mov r0, ip
	ldr r1, [r0, #0x20]
	movs r7, #0x10
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _080236C0
	mov r0, ip
	ldrh r2, [r0, #0x10]
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0802367C
	cmp r4, #0x3f
	beq _0802365A
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0802365A
	movs r0, #1
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0802365A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r6, #0
	cmp r0, r1
	bge _080236BC
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	ble _080236BC
	lsls r0, r1, #0x10
	b _080236BA
_0802367C:
	adds r0, r7, #0
	ands r0, r3
	cmp r0, #0
	beq _080236BC
	cmp r4, #0x3f
	beq _0802369C
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0802369C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0802369C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _080236BC
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	bge _080236BC
	lsls r0, r6, #0x10
_080236BA:
	lsrs r2, r0, #0x10
_080236BC:
	mov r1, ip
	strh r2, [r1, #0x10]
_080236C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80236C8
sub_80236C8: @ 0x080236C8
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _080236EC @ =0x0000BCFF
	cmp r1, r0
	bls _08023702
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x15
	cmp r0, #0
	bge _080236F0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _08023700
	b _080236FE
	.align 2, 0
_080236EC: .4byte 0x0000BCFF
_080236F0:
	cmp r0, #0
	ble _08023702
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08023700
_080236FE:
	movs r1, #0
_08023700:
	strh r1, [r2, #0x10]
_08023702:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023708
sub_8023708: @ 0x08023708
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _0802372C @ =0x0000BCFF
	cmp r1, r0
	bls _08023742
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _08023730
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _08023740
	b _0802373E
	.align 2, 0
_0802372C: .4byte 0x0000BCFF
_08023730:
	cmp r0, #0
	ble _08023742
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08023740
_0802373E:
	movs r1, #0
_08023740:
	strh r1, [r2, #0x10]
_08023742:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023748
sub_8023748: @ 0x08023748
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x37
	ldrb r1, [r4]
	cmp r1, #0
	beq _08023850
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0802377C
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802377C
	ldr r0, _080237E0 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	ldrb r1, [r4]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r4]
_0802377C:
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _080237AA
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080237AA
	ldr r0, _080237E0 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r4]
_080237AA:
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023822
	ldrh r0, [r5, #0x2e]
	subs r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08023822
	ldrb r0, [r4]
	movs r1, #0xfd
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080237E8
	ldr r0, _080237E4 @ =gPlayer
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl CreateItemTask_Shield_Normal
	b _080237FE
	.align 2, 0
_080237E0: .4byte gMPlayInfo_BGM
_080237E4: .4byte gPlayer
_080237E8:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080237FE
	ldr r0, _08023858 @ =gPlayer
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl CreateItemTask_Shield_Magnetic
_080237FE:
	ldr r0, _0802385C @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08023860 @ =gSongTable
	adds r0, #0xe8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08023822
	ldr r1, _08023864 @ =gLevelSongs
	ldr r0, _08023868 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08023822:
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08023850
	ldrh r0, [r5, #0x34]
	subs r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08023850
	ldrb r1, [r4]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r4]
	ldr r2, _0802386C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08023870 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08023874 @ =gWinRegs
	movs r0, #0x3f
	strh r0, [r1, #0xa]
_08023850:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023858: .4byte gPlayer
_0802385C: .4byte gMPlayTable
_08023860: .4byte gSongTable
_08023864: .4byte gLevelSongs
_08023868: .4byte gCurrentLevel
_0802386C: .4byte gDispCnt
_08023870: .4byte 0x00007FFF
_08023874: .4byte gWinRegs

	thumb_func_start sub_8023878
sub_8023878: @ 0x08023878
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	ldr r0, _08023944 @ =0xFFFFEFFF
	ands r2, r0
	str r2, [r4, #0x20]
	ldr r0, _08023948 @ =gUnknown_03005660
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	beq _08023890
	b _08023A60
_08023890:
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _0802389A
	b _08023A60
_0802389A:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	subs r0, #4
	movs r5, #4
	ldrsh r1, [r3, r5]
	cmp r0, r1
	bge _080238AA
	b _08023A60
_080238AA:
	movs r1, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x88
	cmp r0, #0
	bne _08023912
	orrs r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
	str r2, [r4, #0x20]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _080238EE
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _08023912
_080238EE:
	adds r0, r4, #0
	adds r0, #0x88
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bgt _08023912
	movs r0, #0xa
	strb r0, [r5]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #4
	ldrsh r1, [r3, r2]
	bl sub_80118FC
	movs r0, #0x9c
	bl m4aSongNumStart
_08023912:
	adds r1, r4, #0
	adds r1, #0x87
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	adds r7, r1, #0
	cmp r0, #0
	bgt _08023A00
	adds r0, r4, #0
	adds r0, #0x86
	ldrb r1, [r0]
	subs r2, r1, #1
	strb r2, [r0]
	subs r1, #2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r6, r0, #0
	cmp r1, #0xa
	bhi _080239D2
	lsls r0, r1, #2
	ldr r1, _0802394C @ =_08023950
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023944: .4byte 0xFFFFEFFF
_08023948: .4byte gUnknown_03005660
_0802394C: .4byte _08023950
_08023950: @ jump table
	.4byte _080239CA @ case 0
	.4byte _080239D2 @ case 1
	.4byte _080239C0 @ case 2
	.4byte _080239D2 @ case 3
	.4byte _080239B6 @ case 4
	.4byte _080239D2 @ case 5
	.4byte _080239AC @ case 6
	.4byte _080239D2 @ case 7
	.4byte _080239A2 @ case 8
	.4byte _0802397C @ case 9
	.4byte _08023998 @ case 10
_0802397C:
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080239D2
	ldr r1, _08023994 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #4]
	b _080239D2
	.align 2, 0
_08023994: .4byte gUnknown_030054A8
_08023998:
	adds r0, r4, #0
	movs r1, #5
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239A2:
	adds r0, r4, #0
	movs r1, #4
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239AC:
	adds r0, r4, #0
	movs r1, #3
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239B6:
	adds r0, r4, #0
	movs r1, #2
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239C0:
	adds r0, r4, #0
	movs r1, #1
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239CA:
	adds r0, r4, #0
	movs r1, #0
	bl SpawnDrowningCountdownNum
_080239D2:
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bge _080239FC
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, _08023A48 @ =0xFFFFF400
	adds r1, r1, r2
	movs r2, #0
	movs r3, #1
	bl SpawnAirBubbles
	adds r0, r4, #0
	bl SpawnBubblesAfterDrowning
_080239FC:
	movs r0, #0x3c
	strb r0, [r7]
_08023A00:
	ldr r0, _08023A4C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08023B02
	ldr r2, _08023A50 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08023A54 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08023A58 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023B02
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	cmp r0, #0
	beq _08023A34
	ldr r1, _08023A5C @ =0xFFFFFC00
_08023A34:
	ldr r0, [r4, #8]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	ldr r2, _08023A5C @ =0xFFFFFC00
	adds r1, r1, r2
	movs r2, #0
	movs r3, #0
	bl SpawnAirBubbles
	b _08023B02
	.align 2, 0
_08023A48: .4byte 0xFFFFF400
_08023A4C: .4byte gUnknown_03005590
_08023A50: .4byte gPseudoRandom
_08023A54: .4byte 0x00196225
_08023A58: .4byte 0x3C6EF35F
_08023A5C: .4byte 0xFFFFFC00
_08023A60:
	ldr r1, [r4, #0x20]
	movs r0, #0x40
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x88
	cmp r0, #0
	beq _08023AC2
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r1, r0
	str r1, [r4, #0x20]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _08023A9E
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _08023AC2
_08023A9E:
	adds r0, r4, #0
	adds r0, #0x88
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bgt _08023AC2
	movs r0, #0xa
	strb r0, [r5]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #4
	ldrsh r1, [r3, r2]
	bl sub_80118FC
	movs r0, #0x9c
	bl m4aSongNumStart
_08023AC2:
	adds r1, r4, #0
	adds r1, #0x87
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08023B1C @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08023B20 @ =gSongTable
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08023B02
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08023B02
	ldr r1, _08023B24 @ =gLevelSongs
	ldr r0, _08023B28 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08023B02:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08023B2C
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	lsls r0, r0, #1
	b _08023B44
	.align 2, 0
_08023B1C: .4byte gMPlayTable
_08023B20: .4byte gSongTable
_08023B24: .4byte gLevelSongs
_08023B28: .4byte gCurrentLevel
_08023B2C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023B46
	ldr r0, [r4, #0x40]
	asrs r0, r0, #2
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x48]
	asrs r0, r0, #2
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #2
_08023B44:
	str r0, [r4, #0x4c]
_08023B46:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08023B54
	subs r0, r1, #1
	strb r0, [r5]
_08023B54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

    @ Input:
    @  r0 = Player*
    @  r1 = spriteOffsetY
	thumb_func_start sub_8023B5C
sub_8023B5C: @ 0x08023B5C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	cmp r0, r4
	beq _08023C0A
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r2, [r0]
	ldr r0, _08023BA0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023B8E
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08023B8E:
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0
	ble _08023BA8
	cmp r2, #0
	beq _08023BA4
	subs r0, #1
	b _08023BAC
	.align 2, 0
_08023BA0: .4byte gUnknown_03005424
_08023BA4:
	movs r2, #0x20
	b _08023BB4
_08023BA8:
	cmp r2, #0
	beq _08023BB2
_08023BAC:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _08023BB4
_08023BB2:
	movs r2, #0x1f
_08023BB4:
	lsrs r0, r2, #6
	cmp r0, #1
	beq _08023BEE
	cmp r0, #1
	bgt _08023BC4
	cmp r0, #0
	beq _08023BCE
	b _08023C0A
_08023BC4:
	cmp r0, #2
	beq _08023BDE
	cmp r0, #3
	beq _08023BFC
	b _08023C0A
_08023BCE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BDE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BEE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	b _08023C08
_08023BFC:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	subs r0, r0, r1
_08023C08:
	str r0, [r3, #8]
_08023C0A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8023C10
sub_8023C10: @ 0x08023C10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bge _08023CFE
	movs r0, #0x14
	ldrsh r3, [r4, r0]
	ldr r2, _08023C40 @ =gInput
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08023C4A
	adds r3, #0x20
	cmp r3, #0
	blt _08023C44
	adds r0, r3, #0
	movs r1, #0x80
	lsls r1, r1, #5
	cmp r0, r1
	ble _08023C46
	adds r0, r1, #0
	b _08023C46
	.align 2, 0
_08023C40: .4byte gInput
_08023C44:
	movs r0, #0
_08023C46:
	adds r3, r0, #0
	b _08023C4C
_08023C4A:
	movs r3, #0
_08023C4C:
	strh r3, [r4, #0x14]
	ldrh r0, [r2]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _08023C60
	cmp r1, #0x20
	bne _08023C64
	rsbs r0, r3, #0
	b _08023C66
_08023C60:
	strh r3, [r4, #0x10]
	b _08023C68
_08023C64:
	movs r0, #0
_08023C66:
	strh r0, [r4, #0x10]
_08023C68:
	ldrh r0, [r2]
	movs r1, #0xc0
	ands r1, r0
	cmp r1, #0x40
	beq _08023C7C
	cmp r1, #0x80
	beq _08023C82
	movs r0, #0
	strh r0, [r4, #0x12]
	b _08023C84
_08023C7C:
	rsbs r0, r3, #0
	strh r0, [r4, #0x12]
	b _08023C84
_08023C82:
	strh r3, [r4, #0x12]
_08023C84:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08023CCC @ =gUnknown_03005424
	ldr r1, _08023CD0 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023CA6
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08023CA6:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08023CB6
	adds r2, r1, #0
_08023CB6:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023CD4
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08023CDC
	.align 2, 0
_08023CCC: .4byte gUnknown_03005424
_08023CD0: .4byte gUnknown_0300544C
_08023CD4:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08023CDC:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, _08023D04 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023CFE
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_801FD34
_08023CFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023D04: .4byte gPressedKeys

	thumb_func_start Task_8023D08
Task_8023D08: @ 0x08023D08
	push {r4, r5, r6, lr}
	ldr r0, _08023D70 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r5, [r1, #4]
	cmp r5, #0
	beq _08023D1E
	b _08023E84
_08023D1E:
	ldr r0, _08023D74 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08023DA0
	adds r0, r2, #0
	bl TaskDestroy
	ldr r0, _08023D78 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _08023D50
	ldr r0, _08023D7C @ =gCourseTime
	ldr r2, [r0]
	ldr r0, _08023D80 @ =0x00008CA0
	cmp r2, r0
	bhi _08023D68
	ldr r0, _08023D84 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08023D50
	cmp r2, #0
	beq _08023D68
_08023D50:
	ldr r0, _08023D74 @ =gGameMode
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08023D88
	ldr r0, _08023D7C @ =gCourseTime
	ldr r1, [r0]
	ldr r0, _08023D80 @ =0x00008CA0
	cmp r1, r0
	bls _08023D88
_08023D68:
	bl sub_801B6B4
	b _08023E88
	.align 2, 0
_08023D70: .4byte gCurTask
_08023D74: .4byte gGameMode
_08023D78: .4byte gLoadedSaveGame
_08023D7C: .4byte gCourseTime
_08023D80: .4byte 0x00008CA0
_08023D84: .4byte gUnknown_03005424
_08023D88:
	ldr r0, _08023D98 @ =gRingCount
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08023D9C @ =gUnknown_030054F4
	strb r1, [r0]
	bl sub_801AE48
	b _08023E88
	.align 2, 0
_08023D98: .4byte gRingCount
_08023D9C: .4byte gUnknown_030054F4
_08023DA0:
	ldr r1, _08023E50 @ =gRingCount
	strh r5, [r1]
	cmp r0, #3
	bne _08023DAC
	movs r0, #1
	strh r0, [r1]
_08023DAC:
	ldr r1, _08023E54 @ =gUnknown_030054F4
	movs r0, #0
	strb r0, [r1]
	ldr r6, _08023E58 @ =gPlayer
	adds r0, r6, #0
	bl sub_8021694
	ldr r4, _08023E5C @ =gCamera
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	subs r0, #0x78
	str r0, [r4]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4, #0x1c]
	adds r0, r0, r1
	subs r0, #0x50
	str r0, [r4, #4]
	ldr r0, _08023E60 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	str r5, [r6, #0x20]
	ldr r2, _08023E64 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08023E68 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	adds r2, r6, #0
	adds r2, #0x90
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ldr r5, _08023E6C @ =0xFFFFCFFF
	ands r0, r5
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #6
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r2, #4
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ands r0, r5
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r4, #0x50
	ldrh r1, [r4]
	ldr r0, _08023E70 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08023E3E
	ldr r0, _08023E74 @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _08023E3E
	ldr r0, [r6, #8]
	str r0, [r1]
	ldr r0, [r6, #0xc]
	str r0, [r1, #4]
_08023E3E:
	ldr r0, _08023E78 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08023E7C @ =Task_8023FC0
	str r0, [r1, #8]
	ldr r1, _08023E58 @ =gPlayer
	ldr r0, _08023E80 @ =PlayerCB_8025318
	str r0, [r1]
	b _08023E88
	.align 2, 0
_08023E50: .4byte gRingCount
_08023E54: .4byte gUnknown_030054F4
_08023E58: .4byte gPlayer
_08023E5C: .4byte gCamera
_08023E60: .4byte gMPlayInfo_BGM
_08023E64: .4byte gUnknown_03005424
_08023E68: .4byte 0x0000FF7F
_08023E6C: .4byte 0xFFFFCFFF
_08023E70: .4byte 0x0000FFFC
_08023E74: .4byte gUnknown_030056A4
_08023E78: .4byte gCurTask
_08023E7C: .4byte Task_8023FC0
_08023E80: .4byte PlayerCB_8025318
_08023E84:
	subs r5, #1
	str r5, [r1, #4]
_08023E88:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023E90
sub_8023E90: @ 0x08023E90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08023EB4 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r6, [r0]
	adds r0, #4
	ldr r0, [r0]
	mov r8, r0
	ldr r5, _08023EB8 @ =gCamera
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x20]
	adds r7, r4, #0
	cmp r0, #0
	bge _08023EC0
	ldr r2, _08023EBC @ =gUnknown_03005424
	b _08023F34
	.align 2, 0
_08023EB4: .4byte gPlayer
_08023EB8: .4byte gCamera
_08023EBC: .4byte gUnknown_03005424
_08023EC0:
	ldr r2, _08023ED8 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023EDC
	ldr r0, [r5, #4]
	subs r0, #0x50
	lsls r0, r0, #8
	cmp r3, r0
	bgt _08023EEA
	b _08023EF0
	.align 2, 0
_08023ED8: .4byte gUnknown_03005424
_08023EDC:
	ldr r0, [r5, #4]
	lsls r0, r0, #8
	ldr r1, _08023F24 @ =0x0000EFFF
	adds r0, r0, r1
	movs r1, #1
	cmp r3, r0
	bge _08023EEC
_08023EEA:
	movs r1, #0
_08023EEC:
	cmp r1, #0
	beq _08023F34
_08023EF0:
	ldr r5, _08023F28 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0x3c
	str r1, [r0, #4]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r7, #0x20]
	ldr r0, _08023F2C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08023F1A
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8024B10
_08023F1A:
	ldr r1, [r5]
	ldr r0, _08023F30 @ =Task_8023D08
	str r0, [r1, #8]
	b _08023FB6
	.align 2, 0
_08023F24: .4byte 0x0000EFFF
_08023F28: .4byte gCurTask
_08023F2C: .4byte gGameMode
_08023F30: .4byte Task_8023D08
_08023F34:
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023F44
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08023F48
_08023F44:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08023F48:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r1, _08023F90 @ =gUnknown_0300544C
	ldrh r0, [r2]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023F6A
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08023F6A:
	ldrh r3, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08023F7A
	adds r3, r1, #0
_08023F7A:
	strh r3, [r4, #0x12]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023F94
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08023F9C
	.align 2, 0
_08023F90: .4byte gUnknown_0300544C
_08023F94:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08023F9C:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_802486C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8024B10
	adds r0, r4, #0
	mov r1, r8
	bl sub_8024F74
_08023FB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Task_8023FC0
Task_8023FC0: @ 0x08023FC0
	push {r4, r5, r6, r7, lr}
	ldr r5, _08024014 @ =gPlayer
	adds r0, r5, #0
	bl sub_802989C
	adds r0, r5, #0
	bl sub_80298DC
	adds r0, r5, #0
	bl sub_802A1C8
	adds r0, r5, #0
	bl sub_8029990
	ldr r0, _08024018 @ =gUnknown_030054FC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0802401C @ =gUnknown_030054E0
	str r1, [r0]
	adds r0, r5, #0
	bl sub_802460C
	adds r0, r5, #0
	bl sub_800DF8C
	adds r0, r5, #0
	bl sub_8023878
	adds r0, r5, #0
	bl sub_8024228
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08024020
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	b _08024046
	.align 2, 0
_08024014: .4byte gPlayer
_08024018: .4byte gUnknown_030054FC
_0802401C: .4byte gUnknown_030054E0
_08024020:
	ldr r0, _080240EC @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08024040
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802403C
	ldr r0, _080240F0 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024040
_0802403C:
	cmp r1, #0x1d
	bne _08024046
_08024040:
	adds r0, r5, #0
	bl sub_80232D0
_08024046:
	adds r4, r5, #0
	adds r4, #0x90
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_802486C
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_8024B10
	adds r0, r5, #0
	adds r0, #0x94
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8024F74
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0x14
	beq _08024082
	ldrh r1, [r5, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08024082
	subs r0, r1, #1
	strh r0, [r5, #0x2c]
_08024082:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08024094
	subs r0, r2, #1
	strb r0, [r1]
_08024094:
	adds r0, r5, #0
	bl sub_8023748
	bl sub_8015790
	bl sub_80156D0
	ldr r2, [r5, #0x20]
	ldr r0, _080240F4 @ =0xFFFFF7FF
	ands r2, r0
	str r2, [r5, #0x20]
	ldr r1, _080240F8 @ =gUnknown_030054C0
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1]
	movs r3, #0
	strh r3, [r1, #4]
	ldr r1, _080240FC @ =gUnknown_03005498
	ldr r0, _08024100 @ =0x00009C40
	str r0, [r1]
	str r3, [r1, #4]
	movs r0, #0x80
	ands r2, r0
	cmp r2, #0
	bne _080240C8
	b _08024222
_080240C8:
	ldr r7, _08024104 @ =gCamera
	ldr r0, _08024108 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0802410C @ =sub_8023E90
	str r0, [r1, #8]
	movs r0, #0x16
	strh r0, [r6]
	strh r3, [r5, #0x10]
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _08024110 @ =0xFFFFFC00
	cmp r1, r0
	bge _08024114
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0802411A
	.align 2, 0
_080240EC: .4byte gCurrentLevel
_080240F0: .4byte gUnknown_030054B0
_080240F4: .4byte 0xFFFFF7FF
_080240F8: .4byte gUnknown_030054C0
_080240FC: .4byte gUnknown_03005498
_08024100: .4byte 0x00009C40
_08024104: .4byte gCamera
_08024108: .4byte gCurTask
_0802410C: .4byte sub_8023E90
_08024110: .4byte 0xFFFFFC00
_08024114:
	cmp r1, #0
	ble _0802411A
	strh r3, [r5, #0x12]
_0802411A:
	movs r1, #0
	movs r2, #0
	movs r0, #2
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x18
	ands r0, r1
	str r0, [r5, #0x20]
	str r2, [r5, #0x3c]
	adds r2, r7, #0
	adds r2, #0x50
	ldrh r0, [r2]
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08024200 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024156
	ldr r0, _08024204 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #1
	orrs r1, r2
	strh r1, [r0]
_08024156:
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	ldr r1, _08024208 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r6, _0802420C @ =gMPlayTable
	ldr r1, [r6]
	ldr r4, _08024210 @ =gSongTable
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _080241A0
	ldr r1, _08024214 @ =gLevelSongs
	ldr r0, _08024218 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_080241A0:
	ldr r0, [r6]
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bne _080241C2
	ldr r1, _08024214 @ =gLevelSongs
	ldr r0, _08024218 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_080241C2:
	movs r0, #0x1f
	bl m4aSongNumStop
	adds r4, r5, #0
	adds r4, #0x85
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #2
	bne _080241DA
	movs r0, #0x78
	bl m4aSongNumStop
_080241DA:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _080241E8
	movs r0, #0xe3
	bl m4aSongNumStop
_080241E8:
	adds r0, r5, #0
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0802421C
	movs r0, #0x9d
	bl m4aSongNumStart
	b _08024222
	.align 2, 0
_08024200: .4byte gGameMode
_08024204: .4byte gUnknown_03005424
_08024208: .4byte 0xFFFFCFFF
_0802420C: .4byte gMPlayTable
_08024210: .4byte gSongTable
_08024214: .4byte gLevelSongs
_08024218: .4byte gCurrentLevel
_0802421C:
	movs r0, #0x77
	bl m4aSongNumStart
_08024222:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8024228
sub_8024228: @ 0x08024228
	push {lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x6d
	ldrb r0, [r1]
	cmp r0, #0
	bne _08024238
	b _080245EE
_08024238:
	subs r0, #1
	cmp r0, #0x1b
	bls _08024240
	b _080245EE
_08024240:
	lsls r0, r0, #2
	ldr r1, _0802424C @ =_08024250
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802424C: .4byte _08024250
_08024250: @ jump table
	.4byte _080242C0 @ case 0
	.4byte _080242D0 @ case 1
	.4byte _080242E0 @ case 2
	.4byte _08024300 @ case 3
	.4byte _0802434C @ case 4
	.4byte _08024330 @ case 5
	.4byte _08024320 @ case 6
	.4byte _08024368 @ case 7
	.4byte _08024378 @ case 8
	.4byte _08024388 @ case 9
	.4byte _08024578 @ case 10
	.4byte _08024588 @ case 11
	.4byte _08024598 @ case 12
	.4byte _080243E8 @ case 13
	.4byte _08024414 @ case 14
	.4byte _08024440 @ case 15
	.4byte _0802445C @ case 16
	.4byte _08024478 @ case 17
	.4byte _080244B0 @ case 18
	.4byte _080244E8 @ case 19
	.4byte _08024520 @ case 20
	.4byte _08024558 @ case 21
	.4byte _080245A8 @ case 22
	.4byte _08024568 @ case 23
	.4byte _080245B8 @ case 24
	.4byte _080245D8 @ case 25
	.4byte _080245E8 @ case 26
	.4byte _080245C8 @ case 27
_080242C0:
	ldr r1, _080242C8 @ =gPlayer
	ldr r0, _080242CC @ =PlayerCB_8025318
	b _080245EC
	.align 2, 0
_080242C8: .4byte gPlayer
_080242CC: .4byte PlayerCB_8025318
_080242D0:
	ldr r1, _080242D8 @ =gPlayer
	ldr r0, _080242DC @ =PlayerCB_8025A0C
	b _080245EC
	.align 2, 0
_080242D8: .4byte gPlayer
_080242DC: .4byte PlayerCB_8025A0C
_080242E0:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _080242F4 @ =0xFF9FFFFF
	ands r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _080242F8 @ =gPlayer
	ldr r0, _080242FC @ =PlayerCB_8025D00
	b _080245EC
	.align 2, 0
_080242F4: .4byte 0xFF9FFFFF
_080242F8: .4byte gPlayer
_080242FC: .4byte PlayerCB_8025D00
_08024300:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _08024314 @ =0xFF9FFFFF
	ands r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024318 @ =gPlayer
	ldr r0, _0802431C @ =PlayerCB_8025F84
	b _080245EC
	.align 2, 0
_08024314: .4byte 0xFF9FFFFF
_08024318: .4byte gPlayer
_0802431C: .4byte sub_8025F84
_08024320:
	ldr r1, _08024328 @ =gPlayer
	ldr r0, _0802432C @ =PlayerCB_8028D74
	b _080245EC
	.align 2, 0
_08024328: .4byte gPlayer
_0802432C: .4byte PlayerCB_8028D74
_08024330:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024344 @ =gPlayer
	ldr r0, _08024348 @ =PlayerCB_8026060
	b _080245EC
	.align 2, 0
_08024344: .4byte gPlayer
_08024348: .4byte PlayerCB_8026060
_0802434C:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024360 @ =gPlayer
	ldr r0, _08024364 @ =PlayerCB_802611C
	b _080245EC
	.align 2, 0
_08024360: .4byte gPlayer
_08024364: .4byte PlayerCB_802611C
_08024368:
	ldr r1, _08024370 @ =gPlayer
	ldr r0, _08024374 @ =PlayerCB_801225C
	b _080245EC
	.align 2, 0
_08024370: .4byte gPlayer
_08024374: .4byte PlayerCB_801225C
_08024378:
	ldr r1, _08024380 @ =gPlayer
	ldr r0, _08024384 @ =PlayerCB_8027250
	b _080245EC
	.align 2, 0
_08024380: .4byte gPlayer
_08024384: .4byte PlayerCB_8027250
_08024388:
	ldr r0, _080243C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802439E
	ldr r0, _080243C8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_0802439E:
	mov r0, ip
	ldr r1, [r0, #0x20]
	ldr r0, _080243CC @ =0x3000200A
	ands r0, r1
	cmp r0, #0
	beq _080243D0
	movs r0, #0x82
	lsls r0, r0, #0x14
	orrs r1, r0
	mov r3, ip
	str r1, [r3, #0x20]
	mov r0, ip
	adds r0, #0x5c
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _080245EE
	.align 2, 0
_080243C4: .4byte gGameMode
_080243C8: .4byte gUnknown_03005424
_080243CC: .4byte 0x3000200A
_080243D0:
	movs r0, #0x80
	lsls r0, r0, #0x14
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
	ldr r1, _080243E0 @ =gPlayer
	ldr r0, _080243E4 @ =PlayerCB_80273D0
	b _080245EC
	.align 2, 0
_080243E0: .4byte gPlayer
_080243E4: .4byte PlayerCB_80273D0
_080243E8:
	ldr r0, _08024408 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024400
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_08024400:
	ldr r1, _0802440C @ =gPlayer
	ldr r0, _08024410 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024408: .4byte gUnknown_03005424
_0802440C: .4byte gPlayer
_08024410: .4byte PlayerCB_8028E24
_08024414:
	ldr r0, _08024434 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802442C
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_0802442C:
	ldr r1, _08024438 @ =gPlayer
	ldr r0, _0802443C @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024434: .4byte gUnknown_03005424
_08024438: .4byte gPlayer
_0802443C: .4byte PlayerCB_8028E24
_08024440:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024454 @ =gPlayer
	ldr r0, _08024458 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024454: .4byte gPlayer
_08024458: .4byte PlayerCB_8028E24
_0802445C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x30
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024470 @ =gPlayer
	ldr r0, _08024474 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024470: .4byte gPlayer
_08024474: .4byte PlayerCB_8028E24
_08024478:
	ldr r0, _08024490 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024494
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
	b _0802449C
	.align 2, 0
_08024490: .4byte gUnknown_03005424
_08024494:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
_0802449C:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080244A8 @ =gPlayer
	ldr r0, _080244AC @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_080244A8: .4byte gPlayer
_080244AC: .4byte PlayerCB_8028E24
_080244B0:
	ldr r0, _080244C8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080244CC
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
	b _080244D4
	.align 2, 0
_080244C8: .4byte gUnknown_03005424
_080244CC:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
_080244D4:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080244E0 @ =gPlayer
	ldr r0, _080244E4 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_080244E0: .4byte gPlayer
_080244E4: .4byte PlayerCB_8028E24
_080244E8:
	ldr r0, _08024500 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024504
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
	b _0802450C
	.align 2, 0
_08024500: .4byte gUnknown_03005424
_08024504:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
_0802450C:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024518 @ =gPlayer
	ldr r0, _0802451C @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024518: .4byte gPlayer
_0802451C: .4byte PlayerCB_8028E24
_08024520:
	ldr r0, _08024538 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802453C
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
	b _08024544
	.align 2, 0
_08024538: .4byte gUnknown_03005424
_0802453C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
_08024544:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024550 @ =gPlayer
	ldr r0, _08024554 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024550: .4byte gPlayer
_08024554: .4byte PlayerCB_8028E24
_08024558:
	ldr r1, _08024560 @ =gPlayer
	ldr r0, _08024564 @ =PlayerCB_8029158
	b _080245EC
	.align 2, 0
_08024560: .4byte gPlayer
_08024564: .4byte PlayerCB_8029158
_08024568:
	ldr r1, _08024570 @ =gPlayer
	ldr r0, _08024574 @ =PlayerCB_802A300
	b _080245EC
	.align 2, 0
_08024570: .4byte gPlayer
_08024574: .4byte PlayerCB_802A300
_08024578:
	ldr r1, _08024580 @ =gPlayer
	ldr r0, _08024584 @ =PlayerCB_8026764
	b _080245EC
	.align 2, 0
_08024580: .4byte gPlayer
_08024584: .4byte PlayerCB_8026764
_08024588:
	ldr r1, _08024590 @ =gPlayer
	ldr r0, _08024594 @ =PlayerCB_80269C0
	b _080245EC
	.align 2, 0
_08024590: .4byte gPlayer
_08024594: .4byte PlayerCB_80269C0
_08024598:
	ldr r1, _080245A0 @ =gPlayer
	ldr r0, _080245A4 @ =PlayerCB_8026A4C
	b _080245EC
	.align 2, 0
_080245A0: .4byte gPlayer
_080245A4: .4byte PlayerCB_8026A4C
_080245A8:
	ldr r1, _080245B0 @ =gPlayer
	ldr r0, _080245B4 @ =PlayerCB_802A258
	b _080245EC
	.align 2, 0
_080245B0: .4byte gPlayer
_080245B4: .4byte PlayerCB_802A258
_080245B8:
	ldr r1, _080245C0 @ =gPlayer
	ldr r0, _080245C4 @ =PlayerCB_8026E24
	b _080245EC
	.align 2, 0
_080245C0: .4byte gPlayer
_080245C4: .4byte PlayerCB_8026E24
_080245C8:
	ldr r1, _080245D0 @ =gPlayer
	ldr r0, _080245D4 @ =PlayerCB_8026F10
	b _080245EC
	.align 2, 0
_080245D0: .4byte gPlayer
_080245D4: .4byte PlayerCB_8026F10
_080245D8:
	ldr r1, _080245E0 @ =gPlayer
	ldr r0, _080245E4 @ =PlayerCB_8026FC8
	b _080245EC
	.align 2, 0
_080245E0: .4byte gPlayer
_080245E4: .4byte PlayerCB_8026FC8
_080245E8:
	ldr r1, _08024604 @ =gPlayer
	ldr r0, _08024608 @ =PlayerCB_8027114
_080245EC:
	str r0, [r1]
_080245EE:
	mov r3, ip
	adds r3, #0x6d
	ldrb r0, [r3]
	mov r1, ip
	adds r1, #0x6f
	movs r2, #0
	strb r0, [r1]
	strb r2, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08024604: .4byte gPlayer
_08024608: .4byte PlayerCB_8027114

	thumb_func_start sub_802460C
sub_802460C: @ 0x0802460C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _0802463C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024648
	ldr r0, _08024640 @ =0x04000128
	ldr r1, [r0]
	lsls r1, r1, #0x1a
	ldr r0, _08024644 @ =gCamera
	adds r0, #0x66
	lsrs r1, r1, #0x1e
	ldrb r0, [r0]
	cmp r1, r0
	beq _08024648
	adds r1, r3, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	movs r6, #0
	adds r5, r1, #0
	b _080246BE
	.align 2, 0
_0802463C: .4byte gGameMode
_08024640: .4byte 0x04000128
_08024644: .4byte gCamera
_08024648:
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r6, [r0]
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xe
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _080246BE
	ldr r0, _080246D0 @ =gInput
	ldrh r4, [r0]
	strh r4, [r5]
	ldrb r0, [r7]
	cmp r0, #2
	bls _080246BE
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080246BE
	movs r0, #0xf0
	ands r0, r4
	lsrs r2, r0, #4
	ldr r0, _080246D4 @ =gUnknown_03005590
	ldr r1, [r0]
	ldrh r0, [r3, #0x32]
	adds r1, r0, r1
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _08024690
	movs r1, #1
_08024690:
	lsls r2, r1
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x1c
	lsrs r0, r0, #0x18
	orrs r0, r1
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x18
	ldr r0, _080246D8 @ =0x0000FF0F
	ands r0, r4
	orrs r0, r2
	strh r0, [r5]
	ldrh r0, [r3, #0x32]
	subs r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080246BE
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xbf
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
_080246BE:
	ldrh r0, [r5]
	eors r6, r0
	ands r6, r0
	adds r0, r3, #0
	adds r0, #0x5e
	strh r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080246D0: .4byte gInput
_080246D4: .4byte gUnknown_03005590
_080246D8: .4byte 0x0000FF0F

	thumb_func_start sub_80246DC
sub_80246DC: @ 0x080246DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r5, [r0]
	mov sb, r5
	movs r0, #0x68
	adds r0, r0, r4
	mov r8, r0
	ldrh r3, [r0]
	movs r1, #0x6a
	adds r1, r1, r4
	mov ip, r1
	ldrh r2, [r1]
	mov sl, r2
	ldr r1, _0802476C @ =gPlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r7, [r0]
	subs r0, r3, r7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080247CC
	cmp r2, #0
	bne _08024770
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08024770
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08024770
	movs r0, #1
	mov r1, ip
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	b _0802485C
	.align 2, 0
_0802476C: .4byte gPlayerCharacterIdleAnims
_08024770:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	adds r5, r4, #0
	adds r5, #0x6a
	ldrh r0, [r5]
	cmp r0, #1
	bne _0802485C
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802485C
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080247C4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E6D4
	adds r1, r0, #0
	ldr r0, _080247C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0802485C
	cmp r1, #0x20
	bgt _0802485C
	movs r0, #2
	strh r0, [r5]
	b _0802485C
	.align 2, 0
_080247C4: .4byte sub_801EE64
_080247C8: .4byte gGameMode
_080247CC:
	cmp r5, #0x26
	bne _080247EA
	cmp r3, #0x34
	bne _0802485C
	cmp r2, #0
	bne _080247E4
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_080247E4:
	cmp r2, #1
	bne _0802485C
	b _0802484A
_080247EA:
	cmp r5, #0x27
	bne _0802480C
	cmp r3, #0x35
	bne _0802485C
	cmp r2, #0
	bne _0802485C
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802485C
	adds r0, r7, #0
	adds r0, #0x34
	mov r1, r8
	strh r0, [r1]
	b _08024856
_0802480C:
	cmp r5, #0x25
	bne _0802482A
	cmp r3, #0x41
	bne _0802485C
	cmp r2, #0
	bne _08024824
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_08024824:
	cmp r2, #1
	bne _0802485C
	b _0802484A
_0802482A:
	mov r0, sb
	cmp r0, #0x39
	bne _0802485C
	cmp r3, #0x42
	bne _0802485C
	cmp r2, #0
	bne _08024844
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_08024844:
	mov r0, sl
	cmp r0, #1
	bne _0802485C
_0802484A:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802485C
_08024856:
	movs r0, #2
_08024858:
	mov r1, ip
	strh r0, [r1]
_0802485C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802486C
sub_802486C: @ 0x0802486C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r0, #0xc
	adds r0, r0, r6
	mov ip, r0
	adds r2, r3, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080248E0
	adds r0, r3, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	beq _080248E0
	ldr r7, _08024908 @ =gUnknown_080D6736
	adds r0, r1, #0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r4, [r0]
	adds r5, r3, #0
	adds r5, #0x68
	strh r4, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _080248C6
	ldr r0, _0802490C @ =gPlayerCharacterIdleAnims
	adds r1, r3, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r4, r0
	strh r0, [r5]
_080248C6:
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r1, r7, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
_080248E0:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r1
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #0x34
	bls _080248FC
	b _08024A96
_080248FC:
	lsls r0, r0, #2
	ldr r1, _08024910 @ =_08024914
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024908: .4byte gUnknown_080D6736
_0802490C: .4byte gPlayerCharacterIdleAnims
_08024910: .4byte _08024914
_08024914: @ jump table
	.4byte _080249E8 @ case 0
	.4byte _08024A96 @ case 1
	.4byte _08024A96 @ case 2
	.4byte _08024A96 @ case 3
	.4byte _08024A96 @ case 4
	.4byte _08024A96 @ case 5
	.4byte _08024A96 @ case 6
	.4byte _08024A3A @ case 7
	.4byte _08024A96 @ case 8
	.4byte _08024A96 @ case 9
	.4byte _08024A96 @ case 10
	.4byte _08024A96 @ case 11
	.4byte _08024A96 @ case 12
	.4byte _08024A96 @ case 13
	.4byte _08024A96 @ case 14
	.4byte _08024A96 @ case 15
	.4byte _08024A96 @ case 16
	.4byte _08024A96 @ case 17
	.4byte _08024A96 @ case 18
	.4byte _08024A96 @ case 19
	.4byte _08024A96 @ case 20
	.4byte _08024A96 @ case 21
	.4byte _08024A96 @ case 22
	.4byte _08024A96 @ case 23
	.4byte _08024A96 @ case 24
	.4byte _08024A96 @ case 25
	.4byte _08024A96 @ case 26
	.4byte _08024A96 @ case 27
	.4byte _08024A96 @ case 28
	.4byte _08024A96 @ case 29
	.4byte _08024A96 @ case 30
	.4byte _08024A96 @ case 31
	.4byte _08024A96 @ case 32
	.4byte _08024A96 @ case 33
	.4byte _08024A96 @ case 34
	.4byte _08024A96 @ case 35
	.4byte _08024A96 @ case 36
	.4byte _08024A96 @ case 37
	.4byte _08024A96 @ case 38
	.4byte _08024A96 @ case 39
	.4byte _08024A96 @ case 40
	.4byte _08024A96 @ case 41
	.4byte _08024A70 @ case 42
	.4byte _08024A70 @ case 43
	.4byte _08024A76 @ case 44
	.4byte _08024A76 @ case 45
	.4byte _08024A96 @ case 46
	.4byte _08024A96 @ case 47
	.4byte _08024A96 @ case 48
	.4byte _08024A96 @ case 49
	.4byte _08024A10 @ case 50
	.4byte _08024A10 @ case 51
	.4byte _08024A10 @ case 52
_080249E8:
	ldr r1, _08024A2C @ =gPlayerCharacterIdleAnims
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #9
	adds r1, r3, #0
	adds r1, #0x68
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r4, r1, #0
_08024A10:
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A20
	rsbs r0, r0, #0
_08024A20:
	cmp r0, #7
	ble _08024A30
	cmp r0, #0x80
	ble _08024A32
	movs r0, #0x80
	b _08024A32
	.align 2, 0
_08024A2C: .4byte gPlayerCharacterIdleAnims
_08024A30:
	movs r0, #8
_08024A32:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	b _08024A96
_08024A3A:
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #1
	bne _08024A96
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A60
	rsbs r0, r0, #0
_08024A60:
	cmp r0, #7
	ble _08024A6C
	cmp r0, #0x80
	ble _08024A88
	movs r0, #0x80
	b _08024A88
_08024A6C:
	movs r0, #8
	b _08024A88
_08024A70:
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	b _08024A7A
_08024A76:
	movs r4, #0x14
	ldrsh r0, [r3, r4]
_08024A7A:
	cmp r0, #0
	bge _08024A80
	rsbs r0, r0, #0
_08024A80:
	asrs r1, r0, #8
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #8
_08024A88:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
_08024A96:
	ldr r0, _08024B0C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024AA8
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
_08024AA8:
	adds r0, r3, #0
	adds r0, #0x6c
	ldrb r1, [r0]
	adds r6, r0, #0
	mov r5, ip
	adds r5, #0x20
	cmp r1, #0
	bne _08024ACA
	mov r1, ip
	ldrh r0, [r1, #0xa]
	ldrh r1, [r4]
	cmp r0, r1
	bne _08024ACA
	ldrb r0, [r5]
	ldrh r1, [r2]
	cmp r0, r1
	beq _08024AF6
_08024ACA:
	movs r0, #0
	strb r0, [r6]
	ldrh r0, [r4]
	mov r4, ip
	strh r0, [r4, #0xa]
	ldrh r0, [r2]
	strb r0, [r5]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	ldrb r0, [r7]
	cmp r0, #2
	bls _08024AF6
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #1
	strb r0, [r1]
_08024AF6:
	mov r0, r8
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x66
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024B0C: .4byte gGameMode

	thumb_func_start sub_8024B10
sub_8024B10: @ 0x08024B10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r5, #0xc
	adds r6, r1, #0
	ldr r0, _08024BBC @ =gCamera
	ldrh r3, [r0]
	ldrh r4, [r0, #4]
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08024B3A
	ldrh r1, [r5, #0x1e]
	ldr r0, _08024BC0 @ =0x0000FFFF
	cmp r1, r0
	bne _08024B3C
_08024B3A:
	movs r2, #1
_08024B3C:
	mov sb, r2
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	strh r2, [r6, #6]
	strh r1, [r6, #8]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #9
	beq _08024B84
	cmp r0, #0x29
	beq _08024B84
	cmp r0, #0x3e
	beq _08024B84
	cmp r0, #0x3f
	beq _08024B84
	cmp r0, #0x57
	bne _08024C68
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08024C68
_08024B84:
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	strh r0, [r6]
	ldr r1, [r5, #0x10]
	ldr r0, _08024BC4 @ =0xFFFFF3FF
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	movs r2, #0x20
	orrs r0, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r1, r0
	str r1, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024BC8
	movs r0, #0xff
	lsls r0, r0, #8
	b _08024BCC
	.align 2, 0
_08024BBC: .4byte gCamera
_08024BC0: .4byte 0x0000FFFF
_08024BC4: .4byte 0xFFFFF3FF
_08024BC8:
	movs r0, #0x80
	lsls r0, r0, #1
_08024BCC:
	strh r0, [r6, #2]
	ldr r2, _08024C14 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024BE2
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r6, #2]
_08024BE2:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _08024BF0
	ldrh r0, [r6, #6]
	subs r0, #1
	strh r0, [r6, #6]
_08024BF0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024C20
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldrh r1, [r6]
	adds r1, r1, r0
	ldr r2, _08024C18 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _08024C1C @ =0x000003FF
	ands r0, r1
	strh r0, [r6]
	b _08024C26
	.align 2, 0
_08024C14: .4byte gUnknown_03005424
_08024C18: .4byte 0xFFFFFF00
_08024C1C: .4byte 0x000003FF
_08024C20:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
_08024C26:
	movs r3, #2
	ldrsh r1, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r6, #2]
	strh r0, [r6, #4]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08024C64 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	b _08024CC2
	.align 2, 0
_08024C64: .4byte gGameMode
_08024C68:
	movs r0, #0
	strh r0, [r6]
	ldr r2, [r5, #0x10]
	subs r0, #0x40
	ands r2, r0
	str r2, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024C88
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	str r2, [r5, #0x10]
	b _08024C94
_08024C88:
	ldr r0, _08024CAC @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r5, #0x10]
	ldrh r0, [r5, #0x16]
	adds r0, #1
	strh r0, [r5, #0x16]
_08024C94:
	ldr r0, _08024CB0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024CB4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08024CBA
	.align 2, 0
_08024CAC: .4byte 0xFFFFFBFF
_08024CB0: .4byte gUnknown_03005424
_08024CB4:
	ldr r0, [r5, #0x10]
	ldr r1, _08024D9C @ =0xFFFFF7FF
	ands r0, r1
_08024CBA:
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
_08024CC2:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08024CF2
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08024CF8
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024CF2
	ldr r0, _08024DA4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08024CF8
_08024CF2:
	adds r0, r5, #0
	bl sub_80051E8
_08024CF8:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	b _08024F5C
_08024D02:
	ldr r4, _08024DA8 @ =gMultiSioSend
	ldr r2, _08024DAC @ =gMultiplayerPlayerTasks
	ldr r0, _08024DB0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r4]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #4]
	ldrh r3, [r5, #0xa]
	strh r3, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r4, #0xa]
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #5
	bne _08024D6C
	ldr r1, _08024DB4 @ =gPlayerCharacterIdleAnims
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, r3, r1
	ldr r0, _08024DB8 @ =gRingCount
	ldrh r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r4, #6]
_08024D6C:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #4
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r4, #0xb]
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
	ldrh r0, [r6]
	lsrs r0, r0, #2
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024DBC
	ldrh r0, [r4, #8]
	movs r1, #1
	orrs r0, r1
	b _08024DC2
	.align 2, 0
_08024D9C: .4byte 0xFFFFF7FF
_08024DA0: .4byte gGameMode
_08024DA4: .4byte gUnknown_03005590
_08024DA8: .4byte gMultiSioSend
_08024DAC: .4byte gMultiplayerPlayerTasks
_08024DB0: .4byte 0x04000128
_08024DB4: .4byte gPlayerCharacterIdleAnims
_08024DB8: .4byte gRingCount
_08024DBC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DD8 @ =0x0000FFFE
	ands r0, r1
_08024DC2:
	strh r0, [r4, #8]
	ldr r1, [r7, #0x20]
	movs r0, #1
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	bne _08024DDC
	ldrh r1, [r4, #8]
	movs r0, #2
	orrs r0, r1
	b _08024DE2
	.align 2, 0
_08024DD8: .4byte 0x0000FFFE
_08024DDC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DF8 @ =0x0000FFFD
	ands r0, r1
_08024DE2:
	strh r0, [r4, #8]
	ldr r0, _08024DFC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024E00
	ldrh r1, [r4, #8]
	movs r0, #8
	orrs r0, r1
	b _08024E06
	.align 2, 0
_08024DF8: .4byte 0x0000FFFD
_08024DFC: .4byte gUnknown_03005424
_08024E00:
	ldrh r1, [r4, #8]
	ldr r0, _08024E38 @ =0x0000FFF7
	ands r0, r1
_08024E06:
	strh r0, [r4, #8]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024E2E
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024E3C
_08024E2E:
	ldrh r1, [r4, #8]
	movs r0, #4
	orrs r0, r1
	b _08024E42
	.align 2, 0
_08024E38: .4byte 0x0000FFF7
_08024E3C:
	ldrh r1, [r4, #8]
	ldr r0, _08024E5C @ =0x0000FFFB
	ands r0, r1
_08024E42:
	strh r0, [r4, #8]
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08024E60
	ldrh r1, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	b _08024E66
	.align 2, 0
_08024E5C: .4byte 0x0000FFFB
_08024E60:
	ldrh r1, [r4, #8]
	ldr r0, _08024E7C @ =0x0000FEFF
	ands r0, r1
_08024E66:
	strh r0, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08024E80
	ldrh r1, [r4, #8]
	movs r0, #0x40
	orrs r0, r1
	b _08024E86
	.align 2, 0
_08024E7C: .4byte 0x0000FEFF
_08024E80:
	ldrh r1, [r4, #8]
	ldr r0, _08024EB8 @ =0x0000FFBF
	ands r0, r1
_08024E86:
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldr r2, _08024EBC @ =0x0000FFCF
	ands r2, r0
	strh r2, [r4, #8]
	ldr r3, _08024EC0 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r1, r0, #8
	orrs r1, r2
	strh r1, [r4, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024EC4
	movs r0, #0x80
	orrs r1, r0
	b _08024EC8
	.align 2, 0
_08024EB8: .4byte 0x0000FFBF
_08024EBC: .4byte 0x0000FFCF
_08024EC0: .4byte gPlayer
_08024EC4:
	ldr r0, _08024EDC @ =0x0000FF7F
	ands r1, r0
_08024EC8:
	strh r1, [r4, #8]
	mov r0, sb
	cmp r0, #0
	beq _08024EE0
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	b _08024EE6
	.align 2, 0
_08024EDC: .4byte 0x0000FF7F
_08024EE0:
	ldrh r1, [r4, #8]
	ldr r0, _08024F68 @ =0x0000F7FF
	ands r0, r1
_08024EE6:
	strh r0, [r4, #8]
	ldr r6, _08024F6C @ =0x04000128
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, ip
	adds r2, #0x64
	strb r0, [r2]
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08024F4C
	movs r2, #0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08024F2C
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _08024F4C
_08024F16:
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r3, #0x3c]
	cmp r0, r1
	bne _08024F2C
	strb r2, [r5]
_08024F2C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08024F4C
	ldr r0, _08024F6C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08024F2C
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _08024F16
_08024F4C:
	ldrh r0, [r4, #8]
	ldr r1, _08024F70 @ =0x0000F9FF
	ands r1, r0
	strh r1, [r4, #8]
	ldrb r0, [r5]
	lsls r0, r0, #9
	orrs r0, r1
	strh r0, [r4, #8]
_08024F5C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F68: .4byte 0x0000F7FF
_08024F6C: .4byte 0x04000128
_08024F70: .4byte 0x0000F9FF

	thumb_func_start sub_8024F74
sub_8024F74: @ 0x08024F74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r6, #0xc
	adds r4, r1, #0
	ldr r0, _08024FB4 @ =gCamera
	ldrh r3, [r0]
	ldrh r7, [r0, #4]
	ldr r0, _08024FB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08024FC4
	ldr r0, _08024FBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08024FC0 @ =gMultiSioRecv
	adds r1, r1, r0
	ldrh r2, [r1, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r4, #6]
	ldrh r1, [r1, #4]
	b _08024FD4
	.align 2, 0
_08024FB4: .4byte gCamera
_08024FB8: .4byte gGameMode
_08024FBC: .4byte 0x04000128
_08024FC0: .4byte gMultiSioRecv
_08024FC4:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #6]
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
_08024FD4:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #8]
	adds r2, r6, #0
	adds r2, #0x22
	movs r0, #0x10
	strb r0, [r2]
	ldr r1, [r5, #0x20]
	movs r0, #0x40
	ands r0, r1
	mov sl, r1
	cmp r0, #0
	beq _08024FF4
	movs r0, #8
	strb r0, [r2]
_08024FF4:
	adds r0, r5, #0
	adds r0, #0x85
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #4
	bls _08025004
	b _08025306
_08025004:
	lsls r0, r1, #2
	ldr r1, _08025010 @ =_08025014
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025010: .4byte _08025014
_08025014: @ jump table
	.4byte _08025306 @ case 0
	.4byte _08025028 @ case 1
	.4byte _08025180 @ case 2
	.4byte _08025306 @ case 3
	.4byte _08025306 @ case 4
_08025028:
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov ip, r2
	ldr r1, _080250B0 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08025058
	cmp r2, #1
	beq _0802506E
_08025058:
	cmp r1, #4
	bne _08025060
	cmp r2, #0
	beq _0802506E
_08025060:
	cmp r3, #0x46
	beq _08025066
	b _08025306
_08025066:
	mov r0, ip
	cmp r0, #0
	beq _0802506E
	b _08025306
_0802506E:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0xb0
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _080250B4 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080250B8
	movs r0, #0xff
	lsls r0, r0, #8
	b _080250BC
	.align 2, 0
_080250B0: .4byte gPlayerCharacterIdleAnims
_080250B4: .4byte gUnknown_030054B8
_080250B8:
	movs r0, #0x80
	lsls r0, r0, #1
_080250BC:
	strh r0, [r4, #2]
	ldr r2, _08025104 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080250D2
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_080250D2:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080250E0
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_080250E0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025110
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025108 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802510C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _08025116
	.align 2, 0
_08025104: .4byte gUnknown_03005424
_08025108: .4byte 0xFFFFFF00
_0802510C: .4byte 0x000003FF
_08025110:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_08025116:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025174
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	beq _0802515E
	b _08025306
_0802515E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025174
	ldr r0, _0802517C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025174
	b _08025306
_08025174:
	adds r0, r6, #0
	bl sub_80051E8
	b _08025306
	.align 2, 0
_0802517C: .4byte gUnknown_03005590
_08025180:
	movs r3, #0x10
	ldrsh r2, [r5, r3]
	mov ip, r2
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	mov sb, r0
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov r8, r2
	ldr r1, _080251F4 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080251BC
	cmp r2, #1
	beq _080251D2
_080251BC:
	cmp r1, #4
	bne _080251C4
	cmp r2, #0
	beq _080251D2
_080251C4:
	cmp r3, #0x46
	beq _080251CA
	b _08025306
_080251CA:
	mov r2, r8
	cmp r2, #0
	beq _080251D2
	b _08025306
_080251D2:
	mov r3, ip
	cmp r3, #0
	bne _080251DE
	mov r0, sb
	cmp r0, #0
	beq _080251F8
_080251DE:
	mov r0, ip
	mov r1, sb
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08025208
	.align 2, 0
_080251F4: .4byte gPlayerCharacterIdleAnims
_080251F8:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	movs r1, #0x40
	cmp r0, #0
	beq _08025206
	movs r1, #0xc0
_08025206:
	adds r0, r1, #0
_08025208:
	adds r1, r5, #0
	adds r1, #0xad
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08025244 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08025248
	movs r0, #0xff
	lsls r0, r0, #8
	b _0802524C
	.align 2, 0
_08025244: .4byte gUnknown_030054B8
_08025248:
	movs r0, #0x80
	lsls r0, r0, #1
_0802524C:
	strh r0, [r4, #2]
	ldr r2, _08025294 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025262
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_08025262:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08025270
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_08025270:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080252A0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025298 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802529C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _080252A6
	.align 2, 0
_08025294: .4byte gUnknown_03005424
_08025298: .4byte 0xFFFFFF00
_0802529C: .4byte 0x000003FF
_080252A0:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_080252A6:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025300
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08025306
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025300
	ldr r0, _08025314 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025306
_08025300:
	adds r0, r6, #0
	bl sub_80051E8
_08025306:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025314: .4byte gUnknown_03005590
