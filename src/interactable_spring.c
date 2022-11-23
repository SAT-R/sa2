#include "global.h"
#include "gba/types.h"
#include "m4a.h"
#include "malloc_vram.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"
#include "zones.h"

#include "constants/moveStates.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 main;
    /* 0x3C */ struct UNK_0808B3FC_UNK240_UNK30 sub;
} Sprite_Spring;

typedef struct {
    /* 0x00 */ u16 animIndex;
    /* 0x02 */ u16 unk2;
    /* 0x04 */ u16 numTiles;
    /* 0x06 */ u16 unk6;
} Spring_TileInfo;

#define SPRINGTYPE_NORMAL_UP   0
#define SPRINGTYPE_NORMAL_DOWN 1
// TODO: Check remaining springtype values (-> correct names!)
#define SPRINGTYPE_COUNT 10

// Some zones have specific kinds of spring-tiles
#define SPRING_KIND_NORMAL      0
#define SPRING_KIND_MUSIC_PLANT 1
#define SPRING_KIND_TECHNO_BASE 2
#define NUM_SPRING_KINDS        3

#define INITIALIZE_SPRING(springType)                                                   \
    initSprite_Interactable_Spring(springType, entity, spriteRegionX, spriteRegionY,    \
                                   param3)

#ifndef NON_MATCHING
extern
#endif
    void
    initSprite_Interactable_Spring(u8, void *, u16, u16, u8);

extern bool32 sub_800CDBC(struct UNK_0808B3FC_UNK240 *, s16, s16,
                          struct SomeStruct_59E0 *);

// TODO: make static
void Task_Interactable_Spring(void);
static void sub_800E3D0(void);
static bool32 sub_800E490(struct UNK_0808B3FC_UNK240 *p0, Interactable *inEntity,
                          Sprite_Spring *spring, struct SomeStruct_59E0 *player);
void TaskDestructor_Interactable_Spring(struct Task *t);

extern const Spring_TileInfo gUnknown_080D52E0[NUM_SPRING_KINDS][SPRINGTYPE_COUNT];

extern const u8 gUnknown_080D53D0[10];
// static const u8 gUnknown_080D53D0[10] = {14, 15, 16, 17, 18, 19, 20, 21, 18, 19};

extern const u16 gUnknown_080D53DA[5];
// static const u16 gUnknown_080D53DA[5] = {SE_MUSIC_PLANT_SPRING_1,
// SE_MUSIC_PLANT_SPRING_2, SE_MUSIC_PLANT_SPRING_3, SE_MUSIC_PLANT_SPRING_4, MUS_DUMMY};

// Finished, but doesn't match.
#ifdef NON_MATCHING
void initSprite_Interactable_Spring(u8 springType, Interactable *inEntity,
                                    u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    s16 springKind = SPRING_KIND_NORMAL;
    struct Task *t = TaskCreate(&Task_Interactable_Spring, sizeof(Sprite_Spring), 0x2010,
                                0, &TaskDestructor_Interactable_Spring);
    Sprite_Spring *spring = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240 *main = &spring->main;

    spring->base.regionX = spriteRegionX;
    spring->base.regionY = spriteRegionY;
    spring->base.entity = inEntity;
    spring->base.spriteX = inEntity->x;
    spring->base.spriteY = spriteY;

    main->unk16 = SpriteGetScreenPos(inEntity->x, spriteRegionX);
    main->unk18 = SpriteGetScreenPos(inEntity->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(inEntity);

    main->unk1A = 0x480;
    main->unk8 = springKind;
    main->unk14 = springKind;
    main->unk1C = springKind;

    main->unk21 = 0xFF;
    main->unk22 = 0x10;
    main->unk25 = 0;
    main->unk28 = -1;
    main->unk10 = 0x2200;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3)
        springKind = SPRING_KIND_MUSIC_PLANT;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        springKind = SPRING_KIND_TECHNO_BASE;

    if (((s16)springKind != SPRING_KIND_MUSIC_PLANT) || ((springType / 2) != 0)) {
        u16 tileCount = gUnknown_080D52E0[springKind][springType].numTiles;
        main->unk4 = VramMalloc(tileCount);
    } else {
        main->unk4 = (void *)(OBJ_VRAM0 + 0x2980);
    }

    {
        Spring_TileInfo *tileInfo
            = (Spring_TileInfo *)&gUnknown_080D52E0[springKind][springType];
        main->unkA = tileInfo->animIndex;
        main->unk20 = tileInfo->unk2;

        main->unk10 |= tileInfo->unk6;
        spring->sub.unk0 = springType;
        spring->sub.unk1 = inEntity->data[0] & 0x3;
        sub_8004558(main);
    }
}
#endif

// @HACK
#define TO_TYPE(type, p, index) (((type *)(p))[index])

// TODO: make static
void Task_Interactable_Spring(void)
{
    Sprite_Spring *spring = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *main = &spring->main;
    Interactable *entity = spring->base.entity;

    if (sub_800E490(main, entity, spring, &gPlayer) != 0) {
        gCurTask->main = &sub_800E3D0;
        main->unk20++;

        if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3 && (spring->sub.unk0 / 2) == 0))
            main->unk4 = (void *)(OBJ_VRAM0 + 0x2B00);
    }

#ifndef NON_MATCHING
    if (IS_OUT_OF_CAM_RANGE(main->unk16, TO_TYPE(s16, main, 12)))
#else
    if (IS_OUT_OF_CAM_RANGE(main->unk16, main->unk18))
#endif
    {
        entity->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(main);
    }
}

static void sub_800E3D0(void)
{
    Sprite_Spring *spring = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *main = &spring->main;
    Interactable *entity = spring->base.entity;

    sub_800E490(main, entity, spring, &gPlayer);
#ifndef NON_MATCHING
    if (IS_OUT_OF_CAM_RANGE(main->unk16, TO_TYPE(s16, main, 12)))
#else
    if (IS_OUT_OF_CAM_RANGE(main->unk16, main->unk18))
#endif
    {
        entity->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (sub_8004558(main) == 0) {
            main->unk20--;

            if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3)
                && (spring->sub.unk0 / 2) == 0) {
                main->unk4 = (void *)(OBJ_VRAM0 + 0x2980);
            }

            sub_8004558(main);
            gCurTask->main = &Task_Interactable_Spring;
        }

        sub_80051E8(main);
    }
}

#undef TO_S16

static bool32 sub_800E490(struct UNK_0808B3FC_UNK240 *p0, Interactable *inEntity,
                          Sprite_Spring *spring, struct SomeStruct_59E0 *player)
{
    s16 xPos = SpriteGetScreenPos(spring->base.spriteX, spring->base.regionX);
    s16 yPos = SpriteGetScreenPos(inEntity->y, spring->base.regionY);
    p0->unk16 = xPos - gCamera.unk0;
    p0->unk18 = yPos - gCamera.unk4;

    if (((player->unk20 & MOVESTATE_400000) == 0)
        && sub_800CDBC(p0, xPos, yPos, player) != 0) {

        player->unk6D = gUnknown_080D53D0[spring->sub.unk0];
        player->unk6E = spring->sub.unk1;
        player->unk6C = 1;

        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            m4aSongNumStart(gUnknown_080D53DA[spring->sub.unk1]);
        } else {
            m4aSongNumStart(SE_SPRING);
        }

        return TRUE;
    } else {
        return FALSE;
    }
}

void TaskDestructor_Interactable_Spring(struct Task *t)
{
    Sprite_Spring *spring = TaskGetStructPtr(t);
    if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_3) || (spring->sub.unk0 / 2 != 0)) {
        VramFree(spring->main.unk4);
    }
}

void initSprite_Interactable_Spring_Big_DownLeft(void *entity, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(6);
}

void initSprite_Interactable_Spring_Normal_Down(void *entity, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_DOWN);
}

void initSprite_Interactable_Spring_Big_DownRight(void *entity, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(7);
}

void initSprite_Interactable_Spring_Normal_Left(void *entity, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(2);
}

void initSprite_Interactable_Spring_Normal_Right(void *entity, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(3);
}

void initSprite_Interactable_Spring_Big_UpLeft(void *entity, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(4);
}

void initSprite_Interactable_Spring_Normal_Up(void *entity, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_UP);
}

void initSprite_Interactable_Spring_Big_UpRight(void *entity, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(5);
}

void initSprite_Interactable_Spring_Small_UpLeft(void *entity, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(8);
}

void initSprite_Interactable_Spring_Small_UpRight(void *entity, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(9);
}
