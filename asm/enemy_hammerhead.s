.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_Hammerhead
CreateEntity_Hammerhead: @ 0x08056BF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _08056CE0 @ =sub_8056D08
	ldr r2, _08056CE4 @ =0x00004040
	ldr r1, _08056CE8 @ =sub_8056EEC
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r2, _08056CEC @ =IWRAM_START + 0xC
	adds r6, r5, r2
	movs r7, #0
	strh r4, [r0, #4]
	mov r1, r8
	strh r1, [r0, #6]
	mov r2, sl
	str r2, [r0]
	ldrb r1, [r2]
	strb r1, [r0, #8]
	mov r1, sb
	strb r1, [r0, #9]
	str r7, [r0, #0x48]
	bl sub_8056EDC
	ldr r2, _08056CF0 @ =IWRAM_START + 0x4C
	adds r1, r5, r2
	movs r0, #4
	strh r0, [r1]
	mov r0, sl
	ldrb r1, [r0, #6]
	subs r2, #8
	adds r0, r5, r2
	strh r1, [r0]
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r6, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r0, r8
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, sl
	strb r0, [r2]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08056CF4 @ =0x000001F3
	strh r0, [r6, #0xa]
	ldr r1, _08056CF8 @ =IWRAM_START + 0x2C
	adds r0, r5, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r7, [r6, #8]
	strh r7, [r6, #0x14]
	strh r7, [r6, #0x1c]
	ldr r0, _08056CFC @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08056D00 @ =IWRAM_START + 0x2E
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08056D04 @ =IWRAM_START + 0x31
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056CE0: .4byte sub_8056D08
_08056CE4: .4byte 0x00004040
_08056CE8: .4byte sub_8056EEC
_08056CEC: .4byte IWRAM_START + 0xC
_08056CF0: .4byte IWRAM_START + 0x4C
_08056CF4: .4byte 0x000001F3
_08056CF8: .4byte IWRAM_START + 0x2C
_08056CFC: .4byte IWRAM_START + 0x2D
_08056D00: .4byte IWRAM_START + 0x2E
_08056D04: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8056D08
sub_8056D08: @ 0x08056D08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08056DB4 @ =gPlayer
	mov r8, r0
	ldr r0, _08056DB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r1, _08056DBC @ =IWRAM_START + 0xC
	adds r6, r4, r1
	ldr r2, [r5]
	mov sl, r2
	ldr r3, _08056DC0 @ =gGameMode
	mov sb, r3
	ldrb r0, [r3]
	cmp r0, #2
	bls _08056D3A
	adds r0, r5, #0
	bl sub_8056EDC
_08056D3A:
	ldr r1, _08056DC4 @ =IWRAM_START + 0x4C
	adds r0, r4, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, _08056DC8 @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r3, _08056DCC @ =IWRAM_START + 0x44
	adds r1, r4, r3
	lsrs r0, r0, #1
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r2, r0
	ldr r2, _08056DD0 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	ldr r2, [r5, #0x48]
	ldr r1, _08056DD4 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #3
	str r0, [r5, #0x48]
	subs r0, r0, r2
	mov ip, r0
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r7, r1, r0
	mov r0, sl
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r4, r1, r0
	ldr r1, _08056DD8 @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	strh r0, [r6, #0x16]
	mov r3, sb
	ldrb r0, [r3]
	cmp r0, #2
	bls _08056DDC
	ldr r1, [r1, #4]
	subs r1, r4, r1
	ldr r0, [r5, #0x58]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	b _08056DE6
	.align 2, 0
_08056DB4: .4byte gPlayer
_08056DB8: .4byte gCurTask
_08056DBC: .4byte IWRAM_START + 0xC
_08056DC0: .4byte gGameMode
_08056DC4: .4byte IWRAM_START + 0x4C
_08056DC8: .4byte gUnknown_03005590
_08056DCC: .4byte IWRAM_START + 0x44
_08056DD0: .4byte 0x000001FF
_08056DD4: .4byte gSineTable
_08056DD8: .4byte gCamera
_08056DDC:
	ldr r0, [r1, #4]
	subs r0, r4, r0
	asrs r1, r2, #8
	adds r0, r0, r1
	strh r0, [r6, #0x18]
_08056DE6:
	mov r0, r8
	ldr r1, [r0, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08056E06
	mov r2, r8
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08056E06
	ldr r0, [r2, #0xc]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	add r0, ip
	str r0, [r2, #0xc]
_08056E06:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08056E38
	ldr r2, [r5, #0x48]
	asrs r2, r2, #8
	adds r2, r4, r2
	adds r0, r6, #0
	adds r1, r7, #0
	mov r3, r8
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08056E38
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	mov r2, r8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
_08056E38:
	ldr r2, [r5, #0x48]
	asrs r2, r2, #8
	adds r2, r4, r2
	adds r0, r6, #0
	adds r1, r7, #0
	movs r3, #1
	bl sub_800C4FC
	cmp r0, #1
	beq _08056EA2
	ldr r1, _08056EAC @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056E7E
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	blt _08056E7E
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056EB4
_08056E7E:
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08056E9C
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r0, #0
	blt _08056E9C
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r4, r0
	ble _08056EB4
_08056E9C:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
_08056EA2:
	ldr r0, _08056EB0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056ECC
	.align 2, 0
_08056EAC: .4byte gCamera
_08056EB0: .4byte gCurTask
_08056EB4:
	lsls r0, r7, #8
	lsls r1, r4, #8
	ldr r2, [r5, #0x48]
	adds r1, r1, r2
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08056ECC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8056EDC
sub_8056EDC: @ 0x08056EDC
	ldr r1, [r0, #0x54]
	str r1, [r0, #0x58]
	ldr r1, [r0, #0x50]
	str r1, [r0, #0x54]
	ldr r1, [r0, #0x48]
	str r1, [r0, #0x50]
	bx lr
	.align 2, 0

	thumb_func_start sub_8056EEC
sub_8056EEC: @ 0x08056EEC
	push {r4, lr}
	ldrh r0, [r0, #6]
	ldr r1, _08056F20 @ =IWRAM_START + 0xC
	adds r4, r0, r1
	ldr r0, [r4, #4]
	bl VramFree
	ldr r2, _08056F24 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08056F18
	ldr r0, [r2, #0x3c]
	cmp r0, r4
	bne _08056F18
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0x20]
	movs r0, #0
	str r0, [r2, #0x3c]
_08056F18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056F20: .4byte IWRAM_START + 0xC
_08056F24: .4byte gPlayer
