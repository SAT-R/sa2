#include "global.h"
#include "lib/m4a/m4a.h"
#include "task.h"
#include "trig.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/note_particle.h"
#include "game/interactables_2/music_plant/note_block.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

#define NUM_NOTE_BLOCK_TYPES 7

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ s16 bounceOffsetX;
    /* 0x46 */ s16 bounceOffsetY;
    /* 0x48 */ u8 type;
    /* 0x49 */ u8 bounceSin;
    /* 0x4A */ u8 bounceFrame;
    /* 0x4B */ u8 health;
} Sprite_NoteBlock; /* size: 0x4C */

static void Task_Idle(void);
static void TaskDestructor_NoteBlock(struct Task *);
static void HandleBounceComplete(Sprite_NoteBlock *);
static void UpdateBouncePosition(Sprite_NoteBlock *);
static bool32 ShouldDespawn(Sprite_NoteBlock *);
static bool32 IsPlayerTouchingBlock(Sprite_NoteBlock *);
static void Render(Sprite_NoteBlock *);
static void Despawn(Sprite_NoteBlock *);

/* animId, variant, tileId (OBJ VRAM) */
static const u16 sAnims[NUM_NOTE_BLOCK_TYPES][3] = {
    { SA2_ANIM_NOTE_BLOCK, 0, 0x16C }, { SA2_ANIM_NOTE_BLOCK, 1, 0x170 }, { SA2_ANIM_NOTE_BLOCK, 2, 0x174 },
    { SA2_ANIM_NOTE_BLOCK, 3, 0x178 }, { SA2_ANIM_NOTE_BLOCK, 4, 0x17C }, { SA2_ANIM_NOTE_BLOCK, 5, 0x180 },
    { SA2_ANIM_NOTE_BLOCK, 6, 0x184 },
};

static const s16 sBounceSpeeds[NUM_NOTE_BLOCK_TYPES] = {
    Q_8_8(4.5 + 0. / 8.),
    Q_8_8(4.5 + 3. / 8.),
    Q_8_8(4.5 + 6. / 8.),
    Q_8_8(4.5 + 9. / 8.),
    Q_8_8(4.5 + 12. / 8.),
    Q_8_8(4.5 + 15. / 8.),
    Q_8_8(0),
};

const u16 sSfxGlockenspiel[NUM_NOTE_BLOCK_TYPES + 1] = {
    SE_MUSIC_PLANT_GLOCKENSPIEL_1, SE_MUSIC_PLANT_GLOCKENSPIEL_2, SE_MUSIC_PLANT_GLOCKENSPIEL_3, SE_MUSIC_PLANT_GLOCKENSPIEL_4,
    SE_MUSIC_PLANT_GLOCKENSPIEL_5, SE_MUSIC_PLANT_GLOCKENSPIEL_6, SE_MUSIC_PLANT_GLOCKENSPIEL_6, MUS_DUMMY,
};

void CreateEntity_NoteBlock(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Idle, sizeof(Sprite_NoteBlock), 0x2010, 0, TaskDestructor_NoteBlock);
    Sprite_NoteBlock *block = TASK_DATA(t);
    Sprite *s = &block->s;

    block->health = 3;
    block->bounceOffsetX = 0;
    block->bounceOffsetY = 0;
    block->type = me->d.uData[0];

    block->base.regionX = spriteRegionX;
    block->base.regionY = spriteRegionY;
    block->base.me = me;

    block->base.meX = me->x;
    block->base.id = spriteY;

    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 18, 2, 0);

    s->graphics.dest = &((u8 *)OBJ_VRAM0)[sAnims[block->type][2] * TILE_SIZE_4BPP];
    s->graphics.anim = sAnims[block->type][0];
    s->variant = sAnims[block->type][1];

    block->posX = TO_WORLD_POS(me->x, spriteRegionX);
    block->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    UpdateSpriteAnimation(s);
}

static void Task_Bounce(void)
{
    Sprite_NoteBlock *block = TASK_DATA(gCurTask);

    u32 frame = block->bounceFrame++;

    switch (frame) {
        case 0: {
            block->bounceOffsetX = COS_24_8(block->bounceSin * 4) * 4;
            block->bounceOffsetY = SIN_24_8(block->bounceSin * 4) * 4;
        } break;

        case 4: {
            block->bounceOffsetX = 0;
            block->bounceOffsetY = 0;

            if (block->health == 0) {
                Despawn(block);
                return;
            }

            HandleBounceComplete(block);
        } break;
    }

    UpdateBouncePosition(block);

    if (block->health != 0) {
        Render(block);
    }
}

static void LaunchPlayer(Sprite_NoteBlock *block)
{
    // This is very weird
    block->bounceSin = DEG_TO_SIN(270) / 4;
    gPlayer.qSpeedAirY = -(sBounceSpeeds[block->type]);
    gPlayer.charState = CHARSTATE_NOTE_BLOCK;
    gPlayer.transition = PLTRANS_UNCURL;
    gPlayer.prevCharState = CHARSTATE_INVALID;

    block->bounceFrame = 0;
    CreateNoteParticle(block->posX, block->posY, 5, 30, (sBounceSpeeds[block->type]) >> 3,
                       (-((sBounceSpeeds[block->type] * 3) << 14)) >> 16, 0);
    CreateNoteParticle(block->posX, block->posY, 5, 30, (-sBounceSpeeds[block->type]) >> 3,
                       (-((sBounceSpeeds[block->type] * 3) << 14)) >> 16, 1);

    if (--block->health == 1) {
        block->s.graphics.dest = &((u8 *)OBJ_VRAM0)[sAnims[ARRAY_COUNT(sAnims) - 1][2] * TILE_SIZE_4BPP];
        block->s.graphics.anim = sAnims[ARRAY_COUNT(sAnims) - 1][0];
        block->s.variant = sAnims[ARRAY_COUNT(sAnims) - 1][1];
        UpdateSpriteAnimation(&block->s);
    }

    m4aSongNumStart(sSfxGlockenspiel[block->type]);
    gCurTask->main = Task_Bounce;
}

static void Task_Idle(void)
{
    Sprite_NoteBlock *block = TASK_DATA(gCurTask);
    if (IsPlayerTouchingBlock(block)) {
        LaunchPlayer(block);
    }

    if (ShouldDespawn(block)) {
        Despawn(block);
        return;
    }

    UpdateBouncePosition(block);

    if (block->health != 0) {
        Render(block);
    }
}

static void TaskDestructor_NoteBlock(struct Task *UNUSED t) { }

static void HandleBounceComplete(Sprite_NoteBlock *block)
{
    if (block->health != 0) {
        gCurTask->main = Task_Idle;
    } else {
        Despawn(block);
    }
}

static void UpdateBouncePosition(Sprite_NoteBlock *block)
{
    Sprite *s = &block->s;

    s->x = block->posX - gCamera.x + I(block->bounceOffsetX);
    s->y = block->posY - gCamera.y + I(block->bounceOffsetY);
}

static void Render(Sprite_NoteBlock *block)
{
    Sprite *s = &block->s;

    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);

    SPRITE_FLAG_CLEAR(s, X_FLIP);
    DisplaySprite(s);
}

static bool32 ShouldDespawn(Sprite_NoteBlock *block)
{
    s32 screenX, screenY;
    u16 otherX, otherY;

#ifndef NON_MATCHING
    s32 r1;
    register s32 r4 asm("r4");
    screenX = block->posX;
    r1 = 256;
    r4 = r1;
    asm("" ::"r"(r1));
    screenX += r4;
    screenX -= gCamera.x;

    screenY = block->posY + r4;
    screenY -= gCamera.y;
#else
    screenX = block->posX;
    screenX -= gCamera.x;
    screenY = block->posY;
    screenY -= gCamera.y;
#endif

#ifndef NON_MATCHING
    otherY = screenY;
    otherX = screenX;
    if ((otherX) > 752 || (otherY) > 672) {
#else
    if ((screenX < -128 || screenX > (128 + DISPLAY_WIDTH)) || (screenY < -128 || screenY > (DISPLAY_HEIGHT + 128))) {
#endif
        return TRUE;
    }

    return FALSE;
}

static bool32 IsPlayerTouchingBlock(Sprite_NoteBlock *block)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (block->health != 0)) {
        s32 posX, posY;
        u16 otherX, otherY;
        posX = I(gPlayer.qWorldX) + 16;
        posX -= block->posX;
        posY = I(gPlayer.qWorldY) + 24;
        posY -= block->posY;

        otherY = posY;
        otherX = posX;
        if (otherX <= 32 && otherY <= 24)
            return TRUE;
    }

    return FALSE;
}

static void Despawn(Sprite_NoteBlock *block)
{
    block->base.me->x = block->base.meX;
    TaskDestroy(gCurTask);
}
