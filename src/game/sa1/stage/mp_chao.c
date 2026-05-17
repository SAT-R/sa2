#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/globals.h"
#include "game/sa1/stage/mp_chao.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/entity.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

/* Chao that spawns in the Chao Hunt minigame */

#define SPAWN_INDEX_COUNT 8

static void Task_802816C(void);
static void Task_8028388(void);
static void Task_8028518(void);
static void Task_80286B0(void);
static void sub_802888C(void);
static void sub_8028910(void);
static void Task_8028A1C(void);
static bool32 UpdateChaoPosition(CamCoord x, CamCoord y);
static void TaskDestructor_Chao(Task *t);

const u16 sChaoSpawnPositions[NUM_LEVEL_IDS_MP][SPAWN_INDEX_COUNT][2] = { //
    [ACT_CHAO_HUNT_A - NUM_LEVEL_IDS_SP] = {
        { 906, 290 },
        { 1250, 267 },
        { 1348, 700 },
        { 1054, 843 },
        { 753, 889 },
        { 475, 554 },
        { 475, 1035 },
        { 1740, 215 },
    },
    [ACT_CHAO_HUNT_B - NUM_LEVEL_IDS_SP] = {
        { 817, 483 },
        { 817, 815 },
        { 1400, 286 },
        { 1177, 864 },
        { 1506, 579 },
        { 404, 480 },
        { 1594, 1009 },
        { 1029, 482 },
    },
    [ACT_CHAO_HUNT_C - NUM_LEVEL_IDS_SP] = {
        { 458, 192 },
        { 447, 578 },
        { 534, 864 },
        { 332, 1248 },
        { 1023, 1250 },
        { 433, 1536 },
        { 410, 1728 },
        { 650, 1728 },
    },
    [ACT_CHAO_HUNT_D - NUM_LEVEL_IDS_SP] = {
        { 633, 335 },
        { 1289, 335 },
        { 722, 576 },
        { 1162, 576 },
        { 945, 960 },
        { 706, 1057 },
        { 1219, 1057 },
        { 1009, 1008 },
    }
};

Task *CreateMultiplayerChao(u8 spawnIndex, u8 id)
{
    Chao *chao;
    Sprite *s;
    Task *t;
    CamCoord x, y;

#ifdef BUG_FIX
    spawnIndex %= ARRAY_COUNT(sChaoSpawnPositions[0]);
#endif

    t = TaskCreate(Task_802816C, sizeof(Chao), 0x2000U, 0U, TaskDestructor_Chao);
    chao = TASK_DATA(t);

    s = &chao->s;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    x = sChaoSpawnPositions[gCurrentLevel - NUM_LEVEL_IDS_SP][spawnIndex][0];
    if ((gCurrentLevel == ACT_CHAO_HUNT_D) && (spawnIndex > 4U)) {
        SPRITE_FLAG_SET(s, Y_FLIP);
        SPRITE_FLAG_SET_VALUE(s, PRIORITY, 2);
        y = sChaoSpawnPositions[gCurrentLevel - NUM_LEVEL_IDS_SP][spawnIndex][1] + 16;
    } else {
        y = sChaoSpawnPositions[gCurrentLevel - NUM_LEVEL_IDS_SP][spawnIndex][1] - 16;
    }

    chao->id = id;
    chao->playerIdA = -1;
    chao->playerIdB = -1;
    chao->qWorldX = Q(x);
    chao->qWorldY = Q(y);
    chao->qDistanceToPlayer = 0;
    chao->angle = 0;

    s->x = I(chao->qWorldX) - gCamera.x;
    s->y = I(chao->qWorldY) - gCamera.y;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_CHAO_SITTING);
    s->oamFlags = SPRITE_OAM_ORDER(16 - id);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_CHAO_SITTING;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    return t;
}

void Task_802816C(void)
{
    Chao *chao = TASK_DATA(gCurTask);
    Sprite *s = &chao->s;

    s->graphics.anim = 0x2C0;
    s->variant = 0;
    UpdateSpriteAnimation(s);
    if (chao->playerIdA != 0xFF) {
        chao->playerIdB = chao->playerIdA;
        if (chao->id == 0) {
            gCurTask->main = Task_8028388;
        } else if (chao->id == 1) {
            gCurTask->main = Task_8028518;
        } else {
            gCurTask->main = Task_80286B0;
        }
    } else {
        u32 pid;
        for (pid = 0; pid < 4; pid++) {
            Task **mpTasks = gMultiplayerPlayerTasks;
            MultiplayerPlayer *mpp;
            if (mpTasks[pid] == NULL)
                break;

            mpp = TASK_DATA(gMultiplayerPlayerTasks[pid]);
            if (!(mpp->unk54 & 0x4)) {
                if (HB_COLLISION(I(chao->qWorldX), I(chao->qWorldY), s->hitboxes[0].b, mpp->pos.x, mpp->pos.y, mpp->s.hitboxes[0].b)) {
                    mpp->unk5C |= (0x10000 << chao->id);
                    chao->playerIdA = pid;
                    chao->playerIdB = pid;

                    if (chao->id == 0) {
                        gCurTask->main = Task_8028388;
                    } else if (chao->id == 1) {
                        gCurTask->main = Task_8028518;
                    } else {
                        gCurTask->main = Task_80286B0;
                    }

                    m4aSongNumStart(0xA3U);
                    break;
                }
            }
        }
    }

    s->x = I(chao->qWorldX) - gCamera.x;
    s->y = I(chao->qWorldY) - gCamera.y;
    DisplaySprite(s);
}

// TODO: Fake-match
void Task_8028388(void)
{
    s32 theta;
    MultiplayerPlayer *mpp;
    u16 worldX;
    u16 worldY;
    u32 angle;
    s32 valueY;
    s32 sinVal;

    Chao *chao = TASK_DATA(gCurTask);
    Sprite *sprChao;

    if (chao->playerIdA != chao->playerIdB) {
        chao->playerIdB = chao->playerIdA;
        sub_802888C();
        return;
    }
    chao->playerIdB = chao->playerIdA;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[chao->playerIdA]);
    sprChao = &chao->s;
    angle = gStageTime * 0x10;
    chao->angle = angle;
    if (mpp->s.frameFlags & 0x800) {
#ifndef NON_MATCHING
        register u32 r0 asm("r0");
        register u32 mask asm("r3");
#else
        u32 r0;
        u32 mask;
#endif
        sprChao->frameFlags |= 0x800;
        worldY = mpp->pos.y + 28;
        theta = (angle + 0x200);
        mask = 0x3FF;

#ifndef NON_MATCHING
        asm("mov %0, %1" : "=r"(r0) : "r"(mask));
#else
        r0 = mask;
#endif
        theta &= r0;
    } else {
        sprChao->frameFlags &= ~0x800;
        worldY = mpp->pos.y - 28;
        theta = angle & 0x3FF;
    }

    if (mpp->s.frameFlags & 0x400) {
        worldX = mpp->pos.x - 20;
    } else {
        worldX = mpp->pos.x + 20;
    }

    if ((s16)worldX == ((s32)chao->qWorldX >> 8)) {
        s32 charAnim = (mpp->s.graphics.anim - (s16)gPlayerCharacterIdleAnims[gMultiplayerCharacters[mpp->unk56]]);
        if (charAnim == SA1_CHAR_ANIM_1) {
            sprChao->graphics.anim = SA1_ANIM_CHAO_TURN;
            sprChao->variant = 0;
        } else {
            sprChao->graphics.anim = SA1_ANIM_CHAO_FACE_DIAGONAL_R;
            sprChao->variant = 0;
        }
    } else {
        sprChao->graphics.anim = 0x2BB;
        sprChao->variant = 0;
    }
    UpdateChaoPosition(worldX, worldY);
    sprChao->x = I(chao->qWorldX) - gCamera.x;
    sprChao->y = (I(chao->qWorldY) - ((sinVal = SIN(theta)) >> 11)) - gCamera.y;
    UpdateSpriteAnimation(sprChao);
    DisplaySprite(sprChao);
}

void Task_8028518()
{
    s32 theta;
    MultiplayerPlayer *mpp;
    CamCoord worldX, worldY;
    u32 angle;
    s32 valueY;
    s32 sinVal;

    Chao *chao = TASK_DATA(gCurTask);
    Sprite *sprChao;

    if (chao->playerIdA != chao->playerIdB) {
        chao->playerIdB = chao->playerIdA;
        sub_802888C();
        return;
    }
    chao->playerIdB = chao->playerIdA;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[chao->playerIdA]);
    sprChao = &chao->s;
    if (mpp->s.frameFlags & 0x800) {
        sprChao->frameFlags |= 0x800;
        worldY = mpp->pos.y + mpp->s.hitboxes[0].b.bottom + 16;
        theta = chao->angle & (SIN_PERIOD - 1);
    } else {
        sprChao->frameFlags &= ~0x800;
        worldY = mpp->pos.y + mpp->s.hitboxes[0].b.top - 16;
        theta = chao->angle & (SIN_PERIOD - 1);
    }

    worldX = mpp->pos.x;

    if (mpp->pos.x == ((s32)chao->qWorldX >> 8)) {
        s32 charAnim = (mpp->s.graphics.anim - (s16)gPlayerCharacterIdleAnims[gMultiplayerCharacters[mpp->unk56]]);
        if (charAnim == SA1_CHAR_ANIM_1) {
            sprChao->graphics.anim = SA1_ANIM_CHAO_TURN;
            sprChao->variant = 0;
        } else {
            sprChao->graphics.anim = SA1_ANIM_CHAO_FACE_DIAGONAL_R;
            sprChao->variant = 0;
        }
    } else {
        sprChao->graphics.anim = 0x2BB;
        sprChao->variant = 0;
    }

    if (UpdateChaoPosition(worldX, worldY)) {
        sprChao->graphics.anim = SA1_ANIM_CHAO_SITTING;
        sprChao->variant = 0;
        sprChao->x = I(chao->qWorldX) - gCamera.x;
        sprChao->y = I(chao->qWorldY) - gCamera.y;
    } else {
        sprChao->x = I(chao->qWorldX) - gCamera.x;
        sprChao->y = (I(chao->qWorldY) - ((sinVal = SIN(theta)) >> 11)) - gCamera.y;
    }
    UpdateSpriteAnimation(sprChao);
    DisplaySprite(sprChao);
}

void Task_80286B0()
{
    s32 theta;
    Task *chaoTask;
    Chao *chaoZero;
    MultiplayerPlayer *mpp;
    u16 worldX;
    u16 worldY;
    u32 angle;
    s32 valueY;
    s32 sinVal;

    Chao *chao = TASK_DATA(gCurTask);
    Sprite *sprChao;

    if (chao->playerIdA != chao->playerIdB) {
        chao->playerIdB = chao->playerIdA;
        sub_802888C();
        return;
    }
    chao->playerIdB = chao->playerIdA;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[chao->playerIdA]);
    sprChao = &chao->s;
    angle = gStageTime * 0x10;
    chao->angle = angle;
    if (mpp->s.frameFlags & 0x800) {
#ifndef NON_MATCHING
        register u32 r0 asm("r0");
        register u32 mask asm("r3");
#else
        u32 r0;
        u32 mask;
#endif
        sprChao->frameFlags |= 0x800;
        worldY = mpp->pos.y + 16;
        theta = (angle + 0x200);
        mask = 0x3FF;

#ifndef NON_MATCHING
        asm("mov %0, %1" : "=r"(r0) : "r"(mask));
#else
        r0 = mask;
#endif
        theta &= r0;
    } else {
        sprChao->frameFlags &= 0xFFFFF7FF;
        worldY = mpp->pos.y - 16;
        theta = angle & 0x3FF;
    }

    if (mpp->s.frameFlags & 0x400) {
        worldX = mpp->pos.x - 20;
    } else {
        worldX = mpp->pos.x + 20;
    }

    if ((s16)worldX == ((s32)chao->qWorldX >> 8)) {
        s32 charAnim = (mpp->s.graphics.anim - (s16)gPlayerCharacterIdleAnims[gMultiplayerCharacters[mpp->unk56]]);
        if (charAnim == SA1_CHAR_ANIM_1) {
            sprChao->graphics.anim = SA1_ANIM_CHAO_TURN;
            sprChao->variant = 0;
        } else {
            sprChao->graphics.anim = SA1_ANIM_CHAO_FACE_DIAGONAL_R;
            sprChao->variant = 0;
        }
    } else {
        sprChao->graphics.anim = 0x2BB;
        sprChao->variant = 0;
    }

    chaoZero = TASK_DATA(gChaoTasks[0]);

    if (UpdateChaoPosition(worldX, worldY) && (chaoZero->playerIdA == chao->playerIdA)) {
        sprChao->graphics.anim = SA1_ANIM_CHAO_SITTING;
        sprChao->variant = 0;
        sprChao->x = I(chao->qWorldX) - gCamera.x;
        sprChao->y = (I(chao->qWorldY) - ((sinVal = SIN(theta)) >> 11)) - gCamera.y;
    } else {
        sprChao->x = I(chao->qWorldX) - gCamera.x;
        sprChao->y = (I(chao->qWorldY) - ((sinVal = SIN(theta)) >> 11)) - gCamera.y;
    }
    UpdateSpriteAnimation(sprChao);
    DisplaySprite(sprChao);
}

void sub_802888C()
{
    Chao *chao = TASK_DATA(gCurTask);
    Sprite *s = &chao->s;
    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[chao->playerIdA]);

    if (chao->s.frameFlags & 0x400) {
        chao->qSpeedX = -Q(1.5);
    } else {
        chao->qSpeedX = +Q(1.5);
    }

    if (mpp->s.frameFlags & 0x800) {
        chao->qSpeedY = +Q(3.0);
    } else {
        chao->qSpeedY = -Q(3.0);
    }

    s->graphics.anim = 0x2BA;
    s->variant = 0;
    gCurTask->main = sub_8028910;
}

void sub_8028910()
{
    s32 res;

    Chao *chao = TASK_DATA(gCurTask);
    Sprite *s = &chao->s;
    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[chao->playerIdA]);

    if (mpp->s.frameFlags & 0x800) {
        chao->qSpeedY -= 0x28;
    } else {
        chao->qSpeedY += 0x28;
    }
    chao->qWorldX += chao->qSpeedX;
    chao->qWorldY += chao->qSpeedY;

    if (mpp->s.frameFlags & 0x800) {
        res = SA2_LABEL(sub_801F100)(I(chao->qWorldY), I(chao->qWorldX), (mpp->unk54 >> 7) % 2u, -8, SA2_LABEL(sub_801EC3C));
        if (res < 0) {
            chao->qWorldY -= Q(res);
            s->graphics.anim = SA1_ANIM_CHAO_SHOCKED;
            s->variant = 2;
            gCurTask->main = Task_8028A1C;
        }
    } else {
        res = SA2_LABEL(sub_801F100)(I(chao->qWorldY), I(chao->qWorldX), (mpp->unk54 >> 7) % 2u, +8, SA2_LABEL(sub_801EC3C));
        if (res < 0) {
            chao->qWorldY += Q(res);
            s->graphics.anim = SA1_ANIM_CHAO_SHOCKED;
            s->variant = 2;
            gCurTask->main = Task_8028A1C;
        }
    }
    s->x = I(chao->qWorldX) - gCamera.x;
    s->y = I(chao->qWorldY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8028A1C()
{
    Chao *chao = TASK_DATA(gCurTask);
    Sprite *s = &chao->s;

    chao->s.x = I(chao->qWorldX) - gCamera.x;
    chao->s.y = I(chao->qWorldY) - gCamera.y;

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        if (chao->playerIdA != 0xFF) {
            if (chao->id == 0) {
                gCurTask->main = Task_8028388;
            } else if (chao->id == 1) {
                gCurTask->main = Task_8028518;
            } else {
                gCurTask->main = Task_80286B0;
            }
        } else {
            gCurTask->main = Task_802816C;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

// Returns whether a Chao's position is identical to the input player pos
bool32 UpdateChaoPosition(CamCoord playerX, CamCoord playerY)
{
    s16 vecChaoPlayerY;
    s16 vecChaoPlayerX;
    s16 dirX;
    s16 dirY;
    s16 angle;
    s32 qDistance;

    Chao *chao = TASK_DATA(gCurTask);
    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[chao->playerIdA]);
    Sprite *s = &chao->s;

    vecChaoPlayerX = playerX - I(chao->qWorldX);
    vecChaoPlayerY = playerY - I(chao->qWorldY);
    if ((vecChaoPlayerX > 0) || ((vecChaoPlayerX == 0) && (mpp->s.frameFlags & 0x400))) {
        s->frameFlags |= 0x400;
    } else {
        s->frameFlags &= ~0x400;
    }
    if ((vecChaoPlayerX == 0) && (vecChaoPlayerY == 0)) {
        return 1U;
    }

    dirX = vecChaoPlayerX;
    dirY = vecChaoPlayerY;
    if ((vecChaoPlayerX != 0) && (vecChaoPlayerY != 0)) {
        while ((ABS(dirX) > 0x7F) || (ABS(dirY) > 0x7F)) {
            dirX /= 2;
            dirY /= 2;
            if ((ABS(dirX) <= 1) || ABS(dirY) <= 1) {
                break;
            }
        }
    }

    if ((ABS(dirX) <= 1) && (ABS(dirY) > 1)) {
        if (dirY > 0) {
            angle = DEG_TO_SIN(90);
        } else {
            angle = DEG_TO_SIN(270);
        }
    } else {
        if ((ABS(dirY) <= 1) && (ABS(dirX) > 1)) {
            if (dirX > 0) {
                angle = DEG_TO_SIN(0);
            } else {
                angle = DEG_TO_SIN(180);
            }
        } else {
            angle = (u16)SA2_LABEL(sub_8004418)(dirY, dirX);
        }
    }

    qDistance = Q(Sqrt((vecChaoPlayerX * vecChaoPlayerX) + (vecChaoPlayerY * vecChaoPlayerY)));

    if (qDistance > Q(2.0)) {
        qDistance = Q(2.0);
    } else if (qDistance == 0) {
        qDistance = 1;
    }
    chao->qDistanceToPlayer = qDistance;

    if (chao->qDistanceToPlayer != 0) {
        chao->qWorldX += (chao->qDistanceToPlayer * COS(angle)) >> 14;
        chao->qWorldY += (chao->qDistanceToPlayer * SIN(angle)) >> 14;
    }
    return 0U;
}

void TaskDestructor_Chao(Task *t)
{
    Chao *chao = TASK_DATA(t);
    VramFree(chao->s.graphics.dest);
}
