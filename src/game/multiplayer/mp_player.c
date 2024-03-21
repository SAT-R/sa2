#include "core.h"
#include "task.h"
#include "malloc_vram.h"

#include "game/game.h"

#include "sakit/globals.h"

#include "game/stage/stage.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/multiplayer/mp_player.h"
#include "game/item_tasks.h"
#include "game/player_callbacks_1.h"
#include "game/multiplayer/unknown_1.h"
#include "game/unknown_effect.h"
#include "game/multiplayer/player_unk_2.h"
#include "game/multiplayer/multipak_connection.h"

#include "constants/game_modes.h"

u32 unused_3005838 = 0;
u8 gUnknown_0300583C = 0;

void Task_CreateMultiplayerPlayer(void);
void TaskDestructor_CreateMultiplayerPlayer(struct Task *);

void CreateMultiplayerPlayer(u8 id)
{
    u16 *p;
    Sprite *s;
    struct Task *t = TaskCreate(Task_CreateMultiplayerPlayer, sizeof(MultiplayerPlayer),
                                0x2000, 0, TaskDestructor_CreateMultiplayerPlayer);
    MultiplayerPlayer *player = TASK_DATA(t);
    player->unk56 = id;
    player->unk54 = 0x40;
    player->unk44 = 0;
    player->unk48 = 0;
    player->unk66 = 0;
    player->unk68 = 0;
    player->unk6A = 0;

    if (id != SIO_MULTI_CNT->id) {
        player->unk60 = 0x1E;
    } else {
        player->unk60 = 0;
    }

    player->unk57 = 0x80;
    player->unk61 = 0;
    player->unk5C = 0;
    player->unk64 = player->unk56;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        player->unk5C |= 2;
    }

    player->unk50 = 0;
    player->unk52 = 0;

    if (gGameMode < GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        player->unk50 = gSpawnPositions[gCurrentLevel][0];
        player->unk52 = gSpawnPositions[gCurrentLevel][1];
    } else {
        switch (SIO_MULTI_CNT->id) {
            case 0: {
                player->unk50 = 0xE8;
                player->unk52 = 0x33D;
                break;
            }
            case 1: {
                player->unk50 = 0x631;
                player->unk52 = 0x117;
                break;
            }
            case 2: {
                player->unk50 = 0x631;
                player->unk52 = 0x39E;
                break;
            }
            case 3: {
                player->unk50 = 0xE8;
                player->unk52 = 0x15C;
                break;
            }
        }
    }

    s = &player->s;
    s->unk1A = SPRITE_OAM_ORDER(16);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = player->unk56;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    s->graphics.anim = 0;
    s->variant = 0;
    s->x = 0;
    s->y = 0;

    player->transform.height = 0x100;
    s->graphics.anim = gPlayerCharacterIdleAnims[gMultiplayerCharacters[player->unk56]];

    if (player->unk56 != SIO_MULTI_CNT->id) {
        s->graphics.dest = VramMalloc(0x40);
        s->unk10 |= 0x200;
    } else {
        s->graphics.dest = (void *)OBJ_VRAM0;
    }

    UpdateSpriteAnimation(s);
    gMultiplayerPlayerTasks[player->unk56] = t;
}

void sub_8018120(void);
void sub_8016D20(void);
void sub_801707C(void);
void sub_8017670(void);
void sub_8017C28(void);

// around 70%: https://decomp.me/scratch/KNjEN
NONMATCH("asm/non_matching/game/multiplayer/mp_player__Task_CreateMultiplayerPlayer.inc",
         void Task_CreateMultiplayerPlayer())
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
                mpp->unk44 = recv->pat4.x - mpp->unk50;
                mpp->unk48 = recv->pat4.y - mpp->unk52;
                mpp->unk50 = recv->pat4.x;
                mpp->unk52 = recv->pat4.y;

            } else {
                mpp->unk44 = recv->pat4.x - mpp->unk50;
                mpp->unk48 = recv->pat4.y - mpp->unk52;
                x = ABS(mpp->unk44);

                if (x > 15) {
                    x = ABS(mpp->unk48);
                    if (mpp->unk44 > 0 && mpp->unk48 > 0) {
                        mpp->unk44 = recv->pat4.x - mpp->unk50 - 0x5A0;
                        mpp->unk48 = recv->pat4.y - mpp->unk52 - 0x360;
                    } else {
                        if (mpp->unk44 < 0 && mpp->unk48 < 0) {
                            mpp->unk44 = recv->pat4.x - mpp->unk50 - 0x5A0;
                            mpp->unk48 = recv->pat4.y - mpp->unk52 - 0x360;
                        }
                    }
                }
                mpp->unk50 = recv->pat4.x;
                mpp->unk52 = recv->pat4.y;
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
                    MultiplayerPlayer *mpp2
                        = TASK_DATA(gMultiplayerPlayerTasks[mpp->unk64]);
                    if (SIO_MULTI_CNT->id == mpp2->unk64) {
                        mpp2->unk64 = SIO_MULTI_CNT->id;
                        gPlayer.moveState &= ~MOVESTATE_8;
                        gPlayer.moveState &= ~MOVESTATE_20;
                        gPlayer.moveState &= ~MOVESTATE_4;
                        gPlayer.moveState &= ~MOVESTATE_10;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        gPlayer.moveState &= ~MOVESTATE_400;
                        gPlayer.moveState &= ~MOVESTATE_100;
                        sub_8023B5C(&gPlayer, 0xe);
                        gPlayer.unk16 = 6;
                        gPlayer.unk17 = 0xE;
                        gPlayer.unk61 = 0;
                        gPlayer.unk62 = 0;

                        gPlayer.unk64 = 9;
                        gPlayer.moveState |= MOVESTATE_800000;
                        gPlayer.callback = PlayerCB_8025318;
                        gPlayer.moveState &= ~MOVESTATE_400000;
                        mpp->unk5C &= ~4;
                        if (mpp2->unk5C & 4) {
                            gPlayer.moveState &= ~MOVESTATE_400000;
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

                if (s->graphics.anim != anim || s->variant != (recv->pat4.unkB & 0xF)) {
                    s->hitboxes[0].index = -1;
                    s->hitboxes[1].index = -1;
                }

                if (mpp->unk54 & 4) {
                    if (mpp->unk5C & 4) {
                        gPlayer.moveState &= ~MOVESTATE_400000;
                        mpp->unk5C &= ~4;
                    }

                    if (gPlayer.moveState & 8 && gPlayer.unk3C == s) {
                        gPlayer.moveState &= ~8;
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
            // mpp->unk50 += I(mpp->unk66);
            // mpp->unk52 += I(mpp->unk68);

            // if (mpp->unk61++ > 30) {
            //     // TODO: macro this
            //     TasksDestroyAll();
            //     gUnknown_03002AE4 = gUnknown_0300287C;
            //     gUnknown_03005390 = 0;
            //     gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
            //     MultiPakCommunicationError();
            //     return;
            // }
        }
    } else {
    thing:
        mpp->unk50 += I(mpp->unk66);
        mpp->unk52 += I(mpp->unk68);

        if (mpp->unk61++ > 30) {
            // TODO: macro this
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
            MultiPakCommunicationError();
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

        s->x = mpp->unk50 - gCamera.x;
        s->y = mpp->unk52 - gCamera.y;
        transform->x = mpp->unk50 - gCamera.x;
        transform->y = mpp->unk52 - gCamera.y;

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
                        != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                            >> (SIO_MULTI_CNT->id + 4)
                    && !(mpp2->unk54 & 0x100)) {

                    someBool = FALSE;
                    break;
                }
            }
        }

        if (someBool) {
            sub_8019224()->unk0 = 7;
        }
    }

    if (!(gUnknown_03005424 & 1) && !(mpp->unk54 & 0x80000004)) {
        if (!(gPlayer.itemEffect & 0x80)) {
            if (!(mpp->unk5C & 1) && (gPlayer.timerInvulnerability == 0)
                && !(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
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
        if ((gPlayer.itemEffect & 0x80) || (mpp->unk57 & 0x80)
            || gPlayer.timerInvincibility == 0 || !PLAYER_IS_ALIVE
            || gUnknown_030054B4[mpp->unk56] != -1) {
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (mpp->unk56 == SIO_MULTI_CNT->id
                    && gMultiplayerCharacters[mpp->unk56] < 4
                    && gMultiplayerCharacters[mpp->unk56] > 1 && mpp->unk5C & 4) {
                    mpp->unk5C &= ~0x6;
                    if (!(gPlayer.itemEffect & 0x80)) {
                        gPlayer.moveState &= ~MOVESTATE_400000;
                    }
                    {
                        struct UNK_3005510 *thing = sub_8019224();
                        thing->unk0 = 8;
                        thing->unk1 = mpp->unk56;
                        thing->unk2 = 0;
                    }
                }
                if (gPlayer.moveState & 8 && gPlayer.unk3C == s) {
                    gPlayer.moveState &= ~0x9;
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                    mpp->unk60 = 0x1E;
                }
            } else {
                if (gPlayer.moveState & 8 && gPlayer.unk3C == s) {
                    gPlayer.moveState &= ~0x12;
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                    mpp->unk60 = 0x1E;
                }
            }
        }
    }

    if (mpp->unk54 & 1) {
        s->unk10 &= ~0x1F;
        s->unk10 = gUnknown_030054B8++ | 0x20;
        if (mpp->unk54 & 2) {
            transform->width = -256;
        } else {
            transform->width = 256;
        }

        if (mpp->unk54 & 8) {
            transform->width = -transform->width;
        }
        sub_8004860(s, transform);
    } else {
        s->unk10 &= ~0x30;
        if (mpp->unk54 & 2) {
            s->unk10 |= 0x400;
        } else {
            s->unk10 &= ~0x400;
        }
        if (mpp->unk54 & 8) {
            s->unk10 |= 0x800;
        } else {
            s->unk10 &= ~0x800;
        }
    }

    s->unk10 &= ~0x3000;
    s->unk10 |= (mpp->unk54 & 0x30) << 8;

    if (!(mpp->unk54 & 0x40)
        && ((gStageTime & 2 || mpp->unk57 & 0x20 || mpp->unk5C & 1
             || gUnknown_030054B4[mpp->unk56] != -1)
            || (mpp->unk60 == 0 && !(mpp->unk54 & 4) && !(mpp->unk5C & 2)))) {
        s->unk1A = 0x400;
        if (mpp->unk54 & 0x80) {
            s->unk1A |= 0x40;
        }

        s->unk10 &= ~(0x100 | 0x80);
        if (mpp->unk57 & 0x20
            && (gGameMode != GAME_MODE_TEAM_PLAY
                || ((gMultiplayerConnections & (0x10 << (mpp->unk56)))
                        >> ((mpp->unk56 + 4))
                    != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                        >> (SIO_MULTI_CNT->id + 4)))
            && mpp->unk60 == 0 && mpp->unk56 != SIO_MULTI_CNT->id) {
            s->unk10 |= 0x100;
            gDispCnt |= 0x8000;
            gWinRegs[5] = 0x83F;
        }
        if ((u16)(s->x + 0x3F) < 0x16F && (s->y > -0x40 && s->y < 0xE0)) {
            DisplaySprite(s);
        } else if (gGameMode == 5) {
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

            if ((u16)(s->x + 0x3F) < 0x16F && (s->y > -0x40 && s->y < 0xE0)) {
                if (mpp->unk54 & 1) {
                    sub_8004860(s, transform);
                }
                DisplaySprite(s);
            }
        }
    }

    if (gUnknown_03005B7C != 0) {
        sub_8087368();
        gUnknown_03005B7C = 0;
    }

    if (gUnknown_0300583C != 0) {
        sub_801A384();
        gUnknown_0300583C = 0;
    }
}
END_NONMATCH

void sub_8017F34(void);
u32 sub_8018300(void);

u32 sub_800D0A0(Sprite *, s32, s32, s32, s32, u8, u32);

u32 sub_80181E0(void);

void sub_8016D20(void)
{
    Sprite *playerS = &gPlayer.unk90->s;
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    SpriteTransform *transform = &mpp->transform;
    u32 val;

    if (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s) {
        sub_8017F34();
    }

    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                >> (SIO_MULTI_CNT->id + 4))) {
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

    if (mpp->unk60 == 0) {
        if (sub_80181E0() != 0) {
            if (mpp->unk4C & MOVESTATE_20) {
                gPlayer.moveState &= ~MOVESTATE_20;
                mpp->unk4C = 0;
            }

            if (s->graphics.anim != 3) {
                return;
            }

            gPlayer.unk64 = 9;
            gPlayer.callback = PlayerCB_8025318;
            gPlayer.unk61 = 0;
            gPlayer.unk62 = 0;

            if (gPlayer.moveState & 8 && gPlayer.unk3C == s) {
                gPlayer.moveState &= ~8;
                gPlayer.moveState |= 2;
            }

            if (!(gUnknown_03005424 & 0x80) && I(gPlayer.y) > mpp->unk52) {
                mpp->unk60 = 30;
                return;
            } else if ((gUnknown_03005424 & 0x80) && I(gPlayer.y) < mpp->unk52) {
                mpp->unk60 = 30;
                return;
            } else if (s->unk10 & 0x400) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.speedGroundX = 3072;
                gPlayer.speedAirX = 3072;
            } else {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.speedGroundX = -3072;
                gPlayer.speedAirX = -3072;
            }
            mpp->unk60 = 30;
        } else {
            if (playerS->hitboxes[1].index != -1 && s->hitboxes[1].index != -1) {
                return;
            }

            if (gPlayer.unk61 != 0 && (u8)(gPlayer.character - 2) < 2) {
                return;
            }

            val = sub_800D0A0(s, mpp->unk50, mpp->unk52, mpp->unk66, mpp->unk68,
                              mpp->unk54 >> 7 & 1, 1);

            if (mpp->unk4C & MOVESTATE_20 && !(val & MOVESTATE_20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }

            mpp->unk4C = val;

            if (val & MOVESTATE_IGNORE_INPUT) {
                mpp->unk60 = 30;
            }

            if (!(val & (MOVESTATE_10000 | MOVESTATE_20 | MOVESTATE_8))) {
                return;
            }

            if (s->graphics.anim != 3) {
                return;
            }
            gPlayer.unk64 = 9;
            gPlayer.callback = PlayerCB_8025318;
            gPlayer.unk61 = 0;
            gPlayer.unk62 = 0;

            if (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s) {
                gPlayer.moveState &= ~MOVESTATE_8;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (!(gUnknown_03005424 & 0x80) && I(gPlayer.y) > mpp->unk52) {
                mpp->unk60 = 30;
                return;
            } else if ((gUnknown_03005424 & 0x80) && I(gPlayer.y) < mpp->unk52) {
                mpp->unk60 = 30;
                return;
            } else if (s->unk10 & 0x400) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.speedGroundX = 3072;
                gPlayer.speedAirX = 3072;
            } else {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.speedGroundX = -3072;
                gPlayer.speedAirX = -3072;
            }
            mpp->unk60 = 30;
        }
    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_8)) {
            return;
        }

        if (gPlayer.unk3C != s) {
            return;
        }

        val = sub_800D0A0(s, mpp->unk50, mpp->unk52, mpp->unk66, mpp->unk68,
                          mpp->unk54 >> 7 & 1, 0);

        if ((mpp->unk4C & MOVESTATE_20) && !(val & MOVESTATE_20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;
        return;
    }
}
