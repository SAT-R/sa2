
.syntax unified
.text
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
	ldr r0, _0802181C @ =Player_TouchGround
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
	adds r0, #4     @ p->defeatScoreIndex 0x84
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
_0802181C: .4byte Player_TouchGround
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
	ldr r1, _080218D8 @ =gUnknown_03005B7C
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
_080218D8: .4byte gUnknown_03005B7C
_080218DC: .4byte gUnknown_03005840
_080218E0: .4byte gUnknown_0300583C

.syntax divided
