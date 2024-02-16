#ifndef GUARD_INTERACTABLE_H
#define GUARD_INTERACTABLE_H

#include "gba/defines.h"
#include "gba/types.h"
#include "sprite.h"
#include "game/game.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

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

typedef struct PACKED {
    /* 0x00 */ u8 x; // While an enemy is active, x gets repurposed as a "state"
                     // (e.g. indicating that it's active)
    /* 0x01 */ u8 y;
} MapEntity_Ring;

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 spriteY;
} SpriteBase;

// TODO maybe(?): Integrate this with every enemy
typedef struct {
    SpriteBase base;
    Sprite s;
} EnemyBase;

u32 sub_800CDBC(Sprite *, s32, s32, Player *);

u32 sub_800DF38(Sprite *, s32, s32, Player *);

// After a MapEntity is initialized, its x-value in the layout-data gets set to -2.
// TODO:
// Find out whether casting these to u8 can work while still matching!
#define MAP_ENTITY_STATE_ARRAY_END   (-1)
#define MAP_ENTITY_STATE_INITIALIZED (-2)
#define MAP_ENTITY_STATE_MINUS_THREE (-3)

// TODO: Find a way to simplify/remove this macro!
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

// Used for bosses
#define DIFFICULTY_BOSS_IS_NOT_NORMAL                                                   \
    (gDifficultyLevel != DIFFICULTY_NORMAL && gGameMode != GAME_MODE_BOSS_TIME_ATTACK)

#define DIFFICULTY_LEVEL_IS_NOT_EASY_AND_ZONE_IS_NOT_1                                  \
    (gGameMode == GAME_MODE_TIME_ATTACK || gCurrentLevel > 3                            \
     || gDifficultyLevel != DIFFICULTY_EASY)

#define ENEMY_SET_SPAWN_POS_STATIC(_enemy, _mapEntity)                                  \
    _enemy->spawnX = Q_24_8(TO_WORLD_POS(_mapEntity->x, spriteRegionX));                \
    _enemy->spawnY = Q_24_8(TO_WORLD_POS(_mapEntity->y, spriteRegionY));

#define ENEMY_SET_SPAWN_POS_FLYING(_enemy, _mapEntity)                                  \
    ENEMY_SET_SPAWN_POS_STATIC(_enemy, _mapEntity);                                     \
    _enemy->offsetX = 0;                                                                \
    _enemy->offsetY = 0;

#define ENEMY_SET_SPAWN_POS_GROUND(_enemy, _mapEntity)                                  \
    ENEMY_SET_SPAWN_POS_STATIC(_enemy, _mapEntity);                                     \
    _enemy->offsetX = 0;                                                                \
    _enemy->offsetY = Q_24_8(sub_801F07C(Q_24_8_TO_INT(_enemy->spawnY),                 \
                                         Q_24_8_TO_INT(_enemy->spawnX),                 \
                                         _enemy->clampParam, 8, NULL, sub_801EE64));

#define ENEMY_UPDATE_EX_RAW(_s, _posX, _posY, code_insert)                              \
    sub_80122DC(_posX, _posY);                                                          \
    { code_insert };                                                                    \
    UpdateSpriteAnimation(_s);                                                          \
    DisplaySprite(_s);

#define ENEMY_UPDATE_EX(_s, _posX, _posY, code_insert)                                  \
    ENEMY_UPDATE_EX_RAW(_s, Q_24_8_NEW(_posX), Q_24_8_NEW(_posY), code_insert);

#define ENEMY_UPDATE(_s, _posX, _posY) ENEMY_UPDATE_EX(_s, _posX, _posY, {});

#define ENEMY_UPDATE_POSITION_RAW(_enemy, _sprite, _posX, _posY, _offsetX, _offsetY)    \
    _posX = Q_24_8_TO_INT(_enemy->spawnX + _offsetX);                                   \
    _posY = Q_24_8_TO_INT(_enemy->spawnY + _offsetY);                                   \
    _sprite->x = _posX - gCamera.x;                                                     \
    _sprite->y = _posY - gCamera.y;

#define ENEMY_UPDATE_POSITION(_enemy, _sprite, _posX, _posY)                            \
    ENEMY_UPDATE_POSITION_RAW(_enemy, _sprite, _posX, _posY, _enemy->offsetX,           \
                              _enemy->offsetY)

#define ENEMY_UPDATE_POSITION_STATIC(_enemy, _sprite, _posX, _posY)                     \
    ENEMY_UPDATE_POSITION_RAW(_enemy, _sprite, _posX, _posY, 0, 0)

#define ENEMY_TURN_TO_PLAYER(_posX, s)                                                  \
    if (gPlayer.x < _posX) {                                                            \
        SPRITE_FLAG_CLEAR(s, X_FLIP);                                                   \
    } else {                                                                            \
        SPRITE_FLAG_SET(s, X_FLIP);                                                     \
    }

#define ENEMY_TURN_AROUND(_s)                                                           \
    if (_s->unk10 & SPRITE_FLAG_MASK_X_FLIP) {                                          \
        SPRITE_FLAG_CLEAR(_s, X_FLIP);                                                  \
    } else {                                                                            \
        SPRITE_FLAG_SET(_s, X_FLIP);                                                    \
    }

#define ENEMY_CROSSED_LEFT_BORDER(_enemy, _mapEntity)                                   \
    ((Q_24_8_TO_INT(_enemy->offsetX) <= _mapEntity->d.sData[0] * TILE_WIDTH))

#define ENEMY_CROSSED_RIGHT_BORDER(_enemy, _mapEntity)                                  \
    ((Q_24_8_TO_INT(_enemy->offsetX)                                                    \
      >= (_mapEntity->d.sData[0] * TILE_WIDTH + _mapEntity->d.uData[2] * TILE_WIDTH)))

#define ENEMY_CROSSED_TOP_BORDER_RAW(_enemy, _mapEntity, _offsetY)                      \
    ((_offsetY <= _mapEntity->d.sData[1] * TILE_WIDTH))

#define ENEMY_CROSSED_TOP_BORDER(_enemy, _mapEntity)                                    \
    ENEMY_CROSSED_TOP_BORDER_RAW(_enemy, _mapEntity, Q_24_8_TO_INT(_enemy->offsetY))

#define ENEMY_CROSSED_BOTTOM_BORDER_RAW(_enemy, _mapEntity, _offsetY)                   \
    ((_offsetY                                                                          \
      >= (_mapEntity->d.sData[1] * TILE_WIDTH + _mapEntity->d.uData[3] * TILE_WIDTH)))

#define ENEMY_CROSSED_BOTTOM_BORDER(_enemy, _mapEntity)                                 \
    ENEMY_CROSSED_BOTTOM_BORDER_RAW(_enemy, _mapEntity, Q_24_8_TO_INT(_enemy->offsetY))

#define ENEMY_CLAMP_TO_GROUND_INNER(_enemy, _unknownBool, _task)                        \
    sub_801F100(Q_24_8_TO_INT(_enemy->spawnY + _enemy->offsetY),                        \
                Q_24_8_TO_INT(_enemy->spawnX + _enemy->offsetX), _unknownBool, 8,       \
                _task);

#define ENEMY_CLAMP_TO_GROUND_INNER_X_FIRST(_enemy, _unknownBool)                       \
    sub_801F100(Q_24_8_TO_INT(_enemy->spawnX + _enemy->offsetX),                        \
                Q_24_8_TO_INT(_enemy->spawnY + _enemy->offsetY), _unknownBool, 8,       \
                sub_801EC3C);

#define ENEMY_CLAMP_TO_GROUND_RAW(_enemy, _unknownBool, _p)                             \
    {                                                                                   \
        s32 delta = sub_801F07C(Q_24_8_TO_INT(_enemy->spawnY + _enemy->offsetY),        \
                                Q_24_8_TO_INT(_enemy->spawnX + _enemy->offsetX),        \
                                _unknownBool, 8, _p, sub_801EE64);                      \
                                                                                        \
        if (delta < 0) {                                                                \
            _enemy->offsetY += Q_24_8(delta);                                           \
            delta = ENEMY_CLAMP_TO_GROUND_INNER(_enemy, _unknownBool, sub_801EC3C);     \
        }                                                                               \
                                                                                        \
        if (delta > 0) {                                                                \
            _enemy->offsetY += Q_24_8(delta);                                           \
        }                                                                               \
    }

#define ENEMY_CLAMP_TO_GROUND(_enemy, _unknownBool)                                     \
    ENEMY_CLAMP_TO_GROUND_RAW(_enemy, _unknownBool, NULL)

#define ENEMY_CLAMP_TO_GROUND_2(_enemy, _unknownBool)                                   \
    {                                                                                   \
        s32 delta = sub_801F07C(Q_24_8_TO_INT(_enemy->spawnY + _enemy->offsetY),        \
                                Q_24_8_TO_INT(_enemy->spawnX + _enemy->offsetX),        \
                                _unknownBool, -8, NULL, sub_801EE64);                   \
                                                                                        \
        if (delta < 0) {                                                                \
            _enemy->offsetY -= Q_24_8(delta);                                           \
            delta = ENEMY_CLAMP_TO_GROUND_INNER(_enemy, _unknownBool, sub_801EC3C);     \
        }                                                                               \
                                                                                        \
        if (delta > 0) {                                                                \
            _enemy->offsetY -= Q_24_8(delta);                                           \
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

#define ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(_enemy, _mapEntity, _sprite)                  \
    if (IS_OUT_OF_CAM_RANGE(_sprite->x, _sprite->y)) {                                  \
        SET_MAP_ENTITY_NOT_INITIALIZED(_mapEntity, _enemy->base.spriteX);               \
        TaskDestroy(gCurTask);                                                          \
        return;                                                                         \
    }

#define ENEMY_DESTROY_IF_OFFSCREEN_RAW(_enemy, _mapEntity, _sprite, _posX, _posY)       \
    if (IS_OUT_OF_DISPLAY_RANGE(_posX, _posY)) {                                        \
        ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(_enemy, _mapEntity, _sprite);                 \
    }

#define ENEMY_DESTROY_IF_OFFSCREEN(_enemy, _mapEntity, _sprite)                         \
    ENEMY_DESTROY_IF_OFFSCREEN_RAW(_enemy, _mapEntity, _sprite,                         \
                                   Q_24_8_TO_INT(_enemy->spawnX),                       \
                                   Q_24_8_TO_INT(_enemy->spawnY))

#endif // GUARD_INTERACTABLE_H
