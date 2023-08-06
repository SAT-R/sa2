.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

    @ Unused
	thumb_func_start sub_801E3F0
sub_801E3F0: @ 0x0801E3F0
	push {lr}
	ldr r3, _0801E420 @ =gCamera
	ldr r0, _0801E424 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801E41A
	ldr r2, _0801E428 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801E42C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801E430 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r0, r1
	lsrs r0, r0, #0x10
	subs r0, #8
	str r0, [r3, #0x1c]
_0801E41A:
	pop {r0}
	bx r0
	.align 2, 0
_0801E420: .4byte gCamera
_0801E424: .4byte gUnknown_03005590
_0801E428: .4byte gPseudoRandom
_0801E42C: .4byte 0x00196225
_0801E430: .4byte 0x3C6EF35F

	thumb_func_start HBlankCB_801E434
HBlankCB_801E434: @ 0x0801E434
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x49
	bne _0801E448
	ldr r1, _0801E44C @ =0x0400001C
	ldr r0, _0801E450 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r0, r0, #4
	strh r0, [r1]
_0801E448:
	pop {r0}
	bx r0
	.align 2, 0
_0801E44C: .4byte 0x0400001C
_0801E450: .4byte gUnknown_03005590

	thumb_func_start sub_801E454
sub_801E454: @ 0x0801E454
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0801E482
	ldr r0, _0801E488 @ =gUnknown_030022AC
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r1, r0, r1
	subs r0, r1, #2
	ldrh r2, [r1, #2]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0801E474
	ldr r0, _0801E48C @ =0x0400001C
	strh r2, [r0]
_0801E474:
	subs r0, r1, #4
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0801E482
	ldr r0, _0801E490 @ =0x04000010
	strh r1, [r0]
_0801E482:
	pop {r0}
	bx r0
	.align 2, 0
_0801E488: .4byte gUnknown_030022AC
_0801E48C: .4byte 0x0400001C
_0801E490: .4byte 0x04000010

	thumb_func_start nullsub_801E494
nullsub_801E494: @ 0x0801E494
	bx lr
	.align 2, 0

	thumb_func_start sub_801E498
sub_801E498: @ 0x0801E498
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x69
	bls _0801E4B4
	ldr r3, _0801E4B8 @ =0x0400001C
	ldr r2, _0801E4BC @ =gCourseTime
	ldr r0, _0801E4C0 @ =gUnknown_080D5B50
	adds r0, r1, r0
	ldrb r1, [r0]
	subs r1, #1
	ldr r0, [r2]
	lsrs r0, r1
	strh r0, [r3]
_0801E4B4:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4B8: .4byte 0x0400001C
_0801E4BC: .4byte gCourseTime
_0801E4C0: .4byte gUnknown_080D5B50

	thumb_func_start HBlankCB_BgUpdateZoneFinalActXX
HBlankCB_BgUpdateZoneFinalActXX: @ 0x0801E4C4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x58
	bne _0801E4D6
	ldr r0, _0801E4DC @ =0x0400001C
	ldr r1, _0801E4E0 @ =gUnknown_03005590
	ldrb r1, [r1]
	strh r1, [r0]
_0801E4D6:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4DC: .4byte 0x0400001C
_0801E4E0: .4byte gUnknown_03005590
