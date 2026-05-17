#include <string.h> // memcpy
#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    u8 letter;
    u8 unk3D;
    u8 duration;
    u8 unk3F;
    u8 delay;
} Letter; /* 0x44 */

void Task_SegaSonicLetter(void);
void TaskDestructor_SegaSonicLetter(Task *t);

ALIGNED(8) const u16 gUnknown_086CED90[] = { 500, 0x190, 0x12C };

// (100.0%) https://decomp.me/scratch/AVFO8
// It's just the memcpy...
NONMATCH("asm/non_matching/game/sa1/stage/interactables/CreateEntity_SegaSonicLetter.inc",
         void CreateEntity_SegaSonicLetter(MapEntity *me, u16 regionX, u16 regionY, u8 id))
{
    Task *t;
    Letter *letter;
    Sprite *s;
#if 0
    // This matches... but can't be right, the data is used in Task_SegaSonicLetter
    u16 arr[3] = { 500, 400, 300 };
#else
    // memcpy gets optimized away...
    u16 arr[3];
    memcpy(arr, gUnknown_086CED90, sizeof(arr));
#endif
    t = TaskCreate(Task_SegaSonicLetter, sizeof(Letter), 0x2000, 0, TaskDestructor_SegaSonicLetter);
    letter = TASK_DATA(t);
    s = &letter->s;

    letter->base.regionX = regionX;
    letter->base.regionY = regionY;
    letter->base.me = me;
    letter->base.meX = me->x;
    letter->base.id = id;

    letter->letter = me->d.sData[0];
    letter->unk3D = 0;
    letter->duration = me->d.uData[1] & 0x3;
    letter->unk3F = ((arr[me->d.uData[1] & 0x3] - 161) >> 1);

    letter->delay = me->d.uData[2];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SEGA_SONIC_LETTERS);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SEGA_SONIC_LETTERS;
    s->variant = letter->letter * 4;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}
END_NONMATCH

// (100.0%) https://decomp.me/scratch/AF9HF
// It's just the memcpy...
NONMATCH("asm/non_matching/game/sa1/stage/interactables/Task_SegaSonicLetter.inc", void Task_SegaSonicLetter(void))
{
    Letter *letter;
    Sprite *s;
    MapEntity *me;
    CamCoord worldX, worldY;
    s32 i;
    s32 sl; // isSolid?
    u32 r1;

#if 0
    // This matches... but can't be right, the data is used in CreateEntity_SegaSonicLetter
    AnimId arr[3] = { 500, 400, 300 };
#else
    // memcpy gets optimized away...
    AnimId arr[3];
    memcpy(arr, gUnknown_086CED90, sizeof(arr));
#endif

    letter = TASK_DATA(gCurTask);
    s = &letter->s;
    me = letter->base.me;

    worldX = TO_WORLD_POS(letter->base.meX, letter->base.regionX);
    worldY = TO_WORLD_POS(me->y, letter->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, letter->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    sl = 0;

    r1 = Mod(gStageTime - letter->delay, arr[letter->duration]);

    if (r1 < 58) {
        sl = 1;

        if (r1 == 0) {
            sl = 0;

            s->prevVariant = -1;
            s->variant = letter->letter * 4 + 1;
        }
    } else if (r1 < letter->unk3F + 58) {
        sl = 1;

        if (r1 == 58) {
            s->prevVariant = -1;
            s->variant = letter->letter * 4 + 3;
            asm("");
        }
    } else if (r1 < arr[letter->duration] - letter->unk3F) {
        sl = 1;

        if (r1 == letter->unk3F + 58) {
            sl = 0;
            s->prevVariant = -1;
            s->variant = letter->letter * 4 + 0;
        }
    } else {
        if (r1 == arr[letter->duration] - letter->unk3F) {
            s->prevVariant = -1;
            s->variant = letter->letter * 4 + 2;
        }

        i = 0;
        do {
            u32 res = Coll_Player_Entity_Intersection(s, worldX, worldY, &PLAYER(i));
            if (res != 0) {
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    i = 0;
    do {
        if (sl == 1) {
            Coll_Player_Platform(s, worldX, worldY, &PLAYER(i));
        }
    } while (++i < gNumSingleplayerCharacters);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

void TaskDestructor_SegaSonicLetter(Task *t)
{
    Letter *letter = TASK_DATA(t);
    VramFree(letter->s.graphics.dest);
}