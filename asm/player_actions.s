.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D5674
gUnknown_080D5674:
    .byte 2, 4, 6, 0

    @; Some character Animation IDs.
    @; Player character AnimIDs are 91 apart from eachother
    @; TODO: Check whether the name is accurate!
    .global sCharacterPalettesBoostEffect
sCharacterPalettesBoostEffect:
    .2byte 74 + 0*91 @ Sonic
    .2byte 74 + 1*91 @ Cream
    .2byte 74 + 2*91 @ Tails
    .2byte 74 + 3*91 @ Knuckles
    .2byte 74 + 4*91 @ Amy
    .2byte 0

    .global gUnknown_080D5684
gUnknown_080D5684:
    .incbin "baserom.gba", 0x000D5684, 0xC0

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_80159C8
Task_80159C8: @ 0x080159C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08015A14 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	adds r7, r6, #0
	ldr r2, _08015A18 @ =gUnknown_080D5674
	adds r0, #0x50
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _08015A1C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r4, #0x80
	lsls r4, r4, #0x13
	ands r4, r1
	adds r2, r0, #0
	cmp r4, #0
	bne _08015A24
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	beq _08015A24
	adds r0, r3, #0
	bl TaskDestroy
	ldr r0, _08015A20 @ =gUnknown_030055BC
	strb r4, [r0]
	b _08015B44
	.align 2, 0
_08015A14: .4byte gCurTask
_08015A18: .4byte gUnknown_080D5674
_08015A1C: .4byte gPlayer
_08015A20: .4byte gUnknown_030055BC
_08015A24:
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015A30
	b _08015B44
_08015A30:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015A46
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	cmp r1, #0
	bne _08015A46
	b _08015B44
_08015A46:
	adds r4, r6, #0
	adds r4, #0x4c
	adds r0, r4, #0
	mov r1, r8
	bl GetPreviousFramePlayerState
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	ldr r0, [r6, #0x50]
	str r0, [r5, #0x10]
	adds r0, r6, #0
	adds r0, #0x58
	ldrh r0, [r0]
	strh r0, [r7]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r6, #0
	adds r0, #0x44
	mov r1, r8
	bl GetPreviousPlayerPos
	ldr r2, [r6, #0x44]
	asrs r2, r2, #8
	ldr r1, _08015AE8 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r0, [r6, #0x48]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	strh r2, [r7, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r7, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	ldr r1, [r5, #0x10]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08015B14
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x10]
	ldr r2, _08015AEC @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r0, [r6, #0x54]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08015AF0
	movs r0, #0x80
	lsls r0, r0, #1
	b _08015AF4
	.align 2, 0
_08015AE8: .4byte gCamera
_08015AEC: .4byte gUnknown_030054B8
_08015AF0:
	movs r0, #0xff
	lsls r0, r0, #8
_08015AF4:
	strh r0, [r7, #2]
	ldr r0, [r6, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r0, r1
	str r0, [r6, #0x54]
	cmp r0, #0
	beq _08015B0A
	ldrh r0, [r7, #2]
	rsbs r0, r0, #0
	strh r0, [r7, #2]
_08015B0A:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8004860
	b _08015B1C
_08015B14:
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x10]
_08015B1C:
	adds r2, r6, #0
	adds r2, #0x5d
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08015B32
	movs r0, #0
	strb r0, [r2]
_08015B32:
	adds r1, r6, #0
	adds r1, #0x5c
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08015B44
	adds r0, r5, #0
	bl DisplaySprite
_08015B44:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_8015B50
TaskDestructor_8015B50: @ 0x08015B50
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

@ inline
	thumb_func_start sub_8015B64
sub_8015B64: @ 0x08015B64
	push {r4, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _08015BC0 @ =gAnimations
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [r0]
	ldm r2!, {r1}
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08015BBA
	ldm r2!, {r3}       @ r3 = animPalId
	ldr r2, [r2]
	lsrs r1, r2, #0x10
	adds r1, r1, r4
	lsls r1, r1, #0x10
	movs r0, #0xff
	ands r2, r0
	ldr r4, _08015BC4 @ =0x040000D4
	ldr r0, _08015BC8 @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r3, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r3
	str r0, [r4]
	lsrs r1, r1, #0xf
	ldr r0, _08015BCC @ =gObjPalette
	adds r1, r1, r0
	str r1, [r4, #4]
	lsrs r2, r2, #1
	movs r0, #0x84
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _08015BD0 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
_08015BBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015BC0: .4byte gAnimations
_08015BC4: .4byte 0x040000D4
_08015BC8: .4byte gUnknown_03002794
_08015BCC: .4byte gObjPalette
_08015BD0: .4byte gFlags

	thumb_func_start sub_8015BD4
sub_8015BD4: @ 0x08015BD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08015CB4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08015CA6
	ldr r1, _08015CB8 @ =gPlayer
	adds r0, r1, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08015CA6
	adds r0, r1, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xf
	beq _08015C0E
	cmp r0, #0x12
	beq _08015C0E
	cmp r0, #0x24
	bne _08015CA6
_08015C0E:
	ldr r0, _08015CBC @ =sub_8015CE4
	movs r1, #0x86
	lsls r1, r1, #1
	ldr r2, _08015CC0 @ =0x00003001
	ldr r3, _08015CC4 @ =sub_8015FF0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _08015CC8 @ =gUnknown_080D6736
	ldr r6, _08015CB8 @ =gPlayer
	adds r2, r6, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r5, _08015CCC @ =IWRAM_START + 0x100
	adds r4, r3, r5
	movs r5, #0
	strh r0, [r4]
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r7, _08015CD0 @ =IWRAM_START + 0x102
	adds r0, r3, r7
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _08015C76
	ldr r1, _08015CD4 @ =gPlayerCharacterIdleAnims
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r7, [r4]
	adds r0, r0, r7
	strh r0, [r4]
_08015C76:
	ldr r1, _08015CD8 @ =IWRAM_START + 0x104
	adds r0, r3, r1
	mov r4, r8
	strh r4, [r0]
	ldr r7, _08015CDC @ =IWRAM_START + 0x106
	adds r0, r3, r7
	strh r5, [r0]
	adds r1, #4
	adds r0, r3, r1
	strh r5, [r0]
	ldr r4, _08015CE0 @ =IWRAM_START + 0x10A
	adds r0, r3, r4
	strh r5, [r0]
	movs r1, #0
	movs r2, #0
_08015C94:
	lsls r0, r1, #4
	add r0, ip
	adds r0, #0xcc
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _08015C94
_08015CA6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015CB4: .4byte gGameMode
_08015CB8: .4byte gPlayer
_08015CBC: .4byte sub_8015CE4
_08015CC0: .4byte 0x00003001
_08015CC4: .4byte sub_8015FF0
_08015CC8: .4byte gUnknown_080D6736
_08015CCC: .4byte IWRAM_START + 0x100
_08015CD0: .4byte IWRAM_START + 0x102
_08015CD4: .4byte gPlayerCharacterIdleAnims
_08015CD8: .4byte IWRAM_START + 0x104
_08015CDC: .4byte IWRAM_START + 0x106
_08015CE0: .4byte IWRAM_START + 0x10A

	thumb_func_start sub_8015CE4
sub_8015CE4: @ 0x08015CE4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08015D18 @ =gCurTask
	ldr r2, [r0]
	ldrh r3, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r4, _08015D1C @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08015D10
	ldr r1, _08015D20 @ =IWRAM_START + 0x100
	adds r0, r3, r1
	ldr r0, [r0]
	ldr r1, [r4, #0x68]
	cmp r0, r1
	beq _08015D28
	ldr r0, _08015D24 @ =0x0001019F
	cmp r1, r0
	beq _08015D28
_08015D10:
	adds r0, r2, #0
	bl TaskDestroy
	b _08015E10
	.align 2, 0
_08015D18: .4byte gCurTask
_08015D1C: .4byte gPlayer
_08015D20: .4byte IWRAM_START + 0x100
_08015D24: .4byte 0x0001019F
_08015D28:
	movs r5, #0
_08015D2A:
	lsls r0, r5, #4
	adds r0, r6, r0
	adds r2, r0, #0
	adds r2, #0xcc
	ldrb r0, [r2]
	cmp r0, #0
	beq _08015D56
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r4, r6, r0
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08015D56
	movs r0, #0
	strb r0, [r2]
	ldr r0, [r4, #4]
	bl VramFree
_08015D56:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08015D2A
	ldr r3, _08015E18 @ =gUnknown_080D5684
	movs r2, #0x84
	lsls r2, r2, #1
	adds r5, r6, r2
	ldrh r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r2, #4
	adds r0, r6, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	lsrs r2, r0, #0x10
	ldr r7, _08015E1C @ =0x0000FFFF
	cmp r2, r7
	beq _08015DBE
	movs r0, #0x83
	lsls r0, r0, #1
	adds r4, r6, r0
	ldrh r1, [r4]
	ldr r0, _08015E20 @ =gPlayer
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r0, r1, r0
	strh r0, [r4]
	cmp r1, r2
	blo _08015DBE
	ldrh r0, [r5]
	bl sub_8015E28
	ldrh r0, [r5]
	adds r0, #1
	ands r0, r7
	movs r1, #7
	ands r0, r1
	strh r0, [r5]
	cmp r0, #0
	bne _08015DBE
	strh r0, [r4]
_08015DBE:
	movs r5, #0
	ldr r7, _08015E24 @ =gCamera
_08015DC2:
	lsls r2, r5, #4
	adds r0, r6, r2
	adds r0, #0xcc
	ldrb r0, [r0]
	cmp r0, #0
	beq _08015E06
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r4, r6, r0
	adds r0, r6, #0
	adds r0, #0xc0
	adds r0, r0, r2
	ldr r1, [r0]
	lsls r1, r1, #8
	adds r0, r6, #0
	adds r0, #0xc4
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #8
	ldr r2, [r7]
	asrs r1, r1, #0x10
	subs r1, r1, r2
	strh r1, [r4, #0x16]
	ldr r1, [r7, #4]
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_08015E06:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08015DC2
_08015E10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015E18: .4byte gUnknown_080D5684
_08015E1C: .4byte 0x0000FFFF
_08015E20: .4byte gPlayer
_08015E24: .4byte gCamera

	thumb_func_start sub_8015E28
sub_8015E28: @ 0x08015E28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _08015E4C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	movs r3, #0
	adds r1, #0xcc
	adds r0, r0, r1
	b _08015E62
	.align 2, 0
_08015E4C: .4byte gCurTask
_08015E50:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08015E5C
	b _08015FE2
_08015E5C:
	lsls r0, r3, #4
	adds r0, r5, r0
	adds r0, #0xcc
_08015E62:
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015E50
	cmp r3, #3
	bls _08015E6E
	b _08015FE2
_08015E6E:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r6, r5, r0
	lsls r3, r3, #4
	adds r0, r5, r3
	adds r0, #0xcc
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	adds r7, r0, r3
	ldr r1, _08015ED0 @ =gPlayer
	ldr r0, [r1, #8]
	str r0, [r7]
	adds r4, r5, #0
	adds r4, #0xc4
	adds r2, r4, r3
	ldr r0, [r1, #0xc]
	str r0, [r2]
	ldr r1, [r1, #0x20]
	movs r0, #1
	ands r1, r0
	mov r8, r3
	mov sb, r4
	cmp r1, #0
	beq _08015ED8
	ldr r3, _08015ED4 @ =gUnknown_080D5684
	mov r2, ip
	lsls r4, r2, #1
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r3, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r7]
	subs r0, r0, r1
	b _08015F00
	.align 2, 0
_08015ED0: .4byte gPlayer
_08015ED4: .4byte gUnknown_080D5684
_08015ED8:
	ldr r3, _08015F3C @ =gUnknown_080D5684
	mov r1, ip
	lsls r4, r1, #1
	adds r1, r4, r1
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r3, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r7]
	adds r0, r0, r1
_08015F00:
	str r0, [r7]
	adds r7, r3, #0
	ldr r0, _08015F40 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015F44
	mov r3, sb
	add r3, r8
	mov r2, ip
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r7, #4
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r3]
	subs r0, r0, r1
	b _08015F6C
	.align 2, 0
_08015F3C: .4byte gUnknown_080D5684
_08015F40: .4byte gUnknown_03005424
_08015F44:
	mov r3, sb
	add r3, r8
	mov r2, ip
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r7, #4
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r3]
	adds r0, r0, r1
_08015F6C:
	str r0, [r3]
	mov r1, r8
	adds r0, r5, r1
	adds r1, r0, #0
	adds r1, #0xc8
	movs r5, #0
	movs r4, #0
	strh r4, [r1]
	adds r0, #0xca
	strh r4, [r0]
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	subs r0, #0xa6
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08015FD8 @ =gPlayer
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r2, #0x80
	lsls r2, r2, #6
	str r2, [r6, #0x10]
	ldr r0, _08015FDC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015FE0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r2
	str r0, [r6, #0x10]
	b _08015FE2
	.align 2, 0
_08015FD8: .4byte gPlayer
_08015FDC: .4byte gUnknown_03005424
_08015FE0:
	str r2, [r6, #0x10]
_08015FE2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015FF0
sub_8015FF0: @ 0x08015FF0
	push {r4, r5, lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
_08015FFC:
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r0, #0xcc
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016016
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl VramFree
_08016016:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08015FFC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
