#include "global.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/interactables_2/techno_base/light_bridge.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/interactables.h"
#include "constants/animations.h"
#include "constants/songs.h"

#define MACRO_F7C(a, b, c)                                                                                                                 \
    ({                                                                                                                                     \
        s32 temp = ((a) - (b));                                                                                                            \
        temp += (c);                                                                                                                       \
        temp;                                                                                                                              \
    })

typedef struct {
    Sprite sprites[NUM_BRIDGE_SPRITES];
    s32 posX;
    s32 posY;
    u8 type;
    bool8 active;
    u8 layer; // unused
    bool8 playingSfx;
    u8 unk6C;
    void *vram;
    MapEntity *me;
    s8 spriteX;
    s8 spriteY;
} Sprite_LightBridge;

struct UNK_80E0044 {
    s16 minX;
    s16 minY;
    s16 maxX;
    s16 maxY;
};

static void Task_LightBridgeInactive(void);
static void TaskDestructor_InteractableTecBaseLightBridge(struct Task *);
static void DeactivateBridge(Sprite_LightBridge *);
static bool32 IsPlayerWithinRange(Sprite_LightBridge *);
static void sub_807A25C(Sprite_LightBridge *);
static void HandleSfx(Sprite_LightBridge *lightBridge);
static void RenderBridge(Sprite_LightBridge *lightBridge);
static void ActivateBridge(Sprite_LightBridge *lightBridge);
static void DespawnBridge(Sprite_LightBridge *lightBridge);

static const u16 sBridgeSprites[NUM_BRIDGE_SPRITES][3] = {
    { SA2_ANIM_LIGHT_BRIDGE, 0, SPRITE_TILES },
    { SA2_ANIM_LIGHT_BRIDGE, 1, SPRITE_TILES },
};

static const struct UNK_80E0044 sOutOfRangeDimensions[] = {
    [BRIDGE_TYPE_STRAIGHT] = { -120, 0, 120, 0 },
    [BRIDGE_TYPE_CURVED] = { 0, -96, 96, 0 },
};

static const struct UNK_80E0044 sWithinRangeDimensions[] = {
    [BRIDGE_TYPE_STRAIGHT] = { -120, -32, 120, -4 },
    [BRIDGE_TYPE_CURVED] = { 0, -96, 96, 0 },
};

static const u16 sSoundDurations[][2] = {
    [BRIDGE_TYPE_STRAIGHT] = { GBA_FRAMES_PER_SECOND * 3, GBA_FRAMES_PER_SECOND * 1 },
    [BRIDGE_TYPE_CURVED] = { GBA_FRAMES_PER_SECOND * 3, GBA_FRAMES_PER_SECOND * 1 },
};

// x, y,
static const s16 sCurvedBridgePositions[][3] = {
    { 0, 0, 1 },    { 11, -2, 1 },  { 23, -5, 1 },  { 35, -9, 1 },  { 48, -15, 1 }, { 58, -23, 1 },
    { 68, -34, 0 }, { 76, -44, 0 }, { 83, -58, 0 }, { 88, -69, 0 }, { 91, -81, 0 }, { 92, -92, 0 },
};

void CreateEntity_LightBridge(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    void *vram;
    u8 i;
    struct Task *t
        = TaskCreate(Task_LightBridgeInactive, sizeof(Sprite_LightBridge), 0x2010, 0, TaskDestructor_InteractableTecBaseLightBridge);
    Sprite_LightBridge *lightBridge = TASK_DATA(t);
    Sprite *s;
    lightBridge->type = me->d.uData[0];
    lightBridge->unk6C = me->d.uData[1];
    lightBridge->active = FALSE;
    lightBridge->playingSfx = FALSE;
    lightBridge->posX = TO_WORLD_POS(me->x, spriteRegionX);
    lightBridge->posY = TO_WORLD_POS(me->y, spriteRegionY);
    lightBridge->spriteX = me->x;
    lightBridge->spriteY = spriteY;
    lightBridge->me = me;

    vram = VramMalloc(SPRITE_TILES * NUM_BRIDGE_SPRITES);
    lightBridge->vram = vram;

    for (i = 0; i < NUM_BRIDGE_SPRITES; i++) {
        s = &lightBridge->sprites[i];
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
        s->graphics.anim = sBridgeSprites[i][0];
        s->variant = sBridgeSprites[i][1];
        s->graphics.dest = vram;
        UpdateSpriteAnimation(s);
        vram += sBridgeSprites[i][2] * TILE_SIZE_4BPP;
    }

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void Task_LightBridgeActive(void)
{
    Sprite_LightBridge *lightBridge = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        DeactivateBridge(lightBridge);
    }

    if (lightBridge->active) {
        gPlayer.layer &= ~1;
    } else {
        // Fall through bridge
        gPlayer.layer |= 1;
    }

    if (!IsPlayerWithinRange(lightBridge)) {
        DeactivateBridge(lightBridge);
    }

    sub_807A25C(lightBridge);
    HandleSfx(lightBridge);
    if (lightBridge->active) {
        RenderBridge(lightBridge);
    }
}

static void RenderStraightBridge(Sprite_LightBridge *lightBridge)
{
    Sprite *s = &lightBridge->sprites[1];
    s32 posX = lightBridge->posX;
    s32 cameraX = gCamera.x;

    s16 x = MACRO_F7C(posX, cameraX, -(BRIDGE_WIDTH / 2));
    s16 maxX = MACRO_F7C(posX, cameraX, (BRIDGE_WIDTH / 2));
    s16 y = MACRO_F7C(lightBridge->posY, gCamera.y, 0);

    u8 i;
    for (i = (gStageTime >> 1) & 1; x <= maxX && x <= 246; // x <= (BRIDGE_SEGMENT_WIDTH * 20.5)
         x += BRIDGE_SEGMENT_WIDTH, i++) {
        if ((i & 1) && x > 5) {
            s->x = x;
            s->y = y;
            DisplaySprite(s);
        }
    }
}

#ifndef NON_MATCHING
static void RenderCurvedBridge(Sprite_LightBridge *in)
{
    register Sprite_LightBridge *lightBridge asm("r5") = in;
#else
static void RenderCurvedBridge(Sprite_LightBridge *lightBridge)
{
#endif
    u8 i;
    Sprite *s;
    s32 posX, posY;
    s32 cameraX, cameraY, temp;
    s16 x, y;

    posX = lightBridge->posX;
    cameraX = gCamera.x;

    x = MACRO_F7C(posX, cameraX, 0);
    posY = lightBridge->posY;
    cameraY = gCamera.y;

    temp = cameraY - 4;
    posY -= temp;
    y = posY;

    for (i = (gStageTime >> 1) & 1; i < 12; i += 2) {
        s = &lightBridge->sprites[sCurvedBridgePositions[i][2]];
        s->x = x + sCurvedBridgePositions[i][0];
        s->y = y + sCurvedBridgePositions[i][1];
        DisplaySprite(s);
    }
}

static bool32 IsPlayerOutOfRange(Sprite_LightBridge *lightBridge)
{
    s32 posX = lightBridge->posX;
    s32 cameraX = gCamera.x;
    s16 x = MACRO_F7C(posX, cameraX, 0);
    s32 posY = lightBridge->posY;
    s32 cameraY = gCamera.y;
    s16 y = MACRO_F7C(posY, cameraY, 0);
    if (x + sOutOfRangeDimensions[lightBridge->type].maxX < -128
        || x + sOutOfRangeDimensions[lightBridge->type].minX > (DISPLAY_WIDTH + 128)
        || y + sOutOfRangeDimensions[lightBridge->type].maxY < -128
        || y + sOutOfRangeDimensions[lightBridge->type].minY > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }

    return FALSE;
}

static bool32 IsPlayerWithinRange(Sprite_LightBridge *lightBridge)
{
    if (PLAYER_IS_ALIVE) {
        s16 playerX, playerY;
        s32 cameraX, cameraY;
        s32 posX, posY;
        s16 a, b, c, d;

        posX = lightBridge->posX;
        cameraX = gCamera.x;
        posX -= cameraX;

        posY = lightBridge->posY;
        cameraY = gCamera.y;
        posY -= cameraY;

        playerX = I(gPlayer.qWorldX) - gCamera.x;
        playerY = I(gPlayer.qWorldY) - gCamera.y;

        a = ({
            s32 temp1 = (u16)sWithinRangeDimensions[lightBridge->type].minX;
            s16 temp2 = posX;
            temp2 + temp1;
        });
        b = ({
            s32 temp1 = (u16)sWithinRangeDimensions[lightBridge->type].minY;
            s16 temp2 = posY;
            temp2 + temp1;
        });
        c = sWithinRangeDimensions[lightBridge->type].maxX - sWithinRangeDimensions[lightBridge->type].minX;
        d = sWithinRangeDimensions[lightBridge->type].maxY - sWithinRangeDimensions[lightBridge->type].minY;

        if (a <= playerX && (a + c >= playerX)) {
            if (b <= playerY && (b + d >= playerY)) {
                return TRUE;
            }
        }
    }

    return FALSE;
}

static void Task_LightBridgeInactive(void)
{
    Sprite_LightBridge *lightBridge = TASK_DATA(gCurTask);
    if (IsPlayerWithinRange(lightBridge)) {
        ActivateBridge(lightBridge);
    }

    if (IsPlayerOutOfRange(lightBridge)) {
        DespawnBridge(lightBridge);
    } else {
        sub_807A25C(lightBridge);
        HandleSfx(lightBridge);
        if (lightBridge->active) {
            RenderBridge(lightBridge);
        }
    }
}

static void TaskDestructor_InteractableTecBaseLightBridge(struct Task *t)
{
    Sprite_LightBridge *lightBridge = TASK_DATA(t);
    VramFree(lightBridge->vram);
}

static void ActivateBridge(Sprite_LightBridge *lightBridge)
{
    lightBridge->layer = gPlayer.layer;

    gCurTask->main = Task_LightBridgeActive;
}

static void DeactivateBridge(Sprite_LightBridge *lightBridge)
{
    gPlayer.layer |= 1;
    gCurTask->main = Task_LightBridgeInactive;
}

static void sub_807A25C(Sprite_LightBridge *lightBridge)
{
    u16 val = (gStageTime + lightBridge->unk6C) % (sSoundDurations[lightBridge->type][0] + sSoundDurations[lightBridge->type][1]);

    if (val < sSoundDurations[lightBridge->type][0]) {
        lightBridge->active = TRUE;
    } else {
        lightBridge->active = FALSE;
    }
}

static void RenderBridge(Sprite_LightBridge *lightBridge)
{
    switch (lightBridge->type) {
        case BRIDGE_TYPE_STRAIGHT:
            RenderStraightBridge(lightBridge);
            break;
        case BRIDGE_TYPE_CURVED:
            RenderCurvedBridge(lightBridge);
            break;
    }
}

static void HandleSfx(Sprite_LightBridge *lightBridge)
{
    if (lightBridge->active) {
        if (!lightBridge->playingSfx) {
            m4aSongNumStart(SE_295);
            lightBridge->playingSfx = TRUE;
        }
        return;
    }

    if (lightBridge->playingSfx) {
        m4aSongNumStop(SE_295);
        lightBridge->playingSfx = FALSE;
    }
}

static void DespawnBridge(Sprite_LightBridge *lightBridge)
{
    m4aSongNumStop(SE_295);
    lightBridge->me->x = lightBridge->spriteX;
    TaskDestroy(gCurTask);
}
