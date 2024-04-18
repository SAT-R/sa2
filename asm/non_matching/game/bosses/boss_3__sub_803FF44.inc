.include "constants/constants.inc"

.syntax unified
.text
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x5c
    str r0, [sp, #0x24]     @ sp24 = totem
    adds r0, #0x38
    ldrb r0, [r0]
    cmp r0, #0
    beq _0803FF5C
    b _080401C0
_0803FF5C:
    movs r6, #0
    ldr r0, [sp, #0x24]
    adds r0, #0x26
    str r0, [sp, #0x38]     @ sp38 = totem->unk24[0][1]
    ldr r1, [sp, #0x24]
    adds r1, #0xc
    str r1, [sp, #0x28]     @ sp28 = &totem->qDiscPos.x
    ldr r2, [sp, #0x24]
    adds r2, #0x24
    str r2, [sp, #0x34]     @ sp34 = totem->unk24[0][0]
    ldr r3, [sp, #0x24]
    adds r3, #0x10
    str r3, [sp, #0x2c]     @ sp2C = &totem->qDiscPos.y
    ldr r7, [sp, #0x24]
    adds r7, #0xa6
    mov sl, r7              @ sl = &totem->qUnkA6
    ldr r0, [sp, #0x24]
    adds r0, #0x9c
    str r0, [sp, #0x4c]     @ sp4C = &totem->qUnk9C
    ldr r1, [sp, #0x24]
    adds r1, #0xa4
    str r1, [sp, #0x50]     @ sp50 = &totem->qUnkA4
    ldr r2, [sp, #0x24]
    adds r2, #0xa0
    mov sb, r2              @ sb = &totem->qUnkA0
    ldr r3, [sp, #0x24]
    adds r3, #0x90
    str r3, [sp, #0x40]     @ sp40 = &totem->qUnk90
    ldr r7, [sp, #0x24]
    adds r7, #0x94
    str r7, [sp, #0x44]     @ sp44 = &totem->qUnk94
_0803FF9A:
    lsls r0, r6, #2
    mov r8, r0              @ r8 = i * 4
    ldr r5, [sp, #0x38]
    add r5, r8              @ r5 = &totem->unk24[i][1]
    ldrh r0, [r5]
    adds r0, #0x20
    strh r0, [r5]
    lsls r2, r6, #3
    ldr r1, [sp, #0x28]     @ sp28 = &totem->qDiscPos[i].x
    adds r3, r1, r2
    ldr r7, [sp, #0x34]     @ sp34 = &totem->unk24[0][0]
    add r7, r8              @ r7 = &totem->unk24[i][0]
    movs r0, #0
    ldrsh r1, [r7, r0]
    ldr r0, [r3]
    adds r0, r0, r1
    str r0, [r3]            @ totem->qDiscPos.x += totem->unk24[i][0]
    ldr r1, [sp, #0x2c]
    adds r4, r1, r2
    movs r2, #0
    ldrsh r1, [r5, r2]
    ldr r0, [r4]
    adds r0, r0, r1
    str r0, [r4]            @ totem->qDiscPos.y += totem->unk24[i][1]
    asrs r0, r0, #8
    ldr r1, _080400AC @ =gUnknown_080D7F10
    adds r1, r6, r1
    ldrb r1, [r1]
    lsls r1, r1, #0x18
    asrs r1, r1, #0x18
    adds r0, r0, r1
    subs r0, #1
    ldr r1, [r3]
    asrs r1, r1, #8
    ldr r2, _080400B0 @ =sub_801EC3C
    str r2, [sp]
    movs r2, #1
    movs r3, #8
    bl sub_801F100
    adds r2, r0, #0
    cmp r2, #0
    bge _0804002E
__minRes:
    lsls r1, r2, #8
    ldr r0, [r4]
    adds r0, r0, r1
    str r0, [r4]
    movs r3, #0
    ldrsh r1, [r5, r3]
    lsls r0, r1, #2
    adds r0, r0, r1
    lsls r0, r0, #4
    rsbs r0, r0, #0
    movs r1, #0x64
    bl Div
    strh r0, [r5]
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    ldr r1, _080400B4 @ =0xFFFFFF00
    cmp r0, r1
    ble _0804001A
    movs r2, #0
    strh r2, [r5]
_0804001A:
    ldrh r1, [r7]
    movs r3, #0
    ldrsh r0, [r7, r3]
    cmp r0, #0
    ble _0804002E
    adds r0, r1, #0
    subs r0, #0x20
    mov r1, r8
    subs r0, r0, r1
    strh r0, [r7]
_0804002E:
    adds r0, r6, #1
    lsls r0, r0, #0x18
    lsrs r6, r0, #0x18
    cmp r6, #2
    bls _0803FF9A
__unk38_is_0_post_loop:
    mov r2, sl              @ r2 = sl = &totem->qUnkA6
    ldrh r0, [r2]
    adds r0, #0x20
    strh r0, [r2]
    ldr r3, [sp, #0x50]     @ r3 = &totem->qUnkA4
    movs r7, #0
    ldrsh r1, [r3, r7]
    ldr r2, [sp, #0x4c]
    ldr r0, [r2]
    adds r0, r0, r1
    str r0, [r2]            @ r2 = totem->qUnk9C += totem->qUnkA4
    mov r3, sl
    movs r7, #0
    ldrsh r1, [r3, r7]
    mov r2, sb              @ r2 = sb = &totem->qUnkA0
    ldr r0, [r2]
    adds r0, r0, r1
    str r0, [r2]            @ totem->qUnkA0 += totem->qUnkA6
    asrs r0, r0, #8
    subs r0, #8
    ldr r3, [sp, #0x4c]
    ldr r1, [r3]
    asrs r1, r1, #8
    ldr r2, _080400B0 @ =sub_801EC3C
    str r2, [sp]
    movs r2, #1
    movs r3, #8
    bl sub_801F100
    adds r2, r0, #0
    cmp r2, #0
    bge _080400E2
    lsls r1, r2, #8
    mov r7, sb              @ r7 = sb = &totem->qUnkA0
    ldr r0, [r7]
    adds r0, r0, r1
    str r0, [r7]            @ totem->qUnkA0 += Q(res)
    mov r0, sl              @ r0 = sl = &totem->qUnkA6
    movs r2, #0
    ldrsh r1, [r0, r2]
    lsls r0, r1, #2
    adds r0, r0, r1
    lsls r0, r0, #4
    rsbs r0, r0, #0
    movs r1, #0x64
    bl Div
    mov r3, sl              @ r3 = sl = &totem->qUnkA6
    strh r0, [r3]
    lsls r0, r0, #0x10
    asrs r1, r0, #0x10
    ldr r0, _080400B4 @ =0xFFFFFF00
    cmp r1, r0
    ble _080400B8
    movs r0, #0
    strh r0, [r3]
    b _080400D0
    .align 2, 0
_080400AC: .4byte gUnknown_080D7F10
_080400B0: .4byte sub_801EC3C
_080400B4: .4byte 0xFFFFFF00
_080400B8:
    ldr r0, _0804019C @ =0xFFFFFE90
    cmp r1, r0
    bge _080400D0
    movs r0, #0x80
    lsls r0, r0, #3
    movs r1, #0x83
    str r1, [sp]
    movs r1, #0x20
    movs r2, #0x80
    movs r3, #0x14
    bl CreateScreenShake
_080400D0:
    ldr r7, [sp, #0x50]     @ r7 = &totem->qUnkA4
    ldrh r1, [r7]
    movs r2, #0
    ldrsh r0, [r7, r2]
    cmp r0, #0
    ble _080400E2
    adds r0, r1, #0
    subs r0, #0x30
    strh r0, [r7]
_080400E2:
    ldr r3, [sp, #0x4c]     @ r3 = &totem->qUnk9C
    ldr r0, [r3]
    ldr r7, [sp, #0x40]     @ r7 = &totem->qUnk90
    str r0, [r7]
    mov r1, sb              @ r1 = &totem->qUnkA0
    ldr r0, [r1]
    movs r2, #0xc8
    lsls r2, r2, #6
    adds r0, r0, r2
    ldr r3, [sp, #0x44]
    str r0, [r3]            @ totem->qUnk94 
    ldr r0, _080401A0 @ =gStageTime
    ldr r0, [r0]
    movs r1, #6
    bl Mod
    adds r7, r0, #0
    cmp r7, #0
    beq _0804010A
    b _0804049E
_0804010A:
    ldr r0, _080401A4 @ =gPseudoRandom
    mov r8, r0
    ldr r0, [r0]
    ldr r6, _080401A8 @ =0x00196225
    adds r2, r0, #0
    muls r2, r6, r2
    ldr r5, _080401AC @ =0x3C6EF35F
    adds r2, r2, r5
    mov r1, r8
    str r2, [r1]
    ldr r3, [sp, #0x4c]     @ r3 = &totem->qUnk9C
    ldr r1, [r3]
    asrs r1, r1, #8
    ldr r4, _080401B0 @ =gCamera
    ldr r0, [r4]
    subs r1, r1, r0
    movs r3, #0x3f
    adds r0, r2, #0
    ands r0, r3
    adds r1, r1, r0
    subs r1, #0x1f
    str r1, [sp, #0x18]
    muls r2, r6, r2
    adds r2, r2, r5
    mov r0, r8
    str r2, [r0]            @ PseudoRandom32()
    mov r0, sb              @ r0 = sb = &totem->qUnkA0
    ldr r1, [r0]
    asrs r1, r1, #8
    ldr r0, [r4, #4]
    subs r1, r1, r0
    adds r0, r2, #0
    ands r0, r3
    adds r1, r1, r0
    subs r1, #0x2d
    str r1, [sp, #0x1c]
    add r0, sp, #4          @ r0 = sp04 = info
    strh r7, [r0, #0x1c]
    adds r4, r0, #0         @ r4 = r0 = info
    muls r2, r6, r2
    adds r2, r2, r5
    adds r1, r2, #0         @ r1 = r2 = PseudoRandom32()
    ands r1, r3
    movs r0, #0xfa
    lsls r0, r0, #2
    subs r0, r0, r1
    strh r0, [r4, #0xc]
    adds r3, r4, #0         @ r3 = r4 = info
    adds r1, r2, #0
    muls r1, r6, r1
    adds r1, r1, r5
    mov r2, r8
    str r1, [r2]
    ldr r0, _080401B4 @ =0x000001FF
    ands r1, r0
    movs r0, #0xb0
    lsls r0, r0, #3
    subs r0, r0, r1
    strh r0, [r3, #0xe]
    ldr r0, _080401B8 @ =0x06012980
    str r0, [sp, #4]
    adds r1, r3, #0
    ldr r0, _080401BC @ =0x0000026B
    strh r0, [r1, #8]
    adds r0, r1, #0
    strh r7, [r0, #0xa]
    str r7, [sp, #8]
    ldr r1, [sp, #0x24]
    adds r1, #0x39
    bl CreateBossParticleWithExplosionUpdate
    b _0804049E
    .align 2, 0
_0804019C: .4byte 0xFFFFFE90
_080401A0: .4byte gStageTime
_080401A4: .4byte gPseudoRandom
_080401A8: .4byte 0x00196225
_080401AC: .4byte 0x3C6EF35F
_080401B0: .4byte gCamera
_080401B4: .4byte 0x000001FF
_080401B8: .4byte 0x06012980
_080401BC: .4byte 0x0000026B
_080401C0:
    movs r6, #0                 @ r6 = i = 0
    ldr r3, _080404C0 @ =sub_801EC3C
    mov r8, r3                  @ r8 = sub_801EC3C
    ldr r7, [sp, #0x24]
    adds r7, #0x9c
    str r7, [sp, #0x4c]         @ sp4C = &totem->qUnk9C
    ldr r0, [sp, #0x24]
    adds r0, #0xa4
    str r0, [sp, #0x50]         @ sp50 = &totem->qUnkA4
    ldr r1, [sp, #0x24]
    adds r1, #0x90
    str r1, [sp, #0x40]         @ sp40 = &totem->qUnk90
    ldr r2, [sp, #0x24]
    adds r2, #0x94
    str r2, [sp, #0x44]         @ sp44 = &totem->qUnk94
    ldr r3, [sp, #0x24]
    adds r3, #0x9a
    str r3, [sp, #0x48]         @ sp48 = &totem->qUnk9A
    ldr r5, [sp, #0x24]
    adds r5, #0x98              @ r5 = totem->qUnk98
    ldr r4, [sp, #0x24]
    adds r4, #0xc               @ r4 = &totem->qDiscPos[0]
    ldr r3, [sp, #0x24]
    adds r3, #0x24              @ r3 = &totem->unk24[0][0]
_080401F0:
    lsls r1, r6, #3
    adds r1, r4, r1
    lsls r0, r6, #2
    adds r0, r3, r0
    movs r7, #0
    ldrsh r2, [r0, r7]
    ldr r0, [r1]
    adds r0, r0, r2
    str r0, [r1]
    adds r0, r6, #1
    lsls r0, r0, #0x18
    lsrs r6, r0, #0x18
    cmp r6, #2
    bls _080401F0
    ldr r0, [sp, #0x50]         @ r0 = sp50 = &totem->qUnkA4
    movs r2, #0
    ldrsh r1, [r0, r2]
    ldr r3, [sp, #0x4c]         @ r3 = &totem->qUnk9C
    ldr r0, [r3]
    adds r0, r0, r1
    str r0, [r3]
    ldr r7, [sp, #0x48]         @ r7 = &totem->qUnk9A
    ldrh r0, [r7]
    adds r0, #0x20
    strh r0, [r7]
    movs r0, #0
    ldrsh r1, [r5, r0]
    ldr r2, [sp, #0x40]
    ldr r0, [r2]
    adds r0, r0, r1
    str r0, [r2]
    movs r3, #0
    ldrsh r1, [r7, r3]
    ldr r7, [sp, #0x44]
    ldr r0, [r7]
    adds r0, r0, r1
    str r0, [r7]
    asrs r0, r0, #8
    subs r0, #0x32
    ldr r1, [r2]
    asrs r1, r1, #8
    mov r2, r8
    str r2, [sp]
    movs r2, #1
    movs r3, #8
    bl sub_801F100
    adds r2, r0, #0
    cmp r2, #0
    blt _08040256
    b _08040360
_08040256:
    ldr r1, [sp, #0x24]         @ r1 = sp24 = totem
    adds r1, #0x38
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    str r1, [sp, #0x3c]         @ sp3C = totem->unk38
    lsls r2, r2, #8
    str r2, [sp, #0x30]
    cmp r0, #0
    bne _08040324
    movs r3, #0
    ldr r7, [sp, #0x24]         @ r7 = sp24 = totem
    adds r7, #0xa0
    mov sb, r7                  @ sb = totem->qUnkA0
    ldr r0, [sp, #0x24]         @ r0 = sp24 = totem
    adds r0, #0x39
    mov sl, r0                  @ sl = totem->unk39
    ldr r7, _080404C4 @ =gPseudoRandom
    ldr r6, _080404C8 @ =0x00196225
    ldr r5, _080404CC @ =0x3C6EF35F
    add r4, sp, #4
    mov r8, r3
_08040284:
    ldr r0, [r7]
    adds r2, r0, #0
    muls r2, r6, r2
    adds r2, r2, r5
    str r2, [r7]                @ r2 = PseudoRandom32
    ldr r0, [sp, #0x4c]
    ldr r1, [r0]
    asrs r1, r1, #8
    mov ip, r1
    ldr r1, _080404D0 @ =gCamera
    ldr r0, [r1]
    mov r1, ip
    subs r1, r1, r0
    mov ip, r1
    adds r0, r2, #0
    movs r1, #0x3f
    ands r0, r1
    add r0, ip
    adds r1, r0, #0
    subs r1, #0x1f
    str r1, [sp, #0x18]
    muls r2, r6, r2
    adds r2, r2, r5
    str r2, [r7]
    mov r0, sb
    ldr r1, [r0]
    asrs r1, r1, #8
    mov ip, r1
    ldr r1, _080404D0 @ =gCamera
    ldr r0, [r1, #4]
    mov r1, ip
    subs r1, r1, r0
    mov ip, r1
    adds r0, r2, #0
    movs r1, #0x3f
    ands r0, r1
    add r0, ip
    adds r1, r0, #0
    subs r1, #0x2d
    str r1, [sp, #0x1c]
    mov r0, r8
    strh r0, [r4, #0x1c]
    muls r2, r6, r2
    adds r2, r2, r5
    adds r1, r2, #0
    movs r0, #0x3f
    ands r1, r0
    movs r0, #0xfa
    lsls r0, r0, #2
    subs r0, r0, r1
    strh r0, [r4, #0xc]
    adds r1, r2, #0
    muls r1, r6, r1
    adds r1, r1, r5
    str r1, [r7]
    ldr r0, _080404D4 @ =0x000001FF
    ands r1, r0
    movs r0, #0xc0
    lsls r0, r0, #3
    subs r0, r0, r1
    strh r0, [r4, #0xe]
    ldr r0, _080404D8 @ =0x06012980
    str r0, [sp, #4]
    ldr r0, _080404DC @ =0x0000026B
    strh r0, [r4, #8]
    mov r1, r8
    strh r1, [r4, #0xa]
    mov r2, r8
    str r2, [sp, #8]
    add r0, sp, #4
    mov r1, sl
    str r3, [sp, #0x58]
    bl CreateBossParticleWithExplosionUpdate
    ldr r3, [sp, #0x58]
    adds r0, r3, #1
    lsls r0, r0, #0x18
    lsrs r3, r0, #0x18
    cmp r3, #8
    bls _08040284
_08040324:
    ldr r3, [sp, #0x3c]
    ldrb r0, [r3]
    cmp r0, #2
    bls _0804033E
    movs r0, #0x80
    lsls r0, r0, #3
    movs r1, #0x83
    str r1, [sp]
    movs r1, #0x20
    movs r2, #0x80
    movs r3, #0x14
    bl CreateScreenShake
_0804033E:
    ldr r7, [sp, #0x44]     @ r7 = &totem->qUnk94
    ldr r0, [r7]
    ldr r1, [sp, #0x30]     @ r1 = 
    adds r0, r0, r1
    str r0, [r7]
    ldr r2, [sp, #0x48]     @ r2 = &totem->qUnk9A
    movs r3, #0
    ldrsh r1, [r2, r3]
    lsls r0, r1, #4
    subs r0, r0, r1
    lsls r0, r0, #2
    rsbs r0, r0, #0
    movs r1, #0x64
    bl Div
    ldr r7, [sp, #0x48]     @ r2 = &totem->qUnk9A
    strh r0, [r7]
_08040360:
    ldr r0, _080404E0 @ =gStageTime
    mov sb, r0
    ldr r0, [r0]
    movs r1, #0xe
    bl Mod
    adds r7, r0, #0
    cmp r7, #0
    bne _08040400
    ldr r6, _080404C4 @ =gPseudoRandom
    ldr r0, [r6]
    ldr r5, _080404C8 @ =0x00196225
    adds r2, r0, #0
    muls r2, r5, r2
    ldr r4, _080404CC @ =0x3C6EF35F
    adds r2, r2, r4
    str r2, [r6]
    ldr r3, [sp, #0x40]
    ldr r1, [r3]
    asrs r1, r1, #8
    ldr r3, _080404D0 @ =gCamera
    ldr r0, [r3]
    subs r1, r1, r0
    mov sl, r1
    movs r0, #0x3f
    mov r8, r0
    adds r0, r2, #0
    mov r1, r8
    ands r0, r1
    add r0, sl
    adds r1, r0, #0
    subs r1, #0x1f
    str r1, [sp, #0x18]
    muls r2, r5, r2
    adds r2, r2, r4
    str r2, [r6]
    ldr r0, [sp, #0x44]
    ldr r1, [r0]
    asrs r1, r1, #8
    ldr r0, [r3, #4]
    subs r1, r1, r0
    movs r0, #0x1f
    ands r0, r2
    adds r1, r1, r0
    subs r1, #0x4b
    str r1, [sp, #0x1c]
    add r0, sp, #4
    strh r7, [r0, #0x1c]
    adds r3, r0, #0
    muls r2, r5, r2
    adds r2, r2, r4
    adds r1, r2, #0
    mov r0, r8
    ands r1, r0
    movs r0, #0xfa
    lsls r0, r0, #2
    subs r0, r0, r1
    strh r0, [r3, #0xc]
    adds r1, r2, #0
    muls r1, r5, r1
    adds r1, r1, r4
    str r1, [r6]
    ldr r0, _080404D4 @ =0x000001FF
    ands r1, r0
    movs r0, #0xb0
    lsls r0, r0, #3
    subs r0, r0, r1
    strh r0, [r3, #0xe]
    ldr r0, _080404D8 @ =0x06012980
    str r0, [sp, #4]
    adds r1, r3, #0
    ldr r0, _080404DC @ =0x0000026B
    strh r0, [r1, #8]
    adds r0, r1, #0
    strh r7, [r0, #0xa]
    str r7, [sp, #8]
    ldr r1, [sp, #0x24]         @ r1 = sp24 = totem
    adds r1, #0x39
    bl CreateBossParticleWithExplosionUpdate
_08040400:
    mov r1, sb
    ldr r0, [r1]
    movs r1, #0xd
    bl Mod
    adds r7, r0, #0
    cmp r7, #0
    bne _0804049E
    ldr r6, _080404C4 @ =gPseudoRandom
    ldr r0, [r6]
    ldr r5, _080404C8 @ =0x00196225
    adds r2, r0, #0
    muls r2, r5, r2
    ldr r4, _080404CC @ =0x3C6EF35F
    adds r2, r2, r4
    str r2, [r6]
    ldr r3, [sp, #0x4c]
    ldr r1, [r3]
    asrs r1, r1, #8
    ldr r3, _080404D0 @ =gCamera
    ldr r0, [r3]
    subs r1, r1, r0
    mov sb, r1
    movs r0, #0x3f
    mov r8, r0
    adds r0, r2, #0
    mov r1, r8
    ands r0, r1
    add r0, sb
    adds r1, r0, #0
    subs r1, #0x1f
    str r1, [sp, #0x18]
    muls r2, r5, r2
    adds r2, r2, r4
    ldr r0, [sp, #0x24]         @ r0 = sp24 = totem
    adds r0, #0xa0
    ldr r1, [r0]
    asrs r1, r1, #8
    ldr r0, [r3, #4]
    subs r1, r1, r0
    movs r0, #0x1f
    ands r0, r2
    adds r1, r1, r0
    subs r1, #0x10
    str r1, [sp, #0x1c]
    add r0, sp, #4
    strh r7, [r0, #0x1c]
    adds r3, r0, #0
    muls r2, r5, r2
    adds r2, r2, r4
    adds r1, r2, #0
    mov r0, r8
    ands r1, r0
    movs r0, #0xfa
    lsls r0, r0, #2
    subs r0, r0, r1
    strh r0, [r3, #0xc]
    adds r1, r2, #0
    muls r1, r5, r1
    adds r1, r1, r4
    str r1, [r6]
    ldr r0, _080404D4 @ =0x000001FF
    ands r1, r0
    movs r0, #0xb0
    lsls r0, r0, #3
    subs r0, r0, r1
    strh r0, [r3, #0xe]
    ldr r0, _080404D8 @ =0x06012980
    str r0, [sp, #4]
    adds r1, r3, #0
    ldr r0, _080404DC @ =0x0000026B
    strh r0, [r1, #8]
    adds r0, r1, #0
    strh r7, [r0, #0xa]
    str r7, [sp, #8]
    ldr r1, [sp, #0x24]         @ r1 = sp24 = totem
    adds r1, #0x39
    bl CreateBossParticleWithExplosionUpdate
_0804049E:
    movs r6, #0
_080404A0:
    lsls r0, r6, #3
    subs r0, r0, r6
    lsls r0, r0, #2
    adds r0, #0x3c
    ldr r1, [sp, #0x24]         @ sp24 = totem
    adds r4, r1, r0
    ldrb r0, [r4, #0x18]
    cmp r0, #0
    bne _080404E4
    ldrh r0, [r4, #0xa]
    adds r0, #0x20
    strh r0, [r4, #0xa]
    adds r6, #1
    str r6, [sp, #0x54]
    b _080405A0
    .align 2, 0
_080404C0: .4byte sub_801EC3C
_080404C4: .4byte gPseudoRandom
_080404C8: .4byte 0x00196225
_080404CC: .4byte 0x3C6EF35F
_080404D0: .4byte gCamera
_080404D4: .4byte 0x000001FF
_080404D8: .4byte 0x06012980
_080404DC: .4byte 0x0000026B
_080404E0: .4byte gStageTime
_080404E4:
    subs r0, #1
    strb r0, [r4, #0x18]
    lsls r0, r0, #0x18
    adds r6, #1
    str r6, [sp, #0x54]
    cmp r0, #0
    bne _080405A0
    movs r3, #0
    ldr r2, [sp, #0x24]         @ r2 = sp24 = totem
    adds r2, #0x39
    mov sl, r2
    ldr r7, _08040618 @ =gPseudoRandom
    mov sb, r7
    ldr r7, _0804061C @ =0x00196225
    ldr r6, _08040620 @ =0x3C6EF35F
    movs r0, #0x3f
    mov r8, r0
    add r5, sp, #4
_08040508:
    mov r1, sb
    ldr r0, [r1]
    adds r2, r0, #0
    muls r2, r7, r2
    adds r2, r2, r6
    ldr r1, [r4]
    asrs r1, r1, #8
    mov ip, r1
    ldr r1, _08040624 @ =gCamera
    ldr r0, [r1]
    mov r1, ip
    subs r1, r1, r0
    mov ip, r1
    adds r0, r2, #0
    mov r1, r8
    ands r0, r1
    add r0, ip
    adds r1, r0, #0
    subs r1, #0x1f
    str r1, [sp, #0x18]
    muls r2, r7, r2
    adds r2, r2, r6
    ldr r1, [r4, #4]
    asrs r1, r1, #8
    mov ip, r1
    ldr r1, _08040624 @ =gCamera
    ldr r0, [r1, #4]
    mov r1, ip
    subs r1, r1, r0
    mov ip, r1
    movs r0, #7
    ands r0, r2
    add r0, ip
    subs r1, r0, #3
    str r1, [sp, #0x1c]
    movs r0, #0
    strh r0, [r5, #0x1c]
    muls r2, r7, r2
    adds r2, r2, r6
    adds r1, r2, #0
    mov r0, r8
    ands r1, r0
    movs r0, #0xfa
    lsls r0, r0, #2
    subs r0, r0, r1
    strh r0, [r5, #0xc]
    adds r1, r2, #0
    muls r1, r7, r1
    adds r1, r1, r6
    mov r2, sb
    str r1, [r2]
    ldr r0, _08040628 @ =0x000001FF
    ands r1, r0
    movs r0, #0x80
    lsls r0, r0, #3
    subs r0, r0, r1
    strh r0, [r5, #0xe]
    ldr r0, _0804062C @ =0x06012980
    str r0, [sp, #4]
    ldr r0, _08040630 @ =0x0000026B
    strh r0, [r5, #8]
    movs r0, #0
    strh r0, [r5, #0xa]
    movs r1, #0
    str r1, [sp, #8]
    add r0, sp, #4
    mov r1, sl
    str r3, [sp, #0x58]
    bl CreateBossParticleWithExplosionUpdate
    ldr r3, [sp, #0x58]
    adds r0, r3, #1
    lsls r0, r0, #0x18
    lsrs r3, r0, #0x18
    cmp r3, #3
    bls _08040508
_080405A0:
    movs r2, #8
    ldrsh r0, [r4, r2]
    ldr r1, [r4]
    adds r1, r1, r0
    str r1, [r4]
    movs r3, #0xa
    ldrsh r2, [r4, r3]
    ldr r0, [r4, #4]
    adds r0, r0, r2
    str r0, [r4, #4]
    asrs r0, r0, #8
    adds r0, #4
    asrs r1, r1, #8
    ldr r2, _08040634 @ =sub_801EC3C
    str r2, [sp]
    movs r2, #1
    movs r3, #8
    bl sub_801F100
    adds r2, r0, #0
    cmp r2, #0
    bge _080405FC
    lsls r1, r2, #8
    ldr r0, [r4, #4]
    adds r0, r0, r1
    str r0, [r4, #4]
    movs r7, #0xa
    ldrsh r1, [r4, r7]
    lsls r0, r1, #3
    adds r0, r0, r1
    lsls r0, r0, #2
    subs r0, r0, r1
    lsls r0, r0, #1
    rsbs r0, r0, #0
    movs r1, #0x64
    bl Div
    strh r0, [r4, #0xa]
    ldrh r1, [r4, #8]
    movs r2, #8
    ldrsh r0, [r4, r2]
    cmp r0, #0
    ble _080405FC
    ldr r3, _08040638 @ =0xFFFFFF00
    adds r0, r1, r3
    strh r0, [r4, #8]
_080405FC:
    ldr r7, [sp, #0x54]
    lsls r0, r7, #0x18
    lsrs r6, r0, #0x18
    cmp r6, #2
    bhi _08040608
    b _080404A0
_08040608:
    add sp, #0x5c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
_08040618: .4byte gPseudoRandom
_0804061C: .4byte 0x00196225
_08040620: .4byte 0x3C6EF35F
_08040624: .4byte gCamera
_08040628: .4byte 0x000001FF
_0804062C: .4byte 0x06012980
_08040630: .4byte 0x0000026B
_08040634: .4byte sub_801EC3C
_08040638: .4byte 0xFFFFFF00

.syntax divided
