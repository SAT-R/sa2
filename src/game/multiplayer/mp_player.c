#include "core.h"
#include "task.h"
#include "malloc_vram.h"

#include "game/game.h"

#include "sakit/globals.h"

#include "game/stage/stage.h"
#include "game/multiplayer/mp_player.h"

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
