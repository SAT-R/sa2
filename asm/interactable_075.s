.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807A920
sub_807A920: @ 0x0807A920
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x6c]
	ldr r1, _0807A990 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x70]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x88
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	adds r0, #0x18
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807A98A
	adds r0, r3, #0
	adds r0, #0x84
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	subs r0, #0x18
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807A98A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x8a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	adds r0, #0x18
	cmp r0, r5
	blt _0807A98A
	adds r0, r3, #0
	adds r0, #0x86
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	subs r0, #0x18
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807A994
_0807A98A:
	movs r0, #1
	b _0807A996
	.align 2, 0
_0807A990: .4byte gCamera
_0807A994:
	movs r0, #0
_0807A996:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A99C
sub_807A99C: @ 0x0807A99C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807A9E8 @ =gPlayer
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _0807AA5E
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r2, [r4, #0x74]
	asrs r2, r2, #8
	ldr r1, [r4, #0x6c]
	adds r1, r1, r2
	ldr r3, [r4, #0x78]
	asrs r3, r3, #8
	ldr r2, [r4, #0x70]
	adds r2, r2, r3
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AA5E
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807A9EC
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r6, [r5, #0x12]
	movs r0, #2
	b _0807AA60
	.align 2, 0
_0807A9E8: .4byte gPlayer
_0807A9EC:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807AA18
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #1
	b _0807AA60
_0807AA18:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807AA44
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #3
	b _0807AA60
_0807AA44:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AA5E
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #4
	b _0807AA60
_0807AA5E:
	movs r0, #0
_0807AA60:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA68
sub_807AA68: @ 0x0807AA68
	push {r4, lr}
	ldr r0, _0807AAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807AAAC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807AA84
	adds r0, r4, #0
	bl sub_807AB6C
_0807AA84:
	adds r0, r4, #0
	bl sub_807A99C
	cmp r0, #2
	bne _0807AA94
	adds r0, r4, #0
	bl sub_807A688
_0807AA94:
	adds r0, r4, #0
	bl sub_807A920
	cmp r0, #0
	beq _0807AAB0
	adds r0, r4, #0
	bl sub_807AB54
	b _0807AAB6
	.align 2, 0
_0807AAA8: .4byte gCurTask
_0807AAAC: .4byte gGameMode
_0807AAB0:
	adds r0, r4, #0
	bl sub_807A7F4
_0807AAB6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AABC
sub_807AABC: @ 0x0807AABC
	push {r4, lr}
	ldr r0, _0807AAF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807AAF4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807AAD8
	adds r0, r4, #0
	bl sub_807AB6C
_0807AAD8:
	adds r0, r4, #0
	bl sub_807A99C
	adds r0, r4, #0
	bl sub_807A920
	cmp r0, #0
	beq _0807AAF8
	adds r0, r4, #0
	bl sub_807AB54
	b _0807AAFE
	.align 2, 0
_0807AAF0: .4byte gCurTask
_0807AAF4: .4byte gGameMode
_0807AAF8:
	adds r0, r4, #0
	bl sub_807A7F4
_0807AAFE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AB04
sub_807AB04: @ 0x0807AB04
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807AB18
sub_807AB18: @ 0x0807AB18
	push {lr}
	ldr r3, _0807AB50 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xf
	orrs r1, r2
	str r1, [r3, #0x20]
	ldr r2, [r0, #0x6c]
	lsls r2, r2, #8
	ldr r1, [r0, #0x7c]
	adds r1, r1, r2
	ldr r2, [r0, #0x74]
	adds r1, r1, r2
	str r1, [r3, #8]
	adds r1, r0, #0
	adds r1, #0x80
	ldr r2, [r0, #0x70]
	lsls r2, r2, #8
	ldr r1, [r1]
	adds r1, r1, r2
	ldr r2, [r0, #0x78]
	adds r1, r1, r2
	str r1, [r3, #0xc]
	bl sub_807A99C
	pop {r0}
	bx r0
	.align 2, 0
_0807AB50: .4byte gPlayer

	thumb_func_start sub_807AB54
sub_807AB54: @ 0x0807AB54
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807AB68 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807AB68: .4byte gCurTask

	thumb_func_start sub_807AB6C
sub_807AB6C: @ 0x0807AB6C
	push {r4, lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0xa8
	mov r4, ip
	adds r4, #0xa0
	ldr r0, [r4]
	str r0, [r1]
	adds r1, #4
	mov r3, ip
	adds r3, #0xa4
	ldr r0, [r3]
	str r0, [r1]
	mov r2, ip
	adds r2, #0x98
	ldr r0, [r2]
	str r0, [r4]
	subs r1, #0x10
	ldr r0, [r1]
	str r0, [r3]
	mov r3, ip
	ldr r0, [r3, #0x74]
	str r0, [r2]
	ldr r0, [r3, #0x78]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable075_0
initSprite_Interactable075_0: @ 0x0807ABA4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable075_1
initSprite_Interactable075_1: @ 0x0807ABC4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable075_2
initSprite_Interactable075_2: @ 0x0807ABE4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
