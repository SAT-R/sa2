.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D5744
gUnknown_080D5744:
    .4byte sub_8019240
    .4byte sub_80192A8
    .4byte sub_80192FC
    .4byte sub_8019350
    .4byte sub_8019368
    .4byte sub_8018AD8
    .4byte sub_8018E00
    .4byte VoidReturnSIOControl32
    .4byte 0

.text
.syntax unified
.arm

	
	thumb_func_start sub_8018E00
sub_8018E00: @ 0x08018E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, _08018E84 @ =gMultiplayerPlayerTasks
	mov r1, r8
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp]
	movs r7, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08018ED8
	ldr r0, _08018E88 @ =gGameMode
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r2, #0
	movs r2, #0x10
	mov sb, r2
	ldr r6, _08018E8C @ =0x04000128
	ldr r4, _08018E90 @ =gUnknown_030054B4
_08018E4C:
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r2, ip
	cmp r2, #4
	beq _08018E94
	ldr r0, [r1, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08018EC8
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r1, #2
	cmp r0, r1
	beq _08018EC8
	movs r2, #1
	add sl, r2
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
	b _08018EC8
	.align 2, 0
_08018E84: .4byte gMultiplayerPlayerTasks
_08018E88: .4byte gGameMode
_08018E8C: .4byte 0x04000128
_08018E90: .4byte gUnknown_030054B4
_08018E94:
	ldr r1, _08018EF8 @ =gMultiplayerConnections
	ldrb r3, [r1]
	mov r2, sb
	lsls r2, r7
	ands r2, r3
	adds r0, r7, #4
	asrs r2, r0
	ldr r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	mov r0, sb
	lsls r0, r1
	ands r3, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	beq _08018EC8
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08018EC8
	movs r2, #1
	mov sl, r2
_08018EC8:
	adds r5, #4
	adds r4, #1
	adds r7, #1
	cmp r7, #3
	bhi _08018ED8
	ldr r0, [r5]
	cmp r0, #0
	bne _08018E4C
_08018ED8:
	ldr r0, _08018EFC @ =gUnknown_030054B4
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08018F00
	mov r0, sl
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl sub_8019CCC
	b _08018F04
	.align 2, 0
_08018EF8: .4byte gMultiplayerConnections
_08018EFC: .4byte gUnknown_030054B4
_08018F00:
	movs r1, #1
	str r1, [sp, #0xc]
_08018F04:
	ldr r0, _08019080 @ =gGameMode
	ldrb r0, [r0]
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #0x14]
	ldr r1, [sp, #8]
	subs r1, #1
	str r1, [sp, #0x10]
	cmp r0, #4
	bne _08018FFE
	movs r7, #0
	ldr r0, _08019084 @ =gMultiplayerPlayerTasks
	ldr r0, [r0]
	cmp r0, #0
	beq _08018FFE
	movs r2, #0x10
	mov sb, r2
	mov r0, sb
	mov r1, r8
	lsls r0, r1
	mov sb, r0
	ldr r6, _08019088 @ =gPlayer
_08018F30:
	cmp r7, r8
	beq _08018FEC
	ldr r0, _0801908C @ =gUnknown_030054B4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _08018FEC
	ldr r0, _08019090 @ =gMultiplayerConnections
	ldrb r2, [r0]
	movs r0, #0x10
	lsls r0, r7
	ands r0, r2
	adds r1, r7, #4
	asrs r0, r1
	mov r1, sb
	ands r2, r1
	mov r1, r8
	adds r1, #4
	asrs r2, r1
	cmp r0, r2
	bne _08018FEC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r2, sl
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, _08019094 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	bne _08018FEC
	adds r0, r6, #0
	bl sub_80218E4
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	adds r1, #0x1c
	ands r0, r1
	subs r1, #0xc
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08019098 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _0801909C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
	movs r5, #0
	movs r4, #0
	movs r0, #0x14
	ldr r1, _080190A0 @ =gPlayer + 0x64
	strh r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r0, r6, #0
	adds r0, #0x61
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	adds r0, r6, #0
	adds r0, #0x5c
	strh r4, [r0]
	movs r0, #1
	orrs r1, r0
	movs r0, #0x1c
	ldr r2, _080190A0 @ =gPlayer + 0x64
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r6, #0x20]
_08018FEC:
	adds r7, #1
	cmp r7, #3
	bhi _08018FFE
	ldr r0, _08019084 @ =gMultiplayerPlayerTasks
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08018F30
_08018FFE:
	ldr r1, [sp]
	ldr r0, [r1, #0x5c]
	movs r2, #1
	orrs r0, r2
	str r0, [r1, #0x5c]
	mov r0, sl
	cmp r0, #0
	bne _08019028
	ldr r3, _080190A4 @ =gUnknown_03005424
	ldrh r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08019028
	movs r0, #4
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _080190A8 @ =gCourseTime
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
_08019028:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bhs _08019038
	ldr r0, _08019080 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08019104
_08019038:
	movs r7, #0
	ldr r0, _08019084 @ =gMultiplayerPlayerTasks
	ldr r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _080190FA
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	ldr r5, _08019088 @ =gPlayer
	adds r6, r5, #0
	adds r6, #0x5c
_08019050:
	lsls r0, r7, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r0, _0801908C @ =gUnknown_030054B4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080190E6
	ldr r0, _08019080 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _080190AC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_8019CCC
	b _080190E6
	.align 2, 0
_08019080: .4byte gGameMode
_08019084: .4byte gMultiplayerPlayerTasks
_08019088: .4byte gPlayer
_0801908C: .4byte gUnknown_030054B4
_08019090: .4byte gMultiplayerConnections
_08019094: .4byte 0x04000128
_08019098: .4byte 0xFFFFFBFF
_0801909C: .4byte 0xFFFFFEFF
_080190A0: .4byte gPlayer + 0x64
_080190A4: .4byte gUnknown_03005424
_080190A8: .4byte gCourseTime
_080190AC:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x10]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x5c]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	strh r0, [r6]
	ldr r3, _08019114 @ =gUnknown_03005438
	ldrb r1, [r3]
	lsls r2, r1, #3
	ldr r0, _08019118 @ =gUnknown_03005510
	adds r2, r2, r0
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	strb r1, [r3]
	movs r0, #7
	strb r0, [r2]
_080190E6:
	adds r7, #1
	cmp r7, #3
	bhi _080190FA
	ldr r0, _0801911C @ =gMultiplayerPlayerTasks
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _08019050
_080190FA:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _08019104
	bl sub_8019F08
_08019104:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019114: .4byte gUnknown_03005438
_08019118: .4byte gUnknown_03005510
_0801911C: .4byte gMultiplayerPlayerTasks

@; New task
	thumb_func_start sub_8019120
sub_8019120: @ 0x08019120
	push {r4, lr}
	sub sp, #8
	ldr r0, _08019178 @ =Task_80188FC
	ldr r2, _0801917C @ =0x0000FFFE
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r4, [sp, #4]
	ldr r2, _08019180 @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019184 @ =gMultiSioSend
	str r1, [r2, #4]
	ldr r1, _08019188 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _0801918C @ =gMultiSioRecv
	str r1, [r2, #4]
	ldr r1, _08019190 @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019194 @ =gUnknown_03005510
	str r1, [r2, #4]
	ldr r1, _08019198 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r2, _0801919C @ =gUnknown_03005438
	ldr r1, _080191A0 @ =gUnknown_03005420
	strb r4, [r1]
	strb r4, [r2]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08019178: .4byte Task_80188FC
_0801917C: .4byte 0x0000FFFE
_08019180: .4byte 0x040000D4
_08019184: .4byte gMultiSioSend
_08019188: .4byte 0x85000005
_0801918C: .4byte gMultiSioRecv
_08019190: .4byte 0x85000014
_08019194: .4byte gUnknown_03005510
_08019198: .4byte 0x85000020
_0801919C: .4byte gUnknown_03005438
_080191A0: .4byte gUnknown_03005420

@; task
	thumb_func_start sub_80191A4
sub_80191A4: @ 0x080191A4
	push {r4, lr}
	sub sp, #8
	ldr r0, _080191FC @ =Task_8018A28
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl TaskCreate
	str r4, [sp, #4]
	ldr r2, _08019200 @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019204 @ =gMultiSioSend
	str r1, [r2, #4]
	ldr r1, _08019208 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _0801920C @ =gMultiSioRecv
	str r1, [r2, #4]
	ldr r1, _08019210 @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019214 @ =gUnknown_03005510
	str r1, [r2, #4]
	ldr r1, _08019218 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _0801921C @ =gUnknown_03005420
	strb r4, [r1]
	ldr r1, _08019220 @ =gUnknown_03005438
	strb r4, [r1]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080191FC: .4byte Task_8018A28
_08019200: .4byte 0x040000D4
_08019204: .4byte gMultiSioSend
_08019208: .4byte 0x85000005
_0801920C: .4byte gMultiSioRecv
_08019210: .4byte 0x85000014
_08019214: .4byte gUnknown_03005510
_08019218: .4byte 0x85000020
_0801921C: .4byte gUnknown_03005420
_08019220: .4byte gUnknown_03005438
