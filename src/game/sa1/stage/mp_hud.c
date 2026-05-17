#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "game/globals.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"
#include "constants/sa1/tilemaps.h"
#include "constants/zones.h"

/*   Used by Chao Hunt and Collect Rings as HUD task   */

typedef struct {
    Sprite s0;
    Sprite spritesA[11];
    Sprite spritesB[11];
} ChaoHuntHUD;

void Task_ChaoHuntHUD(void);
void TaskDestructor_ChaoHuntHUD(Task *t);

const u8 SA2_LABEL(gUnknown_080E0234)[] = {
    0,   2,   3,   5,   7,   8,   16,  18,  19,  21,  23,  24,  32,  34,  35,  37,  39,  40,  48,  50,
    51,  53,  55,  56,  64,  66,  67,  69,  71,  72,  80,  82,  83,  85,  87,  88,  96,  98,  99,  101,
    103, 104, 112, 114, 115, 117, 119, 120, 128, 130, 131, 133, 135, 136, 144, 146, 147, 149, 151, 152,
};

void CreateChaoHuntHUD(void)
{
    Sprite *s;
    u32 i;

    ChaoHuntHUD *hud = TASK_DATA(TaskCreate(Task_ChaoHuntHUD, sizeof(ChaoHuntHUD), 0x2000U, 0U, TaskDestructor_ChaoHuntHUD));

    s = &hud->s0;
    s->x = 0;
    s->y = 8;
    s->oamFlags = SPRITE_OAM_ORDER(5);
    s->graphics.size = 0;
    if (gGameMode == 6) {
        s->graphics.dest = VramMalloc(12);
        s->graphics.anim = SA1_ANIM_COLLECT_RINGS_COUNTER_BACKDROP;
        s->variant = 0;
    } else {
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA1_ANIM_CHAO_HUNT_COUNTER_BACKDROP;
        s->variant = 0;
    }
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x40000;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 11; i++) {
        s = &hud->spritesA[i];
        s->x = 0;
        s->y = 0;
        if (i == 0) {
            s->graphics.dest = VramMalloc(22);
        } else {
            s->graphics.dest = hud->spritesA[0].graphics.dest + (i * (2 * TILE_SIZE_4BPP));
        }
        s->oamFlags = 0x100;
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_MP_TIMER_DIGITS;
        s->variant = i;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);

        s = &hud->spritesB[i];
        s->x = 0;
        s->y = 0;
        if (i == 0) {
            s->graphics.dest = VramMalloc(22);
        } else {
            s->graphics.dest = hud->spritesB[0].graphics.dest + (i * (2 * TILE_SIZE_4BPP));
        }
        s->oamFlags = 0x100;
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_MP_TIMER_DIGITS;
        s->variant = i + 11;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }
}

// (84.64%) https://decomp.me/scratch/y4y6F
NONMATCH("asm/non_matching/game/sa1/stage/results_2__Task_ChaoHuntHUD.inc", void Task_ChaoHuntHUD(void))
{
    ChaoHuntHUD *hud;
    Sprite *s0;
    Sprite *s;
    Sprite *timerSprites;
    u16 temp_r0;
    u16 temp_r5;
    u16 var_r0;
    u16 var_r4;
    u32 var_r2;
    u8 var_r2_2;
    u32 var_r5;
    u8 var_sb;

    hud = TASK_DATA(gCurTask);

    // Show the red timer every 2 frames, lasting 2 frames
    if (((u32)gCourseTime < TIME(1, 0)) && (gCourseTime & 2)) {
        timerSprites = hud->spritesB;
    } else {
        timerSprites = hud->spritesA;
    }
    if (!(1 & gStageFlags) && (gCourseTime < TIME(1, 0)) && (Mod(gCourseTime, 60) == 0)) {
        m4aSongNumStart(SE_TIMER);
    }
    s = &timerSprites[10];
    s->y = 32;
    s->x = 24;
    DisplaySprite(s);
    s->x = 0x30;
    DisplaySprite(s);
    temp_r5 = Div(gCourseTime, 60);
    var_r4 = SA2_LABEL(gUnknown_080E0234)[gCourseTime - (temp_r5 * 60)];
    s = &timerSprites[var_r4 >> 4];
    s->x = 56;
    s->y = 32;
    DisplaySprite(s);
    s = &timerSprites[0xF & var_r4];
    s->x = 64;
    s->y = 32;
    DisplaySprite(s);
    var_r4 = Div(temp_r5, 60);
    temp_r0 = Base10DigitsToHexNibbles((temp_r5 - (var_r4 * 60)));
    s = &timerSprites[(temp_r0 >> (1 * 4)) & 0xF];
    s->x = 32;
    s->y = 32;
    DisplaySprite(s);
    s = &timerSprites[0xF & temp_r0];
    s->x = 40;
    s->y = 32;
    DisplaySprite(s);
    s = &timerSprites[0xF & Base10DigitsToHexNibbles((var_r4 - (Div(var_r4, 60) * 60)))];
    s->x = 16;
    s->y = 32;
    DisplaySprite(s);

    for (var_r5 = 0; var_r5 < 4; var_r5++) {
        Sprite *timerSprites;
        if (!GetBit(gMultiplayerConnections, var_r5) || (gGameMode == 5 && var_r5 == 2)) {
            break;
        }
        timerSprites = hud->spritesA;
        s0 = &hud->s0;
        s0->x = (var_r5 * 0x14) + 8;
        s0->y = 8;
        if (gGameMode == 6) {
            s0->palId = var_r5;
        } else if (gGameMode == 4) {
            s0->palId = (u8)gMultiplayerCharacters[var_r5];
        } else {
            for (var_r2 = 0; var_r2 < 4; var_r2++) {
                if (var_r5 == ((gMultiplayerConnections & (0x10 << var_r2)) >> (var_r2 + 4))) {
                    break;
                }
            }
            s0->palId = (u8)gMultiplayerCharacters[var_r2];
        }
        DisplaySprite(&hud->s0);
        if (gGameMode == 5) {
            var_r4 = 0;
            for (var_r2_2 = 0; var_r2_2 < 4; var_r2_2++) {
                if (gMultiplayerPlayerTasks[var_r2_2] == NULL) {
                    break;
                }

                if (var_r5 == (CheckBit(gMultiplayerConnections, (0x10 << var_r2_2)) >> (var_r2_2 + 4))) {
                    var_r4 += gMultiplayerCharRings[var_r2_2];
                }
            }

            var_r4 = Base10DigitsToHexNibbles(var_r4);
        } else {
            var_r4 = Base10DigitsToHexNibbles(gMultiplayerCharRings[var_r5]);
        }
        if (var_r4 >= 0x100) {
            s = &timerSprites[(var_r4 >> (2 * 4)) & 0xF];
            s->x = s0->x + 3;
            s->y = 0xE;
            DisplaySprite(s);
            s = &timerSprites[(var_r4 >> (1 * 4)) & 0xF];
            s->x = s0->x + 0xB;
            s->y = 0xE;
            DisplaySprite(s);
            s = &timerSprites[(var_r4 >> (0 * 4)) & 0xF];
            s->x = s0->x + 0x13;
            s->y = 0xE;
            DisplaySprite(s);
        } else if (var_r4 >= 0x10) {
            s = &timerSprites[(var_r4 >> (1 * 4)) & 0xF];
            s->x = s0->x + 7;
            s->y = 0xE;
            DisplaySprite(s);
            s = &timerSprites[(var_r4 >> (0 * 4)) & 0xF];
            s->x = s0->x + 0xF;
            s->y = 0xE;
            DisplaySprite(s);
        } else {
            s = &timerSprites[(var_r4 >> (0 * 4)) & 0xF];
            s->x = s0->x + 0xB;
            s->y = 0xE;
            DisplaySprite(s);
        }
    }
}
END_NONMATCH

void TaskDestructor_ChaoHuntHUD(Task *t)
{
    ChaoHuntHUD *hud = TASK_DATA(t);

    VramFree(hud->s0.graphics.dest);
    VramFree(hud->spritesA[0].graphics.dest);
    VramFree(hud->spritesB[0].graphics.dest);
}
