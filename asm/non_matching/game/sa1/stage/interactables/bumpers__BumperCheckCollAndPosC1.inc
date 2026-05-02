.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	movs r6, #0
	ldr r4, _0807ACAC @ =gPartner
	ldr r5, _0807ACB0 @ =gPlayer
	ldr r2, _0807ACB4 @ =0x0000FA27
	mov sl, r2
_0807ACA2:
	cmp r6, #0
	beq _0807ACB8
	ldr r3, [r4]
	mov sb, r3
	b _0807ACBC
	.align 2, 0
_0807ACAC: .4byte gPartner
_0807ACB0: .4byte gPlayer
_0807ACB4: .4byte 0x0000FA27
_0807ACB8:
	ldr r0, [r5]
	mov sb, r0
_0807ACBC:
	cmp r6, #0
	beq _0807ACCA
	ldr r1, [r4, #0x10]
	movs r0, #0x80
	ands r1, r0
	adds r7, r6, #1
	b _0807ACD2
_0807ACCA:
	ldr r1, [r5, #0x10]
	movs r0, #0x80
	ands r1, r0
	movs r7, #1
_0807ACD2:
	cmp r1, #0
	beq _0807ACD8
	b _0807B066
_0807ACD8:
	ldr r0, _0807AD44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _0807ACE6
	adds r7, r6, #1
	cmp r0, #5
	bne _0807AD30
_0807ACE6:
	movs r2, #0
	ldr r1, _0807AD48 @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	adds r7, r6, #1
	cmp r0, #0
	beq _0807AD30
	adds r3, r1, #0
_0807ACF4:
	ldr r0, _0807AD4C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r2, r0
	beq _0807AD1C
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807AD1C
	movs r0, #1
	str r0, [sp, #0x10]
_0807AD1C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0807AD30
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	bne _0807ACF4
_0807AD30:
	cmp r6, #0
	beq _0807AD50
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807AD5C
	b _0807AD64
	.align 2, 0
_0807AD44: .4byte gGameMode
_0807AD48: .4byte gMultiplayerPlayerTasks
_0807AD4C: .4byte 0x04000128
_0807AD50:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0807AD64
_0807AD5C:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _0807AD64
	b _0807B066
_0807AD64:
	mov r2, r8
	ldr r0, [r2, #0x40]
	asrs r0, r0, #8
	ldr r3, [sp, #4]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	ldr r2, [sp, #8]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, _0807ADA0 @ =gPlayer
	cmp r6, #0
	beq _0807AD86
	ldr r3, _0807ADA4 @ =gPartner
_0807AD86:
	ldr r0, [sp]
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	bne _0807AD92
	b _0807B066
_0807AD92:
	cmp r6, #0
	beq _0807ADAC
	ldr r3, _0807ADA8 @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r3, r0]
	b _0807ADB2
	.align 2, 0
_0807ADA0: .4byte gPlayer
_0807ADA4: .4byte gPartner
_0807ADA8: .4byte gPartner + 0x59
_0807ADAC:
	ldr r1, _0807ADC8 @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
_0807ADB2:
	ldr r3, _0807ADCC @ =gPlayer
	cmp r0, #1
	beq _0807ADDE
	cmp r6, #0
	beq _0807ADD4
	ldr r2, _0807ADD0 @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #2
	beq _0807ADDE
	b _0807AE34
	.align 2, 0
_0807ADC8: .4byte gPlayer + 0x59
_0807ADCC: .4byte gPlayer
_0807ADD0: .4byte gPartner + 0x59
_0807ADD4:
	ldr r1, _0807ADF0 @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #2
	bne _0807AE34
_0807ADDE:
	cmp r6, #0
	beq _0807ADF8
	ldr r2, _0807ADF4 @ =gPartner + 0x3D
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0807AE06
	b _0807AE34
	.align 2, 0
_0807ADF0: .4byte gPlayer + 0x59
_0807ADF4: .4byte gPartner + 0x3D
_0807ADF8:
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807AE34
_0807AE06:
	ldr r0, _0807AE20 @ =gPlayer
	cmp r6, #0
	beq _0807AE0E
	ldr r0, _0807AE24 @ =gPartner
_0807AE0E:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _0807AE2C
	movs r0, #5
	ldr r3, _0807AE28 @ =gPartner + 0x40
	strb r0, [r3]
	b _0807AE32
	.align 2, 0
_0807AE20: .4byte gPlayer
_0807AE24: .4byte gPartner
_0807AE28: .4byte gPartner + 0x40
_0807AE2C:
	movs r0, #5
	ldr r1, _0807AE4C @ =gPlayer + 0x40
	strb r0, [r1]
_0807AE32:
	ldr r3, _0807AE50 @ =gPlayer
_0807AE34:
	ldr r0, _0807AE54 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _0807AE40
	cmp r0, #5
	bne _0807AE5C
_0807AE40:
	cmp r6, #0
	beq _0807AE58
	movs r0, #0x1e
	strh r0, [r4, #0x1c]
	b _0807AE5C
	.align 2, 0
_0807AE4C: .4byte gPlayer + 0x40
_0807AE50: .4byte gPlayer
_0807AE54: .4byte gGameMode
_0807AE58:
	movs r0, #0x1e
	strh r0, [r3, #0x1c]
_0807AE5C:
	cmp r6, #0
	beq _0807AE6C
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807AE76
_0807AE6C:
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807AE76:
	cmp r6, #0
	beq _0807AE84
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _0807AE8C
_0807AE84:
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
_0807AE8C:
	cmp r6, #0
	beq _0807AEA0
	ldr r0, [r4, #0x10]
	ldr r1, _0807AE9C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807AEA8
	.align 2, 0
_0807AE9C: .4byte 0xFFFFFEFF
_0807AEA0:
	ldr r0, [r5, #0x10]
	ldr r1, _0807AEB8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
_0807AEA8:
	cmp r6, #0
	beq _0807AEBC
	ldr r0, [r4, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	b _0807AEC4
	.align 2, 0
_0807AEB8: .4byte 0xFFFFFEFF
_0807AEBC:
	ldr r0, [r5, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
_0807AEC4:
	cmp r6, #0
	beq _0807AED4
	ldr r0, [r4, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807AEDE
_0807AED4:
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807AEDE:
	adds r1, r3, #0
	cmp r6, #0
	beq _0807AEE6
	ldr r1, _0807AF04 @ =gPartner
_0807AEE6:
	movs r0, #6
	strb r0, [r1, #0xe]
	adds r1, r3, #0
	cmp r6, #0
	beq _0807AEF2
	ldr r1, _0807AF04 @ =gPartner
_0807AEF2:
	movs r0, #9
	strb r0, [r1, #0xf]
	mov r2, r8
	ldr r0, [r2, #0x44]
	asrs r1, r0, #8
	cmp r6, #0
	beq _0807AF08
	ldr r0, [r4, #4]
	b _0807AF0A
	.align 2, 0
_0807AF04: .4byte gPartner
_0807AF08:
	ldr r0, [r3, #4]
_0807AF0A:
	asrs r0, r0, #8
	ldr r2, [sp, #8]
	subs r0, r0, r2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	mov r1, r8
	ldr r0, [r1, #0x40]
	asrs r1, r0, #8
	cmp r6, #0
	beq _0807AF24
	ldr r0, [r4]
	b _0807AF26
_0807AF24:
	ldr r0, [r3]
_0807AF26:
	asrs r0, r0, #8
	ldr r3, [sp, #4]
	subs r0, r0, r3
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r0, r2, #0
	bl sa2__sub_8004418
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r1, [sp]
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807AFC4
	ldr r0, _0807AF5C @ =0x000001FF
	cmp r2, r0
	bls _0807AF6C
	cmp r6, #0
	beq _0807AF64
	ldr r0, _0807AF60 @ =0x0000F99A
	strh r0, [r4, #0xa]
	b _0807B054
	.align 2, 0
_0807AF5C: .4byte 0x000001FF
_0807AF60: .4byte 0x0000F99A
_0807AF64:
	ldr r0, _0807AF68 @ =0x0000F99A
	b _0807B052
	.align 2, 0
_0807AF68: .4byte 0x0000F99A
_0807AF6C:
	cmp r2, #0xff
	bhi _0807AF94
	cmp r6, #0
	beq _0807AF80
	ldr r2, _0807AF7C @ =0x00000297
	strh r2, [r4, #8]
	b _0807AF84
	.align 2, 0
_0807AF7C: .4byte 0x00000297
_0807AF80:
	ldr r3, _0807AF8C @ =0x00000297
	strh r3, [r5, #8]
_0807AF84:
	cmp r6, #0
	bne _0807AFAC
	ldr r0, _0807AF90 @ =0x000005D9
	b _0807B052
	.align 2, 0
_0807AF8C: .4byte 0x00000297
_0807AF90: .4byte 0x000005D9
_0807AF94:
	cmp r6, #0
	beq _0807AFA4
	ldr r0, _0807AFA0 @ =0x0000FD69
	strh r0, [r4, #8]
	b _0807AFA8
	.align 2, 0
_0807AFA0: .4byte 0x0000FD69
_0807AFA4:
	ldr r0, _0807AFB4 @ =0x0000FD69
	strh r0, [r5, #8]
_0807AFA8:
	cmp r6, #0
	beq _0807AFBC
_0807AFAC:
	ldr r0, _0807AFB8 @ =0x000005D9
	strh r0, [r4, #0xa]
	b _0807B054
	.align 2, 0
_0807AFB4: .4byte 0x0000FD69
_0807AFB8: .4byte 0x000005D9
_0807AFBC:
	ldr r0, _0807AFC0 @ =0x000005D9
	b _0807B052
	.align 2, 0
_0807AFC0: .4byte 0x000005D9
_0807AFC4:
	movs r0, #0xf7
	lsls r0, r0, #1
	cmp r2, r0
	bls _0807B014
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	bls _0807AFF6
	cmp r6, #0
	beq _0807AFDE
	subs r0, #0x69
	strh r0, [r4, #8]
	b _0807AFE2
_0807AFDE:
	ldr r1, _0807AFEC @ =0x00000297
	strh r1, [r5, #8]
_0807AFE2:
	cmp r6, #0
	beq _0807AFF0
	mov r2, sl
	strh r2, [r4, #0xa]
	b _0807B054
	.align 2, 0
_0807AFEC: .4byte 0x00000297
_0807AFF0:
	mov r3, sl
	strh r3, [r5, #0xa]
	b _0807B054
_0807AFF6:
	cmp r6, #0
	beq _0807B004
	ldr r0, _0807B000 @ =0x0000FD69
	strh r0, [r4, #8]
	b _0807B008
	.align 2, 0
_0807B000: .4byte 0x0000FD69
_0807B004:
	ldr r0, _0807B010 @ =0x0000FD69
	strh r0, [r5, #8]
_0807B008:
	cmp r6, #0
	bne _0807B030
	b _0807B03C
	.align 2, 0
_0807B010: .4byte 0x0000FD69
_0807B014:
	cmp r2, #0x14
	bhi _0807B042
	cmp r6, #0
	beq _0807B028
	ldr r2, _0807B024 @ =0x00000297
	strh r2, [r4, #8]
	b _0807B02C
	.align 2, 0
_0807B024: .4byte 0x00000297
_0807B028:
	ldr r3, _0807B038 @ =0x00000297
	strh r3, [r5, #8]
_0807B02C:
	cmp r6, #0
	beq _0807B03C
_0807B030:
	mov r0, sl
	strh r0, [r4, #0xa]
	b _0807B054
	.align 2, 0
_0807B038: .4byte 0x00000297
_0807B03C:
	mov r1, sl
	strh r1, [r5, #0xa]
	b _0807B054
_0807B042:
	cmp r6, #0
	beq _0807B050
	ldr r0, _0807B04C @ =0x00000666
	strh r0, [r4, #0xa]
	b _0807B054
	.align 2, 0
_0807B04C: .4byte 0x00000666
_0807B050:
	ldr r0, _0807B070 @ =0x00000666
_0807B052:
	strh r0, [r5, #0xa]
_0807B054:
	movs r0, #0xb8
	bl m4aSongNumStart
	mov r1, r8
	adds r1, #0x4c
	movs r0, #0
	strb r0, [r1]
	movs r2, #1
	str r2, [sp, #0xc]
_0807B066:
	cmp r6, #0
	beq _0807B074
	mov r3, sb
	str r3, [r4]
	b _0807B078
	.align 2, 0
_0807B070: .4byte 0x00000666
_0807B074:
	mov r0, sb
	str r0, [r5]
_0807B078:
	adds r6, r7, #0
	ldr r0, _0807B09C @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bge _0807B088
	b _0807ACA2
_0807B088:
	ldr r0, [sp, #0xc]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807B09C: .4byte gNumSingleplayerCharacters

.syntax divided
