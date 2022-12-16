#include "global.h"
#include "gba/types.h"
#include "m4a.h"
#include "malloc_vram.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"
#include "zones.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E;
} Sprite_Spring;

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
    initSprite_Interactable_Spring(springType, ia, spriteRegionX, spriteRegionY, param3)

static void initSprite_Interactable_Spring(u8, Interactable *, u16, u16, u8);
static void Task_Interactable_Spring(void);
static void sub_800E3D0(void);
static bool32 sub_800E490(Sprite *p0, Interactable *ia, Sprite_Spring *spring,
                          Player *player);
static void TaskDestructor_Interactable_Spring(struct Task *t);

extern bool32 sub_800CDBC(Sprite *, s16, s16, Player *);

static const u16 sSpringAnimationData[NUM_SPRING_KINDS][SPRINGTYPE_COUNT][4] = {
    {
        { SA2_ANIM_SPRING, 0, 20, 0x0000 },
        { SA2_ANIM_SPRING, 0, 20, 0x0800 },
        { SA2_ANIM_SPRING, 2, 20, 0x0400 },
        { SA2_ANIM_SPRING, 2, 20, 0x0000 },
        { SA2_ANIM_SPRING, 4, 20, 0x0400 },
        { SA2_ANIM_SPRING, 4, 20, 0x0000 },
        { SA2_ANIM_SPRING, 4, 20, 0x0C00 },
        { SA2_ANIM_SPRING, 4, 20, 0x0800 },
        { SA2_ANIM_SPRING, 6, 15, 0x0400 },
        { SA2_ANIM_SPRING, 6, 15, 0x0000 },
    },
    {
        { SA2_ANIM_SPRING_MUS_PLA, 0, 20, 0x0000 },
        { SA2_ANIM_SPRING_MUS_PLA, 0, 20, 0x0800 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 0, 20, 0x0400 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 0, 20, 0x0000 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, 0x0400 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, 0x0000 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, 0x0C00 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 2, 25, 0x0800 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 4, 20, 0x0400 },
        { SA2_ANIM_SPRING_MUS_PLA_2, 4, 20, 0x0000 },
    },
    {
        { SA2_ANIM_SPIKES_TEC_BAS, 0, 20, 0x0000 },
        { SA2_ANIM_SPIKES_TEC_BAS, 0, 20, 0x0800 },
        { SA2_ANIM_SPIKES_TEC_BAS, 2, 20, 0x0400 },
        { SA2_ANIM_SPIKES_TEC_BAS, 2, 20, 0x0000 },
        { SA2_ANIM_SPIKES_TEC_BAS, 4, 16, 0x0400 },
        { SA2_ANIM_SPIKES_TEC_BAS, 4, 16, 0x0000 },
        { SA2_ANIM_SPIKES_TEC_BAS, 4, 16, 0x0C00 },
        { SA2_ANIM_SPIKES_TEC_BAS, 4, 16, 0x0800 },
        { SA2_ANIM_SPIKES_TEC_BAS, 6, 12, 0x0400 },
        { SA2_ANIM_SPIKES_TEC_BAS, 6, 12, 0x0000 },
    },
};

// Effects applied onto the player-state.
// These trigger the player acceleration when touching each of the spring directions
static const u8 gUnknown_080D53D0[SPRINGTYPE_COUNT]
    = { 14, 15, 16, 17, 18, 19, 20, 21, 18, 19 };

static const u16 sSpring_MusicPlant_Soundeffects[5]
    = { SE_MUSIC_PLANT_SPRING_1, SE_MUSIC_PLANT_SPRING_2, SE_MUSIC_PLANT_SPRING_3,
        SE_MUSIC_PLANT_SPRING_4, MUS_DUMMY };

// Finished, but doesn't match.
static void initSprite_Interactable_Spring(u8 springType, Interactable *ia,
                                           u16 spriteRegionX, u16 spriteRegionY,
                                           u8 spriteY)
{
    s16 springKind = SPRING_KIND_NORMAL;
    struct Task *t = TaskCreate(Task_Interactable_Spring, sizeof(Sprite_Spring), 0x2010,
                                0, TaskDestructor_Interactable_Spring);
    Sprite_Spring *spring = TaskGetStructPtr(t);
    Sprite *displayed = &spring->displayed;

    spring->base.regionX = spriteRegionX;
    spring->base.regionY = spriteRegionY;
    spring->base.ia = ia;
    spring->base.spriteX = ia->x;
    spring->base.spriteY = spriteY;

    displayed->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    displayed->unk1A = 0x480;
    displayed->unk8 = springKind;
    displayed->unk14 = springKind;
    displayed->unk1C = springKind;

    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->focused = 0;
    displayed->unk28[0].unk0 = -1;
    displayed->unk10 = 0x2200;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3)
        springKind = SPRING_KIND_MUSIC_PLANT;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        springKind = SPRING_KIND_TECHNO_BASE;

    if (((s16)springKind != SPRING_KIND_MUSIC_PLANT) || ((springType / 2) != 0)) {
        u16 tileCount = sSpringAnimationData[springKind][springType][2];
        displayed->vram = VramMalloc(tileCount);
    } else {
        displayed->vram = (void *)(OBJ_VRAM0 + 0x2980);
    }

    displayed->anim = sSpringAnimationData[springKind][springType][0];
    displayed->variant = sSpringAnimationData[springKind][springType][1];

    displayed->unk10 |= sSpringAnimationData[springKind][springType][3];
    spring->unk3D = springType;
    spring->unk3E = ia->d.sData[0] & 0x3;
    sub_8004558(displayed);
}

// TODO: make static
static void Task_Interactable_Spring(void)
{
    Sprite_Spring *spring = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &spring->displayed;
    Interactable *ia = spring->base.ia;

    if (sub_800E490(displayed, ia, spring, &gPlayer) != 0) {
        gCurTask->main = sub_800E3D0;
        displayed->variant++;

        if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3 && (spring->unk3D / 2) == 0))
            displayed->vram = (void *)(OBJ_VRAM0 + 0x2B00);
    }

    if (IS_OUT_OF_CAM_RANGE(displayed->x, (s16)displayed->y)) {
        ia->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(displayed);
    }
}

static void sub_800E3D0(void)
{
    Sprite_Spring *spring = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &spring->displayed;
    Interactable *ia = spring->base.ia;

    sub_800E490(displayed, ia, spring, &gPlayer);

    if (IS_OUT_OF_CAM_RANGE(displayed->x, (s16)displayed->y)) {
        ia->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (sub_8004558(displayed) == 0) {
            displayed->variant--;

            if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) && (spring->unk3D / 2) == 0) {
                displayed->vram = (void *)(OBJ_VRAM0 + 0x2980);
            }

            sub_8004558(displayed);
            gCurTask->main = Task_Interactable_Spring;
        }

        sub_80051E8(displayed);
    }
}

static bool32 sub_800E490(Sprite *displayed, Interactable *ia, Sprite_Spring *spring,
                          Player *player)
{
    s16 xPos = SpriteGetScreenPos(spring->base.spriteX, spring->base.regionX);
    s16 yPos = SpriteGetScreenPos(ia->y, spring->base.regionY);
    displayed->x = xPos - gCamera.x;
    displayed->y = yPos - gCamera.y;

    if (((player->moveState & MOVESTATE_400000) == 0)
        && sub_800CDBC(displayed, xPos, yPos, player) != 0) {

        player->unk6D = gUnknown_080D53D0[spring->unk3D];
        player->unk6E = spring->unk3E;
        player->unk6C = 1;

        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            m4aSongNumStart(sSpring_MusicPlant_Soundeffects[spring->unk3E]);
        } else {
            m4aSongNumStart(SE_SPRING);
        }

        return TRUE;
    } else {
        return FALSE;
    }
}

static void TaskDestructor_Interactable_Spring(struct Task *t)
{
    Sprite_Spring *spring = TaskGetStructPtr(t);
    if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_3) || (spring->unk3D / 2 != 0)) {
        VramFree(spring->displayed.vram);
    }
}

void initSprite_Interactable_Spring_Big_DownLeft(Interactable *ia, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(6);
}

void initSprite_Interactable_Spring_Normal_Down(Interactable *ia, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_DOWN);
}

void initSprite_Interactable_Spring_Big_DownRight(Interactable *ia, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(7);
}

void initSprite_Interactable_Spring_Normal_Left(Interactable *ia, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(2);
}

void initSprite_Interactable_Spring_Normal_Right(Interactable *ia, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(3);
}

void initSprite_Interactable_Spring_Big_UpLeft(Interactable *ia, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(4);
}

void initSprite_Interactable_Spring_Normal_Up(Interactable *ia, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(SPRINGTYPE_NORMAL_UP);
}

void initSprite_Interactable_Spring_Big_UpRight(Interactable *ia, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(5);
}

void initSprite_Interactable_Spring_Small_UpLeft(Interactable *ia, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(8);
}

void initSprite_Interactable_Spring_Small_UpRight(Interactable *ia, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(9);
}
