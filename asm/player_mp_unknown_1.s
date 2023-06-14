
.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 01
	thumb_func_start sub_80192A8
sub_80192A8: @ 0x080192A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080192F8 @ =gEntitiesManagerTask
	ldr r0, [r0]
	cmp r0, #0
	beq _080192F0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0, #4]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _080192F0
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
_080192F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080192F8: .4byte gEntitiesManagerTask
.endif

	thumb_func_start sub_80192FC
sub_80192FC: @ 0x080192FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801934C @ =gEntitiesManagerTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08019344
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0, #8]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _08019344
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
_08019344:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801934C: .4byte gEntitiesManagerTask

	thumb_func_start sub_8019350
sub_8019350: @ 0x08019350
	push {lr}
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r2, #4
	ldrsh r1, [r0, r2]
	ldrb r2, [r0, #0xf]
	adds r0, r3, #0
	bl sub_801FD34
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8019368
sub_8019368: @ 0x08019368
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080193B4 @ =gEntitiesManagerTask
	ldr r0, [r0]
	cmp r0, #0
	beq _080193AC
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _080193AC
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	ldrb r0, [r4, #0x12]
	strb r0, [r1, #4]
_080193AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080193B4: .4byte gEntitiesManagerTask

    thumb_func_start sub_80193B8
sub_80193B8:
    ldr r0, _80193C0 @ =REG_SIOCNT
    ldr r0, [r0]
    bx lr
    .align 2 , 0
_80193C0:
	.4byte 0x04000128
