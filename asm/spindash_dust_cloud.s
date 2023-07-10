.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start CreateSpindashDustCloud
CreateSpindashDustCloud: @ 0x0801F7DC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0801F840 @ =Task_801F860
	ldr r2, _0801F844 @ =0x00004001
	ldr r1, _0801F848 @ =TaskDestructor_801FAE8
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r5, [r6, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #0x14
	bl VramMalloc
	str r0, [r4, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #8]
	ldr r0, _0801F84C @ =0x0000034E
	strh r0, [r4, #0xa]
	ldr r1, _0801F850 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	strb r3, [r0]
	ldr r0, _0801F854 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	ldr r0, _0801F858 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801F85C @ =IWRAM_START + 0x25
	adds r5, r5, r1
	strb r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F840: .4byte Task_801F860
_0801F844: .4byte 0x00004001
_0801F848: .4byte TaskDestructor_801FAE8
_0801F84C: .4byte 0x0000034E
_0801F850: .4byte IWRAM_START + 0x20
_0801F854: .4byte IWRAM_START + 0x21
_0801F858: .4byte IWRAM_START + 0x22
_0801F85C: .4byte IWRAM_START + 0x25

	thumb_func_start Task_801F860
Task_801F860: @ 0x0801F860
	push {r4, r5, r6, r7, lr}
	ldr r5, _0801F888 @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F87C
	ldr r0, [r5, #0x20]
	movs r1, #0x90
	lsls r1, r1, #3
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _0801F890
_0801F87C:
	ldr r0, _0801F88C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801F998
	.align 2, 0
_0801F888: .4byte gPlayer
_0801F88C: .4byte gCurTask
_0801F890:
	ldr r3, _0801F908 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _0801F8C2
	movs r1, #0
	ldr r0, _0801F90C @ =0x0000034F
	strh r0, [r4, #0xa]
	ldr r6, _0801F910 @ =IWRAM_START + 0x20
	adds r0, r2, r6
	strb r1, [r0]
	ldr r0, _0801F914 @ =IWRAM_START + 0x21
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, _0801F918 @ =sub_801F9A4
	str r0, [r1, #8]
_0801F8C2:
	ldr r6, _0801F91C @ =gCamera
	movs r3, #0x17
	ldrsb r3, [r5, r3]
	ldr r2, _0801F920 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0801F8D8
	rsbs r3, r3, #0
_0801F8D8:
	ldr r0, _0801F924 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801F938
	ldr r1, _0801F928 @ =gMultiplayerPlayerTasks
	ldr r0, _0801F92C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0801F930 @ =IWRAM_START + 0x50
	adds r0, r1, r2
	ldr r2, [r6]
	ldrh r0, [r0]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, _0801F934 @ =IWRAM_START + 0x52
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0801F946
	.align 2, 0
_0801F908: .4byte gCurTask
_0801F90C: .4byte 0x0000034F
_0801F910: .4byte IWRAM_START + 0x20
_0801F914: .4byte IWRAM_START + 0x21
_0801F918: .4byte sub_801F9A4
_0801F91C: .4byte gCamera
_0801F920: .4byte gUnknown_03005424
_0801F924: .4byte gGameMode
_0801F928: .4byte gMultiplayerPlayerTasks
_0801F92C: .4byte 0x04000128
_0801F930: .4byte IWRAM_START + 0x50
_0801F934: .4byte IWRAM_START + 0x52
_0801F938:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
_0801F946:
	adds r0, r0, r3
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F962
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801F968
_0801F962:
	ldr r0, [r4, #0x10]
	ldr r1, _0801F980 @ =0xFFFFFBFF
	ands r0, r1
_0801F968:
	str r0, [r4, #0x10]
	ldrh r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801F984
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801F98A
	.align 2, 0
_0801F980: .4byte 0xFFFFFBFF
_0801F984:
	ldr r0, [r4, #0x10]
	ldr r1, _0801F9A0 @ =0xFFFFF7FF
	ands r0, r1
_0801F98A:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801F998:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F9A0: .4byte 0xFFFFF7FF

	thumb_func_start sub_801F9A4
sub_801F9A4: @ 0x0801F9A4
	push {r4, r5, r6, r7, lr}
	ldr r5, _0801F9CC @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F9C0
	ldr r0, [r5, #0x20]
	movs r1, #0x90
	lsls r1, r1, #3
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _0801F9D4
_0801F9C0:
	ldr r0, _0801F9D0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801FADC
	.align 2, 0
_0801F9CC: .4byte gPlayer
_0801F9D0: .4byte gCurTask
_0801F9D4:
	ldr r3, _0801FA4C @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bgt _0801FA06
	movs r1, #0
	ldr r0, _0801FA50 @ =0x0000034E
	strh r0, [r4, #0xa]
	ldr r6, _0801FA54 @ =IWRAM_START + 0x20
	adds r0, r2, r6
	strb r1, [r0]
	ldr r0, _0801FA58 @ =IWRAM_START + 0x21
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, _0801FA5C @ =Task_801F860
	str r0, [r1, #8]
_0801FA06:
	ldr r6, _0801FA60 @ =gCamera
	movs r3, #0x17
	ldrsb r3, [r5, r3]
	ldr r2, _0801FA64 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0801FA1C
	rsbs r3, r3, #0
_0801FA1C:
	ldr r0, _0801FA68 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801FA7C
	ldr r1, _0801FA6C @ =gMultiplayerPlayerTasks
	ldr r0, _0801FA70 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0801FA74 @ =IWRAM_START + 0x50
	adds r0, r1, r2
	ldr r2, [r6]
	ldrh r0, [r0]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, _0801FA78 @ =IWRAM_START + 0x52
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0801FA8A
	.align 2, 0
_0801FA4C: .4byte gCurTask
_0801FA50: .4byte 0x0000034E
_0801FA54: .4byte IWRAM_START + 0x20
_0801FA58: .4byte IWRAM_START + 0x21
_0801FA5C: .4byte Task_801F860
_0801FA60: .4byte gCamera
_0801FA64: .4byte gUnknown_03005424
_0801FA68: .4byte gGameMode
_0801FA6C: .4byte gMultiplayerPlayerTasks
_0801FA70: .4byte 0x04000128
_0801FA74: .4byte IWRAM_START + 0x50
_0801FA78: .4byte IWRAM_START + 0x52
_0801FA7C:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
_0801FA8A:
	adds r0, r0, r3
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801FAA6
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801FAAC
_0801FAA6:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FAC4 @ =0xFFFFFBFF
	ands r0, r1
_0801FAAC:
	str r0, [r4, #0x10]
	ldrh r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801FAC8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801FACE
	.align 2, 0
_0801FAC4: .4byte 0xFFFFFBFF
_0801FAC8:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FAE4 @ =0xFFFFF7FF
	ands r0, r1
_0801FACE:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801FADC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FAE4: .4byte 0xFFFFF7FF

	thumb_func_start TaskDestructor_801FAE8
TaskDestructor_801FAE8: @ 0x0801FAE8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
