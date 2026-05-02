.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _08091894 @ =gCurTask
	mov r8, r1
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]    @ r0 = block
	ldr r2, _08091898 @ =0x0300000C
	adds r7, r1, r2     @ r7 = s
	ldr r3, [r0]
	str r3, [sp]        @ sp00 = me
	ldrb r2, [r0, #8]
	lsls r2, r2, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10  @ r2 = worldX << 16
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	ldr r3, [sp, #4]
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10  @ r1 = worldY << 16
	ldr r3, _0809189C @ =gCamera
	ldrh r0, [r3]
	lsrs r6, r2, #0x10  @ r6 = worldX
	asrs r5, r2, #0x10  @ r5 = worldX
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldrh r0, [r3, #2]
	lsrs r2, r1, #0x10  @ r2 = worldY
	asrs r4, r1, #0x10  @ r4 = worldY
	subs r0, r4, r0
	strh r0, [r7, #0x18]
	ldr r0, _080918A0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _080918AC
	ldr r0, [sp]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080918AC
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateDustCloud
	movs r0, #0x8a
	bl m4aSongNumStart
	ldr r1, _080918A4 @ =sa2__gUnknown_0300194C
	ldrh r0, [r7, #0x16]
	strh r0, [r1]
	ldr r2, _080918A8 @ =sa2__gUnknown_03002820
	ldrh r1, [r7, #0x18]
	strh r1, [r2]
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, #0x10
	subs r1, r4, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CreateIceBlockShards
	mov r1, r8
	ldr r0, [r1]
	bl TaskDestroy
	b _08091A66_return
	.align 2, 0
_08091894: .4byte gCurTask
_08091898: .4byte 0x0300000C
_0809189C: .4byte gCamera
_080918A0: .4byte gGameMode
_080918A4: .4byte sa2__gUnknown_0300194C
_080918A8: .4byte sa2__gUnknown_03002820
_080918AC:
	lsls r6, r6, #0x10
	mov sl, r6          @ sl = worldX << 16
	lsls r2, r2, #0x10
	mov sb, r2          @ sb = worldY << 16
	mov r2, sl
	asrs r2, r2, #0x10
	str r2, [sp, #0xc]  @ sp0C = worldX
	mov r3, sb
	asrs r3, r3, #0x10
	str r3, [sp, #0x10] @ sp10 = worldY
_080918C0_loop:
	ldr r6, _08091914 @ =gPlayer
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _080918CA
	ldr r6, _08091918 @ =gPartner
_080918CA:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080918D6
	b _080919FC
_080918D6:
	adds r0, r6, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bne _0809191C
	adds r0, r7, #0
	mov r2, sl
	asrs r1, r2, #0x10
	mov r3, sb
	asrs r2, r3, #0x10
	adds r3, r6, #0
	bl Coll_Player_Platform
	adds r1, r0, #0
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0
	mov r8, r2
	cmp r0, #3
	beq _08091920
	movs r0, #8
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov r8, r0
	b _08091920
	.align 2, 0
_08091914: .4byte gPlayer
_08091918: .4byte gPartner
_0809191C:
	movs r3, #0
	mov r8, r3
_08091920:
	mov r0, sl          @ r0 = sl = worldX << 16
	asrs r4, r0, #0x10
	mov r1, sb
	asrs r5, r1, #0x10
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_800C394
	cmp r0, #0
	bne _0809194E
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_8091E88
	cmp r0, #0
	bne _0809194E
	mov r2, r8
	cmp r2, #0
	beq _080919FC
_0809194E:
	movs r3, #0
	ldr r0, _080919E4 @ =gPlayer
	mov sb, r0
	ldr r1, _080919E8 @ =gNumSingleplayerCharacters
	mov r8, r1
	movs r6, #8
	movs r5, #9
	rsbs r5, r5, #0
	movs r4, #2
_08091960_loop:
	mov r2, sb
	cmp r3, #0
	beq _08091968
	ldr r2, _080919EC @ =gPartner
_08091968:
	ldr r1, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	beq _0809197E
	ldr r0, [r2, #0x28]
	cmp r0, r7
	bne _0809197E
	ands r1, r5
	orrs r1, r4
	str r1, [r2, #0x10]
_0809197E:
	adds r3, #1
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r3, r0
	blt _08091960_loop
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl CreateDustCloud
	movs r0, #0x8a
	bl m4aSongNumStart
	ldr r1, _080919F0 @ =sa2__gUnknown_0300194C
	ldrh r0, [r7, #0x16]
	strh r0, [r1]
	ldr r2, _080919F4 @ =sa2__gUnknown_03002820
	ldrh r1, [r7, #0x18]
	strh r1, [r2]
	ldr r3, [sp, #0xc]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, #0x10
	ldr r2, [sp, #0x10]
	subs r1, r2, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CreateIceBlockShards
	ldr r0, _080919F8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _080919DC
	bl CreateRoomEvent
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r3, [sp, #4]
	ldrh r1, [r3, #4]
	strb r1, [r0, #1]
	ldrh r1, [r3, #6]
	strb r1, [r0, #2]
	ldrb r1, [r3, #9]
	strb r1, [r0, #3]
	strb r2, [r0, #4]
_080919DC:
	movs r0, #0xc1
	bl m4aSongNumStart
	b _08091A4E
	.align 2, 0
_080919E4: .4byte gPlayer
_080919E8: .4byte gNumSingleplayerCharacters
_080919EC: .4byte gPartner
_080919F0: .4byte sa2__gUnknown_0300194C
_080919F4: .4byte sa2__gUnknown_03002820
_080919F8: .4byte gGameMode
_080919FC:
	adds r0, r7, #0
	mov r2, sl          @ r2 = sl = worldX << 16
	asrs r1, r2, #0x10  @ r1 = worldX
	mov r3, sb
	asrs r2, r3, #0x10
	adds r3, r6, #0
	bl Coll_Player_Platform
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	ldr r0, _08091A58 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	bge _08091A22
	b _080918C0_loop
_08091A22:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08091A46
	movs r2, #0x18
	ldrsh r0, [r7, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08091A46
	movs r3, #0x18
	ldrsh r1, [r7, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08091A60
_08091A46:
	ldr r1, [sp, #4]
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
_08091A4E:
	ldr r0, _08091A5C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08091A66_return
	.align 2, 0
_08091A58: .4byte gNumSingleplayerCharacters
_08091A5C: .4byte gCurTask
_08091A60:
	adds r0, r7, #0
	bl DisplaySprite
_08091A66_return:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
