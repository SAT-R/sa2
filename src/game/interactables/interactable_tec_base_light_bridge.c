#include "global.h"
#include "game/game.h"
#include "game/interactables/interactable.h"
#include "game/interactables/interactable_tec_base_light_bridge.h"
#include "engine/sprite.h"
#include "engine/task.h"
#include "engine/malloc_vram.h"
#include "lib/m4a.h"

#include "constants/interactables.h"
#include "constants/move_states.h"
#include "constants/animations.h"
#include "constants/songs.h"

#define MACRO_F7C(a, b, c)                                                              \
    ({                                                                                  \
        s32 temp = ((a) - (b));                                                         \
        temp += (c);                                                                    \
        temp;                                                                           \
    })

#define BRIDGE_SEGMENT_WIDTH 12
#define BRIDGE_WIDTH         (28 * TILE_WIDTH)

#define SPRITE_TILES       2
#define NUM_BRIDGE_SPRITES 2

#define BRIDGE_TYPE_STRAIGHT 0
#define BRIDGE_TYPE_CURVED   1

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
    Interactable *ia;
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
    { SA2_ANIM_LIGHT_BRIDGE_TEC_BASE, 0, SPRITE_TILES },
    { SA2_ANIM_LIGHT_BRIDGE_TEC_BASE, 1, SPRITE_TILES },
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
    { 0, 0, 1 },    { 11, -2, 1 },  { 23, -5, 1 },  { 35, -9, 1 },
    { 48, -15, 1 }, { 58, -23, 1 }, { 68, -34, 0 }, { 76, -44, 0 },
    { 83, -58, 0 }, { 88, -69, 0 }, { 91, -81, 0 }, { 92, -92, 0 },
};

void initSprite_InteractableTecBaseLightBridge(Interactable *ia, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 spriteY)
{
    void *vram;
    u8 i;
    struct Task *t
        = TaskCreate(Task_LightBridgeInactive, sizeof(Sprite_LightBridge), 0x2010, 0,
                     TaskDestructor_InteractableTecBaseLightBridge);
    Sprite_LightBridge *lightBridge = TaskGetStructPtr(t);
    Sprite *sprite;
    lightBridge->type = ia->d.uData[0];
    lightBridge->unk6C = ia->d.uData[1];
    lightBridge->active = FALSE;
    lightBridge->playingSfx = FALSE;
    lightBridge->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    lightBridge->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    lightBridge->spriteX = ia->x;
    lightBridge->spriteY = spriteY;
    lightBridge->ia = ia;

    vram = VramMalloc(SPRITE_TILES * NUM_BRIDGE_SPRITES);
    lightBridge->vram = vram;

    for (i = 0; i < NUM_BRIDGE_SPRITES; i++) {
        sprite = &lightBridge->sprites[i];
        sprite->unk1A = 0x480;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk28[0].unk0 = -1;
        sprite->unk10 = 0x2000;
        sprite->graphics.anim = sBridgeSprites[i][0];
        sprite->variant = sBridgeSprites[i][1];
        sprite->graphics.dest = vram;
        sub_8004558(sprite);
        vram += sBridgeSprites[i][2] * TILE_SIZE_4BPP;
    }

    SET_SPRITE_INITIALIZED(ia);
}

static void Task_LightBridgeActive(void)
{
    Sprite_LightBridge *lightBridge = TaskGetStructPtr(gCurTask);
    if (!PlayerIsAlive) {
        DeactivateBridge(lightBridge);
    }

    if (lightBridge->active) {
        gPlayer.unk38 &= ~1;
    } else {
        // Fall through bridge
        gPlayer.unk38 |= 1;
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
    Sprite *sprite = &lightBridge->sprites[1];
    s32 posX = lightBridge->posX;
    s32 cameraX = gCamera.x;

    s16 x = MACRO_F7C(posX, cameraX, -(BRIDGE_WIDTH / 2));
    s16 maxX = MACRO_F7C(posX, cameraX, (BRIDGE_WIDTH / 2));
    s16 y = MACRO_F7C(lightBridge->posY, gCamera.y, 0);

    u8 i;
    for (i = (gUnknown_03005590 >> 1) & 1;
         x <= maxX && x <= 246; // x <= (BRIDGE_SEGMENT_WIDTH * 20.5)
         x += BRIDGE_SEGMENT_WIDTH, i++) {
        if ((i & 1) && x > 5) {
            sprite->x = x;
            sprite->y = y;
            sub_80051E8(sprite);
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
    Sprite *sprite;
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

    for (i = (gUnknown_03005590 >> 1) & 1; i < 12; i += 2) {
        sprite = &lightBridge->sprites[sCurvedBridgePositions[i][2]];
        sprite->x = x + sCurvedBridgePositions[i][0];
        sprite->y = y + sCurvedBridgePositions[i][1];
        sub_80051E8(sprite);
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
        || x + sOutOfRangeDimensions[lightBridge->type].minX > 368
        || y + sOutOfRangeDimensions[lightBridge->type].maxY < -128
        || y + sOutOfRangeDimensions[lightBridge->type].minY > 288) {
        return TRUE;
    }

    return FALSE;
}

static bool32 IsPlayerWithinRange(Sprite_LightBridge *lightBridge)
{
    if (PlayerIsAlive) {
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

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

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
        c = sWithinRangeDimensions[lightBridge->type].maxX
            - sWithinRangeDimensions[lightBridge->type].minX;
        d = sWithinRangeDimensions[lightBridge->type].maxY
            - sWithinRangeDimensions[lightBridge->type].minY;

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
    Sprite_LightBridge *lightBridge = TaskGetStructPtr(gCurTask);
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
    Sprite_LightBridge *lightBridge = TaskGetStructPtr(t);
    VramFree(lightBridge->vram);
}

static void ActivateBridge(Sprite_LightBridge *lightBridge)
{
    lightBridge->layer = gPlayer.unk38;

    gCurTask->main = Task_LightBridgeActive;
}

static void DeactivateBridge(Sprite_LightBridge *lightBridge)
{
    gPlayer.unk38 |= 1;
    gCurTask->main = Task_LightBridgeInactive;
}

static void sub_807A25C(Sprite_LightBridge *lightBridge)
{
    u16 val = (gUnknown_03005590 + lightBridge->unk6C)
        % (sSoundDurations[lightBridge->type][0]
           + sSoundDurations[lightBridge->type][1]);

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
    lightBridge->ia->x = lightBridge->spriteX;
    TaskDestroy(gCurTask);
}
