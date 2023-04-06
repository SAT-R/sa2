.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D6932
gUnknown_080D6932:
    .incbin "baserom.gba", 0x000D6932, 0x8

    .global gUnknown_080D693A
gUnknown_080D693A:
    .incbin "baserom.gba", 0x000D693A, 0x50

    .global gUnknown_080D698A
gUnknown_080D698A:
    .incbin "baserom.gba", 0x000D698A, 0x8

    .global gUnknown_080D6992
gUnknown_080D6992:
    .incbin "baserom.gba", 0x000D6992, 0x14

    .global gUnknown_080D69A6
gUnknown_080D69A6:
    .incbin "baserom.gba", 0x000D69A6, 0xC

    .global gUnknown_080D69B2
gUnknown_080D69B2:
    .incbin "baserom.gba", 0x000D69B2, 0x8

    .global gUnknown_080D69BA
gUnknown_080D69BA:
    .incbin "baserom.gba", 0x000D69BA, 0x8

    .global gUnknown_080D69C2
gUnknown_080D69C2:
    .incbin "baserom.gba", 0x000D69C2, 0x6

    .global gUnknown_080D69C8
gUnknown_080D69C8:
    .incbin "baserom.gba", 0x000D69C8, 0xB8

    .global gUnknown_080D6A80
gUnknown_080D6A80:
    .incbin "baserom.gba", 0x000D6A80, 0x30

    .global gUnknown_080D6AB0
gUnknown_080D6AB0:
    .incbin "baserom.gba", 0x000D6AB0, 0x1E

    .global gUnknown_080D6ACE
gUnknown_080D6ACE:
    .incbin "baserom.gba", 0x000D6ACE, 0x22

    .global gUnknown_080D6AF0
gUnknown_080D6AF0:
    .incbin "baserom.gba", 0x000D6AF0, 0x18

.arm
.syntax unified
.text

@ NOTE: We consider Player Callbacks to be all those procedures
@       that are passed to the first member of the Player struct.
@       So even if there are procedures that only take a Player,
@       if they are only called directly in the code, those are NOT callbacks.

.if 00
.endif

	thumb_func_start sub_80283C4
sub_80283C4: @ 0x080283C4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08028414 @ =gUnknown_03005424
	ldr r1, _08028418 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080283EE
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080283EE:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080283FE
	adds r2, r1, #0
_080283FE:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802841C
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028424
	.align 2, 0
_08028414: .4byte gUnknown_03005424
_08028418: .4byte gUnknown_0300544C
_0802841C:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028424:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0802843C
	adds r1, #2
	cmp r1, #0
	ble _08028448
	b _08028446
_0802843C:
	cmp r1, #0
	ble _08028448
	subs r1, #2
	cmp r1, #0
	bge _08028448
_08028446:
	movs r1, #0
_08028448:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08028468
	ldr r1, _08028470 @ =gPlayer
	ldr r0, _08028474 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08028468:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028470: .4byte gPlayer
_08028474: .4byte PlayerCB_8025318

	thumb_func_start sub_8028478
sub_8028478: @ 0x08028478
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08028550
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080284A2
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _080284A6
_080284A2:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_080284A6:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080284F0 @ =gUnknown_03005424
	ldr r1, _080284F4 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080284CA
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080284CA:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080284DA
	adds r2, r1, #0
_080284DA:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080284F8
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028500
	.align 2, 0
_080284F0: .4byte gUnknown_03005424
_080284F4: .4byte gUnknown_0300544C
_080284F8:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028500:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028518
	adds r1, #2
	cmp r1, #0
	ble _08028524
	b _08028522
_08028518:
	cmp r1, #0
	ble _08028524
	subs r1, #2
	cmp r1, #0
	bge _08028524
_08028522:
	movs r1, #0
_08028524:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	beq _08028538
	b _08028634
_08028538:
	ldr r1, _08028548 @ =gPlayer
	ldr r0, _0802854C @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
	b _08028634
	.align 2, 0
_08028548: .4byte gPlayer
_0802854C: .4byte PlayerCB_8025318
_08028550:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _08028584
	ldr r1, _080285E0 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08028584
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_08028584:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_80231C0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080285E4 @ =gUnknown_03005424
	ldr r1, _080285E8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080285B8
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080285B8:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080285C8
	adds r2, r1, #0
_080285C8:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080285EC
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080285F4
	.align 2, 0
_080285E0: .4byte gSineTable
_080285E4: .4byte gUnknown_03005424
_080285E8: .4byte gUnknown_0300544C
_080285EC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080285F4:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0802860A
	subs r0, #1
	b _08028632
_0802860A:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08028634
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08028620
	rsbs r1, r1, #0
_08028620:
	ldr r0, _0802863C @ =0x000001DF
	cmp r1, r0
	bgt _08028634
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08028632:
	strh r0, [r4, #0x2a]
_08028634:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802863C: .4byte 0x000001DF

	thumb_func_start sub_8028640
sub_8028640: @ 0x08028640
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	lsls r2, r2, #0x10
	mov r8, r2
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _080286D8 @ =gPlayer
	adds r2, r4, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _080286DC @ =sub_801F214
	str r2, [sp]
	ldr r2, _080286E0 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov sb, r0
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r1, #0x16]
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r1, #0x18]
	ldr r0, _080286E4 @ =IWRAM_START + 0x1C
	adds r6, r2, r0
	ldr r5, _080286E8 @ =gUnknown_080D69A6
	mov r1, r8
	lsls r4, r1, #1
	add r4, r8
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	str r2, [sp, #8]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r0, [r4]
	ldr r2, [sp, #8]
	ldr r1, _080286EC @ =IWRAM_START + 0x3C
	adds r2, r2, r1
	strb r0, [r2]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080286D8: .4byte gPlayer
_080286DC: .4byte sub_801F214
_080286E0: .4byte sub_801F550
_080286E4: .4byte IWRAM_START + 0x1C
_080286E8: .4byte gUnknown_080D69A6
_080286EC: .4byte IWRAM_START + 0x3C

	thumb_func_start PlayerCB_80286F0
PlayerCB_80286F0: @ 0x080286F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x5b
	ldrb r6, [r0]
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08028740 @ =gUnknown_080D6992
	lsls r0, r6, #2
	adds r0, r0, r6
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r5, [r1]
	adds r0, r4, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	ldr r1, _08028744 @ =0x00002102
	orrs r0, r1
	ldr r1, _08028748 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0802874C
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0xa
	b _0802875A
	.align 2, 0
_08028740: .4byte gUnknown_080D6992
_08028744: .4byte 0x00002102
_08028748: .4byte 0xFEFFFFDF
_0802874C:
	movs r0, #8
	ands r5, r0
	cmp r5, #0
	beq _0802875C
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0x2d
_0802875A:
	strh r0, [r1]
_0802875C:
	movs r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	ldr r1, _0802879C @ =gUnknown_080D698A
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	adds r0, #0x2c
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080287A0 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0x74
	bl m4aSongNumStart
	movs r0, #0xe6
	bl m4aSongNumStart
	ldr r0, _080287A4 @ =gPlayer
	ldr r1, _080287A8 @ =PlayerCB_80287AC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802879C: .4byte gUnknown_080D698A
_080287A0: .4byte 0xFFFFBFFF
_080287A4: .4byte gPlayer
_080287A8: .4byte PlayerCB_80287AC

	thumb_func_start PlayerCB_80287AC
PlayerCB_80287AC: @ 0x080287AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08028848
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r5, [r0]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08028898 @ =gUnknown_080D693A
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r3, [r1]
	strh r3, [r4, #0x10]
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08028802
	rsbs r0, r3, #0
	strh r0, [r4, #0x10]
_08028802:
	ldr r1, _0802889C @ =gPlayer
	ldr r0, _080288A0 @ =PlayerCB_802890C
	str r0, [r1]
	ldr r0, _080288A4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08028848
	cmp r5, #2
	bne _08028826
	cmp r6, #0
	bne _08028826
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	bl sub_8028640
_08028826:
	cmp r5, #0
	bne _0802883C
	cmp r6, #3
	bne _0802883C
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8028640
_0802883C:
	cmp r5, #2
	bne _08028848
	cmp r6, #4
	bne _08028848
	bl sub_8086998
_08028848:
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080288A8 @ =gUnknown_03005424
	ldr r1, _080288AC @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028870
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08028870:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08028880
	adds r2, r1, #0
_08028880:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080288B0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080288B8
	.align 2, 0
_08028898: .4byte gUnknown_080D693A
_0802889C: .4byte gPlayer
_080288A0: .4byte PlayerCB_802890C
_080288A4: .4byte gGameMode
_080288A8: .4byte gUnknown_03005424
_080288AC: .4byte gUnknown_0300544C
_080288B0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080288B8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080288D0
	adds r1, #2
	cmp r1, #0
	ble _080288DC
	b _080288DA
_080288D0:
	cmp r1, #0
	ble _080288DC
	subs r1, #2
	cmp r1, #0
	bge _080288DC
_080288DA:
	movs r1, #0
_080288DC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080288FC
	ldr r1, _08028904 @ =gPlayer
	ldr r0, _08028908 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080288FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028904: .4byte gPlayer
_08028908: .4byte PlayerCB_8025318

	thumb_func_start PlayerCB_802890C
PlayerCB_802890C: @ 0x0802890C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x5b
	ldrb r3, [r0]
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0802895C @ =gUnknown_080D6992
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r5, [r1]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08028948
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #1
	bne _08028948
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08028948
	movs r0, #2
	strh r0, [r1]
_08028948:
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08028960
	subs r0, r2, #1
	b _08028982
	.align 2, 0
_0802895C: .4byte gUnknown_080D6992
_08028960:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0802896C
	movs r0, #0xfb
	ands r5, r0
_0802896C:
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08028984
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xe
	beq _08028984
	movs r0, #0xe
_08028982:
	strh r0, [r1]
_08028984:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08028994
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	ble _0802899A
_08028994:
	adds r0, r4, #0
	bl sub_8023610
_0802899A:
	movs r0, #4
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _080289AC
	adds r0, r4, #0
	bl sub_80236C8
_080289AC:
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _080289E2
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	movs r1, #0x2a
	cmp r0, #0
	beq _080289C8
	movs r1, #0xc
_080289C8:
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _080289DA
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080289DA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	b _080289FA
_080289E2:
	cmp r6, #0
	bne _080289FC
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080289F6
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _080289FA
_080289F6:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_080289FA:
	strh r0, [r4, #0x12]
_080289FC:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08028A44 @ =gUnknown_03005424
	ldr r1, _08028A48 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028A1E
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08028A1E:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08028A2E
	adds r2, r1, #0
_08028A2E:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028A4C
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028A54
	.align 2, 0
_08028A44: .4byte gUnknown_03005424
_08028A48: .4byte gUnknown_0300544C
_08028A4C:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028A54:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028A6C
	adds r1, #2
	cmp r1, #0
	ble _08028A78
	b _08028A76
_08028A6C:
	cmp r1, #0
	ble _08028A78
	subs r1, #2
	cmp r1, #0
	bge _08028A78
_08028A76:
	movs r1, #0
_08028A78:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08028A98
	ldr r1, _08028AD0 @ =gPlayer
	ldr r0, _08028AD4 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08028A98:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08028ACA
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _08028ACA
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	cmp r0, #2
	bne _08028ACA
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08028AD0 @ =gPlayer
	ldr r0, _08028AD8 @ =PlayerCB_802A3C4
	str r0, [r1]
_08028ACA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028AD0: .4byte gPlayer
_08028AD4: .4byte PlayerCB_8025318
_08028AD8: .4byte PlayerCB_802A3C4

	thumb_func_start sub_8028ADC
sub_8028ADC: @ 0x08028ADC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08028B74 @ =gGameMode
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #5
	bne _08028AF0
	b _08028D48
_08028AF0:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08028B00
	b _08028D48
_08028B00:
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _08028B78 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028B12
	b _08028D48
_08028B12:
	adds r0, r6, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08028B90
	ldr r1, _08028B7C @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028B80 @ =gUnknown_080D6932
	ldrh r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028B84 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028B6A
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08028B6A
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028B88 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028B62
	movs r0, #0xff
_08028B62:
	strb r0, [r1]
	ldr r1, _08028B8C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028B6A:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #0
	b _08028D40
	.align 2, 0
_08028B74: .4byte gGameMode
_08028B78: .4byte gPlayerControls
_08028B7C: .4byte gUnknown_03005450
_08028B80: .4byte gUnknown_080D6932
_08028B84: .4byte 0x0000C350
_08028B88: .4byte gNumLives
_08028B8C: .4byte gUnknown_030054A8
_08028B90:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08028C68
	ldr r1, _08028BFC @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028C00 @ =gUnknown_080D6932
	ldrh r0, [r0, #6]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028C04 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028BE2
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08028BE2
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028C08 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028BDA
	movs r0, #0xff
_08028BDA:
	strb r0, [r1]
	ldr r1, _08028C0C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028BE2:
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	beq _08028C30
	cmp r0, #3
	bgt _08028C10
	cmp r0, #0
	beq _08028C16
	b _08028C60
	.align 2, 0
_08028BFC: .4byte gUnknown_03005450
_08028C00: .4byte gUnknown_080D6932
_08028C04: .4byte 0x0000C350
_08028C08: .4byte gNumLives
_08028C0C: .4byte gUnknown_030054A8
_08028C10:
	cmp r0, #4
	beq _08028C48
	b _08028C60
_08028C16:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r1, _08028C28 @ =gPlayer
	ldr r0, _08028C2C @ =PlayerCB_8011F1C
	b _08028D46
	.align 2, 0
_08028C28: .4byte gPlayer
_08028C2C: .4byte PlayerCB_8011F1C
_08028C30:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r1, _08028C40 @ =gPlayer
	ldr r0, _08028C44 @ =PlayerCB_8013D18
	b _08028D46
	.align 2, 0
_08028C40: .4byte gPlayer
_08028C44: .4byte PlayerCB_8013D18
_08028C48:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r1, _08028C58 @ =gPlayer
	ldr r0, _08028C5C @ =PlayerCB_8011F1C
	b _08028D46
	.align 2, 0
_08028C58: .4byte gPlayer
_08028C5C: .4byte PlayerCB_8011F1C
_08028C60:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #1
	b _08028D40
_08028C68:
	ldr r0, [r6, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08028C7C
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08028C84
	b _08028CF0
_08028C7C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08028CF0
_08028C84:
	ldr r1, _08028CD8 @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028CDC @ =gUnknown_080D6932
	ldrh r0, [r0, #4]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028CE0 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028CCE
	ldr r0, _08028CE4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08028CCE
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028CE8 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028CC6
	movs r0, #0xff
_08028CC6:
	strb r0, [r1]
	ldr r1, _08028CEC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028CCE:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #2
	b _08028D40
	.align 2, 0
_08028CD8: .4byte gUnknown_03005450
_08028CDC: .4byte gUnknown_080D6932
_08028CE0: .4byte 0x0000C350
_08028CE4: .4byte gGameMode
_08028CE8: .4byte gNumLives
_08028CEC: .4byte gUnknown_030054A8
_08028CF0:
	ldr r1, _08028D54 @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028D58 @ =gUnknown_080D6932
	ldrh r0, [r0, #2]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028D5C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028D3A
	ldr r0, _08028D60 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08028D3A
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028D64 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028D32
	movs r0, #0xff
_08028D32:
	strb r0, [r1]
	ldr r1, _08028D68 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028D3A:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #3
_08028D40:
	strb r0, [r1]
	ldr r1, _08028D6C @ =gPlayer
	ldr r0, _08028D70 @ =PlayerCB_80286F0
_08028D46:
	str r0, [r1]
_08028D48:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028D54: .4byte gUnknown_03005450
_08028D58: .4byte gUnknown_080D6932
_08028D5C: .4byte 0x0000C350
_08028D60: .4byte gGameMode
_08028D64: .4byte gNumLives
_08028D68: .4byte gUnknown_030054A8
_08028D6C: .4byte gPlayer
_08028D70: .4byte PlayerCB_80286F0

	thumb_func_start PlayerCB_8028D74
PlayerCB_8028D74: @ 0x08028D74
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	ldr r1, _08028DD8 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _08028D9A
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _08028DF0
_08028D9A:
	adds r2, r4, #0
	adds r2, #0x68
	ldr r1, _08028DDC @ =PlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #4
	beq _08028DC8
	cmp r1, #0xa
	beq _08028DC8
	cmp r1, #0xb
	beq _08028DC8
	cmp r1, #0x46
	bne _08028DE0
_08028DC8:
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	b _08028DEE
	.align 2, 0
_08028DD8: .4byte 0xFEFFFFDF
_08028DDC: .4byte PlayerCharacterIdleAnims
_08028DE0:
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
_08028DEE:
	strb r0, [r4, #0x17]
_08028DF0:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08028E18 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08028E1C @ =gPlayer
	ldr r1, _08028E20 @ =PlayerCB_8029074
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08028E18: .4byte 0xFFFFBFFF
_08028E1C: .4byte gPlayer
_08028E20: .4byte PlayerCB_8029074

	thumb_func_start PlayerCB_8028E24
PlayerCB_8028E24: @ 0x08028E24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	lsrs r5, r0, #4
	movs r6, #3
	ands r6, r0
	adds r0, r4, #0
	bl sub_80218E4
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08028E58
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08028E58
	ldr r0, _08028E54 @ =0xFFFFFEFD
	ands r1, r0
	str r1, [r4, #0x20]
	b _08028E62
	.align 2, 0
_08028E54: .4byte 0xFFFFFEFD
_08028E58:
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_08028E62:
	ldr r0, [r4, #0x20]
	ldr r1, _08028E90 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _08028E94 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08028E98
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x25
	b _08028EBA
	.align 2, 0
_08028E90: .4byte 0xFEFFFFDF
_08028E94: .4byte gCurrentLevel
_08028E98:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08028EA2
	rsbs r1, r1, #0
_08028EA2:
	ldr r0, _08028EB0 @ =0x0000027F
	cmp r1, r0
	bgt _08028EB4
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x26
	b _08028EBA
	.align 2, 0
_08028EB0: .4byte 0x0000027F
_08028EB4:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
_08028EBA:
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x66
	ldr r0, _08028ED4 @ =0x0000FFFF
	strh r0, [r1]
	cmp r5, #7
	bls _08028ECA
	b _08028FCE
_08028ECA:
	lsls r0, r5, #2
	ldr r1, _08028ED8 @ =_08028EDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028ED4: .4byte 0x0000FFFF
_08028ED8: .4byte _08028EDC
_08028EDC: @ jump table
	.4byte _08028EFC @ case 0
	.4byte _08028F0C @ case 1
	.4byte _08028F18 @ case 2
	.4byte _08028F44 @ case 3
	.4byte _08028F70 @ case 4
	.4byte _08028F90 @ case 5
	.4byte _08028FAC @ case 6
	.4byte _08028FBC @ case 7
_08028EFC:
	ldr r0, _08028F08 @ =gUnknown_080D69B2
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _08028FCC
	.align 2, 0
_08028F08: .4byte gUnknown_080D69B2
_08028F0C:
	ldr r0, _08028F14 @ =gUnknown_080D69B2
	lsls r1, r6, #1
	b _08028FC8
	.align 2, 0
_08028F14: .4byte gUnknown_080D69B2
_08028F18:
	ldr r1, _08028F3C @ =gUnknown_080D69BA
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r2, r0, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08028FCE
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08028F40 @ =0xFFFFF700
	cmp r0, r1
	bge _08028FCE
	b _08028F62
	.align 2, 0
_08028F3C: .4byte gUnknown_080D69BA
_08028F40: .4byte 0xFFFFF700
_08028F44:
	ldr r1, _08028F6C @ =gUnknown_080D69BA
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08028FCE
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x14
	cmp r1, r0
	ble _08028FCE
_08028F62:
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #1
	strb r0, [r1]
	b _08028FCE
	.align 2, 0
_08028F6C: .4byte gUnknown_080D69BA
_08028F70:
	ldr r0, _08028F88 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _08028F8C @ =gUnknown_080D69B2
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _08028FCC
	.align 2, 0
_08028F88: .4byte gUnknown_080D69BA
_08028F8C: .4byte gUnknown_080D69B2
_08028F90:
	ldr r0, _08028FA4 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	ldr r0, _08028FA8 @ =gUnknown_080D69B2
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _08028FCC
	.align 2, 0
_08028FA4: .4byte gUnknown_080D69BA
_08028FA8: .4byte gUnknown_080D69B2
_08028FAC:
	ldr r0, _08028FB8 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	b _08028FC4
	.align 2, 0
_08028FB8: .4byte gUnknown_080D69BA
_08028FBC:
	ldr r0, _08029058 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
_08028FC4:
	strh r0, [r4, #0x10]
	ldr r0, _0802905C @ =gUnknown_080D69B2
_08028FC8:
	adds r1, r1, r0
	ldrh r0, [r1]
_08028FCC:
	strh r0, [r4, #0x12]
_08028FCE:
	ldr r0, _08029060 @ =gUnknown_080D69C2
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x36
	strb r0, [r2]
	ldr r0, _08029064 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802900C
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08028FF6
	adds r0, #3
_08028FF6:
	asrs r0, r0, #2
	strh r0, [r4, #0x10]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08029008
	adds r0, #3
_08029008:
	asrs r0, r0, #2
	strh r0, [r4, #0x12]
_0802900C:
	ldr r2, [r4, #0x20]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08029022
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x12]
_08029022:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _08029036
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08029036:
	ldr r0, _08029068 @ =0xFFFFFEC0
	cmp r1, r0
	bge _08029044
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_08029044:
	ldr r0, _0802906C @ =gPlayer
	ldr r1, _08029070 @ =PlayerCB_8029074
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029058: .4byte gUnknown_080D69BA
_0802905C: .4byte gUnknown_080D69B2
_08029060: .4byte gUnknown_080D69C2
_08029064: .4byte gCurrentLevel
_08029068: .4byte 0xFFFFFEC0
_0802906C: .4byte gPlayer
_08029070: .4byte PlayerCB_8029074

	thumb_func_start PlayerCB_8029074
PlayerCB_8029074: @ 0x08029074
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl sub_8028ADC
	adds r0, r4, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080290A4
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _080290A8
_080290A4:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_080290A8:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080290F4 @ =gUnknown_03005424
	ldr r1, _080290F8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080290CC
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080290CC:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080290DC
	adds r2, r1, #0
_080290DC:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080290FC
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08029104
	.align 2, 0
_080290F4: .4byte gUnknown_03005424
_080290F8: .4byte gUnknown_0300544C
_080290FC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08029104:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0802911C
	adds r1, #2
	cmp r1, #0
	ble _08029128
	b _08029126
_0802911C:
	cmp r1, #0
	ble _08029128
	subs r1, #2
	cmp r1, #0
	bge _08029128
_08029126:
	movs r1, #0
_08029128:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08029148
	ldr r1, _08029150 @ =gPlayer
	ldr r0, _08029154 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08029148:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029150: .4byte gPlayer
_08029154: .4byte PlayerCB_8025318

	thumb_func_start PlayerCB_8029158
PlayerCB_8029158: @ 0x08029158
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _080291C8 @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080291CC @ =0x0000FFFF
	strh r0, [r1]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _080291A0
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_080291A0:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, _080291D0 @ =0xFFFFFEC0
	cmp r1, r0
	bge _080291B2
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_080291B2:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #5
	bls _080291BE
	b _080292CC
_080291BE:
	lsls r0, r0, #2
	ldr r1, _080291D4 @ =_080291D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080291C8: .4byte 0xFEFFFFD7
_080291CC: .4byte 0x0000FFFF
_080291D0: .4byte 0xFFFFFEC0
_080291D4: .4byte _080291D8
_080291D8: @ jump table
	.4byte _080291F0 @ case 0
	.4byte _0802922C @ case 1
	.4byte _0802922C @ case 2
	.4byte _08029268 @ case 3
	.4byte _08029294 @ case 4
	.4byte _08029294 @ case 5
_080291F0:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _080291FE
	adds r0, #7
_080291FE:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _0802920A
	rsbs r0, r0, #0
_0802920A:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08029228 @ =0xFFFFFC40
	b _080292C8
	.align 2, 0
_08029228: .4byte 0xFFFFFC40
_0802922C:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _0802923A
	adds r0, #7
_0802923A:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _08029246
	rsbs r0, r0, #0
_08029246:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08029264 @ =0xFFFFF880
	b _080292C8
	.align 2, 0
_08029264: .4byte 0xFFFFF880
_08029268:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _08029276
	adds r0, #7
_08029276:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _08029282
	rsbs r0, r0, #0
_08029282:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #3
	b _080292BE
_08029294:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _080292A2
	adds r0, #7
_080292A2:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _080292AE
	rsbs r0, r0, #0
_080292AE:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #4
_080292BE:
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08029308 @ =0xFFFFFD80
_080292C8:
	adds r0, r0, r1
	strh r0, [r4, #0x12]
_080292CC:
	ldr r1, [r4, #0x20]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080292DE
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_080292DE:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080292EC
	ldrh r0, [r4, #0x10]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_080292EC:
	movs r0, #0x8a
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0802930C @ =gPlayer
	ldr r1, _08029310 @ =PlayerCB_8029314
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029308: .4byte 0xFFFFFD80
_0802930C: .4byte gPlayer
_08029310: .4byte PlayerCB_8029314

	thumb_func_start PlayerCB_8029314
PlayerCB_8029314: @ 0x08029314
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x28
	bne _08029338
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _08029338
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08029338
	movs r0, #1
	strh r0, [r1]
_08029338:
	adds r0, r4, #0
	bl sub_8028ADC
	adds r0, r4, #0
	bl sub_8023708
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802935A
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _0802935E
_0802935A:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_0802935E:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080293A8 @ =gUnknown_03005424
	ldr r1, _080293AC @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029382
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08029382:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08029392
	adds r2, r1, #0
_08029392:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080293B0
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080293B8
	.align 2, 0
_080293A8: .4byte gUnknown_03005424
_080293AC: .4byte gUnknown_0300544C
_080293B0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080293B8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080293D0
	adds r1, #2
	cmp r1, #0
	ble _080293DC
	b _080293DA
_080293D0:
	cmp r1, #0
	ble _080293DC
	subs r1, #2
	cmp r1, #0
	bge _080293DC
_080293DA:
	movs r1, #0
_080293DC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080293FC
	ldr r1, _08029404 @ =gPlayer
	ldr r0, _08029408 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080293FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029404: .4byte gPlayer
_08029408: .4byte PlayerCB_8025318

	thumb_func_start PlayerCB_802940C
PlayerCB_802940C: @ 0x0802940C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0802942C
	ldr r1, _08029488 @ =gPlayer
	ldr r0, _0802948C @ =PlayerCB_8029074
	str r0, [r1]
_0802942C:
	adds r0, r4, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl sub_8028ADC
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08029490 @ =gUnknown_03005424
	ldr r1, _08029494 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029460
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08029460:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08029470
	adds r2, r1, #0
_08029470:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029498
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080294A0
	.align 2, 0
_08029488: .4byte gPlayer
_0802948C: .4byte PlayerCB_8029074
_08029490: .4byte gUnknown_03005424
_08029494: .4byte gUnknown_0300544C
_08029498:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080294A0:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080294B8
	adds r1, #2
	cmp r1, #0
	ble _080294C4
	b _080294C2
_080294B8:
	cmp r1, #0
	ble _080294C4
	subs r1, #2
	cmp r1, #0
	bge _080294C4
_080294C2:
	movs r1, #0
_080294C4:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080294E4
	ldr r1, _080294EC @ =gPlayer
	ldr r0, _080294F0 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080294E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080294EC: .4byte gPlayer
_080294F0: .4byte PlayerCB_8025318

	thumb_func_start sub_80294F4
sub_80294F4: @ 0x080294F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	beq _08029506
	b _08029664
_08029506:
	adds r2, r4, #0
	adds r2, #0x5e
	ldr r3, _08029530 @ =gPlayerControls
	ldrh r1, [r2]
	ldrh r0, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802956E
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0802953E
	cmp r0, #1
	bgt _08029534
	cmp r0, #0
	beq _08029566
	b _0802956E
	.align 2, 0
_08029530: .4byte gPlayerControls
_08029534:
	cmp r0, #3
	beq _0802955C
	cmp r0, #4
	beq _08029566
	b _0802956E
_0802953E:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _08029554
	adds r0, r4, #0
	bl sub_8012888
	b _08029562
_08029554:
	adds r0, r4, #0
	bl sub_80128E0
	b _08029562
_0802955C:
	adds r0, r4, #0
	bl PlayerCB_8013D18
_08029562:
	movs r0, #1
	b _08029666
_08029566:
	adds r0, r4, #0
	bl PlayerCB_8011F1C
	b _08029562
_0802956E:
	ldrh r1, [r2]
	ldrh r0, [r3]
	ands r0, r1
	cmp r0, #0
	beq _08029664
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _08029664
	lsls r0, r0, #2
	ldr r1, _08029590 @ =_08029594
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08029590: .4byte _08029594
_08029594: @ jump table
	.4byte _080295A8 @ case 0
	.4byte _08029610 @ case 1
	.4byte _08029618 @ case 2
	.4byte _08029634 @ case 3
	.4byte _08029646 @ case 4
_080295A8:
	ldr r0, _080295DC @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080295EC
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080295C4
	ldr r0, _080295E0 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080295EC
_080295C4:
	cmp r1, #0x1d
	beq _080295EC
	ldr r0, _080295E4 @ =gUnknown_030054C0
	ldr r1, [r0]
	ldr r0, _080295E8 @ =0x00003FFF
	cmp r1, r0
	bgt _080295EC
	adds r0, r4, #0
	bl sub_8012194
	b _08029562
	.align 2, 0
_080295DC: .4byte gCurrentLevel
_080295E0: .4byte gUnknown_030054B0
_080295E4: .4byte gUnknown_030054C0
_080295E8: .4byte 0x00003FFF
_080295EC:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x12
	strh r0, [r1]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8011B88
	movs r0, #0x71
	b _08029660
_08029610:
	adds r0, r4, #0
	bl sub_8012644
	b _08029562
_08029618:
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08029664
	adds r0, r4, #0
	bl sub_8012BC0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	b _08029562
_08029634:
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08029664
	adds r0, r4, #0
	bl sub_8013AD8
	b _08029562
_08029646:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x12
	strh r0, [r1]
	movs r0, #2
	bl sub_8015BD4
	movs r0, #0x81
_08029660:
	bl m4aSongNumStart
_08029664:
	movs r0, #0
_08029666:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_802966C
sub_802966C: @ 0x0802966C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0xff
	ldr r5, [r4, #0x48]
	ldr r7, [r4, #0x4c]
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08029680
	b _0802980C
_08029680:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	bne _08029690
	b _0802980C
_08029690:
	ldrh r3, [r4, #0x14]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov ip, r3
	cmp r1, #0
	ble _08029734
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080296D2
	adds r0, r1, #0
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bge _080296BC
	adds r0, r3, r5
	strh r0, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, r1
	ble _080296C6
	strh r1, [r4, #0x14]
	b _080296C6
_080296BC:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_080296C6:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _0802983C
_080296D2:
	ldr r0, _080296F0 @ =0x000001FF
	cmp r1, r0
	ble _08029708
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080296F4
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _08029702
	.align 2, 0
_080296F0: .4byte 0x000001FF
_080296F4:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _08029702
	movs r6, #8
_08029702:
	mov r3, ip
	subs r0, r3, r7
	b _080297A2
_08029708:
	subs r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08029714
	b _0802983C
_08029714:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029720
	b _0802983C
_08029720:
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080297FA
	movs r6, #7
	b _080297FA
_08029734:
	cmp r1, #0
	bge _080297C8
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08029770
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x44]
	rsbs r2, r0, #0
	cmp r1, r2
	ble _0802975C
	subs r0, r3, r5
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08029766
	strh r2, [r4, #0x14]
	b _08029766
_0802975C:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_08029766:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _0802983C
_08029770:
	ldr r0, _0802978C @ =0xFFFFFE00
	cmp r1, r0
	bgt _080297B2
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08029790
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _0802979E
	.align 2, 0
_0802978C: .4byte 0xFFFFFE00
_08029790:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _0802979E
	movs r6, #8
_0802979E:
	mov r2, ip
	adds r0, r2, r7
_080297A2:
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	bl sub_8029FA4
	movs r0, #0x73
	bl m4aSongNumStart
	b _0802983C
_080297B2:
	adds r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802983C
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802983C
	b _08029720
_080297C8:
	ldr r1, [r4, #0x20]
	movs r0, #1
	ands r1, r0
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	cmp r1, r0
	beq _080297FA
	cmp r1, #0
	beq _080297E2
	subs r0, r3, r5
	b _080297E4
_080297E2:
	adds r0, r3, r5
_080297E4:
	strh r0, [r4, #0x14]
	movs r6, #9
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _0802983C
_080297FA:
	ldr r1, _08029804 @ =gPlayer
	ldr r0, _08029808 @ =PlayerCB_802A5C4
	str r0, [r1]
	b _0802983C
	.align 2, 0
_08029804: .4byte gPlayer
_08029808: .4byte PlayerCB_802A5C4
_0802980C:
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	ble _08029820
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0802982E
	b _08029834
_08029820:
	cmp r0, #0
	bge _0802983A
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	blt _08029834
_0802982E:
	movs r1, #0
	movs r6, #0
	b _08029836
_08029834:
	movs r6, #9
_08029836:
	strh r1, [r4, #0x14]
	b _0802983C
_0802983A:
	movs r6, #0
_0802983C:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08029860
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r2, #0xf9
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08029890
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08029890
_08029860:
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0802987C
	adds r2, r4, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, r1
	beq _08029890
	strh r1, [r2]
	b _08029890
_0802987C:
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08029890
	movs r0, #9
	strh r0, [r1]
_08029890:
	adds r0, r4, #0
	bl sub_8023128
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802989C
sub_802989C: @ 0x0802989C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080298B0 @ =gRingCount
	ldrh r0, [r0]
	cmp r0, #(150-1)
	bls _080298B4
	adds r1, #0x52
	movs r0, #4
	b _080298D6
	.align 2, 0
_080298B0: .4byte gRingCount
_080298B4:
	cmp r0, #(100-1)
	bls _080298BE
	adds r1, #0x52
	movs r0, #3
	b _080298D6
_080298BE:
	cmp r0, #(50-1)
	bls _080298C8
	adds r1, #0x52
	movs r0, #2
	b _080298D6
_080298C8:
	cmp r0, #10
	bls _080298D2
	adds r1, #0x52
	movs r0, #1
	b _080298D6
_080298D2:
	adds r1, #0x52
	movs r0, #0
_080298D6:
	strh r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start sub_80298DC
sub_80298DC: @ 0x080298DC
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x5a
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	cmp r2, #0
	beq _0802992C
	ldr r4, [r3, #0x20]
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	bne _0802998A
	ldr r0, _08029924 @ =gUnknown_080D6916
	adds r1, r3, #0
	adds r1, #0x52
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r1, r3, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0x14
	ldrsh r2, [r3, r0]
	cmp r2, #0
	bge _08029914
	rsbs r2, r2, #0
_08029914:
	ldr r0, _08029928 @ =0x0000047F
	cmp r2, r0
	bgt _0802998A
	movs r0, #0
	mov r2, ip
	strb r0, [r2]
	strh r4, [r1]
	b _0802998A
	.align 2, 0
_08029924: .4byte gUnknown_080D6916
_08029928: .4byte 0x0000047F
_0802992C:
	ldr r0, [r3, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08029984
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _08029940
	rsbs r1, r1, #0
_08029940:
	ldr r0, [r3, #0x44]
	cmp r1, r0
	blt _08029984
	adds r2, r3, #0
	adds r2, #0x58
	ldr r1, _0802997C @ =gUnknown_080D6916
	adds r0, r3, #0
	adds r0, #0x52
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0802998A
	movs r0, #1
	mov r3, ip
	strb r0, [r3]
	ldr r1, _08029980 @ =gCamera
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	bl CreateBoostModeParticles
	movs r0, #0xdd
	bl m4aSongNumStart
	b _0802998A
	.align 2, 0
_0802997C: .4byte gUnknown_080D6916
_08029980: .4byte gCamera
_08029984:
	adds r0, r3, #0
	adds r0, #0x58
	strh r2, [r0]
_0802998A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029990
sub_8029990: @ 0x08029990
	push {lr}
	adds r1, r0, #0
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _0802999E
	rsbs r2, r2, #0
_0802999E:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	bgt _080299AC
	adds r1, #0x54
	movs r0, #0
	b _080299E8
_080299AC:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r2, r0
	bgt _080299BA
	adds r1, #0x54
	movs r0, #1
	b _080299E8
_080299BA:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080299C8
	adds r1, #0x54
	movs r0, #2
	b _080299E8
_080299C8:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	bgt _080299D6
	adds r1, #0x54
	movs r0, #3
	b _080299E8
_080299D6:
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _080299E4
	adds r1, #0x54
	movs r0, #4
	b _080299E8
_080299E4:
	adds r1, #0x54
	movs r0, #5
_080299E8:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
@ (4 params!)
	thumb_func_start sub_80299F0
sub_80299F0: @ 0x080299F0
	push {lr}
	bl sub_8021604
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80299FC
sub_80299FC: @ 0x080299FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x8c
	ldr r0, [r5]
	bl TaskDestroy
	movs r0, #0
	str r0, [r5]
	adds r4, #0x60
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08029A20
	bl sub_801F78C
	bl sub_8021350
_08029A20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029A28
sub_8029A28: @ 0x08029A28
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029A34
	mov r4, sp
_08029A34:
	cmp r2, #0
	bne _08029A3A
	add r2, sp, #4
_08029A3A:
	adds r1, r4, #0
	bl sub_802195C
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029A50
	movs r0, #0
	b _08029A62
_08029A50:
	ldr r0, _08029A70 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029A64
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029A62:
	strb r0, [r4]
_08029A64:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029A70: .4byte gUnknown_03005424

	thumb_func_start sub_8029A74
sub_8029A74: @ 0x08029A74
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029A80
	mov r4, sp
_08029A80:
	cmp r2, #0
	bne _08029A86
	add r2, sp, #4
_08029A86:
	adds r1, r4, #0
	bl sub_8021A34
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029A9C
	movs r0, #0
	b _08029AAE
_08029A9C:
	ldr r0, _08029ABC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029AB0
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029AAE:
	strb r0, [r4]
_08029AB0:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029ABC: .4byte gUnknown_03005424

	thumb_func_start sub_8029AC0
sub_8029AC0: @ 0x08029AC0
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029ACC
	mov r4, sp
_08029ACC:
	cmp r2, #0
	bne _08029AD2
	add r2, sp, #4
_08029AD2:
	adds r1, r4, #0
	bl sub_8021B08
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029AE8
	movs r0, #0
	b _08029AFA
_08029AE8:
	ldr r0, _08029B08 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029AFC
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029AFA:
	strb r0, [r4]
_08029AFC:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029B08: .4byte gUnknown_03005424

	thumb_func_start sub_8029B0C
sub_8029B0C: @ 0x08029B0C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029B18
	mov r4, sp
_08029B18:
	cmp r2, #0
	bne _08029B1E
	add r2, sp, #4
_08029B1E:
	adds r1, r4, #0
	bl sub_8029BB8
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029B34
	movs r0, #0
	b _08029B46
_08029B34:
	ldr r0, _08029B54 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029B48
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029B46:
	strb r0, [r4]
_08029B48:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029B54: .4byte gUnknown_03005424

	thumb_func_start sub_8029B58
sub_8029B58: @ 0x08029B58
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08029B74 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029B78
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029B0C
	b _08029B80
	.align 2, 0
_08029B74: .4byte gUnknown_03005424
_08029B78:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029AC0
_08029B80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029B88
sub_8029B88: @ 0x08029B88
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08029BA4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029BA8
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029AC0
	b _08029BB0
	.align 2, 0
_08029BA4: .4byte gUnknown_03005424
_08029BA8:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029B0C
_08029BB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029BB8
sub_8029BB8: @ 0x08029BB8
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
	bne _08029BD0
	add r6, sp, #8
_08029BD0:
	cmp r7, #0
	bne _08029BD6
	add r7, sp, #0xc
_08029BD6:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
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
	cmp r0, #0
	bge _08029C00
	movs r0, #0x80
	orrs r2, r0
_08029C00:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08029C64 @ =sub_801EE64
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
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
	cmp r0, #0
	bge _08029C40
	movs r0, #0x80
	orrs r2, r0
_08029C40:
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
	bge _08029C68
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08029C70
	.align 2, 0
_08029C64: .4byte sub_801EE64
_08029C68:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08029C70:
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

	thumb_func_start sub_8029C84
sub_8029C84: @ 0x08029C84
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0x7f
	ble _08029C9A
	movs r0, #0
	strh r0, [r2, #0x14]
_08029C9A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029CA0
sub_8029CA0: @ 0x08029CA0
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029CD4
	ldr r1, _08029CDC @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r2, r0, #5
	ldrh r1, [r3, #0x14]
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _08029CD4
	adds r0, r1, r2
	strh r0, [r3, #0x14]
_08029CD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029CDC: .4byte gSineTable

	thumb_func_start sub_8029CE0
sub_8029CE0: @ 0x08029CE0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029D0C
	ldr r1, _08029D10 @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	ldrh r1, [r3, #0x14]
	adds r0, r0, r1
	strh r0, [r3, #0x14]
_08029D0C:
	pop {r0}
	bx r0
	.align 2, 0
_08029D10: .4byte gSineTable

	thumb_func_start sub_8029D14
sub_8029D14: @ 0x08029D14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029D5E
	cmp r2, #0
	beq _08029D5E
	ldr r1, _08029D50 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r1, r0, #8
	cmp r2, #0
	ble _08029D54
	cmp r1, #0
	bgt _08029D5A
	b _08029D58
	.align 2, 0
_08029D50: .4byte gSineTable
_08029D54:
	cmp r1, #0
	blt _08029D5A
_08029D58:
	asrs r1, r0, #0xa
_08029D5A:
	adds r2, r2, r1
	strh r2, [r4, #0x14]
_08029D5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029D64
sub_8029D64: @ 0x08029D64
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r4, _08029DB0 @ =gUnknown_03005424
	ldr r1, _08029DB4 @ =gUnknown_0300544C
	ldrh r0, [r4]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029D8A
	ldrh r0, [r2, #0x12]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
_08029D8A:
	ldrh r3, [r2, #0x12]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08029D9A
	adds r3, r1, #0
_08029D9A:
	strh r3, [r2, #0x12]
	ldrh r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029DB8
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	b _08029DC0
	.align 2, 0
_08029DB0: .4byte gUnknown_03005424
_08029DB4: .4byte gUnknown_0300544C
_08029DB8:
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
_08029DC0:
	str r0, [r2, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029DC8
sub_8029DC8: @ 0x08029DC8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08029DDC
	ldrh r0, [r2, #0x12]
	adds r0, #0xc
	b _08029DE0
_08029DDC:
	ldrh r0, [r2, #0x12]
	adds r0, #0x2a
_08029DE0:
	strh r0, [r2, #0x12]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029DE8
sub_8029DE8: @ 0x08029DE8
	push {lr}
	ldr r3, _08029E0C @ =gCamera
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _08029E1E
	ldr r0, _08029E10 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029E14
	ldr r0, [r3, #0x28]
	lsls r0, r0, #8
	cmp r2, r0
	bgt _08029E1E
_08029E08:
	movs r0, #1
	b _08029E20
	.align 2, 0
_08029E0C: .4byte gCamera
_08029E10: .4byte gUnknown_03005424
_08029E14:
	ldr r0, [r3, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	cmp r2, r0
	bge _08029E08
_08029E1E:
	movs r0, #0
_08029E20:
	pop {r1}
	bx r1

	thumb_func_start sub_8029E24
sub_8029E24: @ 0x08029E24
	push {lr}
	ldr r3, _08029E4C @ =gCamera
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _08029E60
	ldr r0, _08029E50 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029E54
	ldr r0, [r3, #4]
	subs r0, #0x50
	lsls r0, r0, #8
	cmp r2, r0
	bgt _08029E60
_08029E46:
	movs r0, #1
	b _08029E62
	.align 2, 0
_08029E4C: .4byte gCamera
_08029E50: .4byte gUnknown_03005424
_08029E54:
	ldr r0, [r3, #4]
	lsls r0, r0, #8
	ldr r1, _08029E68 @ =0x0000EFFF
	adds r0, r0, r1
	cmp r2, r0
	bge _08029E46
_08029E60:
	movs r0, #0
_08029E62:
	pop {r1}
	bx r1
	.align 2, 0
_08029E68: .4byte 0x0000EFFF

	thumb_func_start sub_8029E6C
sub_8029E6C: @ 0x08029E6C
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08029EC0 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08029ED0
	ldr r0, _08029EC4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029EA2
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08029EA2:
	adds r0, r2, #0
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r3, #0
	bl sub_8022F58
	cmp r0, #3
	ble _08029ED0
	ldr r1, _08029EC8 @ =gPlayer
	ldr r0, _08029ECC @ =PlayerCB_8025D00
	str r0, [r1]
	movs r0, #1
	b _08029ED2
	.align 2, 0
_08029EC0: .4byte gPlayerControls
_08029EC4: .4byte gUnknown_03005424
_08029EC8: .4byte gPlayer
_08029ECC: .4byte PlayerCB_8025D00
_08029ED0:
	movs r0, #0
_08029ED2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029ED8
sub_8029ED8: @ 0x08029ED8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _08029EEA
	subs r0, #1
	b _08029F16
_08029EEA:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08029F18
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08029F04
	rsbs r1, r1, #0
_08029F04:
	ldr r0, _08029F1C @ =0x000001DF
	cmp r1, r0
	bgt _08029F18
	strh r3, [r2, #0x14]
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1e
_08029F16:
	strh r0, [r2, #0x2a]
_08029F18:
	pop {r0}
	bx r0
	.align 2, 0
_08029F1C: .4byte 0x000001DF

	thumb_func_start sub_8029F20
sub_8029F20: @ 0x08029F20
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08029F36
	adds r1, #2
	cmp r1, #0
	ble _08029F42
	b _08029F40
_08029F36:
	cmp r1, #0
	ble _08029F42
	subs r1, #2
	cmp r1, #0
	bge _08029F42
_08029F40:
	movs r1, #0
_08029F42:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	pop {r0}
	bx r0

	thumb_func_start sub_8029F4C
sub_8029F4C: @ 0x08029F4C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x87
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08029F94 @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08029F98 @ =gSongTable
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08029F90
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08029F90
	ldr r1, _08029F9C @ =gLevelSongs
	ldr r0, _08029FA0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08029F90:
	pop {r0}
	bx r0
	.align 2, 0
_08029F94: .4byte gMPlayTable
_08029F98: .4byte gSongTable
_08029F9C: .4byte gLevelSongs
_08029FA0: .4byte gCurrentLevel

	thumb_func_start sub_8029FA4
sub_8029FA4: @ 0x08029FA4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	movs r1, #3
	cmp r0, #0
	beq _08029FB8
	movs r1, #7
_08029FB8:
	ldr r0, _08029FE8 @ =gUnknown_03005590
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08029FE2
	movs r2, #0x17
	ldrsb r2, [r3, r2]
	ldr r0, _08029FEC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029FD4
	rsbs r2, r2, #0
_08029FD4:
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	adds r1, r1, r2
	bl sub_801F5CC
_08029FE2:
	pop {r0}
	bx r0
	.align 2, 0
_08029FE8: .4byte gUnknown_03005590
_08029FEC: .4byte gUnknown_03005424

	thumb_func_start Player_SetMovestate_IsInScriptedSequence
Player_SetMovestate_IsInScriptedSequence: @ 0x08029FF0
	ldr r0, _0802A000 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0x17
	orrs r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0802A000: .4byte gPlayer

	thumb_func_start Player_ClearMovestate_IsInScriptedSequence
Player_ClearMovestate_IsInScriptedSequence: @ 0x0802A004
	ldr r0, _0802A010 @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _0802A014 @ =0xBFFFFFFF
	ands r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0802A010: .4byte gPlayer
_0802A014: .4byte 0xBFFFFFFF

	thumb_func_start sub_802A018
sub_802A018: @ 0x0802A018
	push {lr}
	ldr r0, _0802A044 @ =gPlayer
	adds r0, #0x6d
	movs r1, #0xa
	strb r1, [r0]
	ldr r2, _0802A048 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x23
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0802A04C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802A03E
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0802A03E:
	pop {r0}
	bx r0
	.align 2, 0
_0802A044: .4byte gPlayer
_0802A048: .4byte gUnknown_03005424
_0802A04C: .4byte gGameMode

	thumb_func_start sub_802A050
sub_802A050: @ 0x0802A050
	push {lr}
	ldr r2, _0802A074 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x23
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0802A078 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802A06E
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0802A06E:
	pop {r0}
	bx r0
	.align 2, 0
_0802A074: .4byte gUnknown_03005424
_0802A078: .4byte gGameMode

	thumb_func_start sub_802A07C
sub_802A07C: @ 0x0802A07C
	push {r4, lr}
	ldr r4, _0802A0C4 @ =gPlayer
	adds r1, r4, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802A0A2
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0A2:
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802A0BE
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A0C4: .4byte gPlayer

	thumb_func_start sub_802A0C8
sub_802A0C8: @ 0x0802A0C8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x40
	bne _0802A0F4
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A0F4
	ldr r1, _0802A0EC @ =gPlayer
	ldr r0, _0802A0F0 @ =PlayerCB_802A620
	str r0, [r1]
	movs r0, #1
	b _0802A0F6
	.align 2, 0
_0802A0EC: .4byte gPlayer
_0802A0F0: .4byte PlayerCB_802A620
_0802A0F4:
	movs r0, #0
_0802A0F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A0FC
sub_802A0FC: @ 0x0802A0FC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _0802A17C
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	ldrh r3, [r2, #0x14]
	cmp r0, #0
	bne _0802A148
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r0, [r2, #0x20]
	ldr r1, _0802A13C @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r1, _0802A140 @ =gPlayer
	ldr r0, _0802A144 @ =PlayerCB_802A228
	str r0, [r1]
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A13C: .4byte 0x01000006
_0802A140: .4byte gPlayer
_0802A144: .4byte PlayerCB_802A228
_0802A148:
	adds r0, r3, #0
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bls _0802A17C
	ldr r0, [r2, #0x20]
	ldr r1, _0802A170 @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A17C
	ldr r1, _0802A174 @ =gPlayer
	ldr r0, _0802A178 @ =PlayerCB_8025A0C
	str r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A170: .4byte 0x01000006
_0802A174: .4byte gPlayer
_0802A178: .4byte PlayerCB_8025A0C
_0802A17C:
	movs r0, #0
_0802A17E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A184
sub_802A184: @ 0x0802A184
	push {lr}
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0802A1C0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0802A1B4 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0802A1C0
	ldr r0, _0802A1B8 @ =gPlayer
	ldr r1, _0802A1BC @ =PlayerCB_802631C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	movs r0, #1
	b _0802A1C2
	.align 2, 0
_0802A1B4: .4byte gPlayerControls
_0802A1B8: .4byte gPlayer
_0802A1BC: .4byte PlayerCB_802631C
_0802A1C0:
	movs r0, #0
_0802A1C2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A1C8
sub_802A1C8: @ 0x0802A1C8
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	adds r0, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802A1E4
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1E4:
	ldr r0, [r3, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802A1FA
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1FA:
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0x90
	lsls r0, r0, #4
_0802A204:
	str r0, [r3, #0x40]
	ldr r1, _0802A224 @ =gUnknown_080D6902
	lsls r2, r2, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [r3, #0x48]
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	str r0, [r3, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A224: .4byte gUnknown_080D6902

	thumb_func_start PlayerCB_802A228
PlayerCB_802A228: @ 0x0802A228
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #2
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A250 @ =gPlayer
	ldr r2, _0802A254 @ =PlayerCB_8025854
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A250: .4byte gPlayer
_0802A254: .4byte PlayerCB_8025854

	thumb_func_start PlayerCB_802A258
PlayerCB_802A258: @ 0x0802A258
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A27E
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0802A276
	adds r0, r2, #0
	bl PlayerCB_8025A0C
	b _0802A296
_0802A276:
	adds r0, r2, #0
	bl PlayerCB_8025318
	b _0802A296
_0802A27E:
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
	ldr r0, _0802A29C @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r2, #0x20]
	ldr r0, _0802A2A0 @ =gPlayer
	ldr r1, _0802A2A4 @ =PlayerCB_8026D2C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
_0802A296:
	pop {r0}
	bx r0
	.align 2, 0
_0802A29C: .4byte 0xFEFFFFDF
_0802A2A0: .4byte gPlayer
_0802A2A4: .4byte PlayerCB_8026D2C

	thumb_func_start sub_802A2A8
sub_802A2A8: @ 0x0802A2A8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802A2E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0802A2DE
	ldr r0, [r2, #0x20]
	movs r1, #0x84
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0802A2DE
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802A2DE
	adds r0, r2, #0
	adds r0, #0x5e
	ldr r1, _0802A2E8 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0802A2EC
_0802A2DE:
	movs r0, #0
	b _0802A2F4
	.align 2, 0
_0802A2E4: .4byte gGameMode
_0802A2E8: .4byte gPlayerControls
_0802A2EC:
	ldr r1, _0802A2F8 @ =gPlayer
	ldr r0, _0802A2FC @ =PlayerCB_802A714
	str r0, [r1]
	movs r0, #1
_0802A2F4:
	pop {r1}
	bx r1
	.align 2, 0
_0802A2F8: .4byte gPlayer
_0802A2FC: .4byte PlayerCB_802A714

	thumb_func_start PlayerCB_802A300
PlayerCB_802A300: @ 0x0802A300
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0802A34C @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r2, r4, #0
	adds r2, #0x66
	ldr r0, _0802A350 @ =0x0000FFFF
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _0802A354 @ =0x00000115
	bl m4aSongNumStart
	ldr r0, _0802A358 @ =gPlayer
	ldr r1, _0802A35C @ =PlayerCB_802940C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A34C: .4byte 0xFEFFFFD7
_0802A350: .4byte 0x0000FFFF
_0802A354: .4byte 0x00000115
_0802A358: .4byte gPlayer
_0802A35C: .4byte PlayerCB_802940C

	thumb_func_start sub_802A360
sub_802A360: @ 0x0802A360
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x3e
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x92
	lsls r0, r0, #1     @ SE_ICE_PARADISE_SLIDE
	bl m4aSongNumStart
	ldr r0, _0802A3B0 @ =gPlayer
	ldr r1, _0802A3B4 @ =PlayerCB_8026BCC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3B0: .4byte gPlayer
_0802A3B4: .4byte PlayerCB_8026BCC

	thumb_func_start PlayerCB_802A3B8
PlayerCB_802A3B8: @ 0x0802A3B8
	push {lr}
	bl sub_802808C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_802A3C4
PlayerCB_802A3C4: @ 0x0802A3C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	adds r4, #0x90
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802A3E2
	ldr r1, _0802A3E8 @ =gPlayer
	ldr r0, _0802A3EC @ =PlayerCB_8025A0C
	str r0, [r1]
_0802A3E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3E8: .4byte gPlayer
_0802A3EC: .4byte PlayerCB_8025A0C

	thumb_func_start PlayerCB_802A3F0
PlayerCB_802A3F0: @ 0x0802A3F0
	push {lr}
	ldr r2, _0802A408 @ =gCamera
	ldr r1, [r2, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0802A402
	subs r0, r1, #1
	str r0, [r2, #0x1c]
_0802A402:
	pop {r0}
	bx r0
	.align 2, 0
_0802A408: .4byte gCamera

	thumb_func_start sub_802A40C
sub_802A40C: @ 0x0802A40C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x72
	strh r2, [r0]
	ldr r0, _0802A460 @ =gPlayer
	ldr r1, _0802A464 @ =PlayerCB_80279F8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A460: .4byte gPlayer
_0802A464: .4byte PlayerCB_80279F8

	thumb_func_start sub_802A468
sub_802A468: @ 0x0802A468
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0802A4B0 @ =gPlayer
	ldr r1, _0802A4B4 @ =PlayerCB_8027C5C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4B0: .4byte gPlayer
_0802A4B4: .4byte PlayerCB_8027C5C

	thumb_func_start sub_802A4B8
sub_802A4B8: @ 0x0802A4B8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _0802A4F4 @ =gPlayer
	ldr r1, _0802A4F8 @ =PlayerCB_8027D3C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4F4: .4byte gPlayer
_0802A4F8: .4byte PlayerCB_8027D3C

	thumb_func_start PlayerCB_802A4FC
PlayerCB_802A4FC: @ 0x0802A4FC
	bx lr
	.align 2, 0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A500
sub_802A500: @ 0x0802A500
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0802A51A
	adds r0, r4, #0
	bl sub_8022218
	adds r0, r4, #0
	bl sub_8022284
	b _0802A526
_0802A51A:
	adds r0, r4, #0
	bl sub_8022284
	adds r0, r4, #0
	bl sub_8022218
_0802A526:
	pop {r4}
	pop {r0}
	bx r0
    
@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A52C
sub_802A52C: @ 0x0802A52C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0802A54C
	ldr r1, _0802A550 @ =gPlayer
	ldr r0, _0802A554 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r2, #0x10]
	movs r1, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
_0802A54C:
	pop {r0}
	bx r0
	.align 2, 0
_0802A550: .4byte gPlayer
_0802A554: .4byte PlayerCB_8025318

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A558
sub_802A558: @ 0x0802A558
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x40
	ands r0, r1
	movs r1, #0x2a
	cmp r0, #0
	beq _0802A56A
	movs r1, #0xc
_0802A56A:
	ldrh r3, [r2, #0x12]
	movs r4, #0x12
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _0802A57C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0802A57C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	strh r0, [r2, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A58C
sub_802A58C: @ 0x0802A58C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x14
	beq _0802A5A8
	ldrh r2, [r1, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _0802A5A8
	subs r0, r2, #1
	strh r0, [r1, #0x2c]
_0802A5A8:
	pop {r0}
	bx r0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A5AC
sub_802A5AC: @ 0x0802A5AC
	push {lr}
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802A5C0
	subs r0, r2, #1
	strb r0, [r1]
_0802A5C0:
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_802A5C4
PlayerCB_802A5C4: @ 0x0802A5C4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802A5E6
	movs r0, #6
	b _0802A5E8
_0802A5E6:
	movs r0, #5
_0802A5E8:
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A614 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ldr r0, _0802A618 @ =gPlayer
	ldr r1, _0802A61C @ =PlayerCB_8025548
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0802A614: .4byte 0xFFFFBFFF
_0802A618: .4byte gPlayer
_0802A61C: .4byte PlayerCB_8025548

	thumb_func_start PlayerCB_802A620
PlayerCB_802A620: @ 0x0802A620
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r1, r0, #0
	adds r1, #0x90
	ldr r3, [r1]
	ldr r1, [r3, #0x1c]
	ldr r2, _0802A654 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r3, #0x1c]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #1
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A658 @ =gPlayer
	ldr r2, _0802A65C @ =PlayerCB_802569C
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A654: .4byte 0xFFFFBFFF
_0802A658: .4byte gPlayer
_0802A65C: .4byte PlayerCB_802569C

@ Unused?
	thumb_func_start sub_802A660
sub_802A660: @ 0x0802A660
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A6BA
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _0802A69C
	cmp r1, #0x20
	bne _0802A6BA
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0802A690
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A690:
	subs r0, #0x18
	cmp r0, #0
	bge _0802A6B8
	movs r0, #0x60
	rsbs r0, r0, #0
	b _0802A6B8
_0802A69C:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _0802A6B0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A6B0:
	adds r0, #0x18
	cmp r0, #0
	ble _0802A6B8
	movs r0, #0x60
_0802A6B8:
	strh r0, [r2, #0x14]
_0802A6BA:
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
	thumb_func_start sub_802A6C0
sub_802A6C0: @ 0x0802A6C0
	push {lr}
	mov ip, r0
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A708 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r2, ip
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0802A70C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802A710 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_0802A708: .4byte 0xFFFFCFFF
_0802A70C: .4byte gPlayer
_0802A710: .4byte 0xBFFFFFFF

	thumb_func_start PlayerCB_802A714
PlayerCB_802A714: @ 0x0802A714
	push {lr}
	adds r2, r0, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _0802A7A4
	lsls r0, r0, #2
	ldr r1, _0802A730 @ =_0802A734
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A730: .4byte _0802A734
_0802A734: @ jump table
	.4byte _0802A748 @ case 0
	.4byte _0802A750 @ case 1
	.4byte _0802A76A @ case 2
	.4byte _0802A772 @ case 3
	.4byte _0802A78C @ case 4
_0802A748:
	adds r0, r2, #0
	bl sub_8011D48
	b _0802A7A4
_0802A750:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A762
	adds r0, r2, #0
	bl sub_8012548
	b _0802A7A4
_0802A762:
	adds r0, r2, #0
	bl sub_8012830
	b _0802A7A4
_0802A76A:
	adds r0, r2, #0
	bl sub_8012D3C
	b _0802A7A4
_0802A772:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A784
	adds r0, r2, #0
	bl sub_8012EEC
	b _0802A7A4
_0802A784:
	adds r0, r2, #0
	bl sub_8013070
	b _0802A7A4
_0802A78C:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A79E
	adds r0, r2, #0
	bl sub_8013F04
	b _0802A7A4
_0802A79E:
	adds r0, r2, #0
	bl sub_8011D48
_0802A7A4:
	pop {r0}
	bx r0
