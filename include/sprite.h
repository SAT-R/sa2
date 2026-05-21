#ifndef GUARD_SPRITE_H
#define GUARD_SPRITE_H

#include "core.h"
#include "rect.h"
#include "malloc_vram.h"

// TODO: Verify "(in)active" name
#define HITBOX_STATE_INACTIVE -1
#define HITBOX_IS_ACTIVE(hb)  ((hb).index != HITBOX_STATE_INACTIVE)

#define SPRITE_ANIM_SPEED(speed) ((int)((float)(speed)*0x10))
#define SPRITE_OAM_ORDER(index)  ((index) << 6)
#define GET_SPRITE_OAM_ORDER(s)  ((((s)->oamFlags) & 0x7C0) >> 6)

typedef struct {
    /* 0x00 */ s16 unk0[4];
    /* 0x08 */ s16 qDirX;
    /* 0x0A */ s16 qDirY;

    /* 0x0C */ s16 unkC[2];

    /* 0x10 */ s32 posX;
    /* 0x14 */ s32 posY;

    /* 0x18 */ s16 unk18[2][2];
    /* 0x20 */ u16 affineIndex;
} UnkSpriteStruct;

typedef struct {
    /* 0x00 */ u32 numTiles;
    /* 0x04 */ AnimId anim;
    /* 0x06 */ u8 variant;
} TileInfo;

// NOTE: (Only?) used by by src/game/sa2/stage/bosses/final_intro.c
typedef struct {
    /* 0x00 */ void *tiles;
    /* 0x04 */ AnimId anim;
    /* 0x06 */ u8 variant;
} TileInfoPtr;

PACKED(TileInfo16, {
    /* 0x00 */ u16 numTiles;
    /* 0x02 */ AnimId anim;
    /* 0x04 */ u16 variant;
});

#if (ENGINE == ENGINE_1)
typedef struct {
    u32 anim : 16;
    u32 variant : 8;
    u32 size : 8;
} TileInfoBitfield;

// Used in the background code of Casino Paradise
// TODO: Rename TileInfoFirework!
typedef struct {
    /* 0x00 */ AnimId anim;
    /* 0x04 */ u8 variant;
    /* 0x06 */ u8 numTiles;
} TileInfoFirework;

typedef struct {
    AnimId anim;
    u16 variant;
} TileInfoBarrel;
#endif

extern const u8 gOamShapesSizes[12][2];

AnimCmdResult UpdateSpriteAnimation(Sprite *);

void DisplaySprite(Sprite *);
void ProcessOamBuffers(void);
OamData *OamMalloc(u8 order);

void TransformSprite(Sprite *, SpriteTransform *);
// NOTE: Not actually unused in SA1. TODO: Align name with SA2!
void UnusedTransform(Sprite *, SpriteTransform *);
void SA2_LABEL(sub_8004E14)(Sprite *, SpriteTransform *);
void SA2_LABEL(sub_80047A0)(u16 angle, s16 p1, s16 p2, u16 affineIndex);

s16 SA2_LABEL(sub_8004418)(s16 x, s16 y);
void numToASCII(u8 digits[5], u16 number);
u32 Base10DigitsToHexNibbles(u16 num);

#if ((GAME == GAME_SA1) || (GAME == GAME_SA2))
#define GET_SPRITE_ANIM(s) ((s)->graphics.anim)
#else
#define GET_SPRITE_ANIM(s) ((s)->anim)
#endif

#define SpriteShouldUpdate(sprite) (((sprite)->prevVariant != (sprite)->variant) || ((sprite)->prevAnim != (sprite)->graphics.anim))

#define SPRITE_INIT_ANIM_IF_CHANGED(_sprite)                                                                                               \
    if (SpriteShouldUpdate(_sprite)) {                                                                                                     \
        (_sprite)->graphics.size = 0;                                                                                                      \
        (_sprite)->prevVariant = (_sprite)->variant;                                                                                       \
        (_sprite)->prevAnim = (_sprite)->graphics.anim;                                                                                    \
        (_sprite)->animCursor = 0;                                                                                                         \
        (_sprite)->qAnimDelay = 0;                                                                                                         \
        SPRITE_FLAG_CLEAR(_sprite, ANIM_OVER);                                                                                             \
    }

#define SPRITE_INIT_ANIM(_sprite, _anim, _variant, _order)                                                                                 \
    _sprite->graphics.anim = _anim;                                                                                                        \
    _sprite->variant = _variant;                                                                                                           \
    _sprite->oamFlags = SPRITE_OAM_ORDER(_order);                                                                                          \
    _sprite->graphics.size = 0;

#define SPRITE_INIT_SCRIPT(_sprite, _speed)                                                                                                \
    _sprite->animCursor = 0;                                                                                                               \
    _sprite->qAnimDelay = Q(0);                                                                                                            \
    _sprite->prevVariant = -1;                                                                                                             \
    _sprite->animSpeed = SPRITE_ANIM_SPEED(_speed);                                                                                        \
    _sprite->palId = 0;                                                                                                                    \
    _sprite->hitboxes[0].index = HITBOX_STATE_INACTIVE;

#define SPRITE_INIT_ANIM_AND_SCRIPT(_sprite, _anim, _variant, _order)                                                                      \
    SPRITE_INIT_ANIM(_sprite, _anim, _variant, _order);                                                                                    \
    SPRITE_INIT_SCRIPT(_sprite, 1.0);

#define SPRITE_INIT_WITH_POS(_sprite, _numTiles, _anim, _variant, _order, _priority)                                                       \
    _sprite->graphics.dest = VramMalloc(_numTiles);                                                                                        \
    SPRITE_INIT_ANIM(_sprite, _anim, _variant, _order);                                                                                    \
    _sprite->x = 0;                                                                                                                        \
    _sprite->y = 0;                                                                                                                        \
    SPRITE_INIT_SCRIPT(_sprite, 1.0)                                                                                                       \
    _sprite->frameFlags = SPRITE_FLAG(PRIORITY, _priority);

#define SPRITE_INIT_WITHOUT_VRAM(_sprite, _anim, _variant, _order, _priority, _flags)                                                      \
    SPRITE_INIT_ANIM_AND_SCRIPT(_sprite, _anim, _variant, _order);                                                                         \
    _sprite->frameFlags = (SPRITE_FLAG(PRIORITY, _priority) | (_flags));

#define SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(_sprite, _order, _priority, _flags)                                                               \
    _sprite->oamFlags = SPRITE_OAM_ORDER(_order);                                                                                          \
    _sprite->graphics.size = 0;                                                                                                            \
    SPRITE_INIT_SCRIPT(_sprite, 1.0);                                                                                                      \
    _sprite->frameFlags = (SPRITE_FLAG(PRIORITY, _priority) | (_flags));

#define SPRITE_INIT_FLAGS(_sprite, _numTiles, _anim, _variant, _order, _priority, _flags)                                                  \
    _sprite->graphics.dest = VramMalloc(_numTiles);                                                                                        \
    SPRITE_INIT_WITHOUT_VRAM(_sprite, _anim, _variant, _order, _priority, _flags);

#define SPRITE_INIT(_sprite, _numTiles, _anim, _variant, _order, _priority)                                                                \
    SPRITE_INIT_FLAGS(_sprite, _numTiles, _anim, _variant, _order, _priority, 0)

#define SF_SHIFT(name) (SPRITE_FLAG_SHIFT_##name)

#define SPRITE_FLAG(flagName, value) ((value) << SF_SHIFT(flagName))

#define SPRITE_FLAG_GET(sprite, flagName) (((sprite)->frameFlags & (SPRITE_FLAG_MASK_##flagName)) >> (SF_SHIFT(flagName)))

#define SPRITE_FLAG_CLEAR(sprite, flagName) (sprite)->frameFlags &= ~(SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_SET(sprite, flagName) (sprite)->frameFlags |= (SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_FLIP(sprite, flagName) (sprite)->frameFlags ^= (SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_SET_VALUE(sprite, flagName, value) (sprite)->frameFlags |= SPRITE_FLAG(flagName, value)

#define SPRITE_FLAG_ENABLE_ROTATION(value)                                                                                                 \
    (SPRITE_FLAG(ROT_SCALE, value) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE)

#define SPRITE_FLAG_SHIFT_ROT_SCALE             0
#define SPRITE_FLAG_SHIFT_ROT_SCALE_ENABLE      5
#define SPRITE_FLAG_SHIFT_ROT_SCALE_DOUBLE_SIZE 6
#define SPRITE_FLAG_SHIFT_OBJ_MODE              7
#define SPRITE_FLAG_SHIFT_MOSAIC                9
#define SPRITE_FLAG_SHIFT_X_FLIP                10
#define SPRITE_FLAG_SHIFT_Y_FLIP                11
#define SPRITE_FLAG_SHIFT_PRIORITY              12
#define SPRITE_FLAG_SHIFT_ANIM_OVER             14
#define SPRITE_FLAG_SHIFT_BG_ID                 15
#define SPRITE_FLAG_SHIFT_17                    17
#define SPRITE_FLAG_SHIFT_18                    18
#define SPRITE_FLAG_SHIFT_19                    19
#define SPRITE_FLAG_SHIFT_26                    26
#define SPRITE_FLAG_SHIFT_30                    30
#define SPRITE_FLAG_SHIFT_31                    31

#define SPRITE_FLAG_MASK_ROT_SCALE             SPRITE_FLAG(ROT_SCALE, 0x1F) // 0x1F
#define SPRITE_FLAG_MASK_ROT_SCALE_ENABLE      SPRITE_FLAG(ROT_SCALE_ENABLE, 1) // 0x20
#define SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) // 0x40

#define SPRITE_FLAG_MASK_OBJ_MODE  SPRITE_FLAG(OBJ_MODE, 3) // 0x180
#define SPRITE_FLAG_MASK_MOSAIC    SPRITE_FLAG(MOSAIC, 1) // 0x200
#define SPRITE_FLAG_MASK_X_FLIP    SPRITE_FLAG(X_FLIP, 1) // 0x400
#define SPRITE_FLAG_MASK_Y_FLIP    SPRITE_FLAG(Y_FLIP, 1) // 0x800
#define SPRITE_FLAG_MASK_PRIORITY  SPRITE_FLAG(PRIORITY, 3) // 0x3000
#define SPRITE_FLAG_MASK_ANIM_OVER SPRITE_FLAG(ANIM_OVER, 1)
#define SPRITE_FLAG_MASK_BG_ID     SPRITE_FLAG(BG_ID, 3)
#define SPRITE_FLAG_GLOBAL_OFFSET  SPRITE_FLAG(17, 1)
#define SPRITE_FLAG_MASK_18        SPRITE_FLAG(18, 1) // 0x40000
#define SPRITE_FLAG_MASK_19        SPRITE_FLAG(19, 1)
#define SPRITE_FLAG_MASK_26        SPRITE_FLAG(26, 1)
#define SPRITE_FLAG_MASK_30        SPRITE_FLAG(30, 1)
#define SPRITE_FLAG_MASK_31        SPRITE_FLAG(31, 1)

#endif
