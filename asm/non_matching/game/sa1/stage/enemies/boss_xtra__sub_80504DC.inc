.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0      @ sl = r0 = robo
	movs r4, #0
	str r4, [r0, #0x60]
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r0, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r0, sl      @ r0 = sl = robo
	str r1, [r0, #0x64]
	ldr r1, _08050848 @ =0xFFFF0000
	str r1, [r0, #0x44]
	ldr r0, _0805084C @ =0xFFFFCA00
	mov r2, sl      @ r2 = sl = robo
	str r0, [r2, #0x48]
	mov r0, sl      @ r0 = sl = robo
	adds r0, #0x4c
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _08050850 @ =0x00400002
	str r0, [r2, #0x58]
	str r4, [r2, #0x5c]
	mov r0, sl      @ r0 = sl = robo
	adds r0, #0x54
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	mov r1, sl      @ r1 = sl = robo
	adds r1, #0x6c
	movs r0, #0xf0
	strh r0, [r1]
	subs r1, #4
	ldr r0, _08050854 @ =gLoadedSaveGame
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #1
	movs r3, #8
	subs r0, r3, r0
	strb r0, [r1]
	mov r0, sl      @ r0 = sl = robo
	adds r0, #0x69
	movs r1, #0
	strb r1, [r0]
	mov r1, sl      @ r1 = sl = robo
	adds r1, #0x6a
	movs r0, #0x24
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x36
	strb r0, [r1]
	mov r0, sl      @ r0 = sl = robo
	adds r0, #0x6e
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r6, _08050858 @ =gExtraBossTaskData
	mov r0, sl      @ r0 = sl = robo
	movs r1, #0
	movs r2, #0
	movs r3, #0x15
	bl sub_8052838
	adds r5, r6, #4
	str r0, [r6, #4]
	strh r4, [r0]
	movs r7, #1
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _0805085C @ =0xFFFFE400
	movs r3, #0x16
	bl sub_8052474
	movs r3, #4
	mov sb, r3
	str r0, [r5, #4]
	strh r7, [r0]
	movs r7, #2
	ldr r0, [r6, #4]
	ldr r2, _08050860 @ =0xFFFFE900
	movs r1, #0xb0
	lsls r1, r1, #4
	movs r3, #0xf
	bl sub_80524F0
	str r0, [r6, #0xc]
	strh r7, [r0]
	ldr r2, [r6, #0xc]
	ldr r1, [r2, #0x28]
	ldr r3, _08050864 @ =0xFFFFCFFF
	mov r8, r3
	ands r1, r3
	movs r5, #0x80
	lsls r5, r5, #5
	orrs r1, r5
	str r1, [r2, #0x28]
	movs r7, #3
	movs r1, #0
	movs r2, #0xa0
	lsls r2, r2, #5
	movs r3, #0x10
	bl sub_8052578
	str r0, [r6, #0x10]
	strh r7, [r0]
	ldr r2, [r6, #0x10]
	ldr r1, [r2, #0x28]
	mov r3, r8
	ands r1, r3
	orrs r1, r5
	str r1, [r2, #0x28]
	movs r4, #0x90
	lsls r4, r4, #5
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0xf
	bl sub_80525E0
	str r0, [r6, #0x14]
	mov r1, sb
	strh r1, [r0]
	ldr r2, [r6, #0x14]
	ldr r1, [r2, #0x28]
	mov r3, r8
	ands r1, r3
	orrs r1, r5
	str r1, [r2, #0x28]
	movs r7, #5
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0x10
	bl sub_8052578
	str r0, [r6, #0x18]
	strh r7, [r0]
	ldr r2, [r6, #0x18]
	ldr r1, [r2, #0x28]
	mov r3, r8
	ands r1, r3
	orrs r1, r5
	str r1, [r2, #0x28]
	movs r7, #6
	movs r1, #0x80
	lsls r1, r1, #4
	mov sb, r1
	movs r1, #0
	mov r2, sb
	movs r3, #0xe
	bl sub_805265C
	str r0, [r6, #0x1c]
	strh r7, [r0]
	ldr r1, [r6, #0x1c]
	ldr r0, [r1, #0x28]
	mov r2, r8
	ands r0, r2
	orrs r0, r5
	str r0, [r1, #0x28]
	movs r7, #7
	ldr r0, [r6, #4]
	ldr r1, _08050868 @ =0xFFFFFB00
	ldr r2, _0805086C @ =0xFFFFE700
	movs r3, #0x1b
	bl sub_80524F0
	str r0, [r6, #0x20]
	strh r7, [r0]
	movs r1, #0
	movs r2, #0xa0
	lsls r2, r2, #5
	movs r3, #0x1c
	bl sub_8052578
	str r0, [r6, #0x24]
	movs r3, #8
	strh r3, [r0]
	movs r7, #9
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0x1b
	bl sub_80525E0
	str r0, [r6, #0x28]
	strh r7, [r0]
	movs r7, #0xa
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0x1c
	bl sub_8052578
	str r0, [r6, #0x2c]
	strh r7, [r0]
	movs r7, #0xb
	movs r1, #0
	mov r2, sb
	movs r3, #0x1a
	bl sub_805265C
	str r0, [r6, #0x30]
	strh r7, [r0]
	ldr r0, [sp, #4]
	ldr r1, _08050848 @ =0xFFFF0000
	ands r0, r1
	ldr r2, _08050870 @ =0x0000029B
	orrs r0, r2
	ldr r3, _08050874 @ =0xFF00FFFF
	ands r0, r3
	str r0, [sp, #4]
	movs r0, #0x10
	bl VramMalloc
	add r1, sp, #4
	mov sb, r1
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x14
	str r2, [sp]
	movs r2, #0xa0
	lsls r2, r2, #3
	add r3, sp, #4
	bl sub_80526C4
	adds r4, r0, #0
	str r4, [r6, #0x34]
	movs r3, #0xc
	strh r3, [r4]
	ldr r0, [r6, #0x34]
	adds r0, #0x76
	movs r1, #0xe0
	lsls r1, r1, #8
	strh r1, [r0]
	ldr r0, [r6, #0x34]
	adds r0, #0x72
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	ldr r1, [r6, #0x34]
	ldr r0, [r1, #0x28]
	mov r2, r8
	ands r0, r2
	orrs r0, r5
	str r0, [r1, #0x28]
	ldr r1, _08050878 @ =0x0000029D
	add r0, sp, #4
	strh r1, [r0]
	movs r0, #0
	mov r3, sb
	strb r0, [r3, #2]
	movs r0, #9
	bl VramMalloc
	str r0, [sp, #8]
	movs r0, #0x13
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	add r3, sp, #4
	bl sub_8052724
	ldr r1, [r0, #0x28]
	mov r2, r8
	ands r1, r2
	orrs r1, r5
	str r1, [r0, #0x28]
	add r0, sp, #4
	movs r3, #0xa7
	lsls r3, r3, #2
	strh r3, [r0]
	movs r1, #0
	mov r0, sb
	strb r1, [r0, #2]
	movs r0, #0x40
	bl VramMalloc
	str r0, [sp, #8]
	movs r7, #0xd
	movs r2, #0xc0
	lsls r2, r2, #4
	movs r0, #0x12
	str r0, [sp]
	adds r0, r4, #0
	ldr r1, _0805087C @ =0xFFFFF700
	add r3, sp, #4
	bl sub_8052780
	adds r4, r0, #0
	str r4, [r6, #0x38]
	strh r7, [r4]
	ldr r1, [r6, #0x38]
	ldr r0, [r1, #0x28]
	mov r2, r8
	ands r0, r2
	orrs r0, r5
	str r0, [r1, #0x28]
	add r0, sp, #4
	ldr r3, _08050870 @ =0x0000029B
	strh r3, [r0]
	movs r1, #2
	mov r0, sb
	strb r1, [r0, #2]
	movs r0, #0x10
	bl VramMalloc
	str r0, [sp, #8]
	movs r7, #0xe
	movs r2, #0xc0
	lsls r2, r2, #2
	mov sb, r2
	movs r3, #0x11
	str r3, [sp]
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0xd8
	lsls r2, r2, #5
	add r3, sp, #4
	bl sub_80527DC
	str r0, [r6, #0x3c]
	strh r7, [r0]
	ldr r1, [r6, #0x3c]
	ldr r0, [r1, #0x28]
	mov r2, r8
	ands r0, r2
	orrs r0, r5
	str r0, [r1, #0x28]
	ldr r0, [sp, #0xc]
	ldr r3, _08050848 @ =0xFFFF0000
	ands r0, r3
	ldr r1, _08050870 @ =0x0000029B
	orrs r0, r1
	ldr r2, _08050874 @ =0xFF00FFFF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [sp, #0xc]
	movs r0, #0x10
	bl VramMalloc
	add r5, sp, #0xc
	str r0, [r5, #4]
	movs r7, #0xf
	ldr r0, [r6, #4]
	ldr r1, _08050880 @ =0xFFFFFA00
	movs r2, #0x17
	str r2, [sp]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r3, r5, #0
	bl sub_80526C4
	adds r4, r0, #0
	str r4, [r6, #0x40]
	strh r7, [r4]
	ldr r0, [r6, #0x40]
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #6
	strh r1, [r0]
	ldr r0, [r6, #0x40]
	adds r0, #0x72
	movs r1, #0xff
	lsls r1, r1, #8
	strh r1, [r0]
	movs r3, #0xa7
	lsls r3, r3, #2
	strh r3, [r5]
	movs r0, #1
	strb r0, [r5, #2]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r5, #4]
	movs r7, #0x10
	movs r0, #0x16
	str r0, [sp]
	adds r0, r4, #0
	ldr r1, _0805087C @ =0xFFFFF700
	movs r2, #0xb0
	lsls r2, r2, #4
	adds r3, r5, #0
	bl sub_8052780
	adds r4, r0, #0
	str r4, [r6, #0x44]
	strh r7, [r4]
	ldr r0, _08050870 @ =0x0000029B
	strh r0, [r5]
	movs r0, #3
	strb r0, [r5, #2]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x18
	str r0, [sp]
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0xd8
	lsls r2, r2, #5
	adds r3, r5, #0
	bl sub_80527DC
	str r0, [r6, #0x48]
	movs r1, #0x11
	strh r1, [r0]
	ldr r0, _08050884 @ =gInput
	ldrh r0, [r0]
	cmp r0, #0xfa
	bne _08050836
	mov r2, sl      @ r2 = sl = robo
	ldr r0, [r2, #0x58]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #0x58]
_08050836:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050848: .4byte 0xFFFF0000
_0805084C: .4byte 0xFFFFCA00
_08050850: .4byte 0x00400002
_08050854: .4byte gLoadedSaveGame
_08050858: .4byte gExtraBossTaskData
_0805085C: .4byte 0xFFFFE400
_08050860: .4byte 0xFFFFE900
_08050864: .4byte 0xFFFFCFFF
_08050868: .4byte 0xFFFFFB00
_0805086C: .4byte 0xFFFFE700
_08050870: .4byte 0x0000029B
_08050874: .4byte 0xFF00FFFF
_08050878: .4byte 0x0000029D
_0805087C: .4byte 0xFFFFF700
_08050880: .4byte 0xFFFFFA00
_08050884: .4byte gInput

.syntax divided
