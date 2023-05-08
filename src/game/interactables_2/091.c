#include "global.h"
#include "gba/types.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "game/game.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    s32 unk3C;
    u8 filler40[0x4];
    /* 0x44 */ u16 kind;
    u8 filler46[2 + 0x4];
    s16 unk4C;
    s16 filler4E;
    s16 unk50;
    s32 unk54;
    s32 unk58;
    u16 unk5C;
    s32 unk60;
    s32 unk64;
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    s32 unk74;
} Sprite_EggUtopia_Launcher; /* size: 0x78 */

extern void initSprite_EggUtopia_Launcher(MapEntity *me, u16 spriteRegionX,
                                          u16 spriteRegionY, u8 spriteY, u32 kind);

extern void sub_807DDA0(Sprite_EggUtopia_Launcher *);
void Task_807DE98(void);
extern void sub_807E0D0(Sprite_EggUtopia_Launcher *);
void SetTaskMain_807DE98(Sprite_EggUtopia_Launcher *unused);
bool16 sub_807E1C4(Sprite_EggUtopia_Launcher *launcher);

void sub_807E0B8(Sprite_EggUtopia_Launcher *launcher)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(launcher->base.me, launcher->base.spriteX);
    TaskDestroy(gCurTask);
}

void sub_807E0D0(Sprite_EggUtopia_Launcher *launcher)
{
    launcher->unk70 = launcher->unk68;
    launcher->unk74 = launcher->unk6C;
    launcher->unk68 = launcher->unk60;
    launcher->unk6C = launcher->unk64;
    launcher->unk60 = launcher->unk54;
    launcher->unk64 = launcher->unk58;
}

void initSprite_EggUtopia_Launcher_0(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 0);
}

void initSprite_EggUtopia_Launcher_1(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 1);
}

void initSprite_EggUtopia_Launcher_2(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 2);
}

void initSprite_EggUtopia_Launcher_3(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 3);
}

void sub_807E16C(void)
{
    Sprite_EggUtopia_Launcher *launcher = TaskGetStructPtr(gCurTask);

    if (!IS_SINGLE_PLAYER) {
        sub_807E0D0(launcher);
    }

    if (sub_807E1C4(launcher)) {
        SetTaskMain_807DE98(launcher);
    }

    sub_807DDA0(launcher);
}

void SetTaskMain_807DE98(Sprite_EggUtopia_Launcher *unused)
{
    gCurTask->main = Task_807DE98;
}

bool16 sub_807E1C4(Sprite_EggUtopia_Launcher *launcher)
{
    bool32 result = FALSE;

    if (launcher->kind == 0 || launcher->kind == 2) {
        s32 value;
        launcher->unk54 += Q_24_8(1.0);
        value = Q_24_8(launcher->unk3C + launcher->unk50);
        if (launcher->unk54 >= value) {
            launcher->unk54 = value;
            result = TRUE;
        }
    } else {
        s32 value;
        launcher->unk54 -= Q_24_8(1.0);
        value = Q_24_8(launcher->unk3C + launcher->unk4C);
        if (launcher->unk54 <= value) {
            launcher->unk54 = value;
            result = TRUE;
        }
    }

    return result;
}