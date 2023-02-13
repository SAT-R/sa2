#include "global.h"
#include "m4a.h"
#include "trig.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ s32 x0;
    /* 0x04 */ s32 y0;
    /* 0x08 */ s32 x1;
    /* 0x0C */ s32 y1;
    /* 0x10 */ s32 x2;
    /* 0x14 */ s32 y2;
    /* 0x18 */ u16 unk18;
    /* 0x1A */ u16 unk1A;
    /* 0x1C */ s32 posX;
    /* 0x20 */ s32 posY;
    /* 0x24 */ u16 kind;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ Interactable *ia;
    /* 0x2C */ u8 spriteX;
    /* 0x2D */ u8 spriteY;
} Sprite_Pipe_Horn;

typedef struct {
    u16 unk0;
    u16 unk2;
    s32 unk4; // Q_24_8?
} Pipe_Data;

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

extern const Pipe_Data gUnknown_080DFCF0[];
extern const Pipe_Data gUnknown_080DFD40[];
extern const Pipe_Data gUnknown_080DFD98[];
extern const Pipe_Data gUnknown_080DFDD8[];
extern const Pipe_Data gUnknown_080DFE30[];

extern s16 gUnknown_080DFE90[9][2];
extern s16 gUnknown_080DFEB4[14];
extern s16 gUnknown_080DFED0[10];
extern const Pipe_Data gUnknown_080DFEE4[];
extern const Pipe_Data gUnknown_080DFF3C[];
extern const Pipe_Data gUnknown_080DFF9C[];

// NOTE: Gets stored in .data section
//       (I assume that is because it's a pointer array)
const Pipe_Data (*gUnknown_08C8793C[9])[] = {
    &gUnknown_080DFCF0, &gUnknown_080DFCF0, &gUnknown_080DFD40,
    &gUnknown_080DFD40, &gUnknown_080DFD98, &gUnknown_080DFDD8,
    &gUnknown_080DFDD8, &gUnknown_080DFE30, &gUnknown_080DFE30,
};

// NOTE: Gets stored in .data section
const Pipe_Data (*gUnknown_08C87960[3])[] = {
    &gUnknown_080DFEE4,
    &gUnknown_080DFF3C,
    &gUnknown_080DFF9C,
};

extern void (*sPipeHandlers[16])(Sprite_Pipe_Horn *, const Pipe_Data data[]);

extern void Player_SetMovestate_IsInScriptedSequence(void);
extern void Player_ClearMovestate_IsInScriptedSequence(void);

extern void sub_8077774(Sprite_Pipe_Horn *, s32, s32);
extern void sub_80777C8(Sprite_Pipe_Horn *);
extern bool32 sub_8077788(Sprite_Pipe_Horn *, const Pipe_Data data[]);
bool32 sub_8077840(Sprite_Pipe_Horn *);
extern void sub_80778AC(void);
void sub_80778E4(Sprite_Pipe_Horn *pipe);
bool32 sub_807794C(Sprite_Pipe_Horn *);
void sub_8077994(Sprite_Pipe_Horn *);
extern void sub_8077A3C(void);
extern void sub_8077ABC(void);
static void TaskDestructor_Pipe(struct Task *t);
extern void sub_8077AAC(Sprite_Pipe_Horn *);
void sub_8077AAC(Sprite_Pipe_Horn *horn);
static void sub_8077B28(Sprite_Pipe_Horn *);
extern bool32 sub_8077B98(Sprite_Pipe_Horn *);
extern void sub_8077C3C(Sprite_Pipe_Horn *);
extern void sub_8077CA0(Sprite_Pipe_Horn *);
extern bool32 sub_8077CB0(Sprite_Pipe_Horn *);
extern void Task_FrenchHorn_8077C04(void);
void FrenchHorn_Despawn(Sprite_Pipe_Horn *);
void TaskDestructor_FrenchHorn(struct Task *);


void Handler_MusicPlant_Pipe_9(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s32 sin, cos;
    s32 sin2;
    s32 r8, r9;
    s32 r7 = data[pipe->unk18].unk4;
    u16 sinIndex = ((pipe->unk1A >> 3) + 896) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    r8 = r7 * cos;

    sin = SIN_24_8(768);
    r9 = r7*sin;
    pipe->x2 = Q_24_8_TO_INT(r8 - sin) + pipe->x1;

    sin2 = (SIN_24_8(sinIndex) + SIN_24_8(128));
    pipe->y2 = Q_24_8_TO_INT(sin2 * r7) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = SIN_24_8(256);
        pipe->x1 = Q_24_8_TO_INT(r9 - cos) + pipe->x1;
        //pipe->x1 += r7;

        pipe->y1 = Q_24_8_TO_INT((SIN_24_8(0) + sinIndex) * r7) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_10(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4;
    u16 sinIndex = ((pipe->unk1A >> 3) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_24_8(640);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;
        pipe->x1 += r5;

        sin = SIN_24_8(640);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void sub_8077774(Sprite_Pipe_Horn *pipe, s32 x, s32 y)
{
    pipe->x0 = x;
    pipe->y0 = y;
    pipe->x1 = x;
    pipe->y1 = y;
    pipe->x2 = x;
    pipe->y2 = y;
    pipe->unk18 = 0;
    pipe->unk1A = 0;
}

u32 sub_8077788(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    u32 result;
    if (pipe->unk18 == (u16)-1) {
        return 0;
    }

    sPipeHandlers[data[pipe->unk18].unk0](pipe, data);

    result = pipe->unk18;
    result ^= (u16)-1;

    return (-result | result) >> 31;
}

void sub_80777C8(Sprite_Pipe_Horn *pipe)
{
    Player_ClearMovestate_IsInScriptedSequence();

    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk6D = 5;

    gPlayer.speedAirX = gUnknown_080DFE90[pipe->kind][0];
    gPlayer.speedAirY = gUnknown_080DFE90[pipe->kind][1];
    gPlayer.unk24 = gUnknown_080DFEB4[pipe->kind];

    m4aSongNumStart(gUnknown_080DFED0[pipe->kind]);

    gCurTask->main = sub_80778AC;
}

// NOTE: sub_8077840 is identical with sub_8077B98
bool32 sub_8077840(Sprite_Pipe_Horn *pipe)
{
    // NOTE: This matches... but at what cost? D:
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        goto sub_8077B98_ret0;
    } else {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s32 cSquared;

        screenX = pipe->posX - gCamera.x;
        screenY = pipe->posY - gCamera.y;

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

void sub_80778AC(void)
{
    Sprite_Pipe_Horn *pipe = TaskGetStructPtr(gCurTask);

    if (sub_8077840(pipe)) {
        sub_80778E4(pipe);
    }

    if (sub_807794C(pipe)) {
        sub_8077994(pipe);
    }
}

void sub_80778E4(Sprite_Pipe_Horn *pipe)
{
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;

    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;

    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    sub_8077774(pipe, Q_24_8(pipe->posX), Q_24_8(pipe->posY + 4));

    m4aSongNumStart(SE_MUSIC_PLANT_ENTER_HORN2);
    gCurTask->main = sub_8077A3C;
}

bool32 sub_807794C(Sprite_Pipe_Horn *pipe)
{
    s16 screenX, screenY;

    screenX = pipe->posX - gCamera.x;
    screenY = pipe->posY - gCamera.y;

    if (IS_OUT_OF_RANGE_(0, screenX, screenY, (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

void sub_8077994(Sprite_Pipe_Horn *pipe)
{
    pipe->ia->x = pipe->spriteX;
    TaskDestroy(gCurTask);
}

void initSprite_Interactable_MusicPlant_PipeInstrument_Entry(Interactable *ia,
                                                             u16 spriteRegionX,
                                                             u16 spriteRegionY,
                                                             u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80778AC, sizeof(Sprite_Pipe_Horn), 0x2010, 0,
                                TaskDestructor_Pipe);
    Sprite_Pipe_Horn *pipe = TaskGetStructPtr(t);

    pipe->kind = ia->d.sData[0];
    pipe->ia = ia;

    pipe->spriteX = ia->x;
    pipe->spriteY = spriteY;
    pipe->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    pipe->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
}

void sub_8077A3C(void)
{
    Sprite_Pipe_Horn *pipe = TaskGetStructPtr(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = sub_80778AC;
    } else {
        gPlayer.unk24 = 0;
        gPlayer.speedAirX = 1;
        gPlayer.speedAirY = 0;

        if (sub_8077788(pipe, *gUnknown_08C8793C[pipe->kind]) == 0) {
            sub_80777C8(pipe);
        }

        sub_8077AAC(pipe);
    }
}

void TaskDestructor_Pipe(struct Task *t) { }

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

        if (sub_8077788(horn, *gUnknown_08C87960[horn->kind]) == 0) {
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

// NOTE: Literally copy-paste of sub_8077840
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