#include "global.h"
#include "m4a.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/move_states.h"
#include "constants/songs.h"

extern u8 gUnknown_080DFCF0[];
extern u8 gUnknown_080DFD40[];
extern u8 gUnknown_080DFD98[];
extern u8 gUnknown_080DFDD8[];
extern u8 gUnknown_080DFE30[];
extern u8 gUnknown_080DFEE4[];
extern u8 gUnknown_080DFF3C[];
extern u8 gUnknown_080DFF9C[];

static const s16 gUnknown_080DFFF4[3][2] = {
    { Q_8_8(9), Q_8_8(0) },
    { Q_8_8(12), Q_8_8(0) },
    { Q_8_8(9), Q_8_8(-9) },
};

static const s16 gUnknown_080E0000[4] = {
    Q_8_8(0),
    Q_8_8(0),
    Q_8_8(7. / 8.),
    Q_8_8(0),
};

const void *gUnknown_08C8793C[9] = {
    gUnknown_080DFCF0, gUnknown_080DFCF0, gUnknown_080DFD40,
    gUnknown_080DFD40, gUnknown_080DFD98, gUnknown_080DFDD8,
    gUnknown_080DFDD8, gUnknown_080DFE30, gUnknown_080DFE30,
};

const void *gUnknown_08C87960[3] = {
    gUnknown_080DFEE4,
    gUnknown_080DFF3C,
    gUnknown_080DFF9C,
};

typedef struct {
    /* 0x00 */ s32 x0;
    /* 0x04 */ s32 y0;
    /* 0x08 */ s32 x1;
    /* 0x0C */ s32 y1;
    /* 0x10 */ s32 x2;
    /* 0x14 */ s32 y2;
    u8 filler18[0x4];
    /* 0x1C */ s32 posX;
    /* 0x20 */ s32 posY;
    /* 0x24 */ u16 kind;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ Interactable *ia;
    /* 0x2C */ u8 spriteX;
    /* 0x2D */ u8 spriteY;
} Sprite_Pipe_Horn;

extern void Player_SetMovestate_IsInScriptedSequence(void);
extern void Player_ClearMovestate_IsInScriptedSequence(void);

extern void sub_8077774(Sprite_Pipe_Horn *, s32, s32);
extern void sub_80777C8(Sprite_Pipe_Horn *);
extern bool32 sub_8077788(Sprite_Pipe_Horn *, const void *);
extern void sub_80778AC(void);
extern void sub_8077ABC(void);
static void TaskDestructor_Pipe(struct Task* t);
extern void sub_8077AAC(Sprite_Pipe_Horn*);
void sub_8077AAC(Sprite_Pipe_Horn *horn);
static void sub_8077B28(Sprite_Pipe_Horn *);
extern bool32 sub_8077B98(Sprite_Pipe_Horn *);
extern void sub_8077C3C(Sprite_Pipe_Horn *);
extern void sub_8077CA0(Sprite_Pipe_Horn *);
extern bool32 sub_8077CB0(Sprite_Pipe_Horn *);
extern void Task_FrenchHorn_8077C04(void);
void FrenchHorn_Despawn(Sprite_Pipe_Horn *);
void TaskDestructor_FrenchHorn(struct Task *);

void sub_8077994(Sprite_Pipe_Horn* pipe) {
    pipe->ia->x = pipe->spriteX;
    TaskDestroy(gCurTask);
}

void initSprite_Interactable_MusicPlant_PipeInstrument_Entry(Interactable *ia,
                                                         u16 spriteRegionX,
                                                         u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80778AC, sizeof(Sprite_Pipe_Horn), 0x2010, 0, TaskDestructor_Pipe);
    Sprite_Pipe_Horn *pipe = TaskGetStructPtr(t);

    pipe->kind = ia->d.sData[0];
    pipe->ia = ia;

    pipe->spriteX = ia->x;
    pipe->spriteY = spriteY;
    pipe->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    pipe->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
}

void sub_8077A3C(void) {
    Sprite_Pipe_Horn* pipe = TaskGetStructPtr(gCurTask);

    if(gPlayer.moveState & MOVESTATE_DEAD) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = sub_80778AC;
    } else {
        gPlayer.unk24 = 0;
        gPlayer.speedAirX = 1;
        gPlayer.speedAirY = 0;

        if(sub_8077788(pipe, gUnknown_08C8793C[pipe->kind]) == 0) {
            sub_80777C8(pipe);
        }

        sub_8077AAC(pipe);
    }
}

void TaskDestructor_Pipe(struct Task* t) {}

/* --- French Horn --- */

void sub_8077AAC(Sprite_Pipe_Horn *horn)
{
    gPlayer.x = horn->x2;
    gPlayer.y = horn->y2;
}

void sub_8077ABC(void)
{
    Sprite_Pipe_Horn *horn = TaskGetStructPtr(gCurTask);
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = Task_FrenchHorn_8077C04;
    } else {
        gPlayer.unk24 = 0x20;

        gPlayer.speedAirX = 1;
        gPlayer.speedAirY = 1;

        if (sub_8077788(horn, gUnknown_08C87960[horn->kind]) == 0) {
            sub_8077B28(horn);
        }

        sub_8077CA0(horn);
    }
}

void sub_8077B28(Sprite_Pipe_Horn *horn)
{
#ifndef MODERN
    Player_ClearMovestate_IsInScriptedSequence();
    gPlayer.moveState &= ~(MOVESTATE_400000);
#else
    // Doing this inline is faster, and
    // personally more comprehensible.
    gPlayer.moveState &= ~(MOVESTATE_IN_SCRIPTED | MOVESTATE_400000);
#endif

    gPlayer.unk6D = 5;
    gPlayer.speedAirX = gUnknown_080DFFF4[horn->kind][0];
    gPlayer.speedAirY = gUnknown_080DFFF4[horn->kind][1];
    gPlayer.unk24 = gUnknown_080E0000[horn->kind];

    m4aSongNumStart(SE_MUSIC_PLANT_EXIT_HORN);

    gCurTask->main = Task_FrenchHorn_8077C04;
}

bool32 sub_8077B98(Sprite_Pipe_Horn *horn)
{
    // NOTE: This matches... but at what cost? D:
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        goto sub_8077B98_ret0;
    } else {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s32 cSquared;

        screenX = horn->posX - gCamera.x;
        screenY = horn->posY - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        screenX -= playerX;
        screenY -= playerY;

        cSquared = (screenX * screenX) + (screenY * screenY);
        if (cSquared > 400) {
        sub_8077B98_ret0:
            return FALSE;
        } else {
            return TRUE;
        }
    }
}

void Task_FrenchHorn_8077C04(void)
{
    Sprite_Pipe_Horn *horn = TaskGetStructPtr(gCurTask);

    if (sub_8077B98(horn)) {
        sub_8077C3C(horn);
    }

    if (sub_8077CB0(horn)) {
        FrenchHorn_Despawn(horn);
    }
}

void sub_8077C3C(Sprite_Pipe_Horn *horn)
{
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;

    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.moveState &= ~(MOVESTATE_FACING_LEFT);
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    sub_8077774(horn, Q_24_8(horn->posX), Q_24_8(horn->posY));

    m4aSongNumStart(SE_MUSIC_PLANT_ENTER_HORN);

    gCurTask->main = sub_8077ABC;
}

void sub_8077CA0(Sprite_Pipe_Horn *horn)
{
    gPlayer.x = horn->x2;
    gPlayer.y = horn->y2;
}

bool32 sub_8077CB0(Sprite_Pipe_Horn *horn)
{
    s16 screenX, screenY;

    screenX = horn->posX - gCamera.x;
    screenY = horn->posY - gCamera.y;

    if (IS_OUT_OF_RANGE_(0, screenX, screenY, (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

void FrenchHorn_Despawn(Sprite_Pipe_Horn *horn)
{
    horn->ia->x = horn->spriteX;
    TaskDestroy(gCurTask);
}

void initSprite_Interactable_MusicPlant_FrenchHorn_Entry(Interactable *ia,
                                                         u16 spriteRegionX,
                                                         u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_FrenchHorn_8077C04, sizeof(Sprite_Pipe_Horn),
                                0x2010, 0, TaskDestructor_FrenchHorn);
    Sprite_Pipe_Horn *horn = TaskGetStructPtr(t);

    horn->kind = ia->d.sData[0];
    horn->ia = ia;
    horn->spriteX = ia->x;
    horn->spriteY = spriteY;

    horn->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    horn->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
}

void TaskDestructor_FrenchHorn(struct Task *t) { }