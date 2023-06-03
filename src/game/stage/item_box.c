#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/entity.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    Sprite s2;
    s32 x;
    s32 y;
    u16 unk74;
    u8 kind;
    u8 unk77;
    u8 unk78;
} Entity_ItemBox; /* size: 0x7C */

void sub_800B1AC(Entity_ItemBox *);
void sub_800B580(Entity_ItemBox *, s32);
void Task_800B704(void);
void Task_800B780(void);
void Task_800B7D0(void);
void TaskDestructor_800B80C(struct Task *);

const u16 ItemBox_MysteryIcons[13][3] = {
    {SA2_ANIM_ITEMBOX_TYPE, 0   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 5   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 6   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 7   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 8   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 9   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 10  , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 11  , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 13  , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 14  , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 15  , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 16  , 4},
    {SA2_ANIM_ITEMBOX_TYPE, 12  , 4},
};

const u16 ItemBox_1UpIcons[5][3] = {
    {SA2_ANIM_ITEMBOX_TYPE, CHARACTER_SONIC   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, CHARACTER_CREAM   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, CHARACTER_TAILS   , 4},
    {SA2_ANIM_ITEMBOX_TYPE, CHARACTER_KNUCKLES, 4},
    {SA2_ANIM_ITEMBOX_TYPE, CHARACTER_AMY     , 4},
};

const u16 gUnknown_080D51E4[] = {5, 13, 4, 13, 3, 13, 6, 13};
const u16 gUnknown_080D51F4[] = {8, 9, 10, 11};
const u8 gUnknown_080D51FC[] = {1, 5, 10, 30, 50, 0, 0, 0};

void CreateEntity_ItemBox(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    struct Task *t;
    Entity_ItemBox *itembox;
    Sprite *s;
    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        if (me->index == 0) {
            goto CreateEntity_Bell_defer;
        }

        if (me->index == 5) {
            me->index = 7;
        }
    }

    t = TaskCreate(Task_800B704, sizeof(Entity_ItemBox), 0x2000, 0,
                   TaskDestructor_800B80C);
    itembox = TaskGetStructPtr(t);
    itembox->kind = me->index;
    itembox->unk74 = 0;
    itembox->x = TO_WORLD_POS(me->x, spriteRegionX);
    itembox->y = TO_WORLD_POS(me->y, spriteRegionY);
    itembox->base.regionX = spriteRegionX;
    itembox->base.regionY = spriteRegionY;
    itembox->base.me = me;
    itembox->base.spriteX = me->x;
    itembox->base.spriteY = spriteY;

    s = &itembox->s;
    s->unk1A = 0x4C0;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.anim = SA2_ANIM_ITEMBOX;
    s->variant = 0;
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX);
    sub_8004558(s);

    s = &itembox->s2;
    s->unk1A = 0x500;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX_TYPE);
    sub_800B580(itembox, 1);

CreateEntity_Bell_defer:
    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_800B1AC(Entity_ItemBox *itembox)
{
    if(itembox->unk78 != 1 || gPlayer.moveState & MOVESTATE_IN_AIR) {
        gPlayer.speedAirY = -Q_24_8(3.0);
        gPlayer.unk64 = 38;
        gPlayer.unk66 = -1;
        gPlayer.unk6D = 5;
    }

    m4aSongNumStart(SE_ITEM_BOX_2);

    sub_800B9B8(itembox->x, itembox->y);

    itembox->unk77 = 0;
    
    if(IS_MULTI_PLAYER) {
        struct UNK_3005510 *unk = sub_8019224();
        unk->unk0 = 2;
        unk->unk1 = itembox->base.regionX;
        unk->unk2 = itembox->base.regionY;
        unk->unk3 = itembox->base.spriteY;
    }

    gCurTask->main = Task_800B780;
}

//asm(".end");
void sub_800B23C(Entity_ItemBox *itembox)
{
    s32 oldRingCount;

    switch(itembox->kind)
    {
    case 0: {
        u32 newLives = gNumLives;
        if(++newLives > 255) {
            newLives = 255;
        }
        gNumLives = newLives;

        gUnknown_030054A8.unk3 = 16;
    } break;
    
    case 1: {
        if(!(gPlayer.unk37 & 0x1)) {
            gPlayer.unk37 &= ~0x8;
            gPlayer.unk37 |= 0x1;
            
            if(!(gPlayer.unk37 & 0x2)) {
                sub_802A7A8(gPlayer.unk60);
            }
        }

    } break;
    
    case 2: {
        if(!(gPlayer.unk37 & 0x8)) {
            gPlayer.unk37 &= ~0x1;
            gPlayer.unk37 |= 0x8;
            
            if(!(gPlayer.unk37 & 0x2)) {
                sub_802A8F8(gPlayer.unk60);
            }
        }

    } break;
    
    case 3: {
        gPlayer.unk2E = 0x4B0;

        if(IS_SINGLE_PLAYER || !(gPlayer.unk37 & 0x2)) {
            gPlayer.unk37 |= 0x2;
            sub_802A854(gPlayer.unk60);
            gUnknown_030054A8.unk2 = 16;
        }
    } break;
    
    case 4: {
        gPlayer.unk37 |= 0x4;
        gPlayer.unk30 = 0x4B0;

        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x200);

        if(IS_MULTI_PLAYER) {
            gPlayer.unk37 &= ~0x10;
        }
    } break;
    
    case 5: {
        s32 rnd = gUnknown_080D51FC[(u32)PseudoRandom32() % 5];
        oldRingCount = gRingCount;
        gRingCount += rnd;
        goto sub_800B23C_case7;
    } break;
    
    case 6: {
        oldRingCount = gRingCount;
        gRingCount += 5;
        goto sub_800B23C_case7;
    } break;
    
    case 7: {
        oldRingCount = gRingCount;
        gRingCount += 10;

sub_800B23C_case7:
        if(gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            s32 newLivesCount = Div(gRingCount, 100);

            if(newLivesCount != Div(oldRingCount, 100) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                u32 newLives = gNumLives;
                if(++newLives > 255) {
                    newLives = 255;
                }
                gNumLives = newLives;
                
                gUnknown_030054A8.unk3 = 16;
            }

            if(gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                u32 newLives = gNumLives;
                if(++newLives > 255) {
                    newLives = 255;
                }
                gNumLives = newLives;
            }

            m4aSongNumStart(SE_RING_COPY);
        }
    } break;
    
    case 8: {
        s32 r6 = -1;
        u8 i;
        u8 sl = 0;

        for(i = 0; i < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[i] != NULL; i++) {
            struct MultiplayerPlayer *mpp;
            s32 someX, someY;

            // (REG_SIOCNT & SIO_ID) >> 4
            u32 sioId = (*(vu32*)&REG_SIOCNT << 26) >> 30;

            if(i == sioId)
                continue;

            mpp = TaskGetStructPtr(gMultiplayerPlayerTasks[i]);
            someX = Q_24_8_TO_INT(gPlayer.x) - mpp->unk50;
            someX *= someX;
            someY = Q_24_8_TO_INT(gPlayer.y) - mpp->unk52;
            someY *= someY;

            if(r6 < someX * someY) {
                r6 = someX * someY;
                sl = i;
            }
        }
        
        {
            struct UNK_3005510 *unkPtr = sub_8019224();
            unkPtr->unk0 = 6;
            unkPtr->unk1 = 1;
            unkPtr->unk2 = sl;
        }

        m4aSongNumStart(SE_218);
    } break;
    
    case 9: {
        struct UNK_3005510 *unkPtr = sub_8019224();
        unkPtr->unk0 = 0;
        unkPtr->unk1 = 1;
        m4aSongNumStart(SE_217);
    } break;
    
    case 10: {
        struct UNK_3005510 *unkPtr = sub_8019224();
        unkPtr->unk0 = 6;
        unkPtr->unk1 = 2;
        m4aSongNumStart(SE_217);
    } break;
    
    case 11: {
        struct UNK_3005510 *unkPtr = sub_8019224();
        unkPtr->unk0 = 6;
        unkPtr->unk1 = 3;
        m4aSongNumStart(SE_219);
    } break;
    
    case 12: {
        struct UNK_3005510 *unkPtr = sub_8019224();
        unkPtr->unk0 = 6;
        unkPtr->unk1 = 4;
        m4aSongNumStart(SE_216);
    } break;

    }

    itembox->unk77 = 0;
    gCurTask->main = Task_800B7D0;
}