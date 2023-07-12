#ifndef GUARD_INTERACTABLE_H
#define GUARD_INTERACTABLE_H

#include "gba/defines.h"
#include "gba/types.h"
#include "sprite.h"
#include "game/game.h"

// After a MapEntity is initialized, its x-value in the layout-data gets set to -2.
#define MAP_ENTITY_STATE_INITIALIZED (-2)
#define MAP_ENTITY_STATE_MINUS_THREE (-3)
#define SET_MAP_ENTITY_INITIALIZED(mapEnt)                                              \
    {                                                                                   \
        s32 negativeTwo;                                                                \
        s16 forMatching;                                                                \
        negativeTwo = MAP_ENTITY_STATE_INITIALIZED;                                     \
        forMatching = negativeTwo;                                                      \
        mapEnt->x = forMatching;                                                        \
    }

#define SET_MAP_ENTITY_NOT_INITIALIZED(mapEnt, initialX)                                \
    {                                                                                   \
        mapEnt->x = initialX;                                                           \
    }

// Used by Enemies that do not appear in EASY-mode
#define DIFFICULTY_LEVEL_IS_NOT_EASY                                                    \
    (gGameMode == GAME_MODE_TIME_ATTACK || gDifficultyLevel != DIFFICULTY_EASY)

#define ENTITY_INIT(eType, eName, _task, _taskPrio, _taskFlags, _taskDtor)              \
    struct Task *t                                                                      \
        = TaskCreate(_task, sizeof(eType), _taskPrio, _taskFlags, _taskDtor);           \
    eType *eName = TaskGetStructPtr(t);                                                 \
    Sprite *s = &eName->s;                                                              \
    eName->base.regionX = spriteRegionX;                                                \
    eName->base.regionY = spriteRegionY;                                                \
    eName->base.me = me;                                                                \
    eName->base.spriteX = me->x;                                                        \
    eName->base.spriteY = spriteY;

#define ENTITY_INIT_2(eType, eName, _task, _taskPrio, _taskFlags, _taskDtor, _UNK4C)    \
    struct Task *t                                                                      \
        = TaskCreate(_task, sizeof(eType), _taskPrio, _taskFlags, _taskDtor);           \
    eType *eName = TaskGetStructPtr(t);                                                 \
    Sprite *s = &eName->s;                                                              \
    eName->unk4C = _UNK4C;                                                              \
    eName->base.regionX = spriteRegionX;                                                \
    eName->base.regionY = spriteRegionY;                                                \
    eName->base.me = me;                                                                \
    eName->base.spriteX = me->x;                                                        \
    eName->base.spriteY = spriteY;

#define ENEMY_SET_SPAWN_POS_FLYING(_enemy, _mapEntity)                                  \
    _enemy->spawnX = Q_24_8(TO_WORLD_POS(_mapEntity->x, spriteRegionX));                \
    _enemy->spawnY = Q_24_8(TO_WORLD_POS(_mapEntity->y, spriteRegionY));                \
    _enemy->offsetX = 0;                                                                \
    _enemy->offsetY = 0;

#define ENEMY_SET_SPAWN_POS_GROUND(_enemy, _mapEntity)                                  \
    _enemy->spawnX = Q_24_8(TO_WORLD_POS(_mapEntity->x, spriteRegionX));                \
    _enemy->spawnY = Q_24_8(TO_WORLD_POS(_mapEntity->y, spriteRegionY));                \
    _enemy->offsetX = 0;                                                                \
    _enemy->offsetY = Q_24_8(sub_801F07C(Q_24_8_TO_INT(_enemy->spawnY),                 \
                                         Q_24_8_TO_INT(_enemy->spawnX),                 \
                                         _enemy->clampParam, 8, NULL, sub_801EE64));

#define ENEMY_UPDATE_EX_RAW(_s, _posX, _posY, code_insert)                              \
    sub_80122DC(_posX, _posY);                                                          \
    { code_insert };                                                                    \
    sub_8004558(_s);                                                                    \
    sub_80051E8(_s);

#define ENEMY_UPDATE_EX(_s, _posX, _posY, code_insert)                                  \
    ENEMY_UPDATE_EX_RAW(_s, Q_24_8_NEW(_posX), Q_24_8_NEW(_posY), code_insert);

#define ENEMY_UPDATE(_s, _posX, _posY) ENEMY_UPDATE_EX(_s, _posX, _posY, {});

#define ENEMY_UPDATE_POSITION(_enemy, _sprite, _posX, _posY)                            \
    _posX = Q_24_8_TO_INT(_enemy->spawnX + _enemy->offsetX);                            \
    _posY = Q_24_8_TO_INT(_enemy->spawnY + _enemy->offsetY);                            \
    _sprite->x = _posX - gCamera.x;                                                     \
    _sprite->y = _posY - gCamera.y;

#define ENEMY_UPDATE_POSITION_STATIC(_enemy, _sprite, _posX, _posY)                     \
    _posX = Q_24_8_TO_INT(_enemy->spawnX);                                              \
    _posY = Q_24_8_TO_INT(_enemy->spawnY);                                              \
    _sprite->x = _posX - gCamera.x;                                                     \
    _sprite->y = _posY - gCamera.y;

#define ENEMY_TURN_TO_PLAYER(pos, s)                                                    \
    if (gPlayer.x < Q_24_8_NEW(pos.x)) {                                                \
        s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;                                           \
    } else {                                                                            \
        s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;                                            \
    }

#define ENEMY_CROSSED_LEFT_BORDER(_enemy, _mapEntity)                                   \
    ((Q_24_8_TO_INT(_enemy->offsetX) <= _mapEntity->d.sData[0] * TILE_WIDTH))

#define ENEMY_CROSSED_RIGHT_BORDER(_enemy, _mapEntity)                                  \
    ((Q_24_8_TO_INT(_enemy->offsetX)                                                    \
      >= (_mapEntity->d.sData[0] * TILE_WIDTH + _mapEntity->d.uData[2] * TILE_WIDTH)))

#define ENEMY_CLAMP_TO_GROUND(_enemy, _unknownBool)                                     \
    {                                                                                   \
        s32 delta = sub_801F07C(Q_24_8_TO_INT(_enemy->spawnY + _enemy->offsetY),        \
                                Q_24_8_TO_INT(_enemy->spawnX + _enemy->offsetX),        \
                                _unknownBool, 8, NULL, sub_801EE64);                    \
                                                                                        \
        if (delta < 0) {                                                                \
            _enemy->offsetY += Q_24_8(delta);                                           \
                                                                                        \
            delta = sub_801F100(Q_24_8_TO_INT(_enemy->spawnY + _enemy->offsetY),        \
                                Q_24_8_TO_INT(_enemy->spawnX + _enemy->offsetX),        \
                                _unknownBool, 8, sub_801EC3C);                          \
        }                                                                               \
                                                                                        \
        if (delta > 0) {                                                                \
            _enemy->offsetY += Q_24_8(delta);                                           \
        }                                                                               \
    }

#define ENEMY_DESTROY_IF_PLAYER_HIT(_s, _pos)                                           \
    if (sub_800C4FC(_s, _pos.x, _pos.y, 0) == TRUE) {                                   \
        TaskDestroy(gCurTask);                                                          \
        return;                                                                         \
    }

#define ENEMY_DESTROY_IF_PLAYER_HIT_2(_s, _pos)                                         \
    if (sub_800C4FC(_s, _pos.x, _pos.y, 0)) {                                           \
        TaskDestroy(gCurTask);                                                          \
        return;                                                                         \
    }

#define ENEMY_DESTROY_IF_INVISIBLE(_enemy, _mapEntity, _sprite)                         \
    if (IS_OUT_OF_DISPLAY_RANGE(Q_24_8_TO_INT(_enemy->spawnX),                          \
                                Q_24_8_TO_INT(_enemy->spawnY))                          \
        && IS_OUT_OF_CAM_RANGE(_sprite->x, _sprite->y)) {                               \
        SET_MAP_ENTITY_NOT_INITIALIZED(_mapEntity, _enemy->base.spriteX);               \
        TaskDestroy(gCurTask);                                                          \
        return;                                                                         \
    }

#define ENTITY_DATA_SIZE_SA1 4
#define ENTITY_DATA_SIZE_SA2 4
#define ENTITY_DATA_SIZE_SA3 5
#define ENTITY_DATA_SIZE     ENTITY_DATA_SIZE_SA2

typedef struct PACKED {
    /* 0x00 */ u8 x; // While an enemy is active, x gets repurposed as a "state"
                     // (e.g. indicating that it's active)
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    union {
        /* 0x03 */
        s8 sData[ENTITY_DATA_SIZE];
        u8 uData[ENTITY_DATA_SIZE];
    } d;
} MapEntity;

typedef struct PACKED {
    /* 0x00 */ u8 x; // While an enemy is active, x gets repurposed as a "state"
                     // (e.g. indicating that it's active)
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;
} MapEntity_Itembox;

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 spriteY;
} SpriteBase;

// IsColliding?
bool32 sub_800C204(Sprite *, s32, s32, s16, Player *, u32);

u32 sub_800CDBC(Sprite *, s32, s32, Player *);
bool32 sub_800CBA4(Player *);
u32 sub_800DF38(Sprite *, s32, s32, Player *);

// TODO: Include header this belongs to
u32 sub_800C944(Sprite *, s32, s32);

// TODO: Include header this belongs to
bool32 sub_800CA20(Sprite *s, s32 x, s32 y, u16 p3, Player *p);
u32 sub_800CCB8(Sprite *, s32 x, s32 y, Player *);

void sub_801FD34(s32, s32, s32);

#endif // GUARD_INTERACTABLE_H
