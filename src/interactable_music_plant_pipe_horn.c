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
} Sprite_Trumpet;

extern void Player_SetMovestate_IsInScriptedSequence(void);

extern void sub_8077774(Sprite_Trumpet *, s32, s32);
extern void sub_8077ABC(void);
extern bool32 sub_8077B98(Sprite_Trumpet *);
extern void sub_8077C3C(Sprite_Trumpet *);
extern bool32 sub_8077CB0(Sprite_Trumpet *);
extern void Task_Trumpet_8077C04(void);
void Trumpet_Despawn(Sprite_Trumpet *);
void TaskDestructor_Trumpet(struct Task *);

void Task_Trumpet_8077C04(void)
{
    Sprite_Trumpet *trumpet = TaskGetStructPtr(gCurTask);

    if (sub_8077B98(trumpet)) {
        sub_8077C3C(trumpet);
    }

    if (sub_8077CB0(trumpet)) {
        Trumpet_Despawn(trumpet);
    }
}

void sub_8077C3C(Sprite_Trumpet *trumpet)
{
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;

    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.moveState &= ~(MOVESTATE_FACING_LEFT);
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    sub_8077774(trumpet, Q_24_8(trumpet->posX), Q_24_8(trumpet->posY));

    m4aSongNumStart(SE_MUSIC_PLANT_ENTER_HORN);

    gCurTask->main = sub_8077ABC;
}

void sub_8077CA0(Sprite_Trumpet *trumpet)
{
    gPlayer.x = trumpet->x2;
    gPlayer.y = trumpet->y2;
}

bool32 sub_8077CB0(Sprite_Trumpet *trumpet)
{
    s16 screenX, screenY;

    screenX = trumpet->posX - gCamera.x;
    screenY = trumpet->posY - gCamera.y;

    if (IS_OUT_OF_RANGE_(0, screenX, screenY, (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

void Trumpet_Despawn(Sprite_Trumpet *trumpet)
{
    trumpet->ia->x = trumpet->spriteX;
    TaskDestroy(gCurTask);
}

void initSprite_Interactable_MusicPlant_Trumpet_Entry(Interactable *ia,
                                                      u16 spriteRegionX,
                                                      u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Trumpet_8077C04, sizeof(Sprite_Trumpet), 0x2010, 0,
                                TaskDestructor_Trumpet);
    Sprite_Trumpet *trumpet = TaskGetStructPtr(t);

    trumpet->kind = ia->d.sData[0];
    trumpet->ia = ia;
    trumpet->spriteX = ia->x;
    trumpet->spriteY = spriteY;

    trumpet->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    trumpet->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
}

void TaskDestructor_Trumpet(struct Task *t) { }