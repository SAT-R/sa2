.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0800FE64 @ =gPlayer
	mov ip, r0
	ldr r2, _0800FE68 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FE6C
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r7, r0, r1
	b _0800FE78
	.align 2, 0
_0800FE64: .4byte gPlayer
_0800FE68: .4byte gUnknown_03005424
_0800FE6C:
	mov r2, ip
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r7, r0, r1
_0800FE78:
	ldr r4, _0800FF3C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov sl, r0      @ sl = me
	ldr r3, _0800FF40 @ =IWRAM_START + 0x8
	adds r0, r1, r3
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldr r6, _0800FF44 @ =IWRAM_START+4
	adds r0, r1, r6
	ldrh r2, [r0]       @ r2 = regionX
	subs r3, #2
	adds r0, r1, r3
	ldrh r3, [r0]       @ r3 = regionY
	adds r6, #5
	adds r1, r1, r6
	ldrb r5, [r1]       @ r5 = railKind
	ldr r1, [sp, #8]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]        @ sp = posX
	mov r2, sl
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]    @ sp04 = posY
	mov r3, ip
	ldr r1, [r3, #0x20]
	adds r0, r1, #0
	movs r6, #0x80
	ands r0, r6
	mov sb, r1          @ sb = player->moveState
	cmp r0, #0
	beq _0800FED2
	b _080100D6
_0800FED2:
	ldr r0, [sp]
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10      @ r1 = posX
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r0, r2, #3
	adds r4, r1, r0
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r6, r0, #8
	str r3, [sp, #0xc]      @ sp0C = (posX << 16)
	mov r8, r2              @ r8 = me->d.sData[0]
	adds r3, r0, #0         @ r3 = player.x
	cmp r4, r6
	ble _0800FEF4
	b _080100C4
_0800FEF4:
	mov r2, sl
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r4, r1, #0         @ r4 = me->d.uData[2]
	cmp r0, r6
	bge _0800FF04
	b _080100C4
_0800FF04:
	ldr r6, [sp, #4]
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10      @ r2 = posY
	mov r1, sl
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r1, r2, r0
	cmp r1, r7
	ble _0800FF1A
	b _080100C4
_0800FF1A:
	mov r6, sl
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r7
	bge _0800FF28
	b _080100C4
_0800FF28:
	movs r6, #0
	ldr r0, _0800FF48 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FF4C
	cmp r7, r2
	blt _0800FF52
	b _0800FF50
	.align 2, 0
_0800FF3C: .4byte gCurTask
_0800FF40: .4byte IWRAM_START + 0x8
_0800FF44: .4byte IWRAM_START+4
_0800FF48: .4byte gUnknown_03005424
_0800FF4C:
	cmp r7, r2
	bgt _0800FF52
_0800FF50:
	movs r6, #1
_0800FF52:
	mov r1, ip
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0800FF5E
	b _080100B0
_0800FF5E:
	cmp r6, #0
	bne _0800FF64
	b _080100B0
_0800FF64:
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _0800FF6E
	b _080100B0
_0800FF6E:
	movs r0, #0x80
	lsls r0, r0, #0x11
	mov r6, sb
	ands r0, r6
	cmp r0, #0
	beq _08010060
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0800FFF0
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _0800FFE8
	asrs r2, r3, #8
	ldr r1, [sp, #0xc]
	asrs r0, r1, #0x10  @ r0 = posX
	mov r6, r8
	lsls r1, r6, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	blt _0800FFB8
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0800FFC8 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0800FFE8
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FFE8
_0800FFB8:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0800FFCC
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0800FFD2
	.align 2, 0
_0800FFC8: .4byte gPlayerControls
_0800FFCC:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0800FFD2:
	strb r0, [r1]
	ldr r1, _0800FFE0 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0800FFE4 @ =IWRAM_START + 0x9
	adds r1, r1, r2
	b _0801004E
	.align 2, 0
_0800FFE0: .4byte gCurTask
_0800FFE4: .4byte IWRAM_START + 0x9
_0800FFE8:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080100B0
_0800FFF0:
	movs r0, #1
	mov r6, sb
	ands r0, r6
	cmp r0, #0
	bne _080100B0
	asrs r2, r3, #8     @ r2 = Q_24_8_TO_INT(player->x)
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _08010028
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _08010038 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080100B0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080100B0
_08010028:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0801003C
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _08010042
	.align 2, 0
_08010038: .4byte gPlayerControls
_0801003C:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_08010042:
	strb r0, [r1]
	ldr r6, _08010058 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	ldr r0, _0801005C @ =IWRAM_START + 0x9
	adds r1, r1, r0
_0801004E:
	ldrb r0, [r1]
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	b _080100B0
	.align 2, 0
_08010058: .4byte gCurTask
_0801005C: .4byte IWRAM_START + 0x9
_08010060:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08010080
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	blt _08010096
	b _080100B0
_08010080:
	asrs r2, r3, #8
	ldr r6, [sp]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	ble _080100B0
_08010096:
	mov r2, ip
	adds r2, #0x6d
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x6e
	strb r1, [r0]
	movs r1, #1
	ands r5, r1
	cmp r5, #0
	beq _080100B0
	strb r1, [r0]
_080100B0:
	ldr r6, _080100BC @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	ldr r0, _080100C0 @ =IWRAM_START + 0x9
	adds r1, r1, r0
	b _080100CE
	.align 2, 0
_080100BC: .4byte gCurTask
_080100C0: .4byte IWRAM_START + 0x9
_080100C4:
	ldr r1, _08010138 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0801013C @ =IWRAM_START + 0x9
	adds r1, r1, r2
_080100CE:
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
_080100D6:
	ldr r2, _08010140 @ =gCamera
	ldr r0, [r2]
	ldr r3, [sp]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	ldr r6, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08010118
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08010118
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08010128
_08010118:
	mov r2, sp
	ldrb r3, [r2, #8]
	mov r2, sl
	strb r3, [r2]
	ldr r6, _08010138 @ =gCurTask
	ldr r0, [r6]
	bl TaskDestroy
_08010128:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010138: .4byte gCurTask
_0801013C: .4byte IWRAM_START + 0x9
_08010140: .4byte gCamera
    .syntax divided
