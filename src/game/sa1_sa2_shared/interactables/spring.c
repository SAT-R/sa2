#include "global.h"

#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

#include "lib/m4a/m4a.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/interactables/spring.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3D */ u8 dir;
    /* 0x3E */ u8 speedId;
} Sprite_Spring;

#define SPRINGTYPE_NORMAL_UP     0
#define SPRINGTYPE_NORMAL_DOWN   1
#define SPRINGTYPE_NORMAL_LEFT   2
#define SPRINGTYPE_NORMAL_RIGHT  3
#define SPRINGTYPE_BIG_UPLEFT    4
#define SPRINGTYPE_BIG_UPRIGHT   5
#define SPRINGTYPE_BIG_DOWNLEFT  6
#define SPRINGTYPE_BIG_DOWNRIGHT 7
#define SPRINGTYPE_SMALL_UPLEFT  8
#define SPRINGTYPE_SMALL_UPRIGHT 9
// TODO: Check remaining springtype values (-> correct names!)
#define SPRINGTYPE_COUNT 10

// Some zones have specific kinds of spring-tiles
#define SPRING_KIND_NORMAL      0
#define SPRING_KIND_MUSIC_PLANT 1
#define SPRING_KIND_TECHNO_BASE 2
#define NUM_SPRING_KINDS        3

#define INITIALIZE_SPRING(springType) CreateEntity_Spring(springType, me, spriteRegionX, spriteRegionY, param3)

static void CreateEntity_Spring(u8, MapEntity *, u16, u16, u8);
static void Task_Spring_Idle(void);
static void Task_Spring_Activated(void);
static bool32 CheckSpringPlayerCollisions(Sprite *p0, MapEntity *me, Sprite_Spring *spring, Player *player);
static void TaskDestructor_Spring(struct Task *t);

#ifndef COLLECT_RINGS_ROM
static const u16 sSpringAnimationData[NUM_SPRING_KINDS][SPRINGTYPE_COUNT][4] = {
    {
        [SPRINGTYPE_NORMAL_UP] = { SA2_ANIM_SPRING, 0, 20, 0x0000 },
        [SPRINGTYPE_NORMAL_DOWN] = { SA2_ANIM_SPRING, 0, 20, SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_NORMAL_LEFT] = { SA2_ANIM_SPRING, 2, 20, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_NORMAL_RIGHT] = { SA2_ANIM_SPRING, 2, 20, 0x0000 },
        [SPRINGTYPE_BIG_UPLEFT] = { SA2_ANIM_SPRING, 4, 20, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_BIG_UPRIGHT] = { SA2_ANIM_SPRING, 4, 20, 0x0000 },
        [SPRINGTYPE_BIG_DOWNLEFT] = { SA2_ANIM_SPRING, 4, 20, SPRITE_FLAG_MASK_X_FLIP | SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_BIG_DOWNRIGHT] = { SA2_ANIM_SPRING, 4, 20, SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_SMALL_UPLEFT] = { SA2_ANIM_SPRING, 6, 15, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_SMALL_UPRIGHT] = { SA2_ANIM_SPRING, 6, 15, 0x0000 },
    },
    {
        [SPRINGTYPE_NORMAL_UP] = { SA2_ANIM_SPRING_MUS_PLA, 0, 20, 0x0000 },
        [SPRINGTYPE_NORMAL_DOWN] = { SA2_ANIM_SPRING_MUS_PLA, 0, 20, SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_NORMAL_LEFT] = { SA2_ANIM_SPRING_MUS_PLA_2, 0, 20, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_NORMAL_RIGHT] = { SA2_ANIM_SPRING_MUS_PLA_2, 0, 20, 0x0000 },
        [SPRINGTYPE_BIG_UPLEFT] = { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_BIG_UPRIGHT] = { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, 0x0000 },
        [SPRINGTYPE_BIG_DOWNLEFT] = { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, SPRITE_FLAG_MASK_X_FLIP | SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_BIG_DOWNRIGHT] = { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_SMALL_UPLEFT] = { SA2_ANIM_SPRING_MUS_PLA_2, 4, 20, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_SMALL_UPRIGHT] = { SA2_ANIM_SPRING_MUS_PLA_2, 4, 20, 0x0000 },
    },
    {
        [SPRINGTYPE_NORMAL_UP] = { SA2_ANIM_SPRING_TEC_BAS, 0, 20, 0x0000 },
        [SPRINGTYPE_NORMAL_DOWN] = { SA2_ANIM_SPRING_TEC_BAS, 0, 20, SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_NORMAL_LEFT] = { SA2_ANIM_SPRING_TEC_BAS, 2, 20, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_NORMAL_RIGHT] = { SA2_ANIM_SPRING_TEC_BAS, 2, 20, 0x0000 },
        [SPRINGTYPE_BIG_UPLEFT] = { SA2_ANIM_SPRING_TEC_BAS, 4, 16, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_BIG_UPRIGHT] = { SA2_ANIM_SPRING_TEC_BAS, 4, 16, 0x0000 },
        [SPRINGTYPE_BIG_DOWNLEFT] = { SA2_ANIM_SPRING_TEC_BAS, 4, 16, SPRITE_FLAG_MASK_X_FLIP | SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_BIG_DOWNRIGHT] = { SA2_ANIM_SPRING_TEC_BAS, 4, 16, SPRITE_FLAG_MASK_Y_FLIP },
        [SPRINGTYPE_SMALL_UPLEFT] = { SA2_ANIM_SPRING_TEC_BAS, 6, 12, SPRITE_FLAG_MASK_X_FLIP },
        [SPRINGTYPE_SMALL_UPRIGHT] = { SA2_ANIM_SPRING_TEC_BAS, 6, 12, 0x0000 },
    },
};

// Effects applied onto the player-state.
// These trigger the player acceleration when touching each of the spring directions
static const u8 sSpringDirToPlayerTransition[SPRINGTYPE_COUNT]
    = { PLTRANS_SPRING_UP,       PLTRANS_SPRING_DOWN,      PLTRANS_SPRING_LEFT,       PLTRANS_SPRING_RIGHT,   PLTRANS_SPRING_UP_LEFT,
        PLTRANS_SPRING_UP_RIGHT, PLTRANS_SPRING_DOWN_LEFT, PLTRANS_SPRING_DOWN_RIGHT, PLTRANS_SPRING_UP_LEFT, PLTRANS_SPRING_UP_RIGHT };

static const u16 sSpring_MusicPlant_Soundeffects[5]
    = { SE_MUSIC_PLANT_SPRING_1, SE_MUSIC_PLANT_SPRING_2, SE_MUSIC_PLANT_SPRING_3, SE_MUSIC_PLANT_SPRING_4, MUS_DUMMY };
#else
extern const u8 gUnknown_02015B24[SPRINGTYPE_COUNT][2];
extern const u8 sSpringDirToPlayerTransition[SPRINGTYPE_COUNT];
extern const u16 sSpring_MusicPlant_Soundeffects[5];
#endif

void CreateEntity_Spring(u8 springType, MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    s16 springKind = SPRING_KIND_NORMAL;
    struct Task *t = TaskCreate(Task_Spring_Idle, sizeof(Sprite_Spring), 0x2010, 0, TaskDestructor_Spring);
    Sprite_Spring *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = spriteRegionX;
    spring->base.regionY = spriteRegionY;
    spring->base.me = me;
    spring->base.spriteX = me->x;
    spring->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;

    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2200;
#ifndef COLLECT_RINGS_ROM
    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3)
        springKind = SPRING_KIND_MUSIC_PLANT;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        springKind = SPRING_KIND_TECHNO_BASE;

    if (((s16)springKind != SPRING_KIND_MUSIC_PLANT) || ((springType / 2) != 0)) {
        u16 tileCount = sSpringAnimationData[springKind][springType][2];
        s->graphics.dest = VramMalloc(tileCount);
    } else {
        s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
    }

    s->graphics.anim = sSpringAnimationData[springKind][springType][0];
    s->variant = sSpringAnimationData[springKind][springType][1];

    s->frameFlags |= sSpringAnimationData[springKind][springType][3];
#else
    s->graphics.dest = VramMalloc(0x14);
    s->graphics.anim = 0x66;
    s->variant = gUnknown_02015B24[springType][0];

    if (gUnknown_02015B24[springType][1] & 1) {
        s->frameFlags |= 0x400;
    }

    if (gUnknown_02015B24[springType][1] & 2) {
        s->frameFlags |= 0x800;
    }
#endif

    spring->dir = springType;
    spring->speedId = me->d.sData[0] & 0x3;
    UpdateSpriteAnimation(s);
}

static void Task_Spring_Idle(void)
{
    Sprite_Spring *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;

    if (CheckSpringPlayerCollisions(s, me, spring, &gPlayer) != 0) {
        gCurTask->main = Task_Spring_Activated;
        s->variant++;

#ifndef COLLECT_RINGS_ROM
        if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3 && (spring->dir / 2) == 0))
            s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2B00);
#endif
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        DisplaySprite(s);
    }
}

static void Task_Spring_Activated(void)
{
    Sprite_Spring *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;

    CheckSpringPlayerCollisions(s, me, spring, &gPlayer);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (UpdateSpriteAnimation(s) == 0) {
            s->variant--;
#ifndef COLLECT_RINGS_ROM
            if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) && (spring->dir / 2) == 0) {
                s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
            }
#endif

            UpdateSpriteAnimation(s);
            gCurTask->main = Task_Spring_Idle;
        }

        DisplaySprite(s);
    }
}

static bool32 CheckSpringPlayerCollisions(Sprite *s, MapEntity *me, Sprite_Spring *spring, Player *player)
{
    s16 xPos = TO_WORLD_POS(spring->base.spriteX, spring->base.regionX);
    s16 yPos = TO_WORLD_POS(me->y, spring->base.regionY);
    s->x = xPos - gCamera.x;
    s->y = yPos - gCamera.y;

    if (((player->moveState & MOVESTATE_IA_OVERRIDE) == 0) && Coll_Player_Interactable(s, xPos, yPos, player) != 0) {
        player->transition = sSpringDirToPlayerTransition[spring->dir];
        player->unk6E = spring->speedId;
        player->unk6C = TRUE;

#ifndef COLLECT_RINGS_ROM
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            m4aSongNumStart(sSpring_MusicPlant_Soundeffects[spring->speedId]);
        } else
#endif
        {
            m4aSongNumStart(SE_SPRING);
        }

        return TRUE;
    } else {
        return FALSE;
    }
}

static void TaskDestructor_Spring(struct Task *t)
{
    Sprite_Spring *spring = TASK_DATA(t);
#ifndef COLLECT_RINGS_ROM
    if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_3) || (spring->dir / 2 != 0))
#endif
    {
        VramFree(spring->s.graphics.dest);
    }
}

void CreateEntity_Spring_Big_DownLeft(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_BIG_DOWNLEFT);
}

void CreateEntity_Spring_Normal_Down(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_DOWN);
}

void CreateEntity_Spring_Big_DownRight(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_BIG_DOWNRIGHT);
}

void CreateEntity_Spring_Normal_Left(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_LEFT);
}

void CreateEntity_Spring_Normal_Right(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_RIGHT);
}

void CreateEntity_Spring_Big_UpLeft(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_BIG_UPLEFT);
}

void CreateEntity_Spring_Normal_Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_UP);
}

void CreateEntity_Spring_Big_UpRight(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_BIG_UPRIGHT);
}

void CreateEntity_Spring_Small_UpLeft(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_SMALL_UPLEFT);
}

void CreateEntity_Spring_Small_UpRight(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_SMALL_UPRIGHT);
}
