#include "core.h"
#include "task.h"
#include "malloc_vram.h"

#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collision.h"

#include "game/stage/spawn_positions.h"
#include "game/stage/terrain_collision.h"
#include "game/stage/stage.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/multiplayer/mp_player.h"
#include "game/stage/item_tasks.h"

#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/multiplayer/mp_attack_1_effect.h"
#include "game/multiplayer/mp_attack_2_effect.h"
#include "game/multiplayer/multipak_connection.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/game_modes.h"
#include "constants/songs.h"

u32 unused_3005838 = 0;
bool8 gShouldSpawnMPAttack2Effect = FALSE;

void Task_CreateMultiplayerPlayer(void);
void TaskDestructor_MultiplayerPlayer(struct Task *);

void sub_8017F34(void);
bool32 sub_8018300(void);

u32 sub_80181E0(void);
void sub_8018120(void);
void sub_8016D20(void);
void sub_801707C(void);
void sub_8017670(void);
void sub_8017C28(void);
void LaunchPlayer(s16);

#if COLLECT_RINGS_ROM
// Can't be sure this was defined here, but it works as it
// may have something to do with the characters
const u16 gUnknown_02015B18[] = { 0x55, 0x59, 0x5D, 0x61 };
#endif

void CreateMultiplayerPlayer(u8 id)
{
    u16 *p;
    Sprite *s;
    struct Task *t = TaskCreate(Task_CreateMultiplayerPlayer, sizeof(MultiplayerPlayer), 0x2000, 0, TaskDestructor_MultiplayerPlayer);
    MultiplayerPlayer *mpp = TASK_DATA(t);
    mpp->unk56 = id;
    mpp->unk54 = 0x40;
    mpp->unk44 = 0;
    mpp->unk48 = 0;
    mpp->unk66 = 0;
    mpp->unk68 = 0;
    mpp->unk6A = 0;

    if (id != SIO_MULTI_CNT->id) {
        mpp->unk60 = 30;
    } else {
        mpp->unk60 = 0;
    }

    mpp->unk57 = 128;
    mpp->unk61 = 0;
    mpp->unk5C = 0;
    mpp->unk64 = mpp->unk56;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        mpp->unk5C |= 2;
    }

    mpp->pos.x = 0;
    mpp->pos.y = 0;

#ifndef COLLECT_RINGS_ROM
    if (IS_SINGLE_PLAYER || gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
        mpp->pos.x = gSpawnPositions[gCurrentLevel][0];
        mpp->pos.y = gSpawnPositions[gCurrentLevel][1];
    } else
#endif
    {
        switch (SIO_MULTI_CNT->id) {
            case 0: {
                mpp->pos.x = 232;
                mpp->pos.y = 829;
                break;
            }
            case 1: {
                mpp->pos.x = 1585;
                mpp->pos.y = 279;
                break;
            }
            case 2: {
                mpp->pos.x = 1585;
                mpp->pos.y = 926;
                break;
            }
            case 3: {
                mpp->pos.x = 232;
                mpp->pos.y = 348;
                break;
            }
        }
    }

    s = &mpp->s;
    s->oamFlags = SPRITE_OAM_ORDER(16);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = mpp->unk56;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s->graphics.anim = 0;
    s->variant = 0;
    s->x = 0;
    s->y = 0;

    mpp->transform.qScaleY = 256;
#ifndef COLLECT_RINGS_ROM
    s->graphics.anim = gPlayerCharacterIdleAnims[gMultiplayerCharacters[mpp->unk56]];
#endif

    if (mpp->unk56 != SIO_MULTI_CNT->id) {
        s->graphics.dest = VramMalloc(64);
        s->frameFlags |= SPRITE_FLAG_MASK_MOSAIC;
    } else {
        s->graphics.dest = (void *)OBJ_VRAM0;
    }

    UpdateSpriteAnimation(s);
    gMultiplayerPlayerTasks[mpp->unk56] = t;
}

#ifndef COLLECT_RINGS_ROM
// around 70%: https://decomp.me/scratch/KNjEN
NONMATCH("asm/non_matching/game/multiplayer/mp_player__Task_CreateMultiplayerPlayer.inc", void Task_CreateMultiplayerPlayer(void))
#else
NONMATCH("asm/non_matching/game/multiplayer/mp_player__Task_CreateMultiplayerPlayer__CollectRings.inc",
         void Task_CreateMultiplayerPlayer(void))
#endif
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    SpriteTransform *transform = &mpp->transform;
    s32 id = mpp->unk56;
    union MultiSioData *recv = &gMultiSioRecv[id];

    u32 i;

    if ((gMultiSioStatusFlags & MULTI_SIO_RECV_ID(id))) {
        mpp->unk61 = 0;
        if (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(id) && recv->pat0.unk0 == 0x5000) {
            s32 x;
            mpp->unk61 = 0;
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                mpp->unk44 = recv->pat4.x - mpp->pos.x;
                mpp->unk48 = recv->pat4.y - mpp->pos.y;
                mpp->pos.x = recv->pat4.x;
                mpp->pos.y = recv->pat4.y;

            } else {
                mpp->unk44 = recv->pat4.x - mpp->pos.x;
                mpp->unk48 = recv->pat4.y - mpp->pos.y;
                x = ABS(mpp->unk44);

                if (x > 15) {
                    x = ABS(mpp->unk48);
                    if (mpp->unk44 > 0 && mpp->unk48 > 0) {
                        mpp->unk44 = recv->pat4.x - mpp->pos.x - 1440;
                        mpp->unk48 = recv->pat4.y - mpp->pos.y - 864;
                    } else {
                        if (mpp->unk44 < 0 && mpp->unk48 < 0) {
                            mpp->unk44 = recv->pat4.x - mpp->pos.x - 1440;
                            mpp->unk48 = recv->pat4.y - mpp->pos.y - 864;
                        }
                    }
                }
                mpp->pos.x = recv->pat4.x;
                mpp->pos.y = recv->pat4.y;
            }
            if (ABS(mpp->unk44) < 0x41) {
                if (ABS(mpp->unk48) >= 0x40) {
                    mpp->unk66 = Q(mpp->unk44);
                    mpp->unk68 = Q(mpp->unk48);
                } else {
                    mpp->unk66 = 0;
                    mpp->unk68 = 0;
                }
            } else {
                mpp->unk66 = 0;
                mpp->unk68 = 0;
            }
            {
                u8 val = recv->pat4.unk10 & ~mpp->unk57;
                if (SIO_MULTI_CNT->id == mpp->unk56) {
                    if (val & 2 && !(mpp->unk57 & 2)) {
                        CreateItemTask_Invincibility(mpp->unk56);
                    }
                    if (val & 0x50 && !(mpp->unk57 & 2)) {
                        CreateItemTask_Confusion(mpp->unk56);
                    }
                }
            }
            mpp->unk57 = recv->pat4.unk10;
            // TODO: not pat4
            mpp->unk54 = recv->pat4.unk8;

            if (SIO_MULTI_CNT->id != mpp->unk56) {
                mpp->unk64 = ((recv->pat4.unk8) & 0x600) >> 9;
            } else {
                if (SIO_MULTI_CNT->id != mpp->unk64) {
                    MultiplayerPlayer *mpp2 = TASK_DATA(gMultiplayerPlayerTasks[mpp->unk64]);
                    if (SIO_MULTI_CNT->id == mpp2->unk64) {
                        mpp2->unk64 = SIO_MULTI_CNT->id;
                        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        gPlayer.moveState &= ~MOVESTATE_20;
                        gPlayer.moveState &= ~MOVESTATE_4;
                        gPlayer.moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        gPlayer.moveState &= ~MOVESTATE_400;
                        gPlayer.moveState &= ~MOVESTATE_100;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                        gPlayer.unk61 = 0;
                        gPlayer.unk62 = 0;

                        gPlayer.charState = CHARSTATE_WALK_A;
                        gPlayer.moveState |= MOVESTATE_800000;
                        gPlayer.callback = Player_TouchGround;
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        mpp->unk5C &= ~4;
                        if (mpp2->unk5C & 4) {
                            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                            mpp2->unk5C &= ~4;
                        }
                    }
                }
            }

            {
                u32 anim;
                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    gMultiplayerCharRings[mpp->unk56] = I(recv->pat4.unk6);
                    mpp->unk6A = recv->pat4.unk6;
                    anim = gPlayerCharacterIdleAnims[mpp->unk6A];
                } else {
                    anim = recv->pat4.unk6;
                }

                if (s->graphics.anim != anim || s->variant != (recv->pat4.unkB % 16)) {
                    s->hitboxes[0].index = -1;
                    s->hitboxes[1].index = -1;
                }

                if (mpp->unk54 & 4) {
                    if (mpp->unk5C & 4) {
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        mpp->unk5C &= ~4;
                    }

                    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                    }
                }

                s->graphics.anim = anim;
                s->variant = recv->pat4.unk6;
                mpp->unk58[0] = recv->pat4.unkB >> 4;
                s->animSpeed = recv->pat4.unkC;
                transform->rotation = recv->pat4.unkD << 2;
            }
        } else {
            goto thing;
            // mpp->pos.x += I(mpp->unk66);
            // mpp->pos.y += I(mpp->unk68);

            // if (mpp->unk61++ > 30) {
            //     // TODO: macro this
            //     TasksDestroyAll();
            //     PAUSE_BACKGROUNDS_QUEUE();
            //     gUnknown_03005390 = 0;
            //     PAUSE_GRAPHICS_QUEUE();
            //     LinkCommunicationError();
            //     return;
            // }
        }
    } else {
    thing:
        mpp->pos.x += I(mpp->unk66);
        mpp->pos.y += I(mpp->unk68);

        if (mpp->unk61++ > 30) {
            // TODO: macro this
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            LinkCommunicationError();
            return;
        }
    }

    {
        s8 i;
        for (i = 3; i >= 0; i--) {
            if (s->graphics.anim >= gPlayerCharacterIdleAnims[i]) {
                break;
            }
        }

        s->x = mpp->pos.x - gCamera.x;
        s->y = mpp->pos.y - gCamera.y;
        transform->x = mpp->pos.x - gCamera.x;
        transform->y = mpp->pos.y - gCamera.y;

        if (mpp->unk54 & 0x800) {
            s->prevVariant = -1;
            s->hitboxes[0].index = -1;
            s->hitboxes[1].index = -1;
        }
        UpdateSpriteAnimation(s);
    }

    if (gGameMode == GAME_MODE_TEAM_PLAY && gUnknown_030054B4[SIO_MULTI_CNT->id] == -1) {
        u32 someBool = TRUE;
        for (i = 0; i < 4; i++) {
            if (gMultiplayerPlayerTasks[i] == NULL) {
                break;
            }

            {
                MultiplayerPlayer *mpp2 = TASK_DATA(gMultiplayerPlayerTasks[i]);
                if ((gMultiplayerConnections & (0x10 << (i))) >> ((i + 4))
                        != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)
                    && !(mpp2->unk54 & 0x100)) {

                    someBool = FALSE;
                    break;
                }
            }
        }

        if (someBool) {
            ((RoomEvent *)CreateRoomEvent())->type = 7;
        }
    }

    if (!(gStageFlags & 1) && !(mpp->unk54 & 0x80000004)) {
        if (!(gPlayer.itemEffect & 0x80)) {
            if (!(mpp->unk5C & 1) && (gPlayer.timerInvulnerability == 0)
                && !(gPlayer.moveState & (MOVESTATE_IA_OVERRIDE | MOVESTATE_DEAD))) {
                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (mpp->unk56 != SIO_MULTI_CNT->id) {
                        switch (gMultiplayerCharacters[mpp->unk56]) {

                            case CHARACTER_SONIC:
                            case CHARACTER_CREAM:
                                sub_8016D20();
                                break;
                            case CHARACTER_TAILS:
                                sub_801707C();
                                break;
                            case CHARACTER_KNUCKLES:
                                sub_8017670();
                                break;
                            case CHARACTER_AMY:
                                sub_8017C28();
                                break;
                        }
                    }
                } else {
                    if (mpp->unk56 != SIO_MULTI_CNT->id) {
                        sub_8018120();
                    }
                }
            }
        }
    } else {
        if ((gPlayer.itemEffect & PLAYER_ITEM_EFFECT__TELEPORT) || (mpp->unk57 & 0x80) || gPlayer.timerInvincibility == 0
            || !PLAYER_IS_ALIVE || gUnknown_030054B4[mpp->unk56] != -1) {
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (mpp->unk56 == SIO_MULTI_CNT->id && gMultiplayerCharacters[mpp->unk56] == CHARACTER_TAILS
                    && gMultiplayerCharacters[mpp->unk56] == CHARACTER_KNUCKLES && mpp->unk5C & 4) {
                    mpp->unk5C &= ~0x6;
                    if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__TELEPORT)) {
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                    }
                    {
                        RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_UNKNOWN;
                        roomEvent->unk1 = mpp->unk56;
                        roomEvent->unk2 = 0;
                    }
                }
                if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                    gPlayer.moveState &= ~(MOVESTATE_STOOD_ON_OBJ | MOVESTATE_FACING_LEFT);
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                    mpp->unk60 = 30;
                }
            } else {
                if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                    gPlayer.moveState &= ~(MOVESTATE_FLIP_WITH_MOVE_DIR | MOVESTATE_IN_AIR);
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                    mpp->unk60 = 30;
                }
            }
        }
    }

    if (mpp->unk54 & 1) {
        s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
        s->frameFlags = gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE;
        if (mpp->unk54 & 2) {
            transform->qScaleX = -256;
        } else {
            transform->qScaleX = +256;
        }

        if (mpp->unk54 & 8) {
            transform->qScaleX = -transform->qScaleX;
        }
        TransformSprite(s, transform);
    } else {
        s->frameFlags &= ~0x30;
        if (mpp->unk54 & 2) {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
        }
        if (mpp->unk54 & 8) {
            s->frameFlags |= SPRITE_FLAG_MASK_Y_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_Y_FLIP;
        }
    }

    s->frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    s->frameFlags |= (mpp->unk54 & 0x30) << 8;

    if (!(mpp->unk54 & 0x40)
        && ((gStageTime & 2 || mpp->unk57 & 0x20 || mpp->unk5C & 1 || gUnknown_030054B4[mpp->unk56] != -1)
            || (mpp->unk60 == 0 && !(mpp->unk54 & 4) && !(mpp->unk5C & 2)))) {
        s->oamFlags = SPRITE_OAM_ORDER(16);
        if (mpp->unk54 & 0x80) {
            s->oamFlags |= 0x40;
        }

        s->frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
        if (mpp->unk57 & 0x20
            && (gGameMode != GAME_MODE_TEAM_PLAY
                || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
                    != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
            && mpp->unk60 == 0 && mpp->unk56 != SIO_MULTI_CNT->id) {
            s->frameFlags |= SPRITE_FLAG(OBJ_MODE, 2);
            gDispCnt |= DISPCNT_OBJWIN_ON;
            gWinRegs[WINREG_WINOUT] = (WINOUT_WINOBJ_BG3 | WINOUT_WIN01_ALL);
        }

        if ((u16)(s->x + 63) < (DISPLAY_WIDTH + 127) && (s->y > -64 && s->y < DISPLAY_HEIGHT + 64)) {
            DisplaySprite(s);
        } else if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            if ((gCamera.x + s->x) < 0x3C1) {
                s->x += 0x5A0;
                transform->x += 0x5A0;
                s->y += 0x360;
                transform->y += 0x360;
            } else {
                s->x -= 0x5A0;
                transform->x -= 0x5A0;
                s->y -= 0x360;
                transform->y -= 0x360;
            }

            if ((u16)(s->x + 63) < (DISPLAY_WIDTH + 127) && (s->y > -64 && s->y < DISPLAY_HEIGHT + 64)) {
                if (mpp->unk54 & 1) {
                    TransformSprite(s, transform);
                }
                DisplaySprite(s);
            }
        }
    }

    if (gShouldSpawnMPAttackEffect != FALSE) {
        CreateMPAttackEffect();
        gShouldSpawnMPAttackEffect = FALSE;
    }

    if (gShouldSpawnMPAttack2Effect != FALSE) {
        CreateMPAttack2Effect();
        gShouldSpawnMPAttack2Effect = FALSE;
    }
}
END_NONMATCH

#ifndef COLLECT_RINGS_ROM
void sub_8016D20(void)
{
    Sprite *sprPlayer = &gPlayer.spriteInfoBody->s;
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    SpriteTransform *transform = &mpp->transform;
    u32 val;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        sub_8017F34();
    }

    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4))) {
        if (!sub_8018300()) {
            return;
        }

        if (!(mpp->unk4C & MOVESTATE_20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (mpp->unk60 == 0) {
        if (sub_80181E0() != 0) {
            if (mpp->unk4C & MOVESTATE_20) {
                gPlayer.moveState &= ~MOVESTATE_20;
                mpp->unk4C = 0;
            }

            if (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_DASH, CHARACTER_SONIC)) {
                return;
            }

            gPlayer.charState = CHARSTATE_WALK_A;
            gPlayer.callback = Player_TouchGround;
            gPlayer.unk61 = 0;
            gPlayer.unk62 = 0;

            if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (!GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) > mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) < mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = Q_8_8(12);
                gPlayer.qSpeedAirX = Q_8_8(12);
            } else {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = -Q_8_8(12);
                gPlayer.qSpeedAirX = -Q_8_8(12);
            }
            mpp->unk60 = 30;
        } else {
            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
                return;
            }

            if (gPlayer.unk61 != 0 && (gPlayer.character == CHARACTER_TAILS || gPlayer.character == CHARACTER_KNUCKLES)) {
                return;
            }

            val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

            if (mpp->unk4C & MOVESTATE_20 && !(val & MOVESTATE_20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }

            mpp->unk4C = val;

            if (val & MOVESTATE_IGNORE_INPUT) {
                mpp->unk60 = 30;
            }

            if (!(val & (MOVESTATE_10000 | MOVESTATE_20 | MOVESTATE_STOOD_ON_OBJ))) {
                return;
            }

            if (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_DASH, CHARACTER_SONIC)) {
                return;
            }
            gPlayer.charState = CHARSTATE_WALK_A;
            gPlayer.callback = Player_TouchGround;
            gPlayer.unk61 = 0;
            gPlayer.unk62 = 0;

            if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (!GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) > mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) < mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = Q(12);
                gPlayer.qSpeedAirX = Q(12);
            } else {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = -Q(12);
                gPlayer.qSpeedAirX = -Q(12);
            }
            mpp->unk60 = 30;
        }
    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if ((mpp->unk4C & MOVESTATE_20) && !(val & MOVESTATE_20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;
        return;
    }
}

#define SOME_INVERTED_GRAVITY_MACRO (!GRAVITY_IS_INVERTED != !(mpp->unk54 & 8) || !(mpp->unk5C & 0x100) != !GRAVITY_IS_INVERTED)

void sub_801707C(void)
{

    Sprite *playerSprite, *s;
    MultiplayerPlayer *mpp;

    bool8 someBool;
    u32 moveStateVal, val;
    s32 result;
    u8 unusedByte;

    playerSprite = &gPlayer.spriteInfoBody->s;
    someBool = FALSE;
    mpp = TASK_DATA(gCurTask);
    s = &mpp->s;
    moveStateVal = (gPlayer.moveState >> 5) & 1;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        sub_8017F34();
        someBool = TRUE;
    }

    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4))) {
        if (sub_8018300() == 0) {
            return;
        }

        if (!(mpp->unk4C & MOVESTATE_20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (gPlayer.unk61 != 0 && gPlayer.character == CHARACTER_KNUCKLES) {
        return;
    }

    if (mpp->unk60 == 0 || (mpp->unk5C & 4)) {
        u32 someOtherBool;

        mpp->unk60 = 0;

        if (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_TAILS)
            && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_TAILS)
            && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_TAILS)) {
            if (sub_80181E0()) {
                if (!(mpp->unk4C & 0x20)) {
                    return;
                }

                gPlayer.moveState &= ~MOVESTATE_20;
                mpp->unk4C = 0;
                return;
            }
        }

        if (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_TAILS)
            && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_TAILS)
            && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_TAILS) && HITBOX_IS_ACTIVE(playerSprite->hitboxes[1])
            && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            return;
        }

        someOtherBool = (gPlayer.moveState >> 1) & 1;
        val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

        if ((mpp->unk4C & 0x20) && !(val & 0x20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;

        if (val & 0x200000) {
            mpp->unk60 = 30;
        }

        if (!(mpp->unk5C & 4)) {
            if ((someOtherBool || someBool)
                && (val & 0x10028
                    && (s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_TAILS)
                        || s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_TAILS)
                        || s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_TAILS))
                    && (!!GRAVITY_IS_INVERTED != !(mpp->unk54 & 8)))) {

                s32 y;
                if (!GRAVITY_IS_INVERTED) {
                    result = sub_801E4E4(MAX(I(gPlayer.qWorldY), mpp->pos.y) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, 8,
                                         &unusedByte, sub_801EE64);
                } else {
                    result = sub_801E4E4(MIN(I(gPlayer.qWorldY), mpp->pos.y) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8,
                                         &unusedByte, sub_801EE64);
                }

                if (result - gPlayer.spriteOffsetY > 0) {
                    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
                    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;

                    mpp->unk5C |= 4;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

                    {
                        RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_UNKNOWN;
                        roomEvent->unk1 = mpp->unk56;
                        roomEvent->unk2 = 1;
                    }

                    if (!GRAVITY_IS_INVERTED) {
                        mpp->unk5C &= ~0x100;
                    } else {
                        mpp->unk5C |= 0x100;
                    }
                }
            }

            if (!(mpp->unk5C & 4)) {
                return;
            }
        }

        gPlayer.charState = CHARSTATE_IDLE;
        gPlayer.callback = Player_TouchGround;
        gPlayer.moveState |= MOVESTATE_IN_AIR;
        gPlayer.unk61 = 0;
        gPlayer.unk62 = 0;

        if (Player_TryJump(&gPlayer)) {
            mpp->unk60 = 30;
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            mpp->unk5C &= ~4;

        } else {
            if ((s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_TAILS)
                 && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_TAILS)
                 && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_TAILS))
                || I(gPlayer.qWorldX) <= gCamera.minX || I(gPlayer.qWorldX) >= gCamera.maxX || SOME_INVERTED_GRAVITY_MACRO
                || moveStateVal != 0) {
                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                mpp->unk5C &= ~4;
                gPlayer.charState = CHARSTATE_IDLE;
                gPlayer.callback = Player_TouchGround;
                if (SOME_INVERTED_GRAVITY_MACRO) {
                    gPlayer.timerInvulnerability = 60;
                }
            } else {
                if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) {
                    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                    mpp->unk5C &= ~4;
                } else {
                    s32 x, y;
                    bool32 invertedGravity = GRAVITY_IS_INVERTED;
                    mpp->unk5C |= 4;
                    x = Q(mpp->pos.x);

                    // TODO: potential macro
                    if (!invertedGravity) {
                        y = Q(mpp->pos.y + (s->hitboxes[0].bottom) + 17);
                        result = sub_801E4E4(I(gPlayer.qWorldY) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, 8, &unusedByte,
                                             sub_801EE64);

                        if (result < 0) {
                            y += Q(result);
                            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                            gPlayer.moveState |= MOVESTATE_IN_AIR;
                            mpp->unk5C &= ~4;
                        }

                    } else {
                        y = Q(mpp->pos.y + (s->hitboxes[0].top) - 17);
                        result = sub_801E4E4(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8, &unusedByte,
                                             sub_801EE64);

                        if (result < 0) {
                            y -= Q(result);
                            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                            gPlayer.moveState |= MOVESTATE_IN_AIR;
                            mpp->unk5C &= ~4;
                        }
                    }
                    gPlayer.qWorldX = x;
                    gPlayer.qWorldY = y;
                    if (mpp->unk5C & 4) {
#ifndef NON_MATCHING
                        // thanks pidgey
                        u32 speed = 0;
                        gPlayer.qSpeedAirX = speed;
                        invertedGravity = GRAVITY_IS_INVERTED;
                        if (!invertedGravity) {
                            invertedGravity = FALSE;
                        } else {
                            invertedGravity = FALSE;
                        }
                        gPlayer.qSpeedAirY = speed;
                        asm("" ::: "r2");
#else
                        gPlayer.qSpeedAirX = 0;
                        gPlayer.qSpeedAirY = 0;
#endif

                        gPlayer.moveState &= ~MOVESTATE_20;
                    }
                }
            }
        }

        if (!(mpp->unk5C & 4)) {
            RoomEvent_Unknown *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_UNKNOWN;
            roomEvent->unk1 = mpp->unk56;
            roomEvent->unk2 = 0;
        }

        if (!GRAVITY_IS_INVERTED) {
            mpp->unk5C &= ~0x100;
        } else {
            mpp->unk5C |= 0x100;
        }
    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if ((mpp->unk4C & MOVESTATE_20) && !(val & MOVESTATE_20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;
    }
}

void sub_8017670(void)
{
    Sprite *playerSprite, *s;
    MultiplayerPlayer *mpp;

    u32 moveStateVal, val;
    s32 result;
    u8 unusedByte;

    playerSprite = &gPlayer.spriteInfoBody->s;
    mpp = TASK_DATA(gCurTask);
    s = &mpp->s;
    moveStateVal = (gPlayer.moveState >> 5) & 1;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        sub_8017F34();
    }

    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4))) {
        if (!sub_8018300()) {
            return;
        }

        if (!(mpp->unk4C & 0x20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (gPlayer.unk61 != 0 && gPlayer.character == CHARACTER_TAILS) {
        return;
    }

    if (mpp->unk60 == 0 || (mpp->unk5C & 4)) {
        mpp->unk60 = 0;
        if (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_KNUCKLES)
            && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES)
            && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_KNUCKLES)) {
            if (sub_80181E0()) {
                if (!(mpp->unk4C & 0x20)) {
                    return;
                }
                gPlayer.moveState &= ~MOVESTATE_20;
                mpp->unk4C = 0;
                return;
            }

            if ((s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_KNUCKLES)
                 && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES)
                 && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_KNUCKLES))
                && HITBOX_IS_ACTIVE(playerSprite->hitboxes[1]) && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
                return;
            }
        }

        {
            s8 rect[4] = { -gPlayer.spriteOffsetX, -gPlayer.spriteOffsetY, gPlayer.spriteOffsetX, gPlayer.spriteOffsetY };
            val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

            if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }

            mpp->unk4C = val;

            if (val & 0x200000) {
                mpp->unk60 = 30;
            }

            if (Coll_Player_Entity_RectIntersection(s, mpp->pos.x, mpp->pos.y, &gPlayer, (Rect8 *)rect)) {
                u8 temp = ((mpp->unk54 >> 7) & 1);
                if ((temp == gPlayer.layer)
                    && (s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_KNUCKLES)
                        || s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES)
                        || s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_KNUCKLES))
                    && !GRAVITY_IS_INVERTED == !(mpp->unk54 & 8)) {
                    if ((!GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) > mpp->pos.y)
                        || (GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) < mpp->pos.y)) {
                        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                        gPlayer.qSpeedGround = 0;
                        gPlayer.qSpeedAirX = 0;
                        gPlayer.charState = CHARSTATE_IDLE;
                        gPlayer.unk61 = 0;
                        gPlayer.unk62 = 0;
                        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                        } else {
                            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                        }
                        if (!(mpp->unk5C & 4)) {
                            {
                                RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                                roomEvent->type = ROOMEVENT_TYPE_UNKNOWN;
                                roomEvent->unk1 = mpp->unk56;
                                roomEvent->unk2 = 1;
                            }
                            if (!GRAVITY_IS_INVERTED) {
                                mpp->unk5C &= ~0x100;
                            } else {
                                mpp->unk5C |= 0x100;
                            }
                        }
                        mpp->unk5C |= 4;
                    }
                }
            }

            if (!(mpp->unk5C & 4)) {
                return;
            }

            if (Player_TryJump(&gPlayer) != 0) {
                mpp->unk60 = 30;
                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                mpp->unk5C &= ~0x4;
                return;
            }

            if ((s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_KNUCKLES)
                 && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES)
                 && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_KNUCKLES))
                || I(gPlayer.qWorldX) <= gCamera.minX || I(gPlayer.qWorldX) >= gCamera.maxX || SOME_INVERTED_GRAVITY_MACRO
                || moveStateVal != 0) {
                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                mpp->unk5C &= ~4;
                gPlayer.charState = CHARSTATE_IDLE;
                if (SOME_INVERTED_GRAVITY_MACRO) {
                    mpp->unk60 = 30;
                }

                return;
            }
            {
                s32 x, y;
                s32 playerUnk17 = gPlayer.spriteOffsetY;
                bool32 gravityInverted = GRAVITY_IS_INVERTED;
                // mpp->unk5C |= 4;
                x = QS(mpp->pos.x);

                // TODO: potential macro
                if (!(gravityInverted)) {
                    y = QS((mpp->pos.y + (s->hitboxes[0].top)) - rect[3]);
                    result = sub_801F100((mpp->pos.y + (s->hitboxes[0].top) - rect[3]) - playerUnk17, I(x), gPlayer.layer, -8, sub_801EC3C);

                    if (result < 0) {
                        y -= QS(result);
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        mpp->unk5C &= ~4;
                    }
                } else {
                    y = QS(mpp->pos.y + (s->hitboxes[0].bottom) + rect[3]);
                    result = sub_801F100(((mpp->pos.y + (s->hitboxes[0].bottom) + rect[3]) + playerUnk17), I(x), gPlayer.layer, 8,
                                         sub_801EC3C);

                    if (result < 0) {
                        y += QS(result);
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        mpp->unk5C &= ~4;
                    }
                }
                gPlayer.qWorldX = x;
                gPlayer.qWorldY = y;
            }

            if ((mpp->unk5C & 4)) {
                gPlayer.moveState |= MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState &= ~MOVESTATE_4;
                gPlayer.moveState &= ~MOVESTATE_IN_AIR;

                gPlayer.stoodObj = s;
                gPlayer.qSpeedAirY = 0;

                if ((s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
                    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                } else {
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                }
            }

            if (!(mpp->unk5C & 4)) {
                RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_UNKNOWN;
                roomEvent->unk1 = mpp->unk56;
                roomEvent->unk2 = 0;
            }

            if (!GRAVITY_IS_INVERTED) {
                mpp->unk5C &= ~0x100;
            } else {
                mpp->unk5C |= 0x100;
            }
        }
    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if ((mpp->unk4C & MOVESTATE_20) && !(val & MOVESTATE_20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;
    }
}

void sub_8017C28(void)
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    u32 val;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        sub_8017F34();
    }

    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4))) {
        if (!sub_8018300()) {
            return;
        }

        if (!(mpp->unk4C & 0x20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (mpp->unk60 == 0) {
        if (!HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            if (gPlayer.unk61 != 0 && (gPlayer.character == CHARACTER_TAILS || gPlayer.character == CHARACTER_KNUCKLES)) {
                return;
            }

            val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

            if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }
            mpp->unk4C = val;
            return;
        } else {
            if (gPlayer.unk61 != 0 && (gPlayer.character == CHARACTER_TAILS || gPlayer.character == CHARACTER_KNUCKLES)) {
                return;
            }
            val = sub_800DA4C(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
            if ((val & 2) && !(gPlayer.moveState & MOVESTATE_IN_AIR) && gPlayer.rotation == 0) {
                if (s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOSTLESS_ATTACK, CHARACTER_AMY)) {
                    LaunchPlayer(-Q_8_8(7.5));
#ifndef NON_MATCHING
                    goto lab;
#else
                    mpp->unk60 = 30;
                    return;
#endif
                }

                if (s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_AMY)) {
                    LaunchPlayer(-Q_8_8(10.5));
#ifndef NON_MATCHING
                    goto lab;
#else
                    mpp->unk60 = 30;
                    return;
#endif
                }
            }

            if ((val & 1)) {
                if ((val & 0x20000)) {
                    if (gPlayer.qSpeedAirX > 0) {
                        gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                        gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                    }
                } else if ((val & 0x40000)) {
                    if (gPlayer.qSpeedAirX < 0) {
                        gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                        gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                    }
                }

                if (val & 0x100000 && gPlayer.qSpeedAirY > 0) {
                    gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
                }
#ifndef NON_MATCHING
            lab:
#endif
                mpp->unk60 = 30;
                return;
            } else {
                val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

                if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                    gPlayer.moveState &= ~MOVESTATE_20;
                }

                mpp->unk4C = val;
                return;
            }
        }

    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if (mpp->unk4C & 0x20 && !(val & 0x20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }
        mpp->unk4C = val;
    }
}

void sub_8017F34(void)
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    MultiplayerPlayer *otherMpp;
    s32 result;

    if ((ABS(mpp->unk44) > 0x80) || (ABS(mpp->unk48) > 0x80)) {
        gPlayer.moveState &= ~0x8;
        gPlayer.moveState |= 2;
        mpp->unk60 = 30;
        return;
    }

    otherMpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    if ((otherMpp->unk54 & 0x80) != (mpp->unk54 & 0x80)) {
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.stoodObj = (void *)-1;
        mpp->unk64 = mpp->unk56;
        return;
    }

    gPlayer.qWorldX += Q(mpp->unk44);
    if (!GRAVITY_IS_INVERTED) {
        gPlayer.qWorldY += Q(mpp->unk48) + Q(1);
    } else {
        gPlayer.qWorldY += Q(mpp->unk48) - Q(2);
    }

    if (mpp->unk48 < 0) {
        result = sub_801F100(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8, sub_801EC3C);
        if (result < 0) {
            gPlayer.qWorldY -= Q(result);
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
            mpp->unk60 = 30;
        }
    } else if (mpp->unk48 > 0) {
        result = sub_801F100(I(gPlayer.qWorldY) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, 8, sub_801EC3C);
        if (result < 0) {
            gPlayer.qWorldY += Q(result);
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
            mpp->unk60 = 30;
        }
    }

    if (mpp->unk44 < 0) {
        result = sub_801F100(I(gPlayer.qWorldX) - gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, -8, sub_801EB44);
        if (result < 0) {
            gPlayer.qWorldX -= Q(result);
        }
        return;
    } else if (mpp->unk44 > 0) {
        result = sub_801F100(I(gPlayer.qWorldX) + gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, 8, sub_801EB44);
        if (result < 0) {
            gPlayer.qWorldX += Q(result);
        }
        return;
    }
}
#endif

void sub_8018120(void)
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        MultiplayerPlayer *otherMpp;
        gPlayer.qWorldX += Q(mpp->unk44);
        gPlayer.qWorldY += Q(mpp->unk48) + Q(1);

        otherMpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);

        if ((otherMpp->unk54 & 0x80) != (mpp->unk54 & 0x80)) {
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.stoodObj = (void *)-1;
            mpp->unk64 = mpp->unk56;
        }
    }
    if (sub_8018300() && (mpp->unk4C & 0x20)) {
        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
    }
}

#ifndef COLLECT_RINGS_ROM
bool32 sub_80181E0(void)
{
    Sprite *sprPlayer = &gPlayer.spriteInfoBody->s;
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;

    u32 val;

    if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
        val = sub_800DA4C(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);

        if ((val & 1)) {
            if (gPlayer.unk61 == 0 && (val & 0x20000)) {
                if (gPlayer.qSpeedAirX > 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            } else if (gPlayer.unk61 == 0 && (val & 0x40000)) {
                if (gPlayer.qSpeedAirX < 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            }

            if (val & 0x100000 && gPlayer.qSpeedAirY > 0) {
                gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
            }
            mpp->unk60 = 30;
            return TRUE;
        }
    }

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.moveState |= MOVESTATE_IN_AIR;
    }
    return FALSE;
}
#endif

bool32 sub_8018300(void)
{
    MultiplayerPlayer *mpp;
    Sprite *s, *sprPlayer;
    u32 val;

    sprPlayer = &gPlayer.spriteInfoBody->s;
    mpp = TASK_DATA(gCurTask);
    s = &mpp->s;

    if (mpp->unk60 == 0) {
        u32 val2 = sub_800DA4C(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && !(val2 & 3)) {
            if (mpp->pos.x > 960) {
                val2 = sub_800DA4C(s, mpp->pos.x - 1440, mpp->pos.y - 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
            } else {
                val2 = sub_800DA4C(s, mpp->pos.x + 1440, mpp->pos.y + 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
            }
        }

        if (val2 & 1) {
            if (gPlayer.unk61 == 0 && (val2 & 0x20000)) {
                if (gPlayer.qSpeedAirX > 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            } else if (gPlayer.unk61 == 0 && (val2 & 0x40000)) {
                if (gPlayer.qSpeedAirX < 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            }

            if (val2 & 0x100000 && gPlayer.qSpeedAirY > 0) {
                gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
            }
            mpp->unk60 = 30;

            if (!(val2 & 2)) {
                return TRUE;
            }
        }
        if (val2 & 2) {
#ifndef COLLECT_RINGS_ROM
            if (val2 & 1) {
                if (mpp->pos.x < I(gPlayer.qWorldX)) {
                    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                } else {
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                }
                sub_800DE44(&gPlayer);
            } else
#endif
            {
                if (mpp->pos.x < I(gPlayer.qWorldX)) {
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                } else {
                    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                }
                sub_800DD54(&gPlayer);
            }

            mpp->unk60 = 30;
            return TRUE;
        }

        if (!HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && !HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            u32 existingMoveState = gPlayer.moveState;
            Sprite *existingS = gPlayer.stoodObj;
            s16 x, y;

            val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val2 & 2);

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && val == 0) {
                gPlayer.moveState = existingMoveState;
                gPlayer.stoodObj = existingS;

                if (mpp->pos.x > 960) {
                    val = sub_800D0A0(s, mpp->pos.x - 1440, mpp->pos.y - 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val);
                } else {
                    val = sub_800D0A0(s, mpp->pos.x + 1440, mpp->pos.y + 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val);
                }
            }

            if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }
            mpp->unk4C = val;
            if ((val & 0x200000)) {
                mpp->unk60 = 30;
            }
        } else {
            if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (mpp->unk4C & 0x20) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }
        }
        return FALSE;
    }

    mpp->unk60--;

    if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
        return FALSE;
    }

    if (gPlayer.stoodObj != s) {
        return FALSE;
    }

    val = sub_800D0A0(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && val == 0) {
        if (mpp->pos.x > 960) {
            val = sub_800D0A0(s, mpp->pos.x - 1440, mpp->pos.y - 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val);
        } else {
            val = sub_800D0A0(s, mpp->pos.x + 1440, mpp->pos.y + 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val);
        }
    }

    if (mpp->unk4C & 0x20 && !(val & 0x20)) {
        gPlayer.moveState &= ~MOVESTATE_20;
    }
    mpp->unk4C = val;

    if ((val & 0x200000)) {
        mpp->unk60 = 30;
    }

    return FALSE;
}

#ifndef COLLECT_RINGS_ROM
void Task_HandleLaunchPlayer(void)
{
    PlayerSpriteInfo *psi = gPlayer.spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (sprPlayer->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        s16 *airSpeed = TASK_DATA(gCurTask);
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPlayer.moveState &= ~MOVESTATE_800000;
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.moveState |= MOVESTATE_IN_AIR;
        gPlayer.moveState &= ~MOVESTATE_100;
        gPlayer.charState = CHARSTATE_SPRING_B;
        sprPlayer->prevVariant = -1;
        PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
        m4aSongNumStart(SE_SPRING);
        gPlayer.qSpeedAirY = *airSpeed;
        TaskDestroy(gCurTask);
        return;
    }

    if (gPlayer.charState != CHARSTATE_AMY_SA1_JUMP) {
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPlayer.moveState &= ~MOVESTATE_800000;
        TaskDestroy(gCurTask);
    }
}
#endif

void sub_8018818(void)
{
    u32 i;
    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (gMultiplayerPlayerTasks[i] == NULL) {
                break;
            }
            mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
            mpp->unk5C &= ~2;
        }

        gPlayer.timerInvulnerability = 120;
        gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    }
}

void TaskDestructor_MultiplayerPlayer(struct Task *t)
{
    MultiplayerPlayer *mpp = TASK_DATA(t);
    gMultiplayerPlayerTasks[mpp->unk56] = NULL;
    VramFree(mpp->s.graphics.dest);
}

#ifndef COLLECT_RINGS_ROM
void LaunchPlayer(s16 airSpeedY)
{
    struct Task *t = TaskCreate(Task_HandleLaunchPlayer, sizeof(s16), 0x2000, 0, NULL);
    s16 *airSpeed = TASK_DATA(t);
    *airSpeed = airSpeedY;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    gPlayer.heldInput = 0;
    gPlayer.charState = CHARSTATE_AMY_SA1_JUMP;
    gPlayer.moveState |= MOVESTATE_800000;
}
#endif
