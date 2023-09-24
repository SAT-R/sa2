.include "constants/gba_constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080113E0 @ =gWater
	mov sl, r0              @ sl = gWater
	ldr r0, [r0, #0x10]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov ip, r0              @ ip = TaskGetStructPtr(gWater.t)
	ldr r0, _080113E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08011400
	movs r7, #0
	movs r4, #0
	ldr r1, _080113E8 @ =gAnimations
	mov r8, r1
	ldr r2, _080113EC @ =gSpritePalettes
	mov sb, r2
	ldr r3, _080113F0 @ =IWRAM_START + 0x80
	adds r6, r6, r3
	ldr r0, _080113F4 @ =gMultiplayerConnections
	ldrb r1, [r0]
	movs r3, #1
_08011360:
	adds r0, r1, #0
	asrs r0, r4
	ands r0, r3
	cmp r0, #0
	beq _08011370
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08011370:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08011360
	movs r4, #0
	cmp r4, r7
	blo _08011382
	b _080114B0
_08011382:
	ldr r0, _080113F8 @ =gMultiplayerCharacters
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	ldr r1, _080113FC @ =gUnknown_080D550C
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r0, #5
	lsls r0, r4, #5
	mov r2, ip
	adds r3, r0, r2
	add r1, sb
	movs r5, #0
	adds r4, #1
_080113AE:
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _080113AE
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _08011382
	b _080114B0
	.align 2, 0
_080113E0: .4byte gWater
_080113E4: .4byte gGameMode
_080113E8: .4byte gAnimations
_080113EC: .4byte gSpritePalettes
_080113F0: .4byte IWRAM_START + 0x80
_080113F4: .4byte gMultiplayerConnections
_080113F8: .4byte gMultiplayerCharacters
_080113FC: .4byte gUnknown_080D550C
_08011400:
	ldr r3, _080115A8 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	ldr r1, _080115AC @ =gUnknown_080D550C
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r2, _080115B0 @ =gAnimations
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r0, r0, #5
	ldr r1, _080115B4 @ =gSpritePalettes
	mov r5, ip
	adds r4, r0, r1
	movs r7, #0
	mov r8, r2
	mov sb, r1
	ldr r2, _080115B8 @ =gUnknown_080D5678
	ldr r0, _080115BC @ =IWRAM_START + 0x20
	adds r1, r6, r0
	adds r0, #0x60
	adds r6, r6, r0
_0801143A:
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	bne _0801143A
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r0, r0, #5
	adds r2, r1, #0
	mov r3, sb
	adds r1, r0, r3
	movs r3, #0
_08011488:
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	adds r0, r3, #0
	subs r3, #1
	cmp r0, #0
	bne _08011488
_080114B0:
	ldr r0, _080115C0 @ =0x000008A8
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, #4
	lsls r0, r0, #5
	adds r2, r6, #0
	mov r3, sb
	adds r1, r0, r3
	movs r3, #0xb
_080114C6:
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	adds r0, r3, #0
	subs r3, #1
	cmp r0, #0
	bne _080114C6
	movs r3, #0x80
	lsls r3, r3, #2
	add r3, ip          @ r3 = &(gWater.t)->pal[256]
	ldr r6, _080115C4 @ =gBgPalette
	mov r0, sl          @ r0 = sl = gWater
	ldr r2, [r0, #0xc]
	movs r7, #0xf
	ldr r5, _080115C8 @ =0x7BDE7BDE
	ldr r4, _080115CC @ =0x739C739C
	ands r2, r4
_08011502:
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	bne _08011502
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080115A8: .4byte gPlayer
_080115AC: .4byte gUnknown_080D550C
_080115B0: .4byte gAnimations
_080115B4: .4byte gSpritePalettes
_080115B8: .4byte gUnknown_080D5678
_080115BC: .4byte IWRAM_START + 0x20
_080115C0: .4byte 0x000008A8
_080115C4: .4byte gBgPalette
_080115C8: .4byte 0x7BDE7BDE
_080115CC: .4byte 0x739C739C
    .syntax divided
