.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x20]     @ sp20 = boss
	adds r0, #0x18
	mov sl, r0              @ sl = sub
	ldr r1, [sp, #0x20] 
	adds r1, #0x82
	mov sb, r1              @ sb = &sub->unk6A
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	str r2, [sp, #0x24]     @ sp24 = sub->unk6A
	ldr r0, [sp, #0x20]
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0
	beq _08041D62
	b sub_8041D34_return
_08041D62:
	adds r0, r2, #0
	movs r1, #0xc
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08041DFA
	movs r0, #0x30
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08041FFC @ =gPseudoRandom
	mov r8, r0              @ r8 = &gPseudoRandom
	ldr r0, [r0]
	ldr r5, _08042000 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _08042004 @ =0x3C6EF35F
	adds r2, r2, r4         @ r2 = rand
	mov r3, sl              @ r3 = sub
	ldr r1, [r3, #4]
	asrs r1, r1, #8         @ r1 = Q_24_8_TO_INT(sub->cockpit.x)
	ldr r3, _08042008 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0         @ r1 = bossX = Q_24_8_TO_INT(sub->cockpit.x) - gCamera.x;
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sl              @ r0 = sl = sub
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x30
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp              @ r3 = sp = partsInfo
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r1, #0x81
	bl CreateBossParticleWithExplosionUpdate
_08041DFA:
	mov r3, sb              @ r3 = sb = &sub->unk6A
	ldrb r1, [r3]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08041ED0
	ldr r0, _08041FFC @ =gPseudoRandom
	mov sb, r0              @ sb = &gPseudoRandom
	ldr r0, [r0]
	ldr r1, _08042000 @ =0x00196225
	mov r8, r1
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r6, _08042004 @ =0x3C6EF35F
	adds r0, r0, r6
	mov r3, sb
	str r0, [r3]
	movs r5, #0xf
	adds r4, r5, #0
	ands r4, r0
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18      @ r7 = rand - Div(rand, 6) * 6;
	mov r1, sl              @ r1 = sl = sub
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r3, _08042008 @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r1, r4, #1
	subs r0, r0, r1
	lsls r4, r4, #2
	adds r0, r0, r4
	str r0, [sp, #0x14]
	mov r2, sb
	ldr r0, [r2]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r6
	ands r5, r2             @ r5 = rand
	mov r1, sl              @ r1 = sl = sub
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r1, r5, #1
	subs r0, r0, r1
	lsls r5, r5, #2
	adds r0, r0, r5
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]    @ sp1C = partsInfo.velocity = Q_24_8(0.25);
	mov r3, sp
	mov r1, r8
	muls r1, r2, r1
	adds r1, r1, r6
	ldr r0, _08042018 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r2, sp
	mov r3, r8
	muls r3, r1, r3
	adds r1, r3, #0
	adds r1, r1, r6
	mov r0, sb
	str r1, [r0]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0xe0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r2, _0804201C @ =gTileInfoBossScrews
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08042020 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r3, #8]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	strh r0, [r3, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r1, #0x81
	mov r0, sp
	bl CreateBossParticleWithExplosionUpdate
_08041ED0:
	movs r7, #0
	ldr r0, [sp, #0x20]
	adds r0, #0x40              @ r0 = &boss->sub.tail[0].status
	str r0, [sp, #0x28]         @ sp00 = &boss->sub.tail[0].status
	ldr r1, _08042008 @ =gCamera
	mov sb, r1                  @ sb = r1 = gCamera
	mov r5, sp
	ldr r2, _08041FFC @ =gPseudoRandom
	mov r8, r2
	ldr r6, _08042000 @ =0x00196225
_08041EE4:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r2, r0, #2             @ r2 = i * 20
	ldr r3, [sp, #0x28]
	adds r0, r3, r2
	ldr r4, [r0]
	cmp r4, #0
	bne _08041F6A
	adds r0, r7, #4
	ldr r1, [sp, #0x24]         @ r1 = sub->unk6A
	cmp r1, r0                  @ if(sub->unk6A != i + 4)
	beq _08041F02
	adds r0, #0x1a
	cmp r1, r0
	bne _08041F6A
_08041F02:
	mov r0, sl                  @ r0 = sl = sub
	adds r0, #0x18
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8             @ r0 = Q_24_8_To_INT(sub->tail[i].x))
	mov r3, sb                  @ r3 = sb = gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [sp, #0x14]         @ sub->spawnX = Q_24_8_To_INT(sub->tail[i].x) - gCamera.x
	mov r0, sl                  @ r0 = sl = sub
	adds r0, #0x1c
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]         @ sub->spawnY = Q_24_8_To_INT(sub->tail[i].y) - gCamera.y
	strh r4, [r5, #0x1c]        @ sub->velocity = 0
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r3, _08042004 @ =0x3C6EF35F
	adds r2, r2, r3             @ r2 = PseudoRandom32()
	movs r1, #0x3f
	ands r1, r2
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r3
	mov r2, r8
	str r1, [r2]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x90
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]                @ sub->vram = RESERVED_EXPLOSION_TILES_VRAM
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r5, #8]           @ sub->anim = SA2_ANIM_EXPLOSION
	strh r4, [r5, #0xa]         @ sub->variant = 0
	str r4, [sp, #4]            @ sub->unk4 = 0
	mov r0, sp
	mov r1, sl
	adds r1, #0x69
	bl CreateBossParticleWithExplosionUpdate
_08041F6A:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _08041EE4
	ldr r3, [sp, #0x24]         @ r3 = sub->unk6A
	cmp r3, #0x29
	beq _08041F7E
	cmp r3, #0x12
	bne sub_8041D34_return
_08041F7E:
	mov r0, sl
	ldr r7, [r0, #0x64]
	cmp r7, #0
	bne sub_8041D34_return
	ldr r0, [r0, #0x54]
	asrs r0, r0, #8
	ldr r2, _08042008 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	mov r1, sl
	ldr r0, [r1, #0x58]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r5, sp
	ldr r6, _08041FFC @ =gPseudoRandom
	ldr r0, [r6]
	ldr r4, _08042000 @ =0x00196225
	adds r2, r0, #0
	muls r2, r4, r2
	ldr r3, _08042004 @ =0x3C6EF35F
	adds r2, r2, r3
	movs r1, #0x3f
	ands r1, r2
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r4, r1
	adds r1, r1, r3
	str r1, [r6]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0x69
	bl CreateBossParticleWithExplosionUpdate
sub_8041D34_return:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041FFC: .4byte gPseudoRandom
_08042000: .4byte 0x00196225
_08042004: .4byte 0x3C6EF35F
_08042008: .4byte gCamera
_0804200C: .4byte 0x000001FF
_08042010: .4byte 0x06012980
_08042014: .4byte 0x0000026B
_08042018: .4byte 0x000003FF
_0804201C: .4byte gTileInfoBossScrews
_08042020: .4byte 0x06010000
	
.syntax divided
