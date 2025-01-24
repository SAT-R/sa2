#include "global.h"
#include "game/entity.h"
#include "game/math.h"
#include "core.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/techno_base/light_globe.h"
#include "malloc_vram.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ u16 kind;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 left;
    /* 0x0E */ s16 top;
    /* 0x10 */ s16 right;
    /* 0x12 */ s16 bottom;
    /* 0x14 */ s32 centerX;
    /* 0x18 */ s32 centerY;
    /* 0x1C */ u16 height;
    /* 0x1E */ u16 width;
    /* 0x20 */ u16 quarterWidth;

    /* 0x24 */ MapEntity *me;
    /* 0x28 */ u8 spriteX;
    /* 0x29 */ u8 spriteY;
    /* 0x2C */ u8 *vramMem;
} StrcUnkIA086;

typedef struct {
    /* 0x00 */ Sprite *s;
    /* 0x04 */ u8 unk4;
    /* 0x05 */ u8 filler5[3];
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
} Unk_IA86;

typedef struct {
    /* 0x00 */ Unk_IA86 unk0[16];

    /* 0x180 */ u16 unk180;
    /* 0x182 */ u8 unk182;
    /* 0x183 */ u8 unk183;
    /* 0x184 */ s16 unk184;
    /* 0x186 */ s16 unk186;
    /* 0x188 */ s32 unk188;
    /* 0x18C */ s32 unk18C;
    /* 0x190 */ s32 unk190;
    /* 0x194 */ s32 unk194;
    /* 0x198 */ Sprite sprites[3];
    /* 0x228 */ StrcUnkIA086 unk228;
} Sprite_IA86; /* size: 0x258 (600) */

void sub_807C9C0(Sprite_IA86 *);
bool32 sub_807CB78(Sprite_IA86 *);
bool32 sub_807CA64(Sprite_IA86 *);
void sub_807CC28(Sprite_IA86 *ia086);
bool32 sub_807CF2C(Sprite_IA86 *);
bool32 sub_807CFB4(Sprite_IA86 *);
void sub_807CCBC(Sprite_IA86 *);
void sub_807CE94(Sprite_IA86 *);
void Task_807D0C4(void);
void sub_807D100(Sprite_IA86 *);
void sub_807D130(Sprite_IA86 *);
void sub_807D188(Sprite_IA86 *);
void sub_807D16C(Sprite_IA86 *);
void sub_807D1BC(Sprite_IA86 *ia086);
void Task_807D268(void);
void sub_807D2BC(Sprite_IA86 *);

static void Task_807D06C(void);
void TaskDestructor_Interactable086(struct Task *t);

static const u16 gUnknown_080E0124[3][3] = {
    { SA2_ANIM_WHIRLWIND, 2, 1 },
    { SA2_ANIM_WHIRLWIND, 1, 1 },
    { SA2_ANIM_WHIRLWIND, 0, 2 },
};

static const u8 gUnknown_080E0136[8] = { 0, 0, 0, 0, 1, 1, 1, 2 };

#define UNKNOWN_WHIRLWIND_THIRYTWO 32

void CreateEntity_Whirlwind(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u32 kind)
{
    struct Task *t = TaskCreate(Task_807D06C, sizeof(Sprite_IA86), 0x2010, 0, TaskDestructor_Interactable086);
    Sprite_IA86 *ia086 = TASK_DATA(t);
    s32 someX, someY;
    s32 value;
    u32 width;
    ia086->unk228.posX = TO_WORLD_POS(me->x, spriteRegionX);
    ia086->unk228.posY = TO_WORLD_POS(me->y, spriteRegionY);
    ia086->unk228.kind = kind;
    ia086->unk228.left = me->d.sData[0] * TILE_WIDTH;
    ia086->unk228.top = me->d.sData[1] * TILE_WIDTH;
    ia086->unk228.right = ia086->unk228.left + me->d.uData[2] * TILE_WIDTH;
    ia086->unk228.bottom = ia086->unk228.top + me->d.uData[3] * TILE_WIDTH;

    ia086->unk228.centerX = ia086->unk228.posX + ((ia086->unk228.right + ia086->unk228.left) >> 1);

    ia086->unk228.centerY = ia086->unk228.posY + (ia086->unk228.bottom);

    ia086->unk228.height = ia086->unk228.bottom - ia086->unk228.top;
    ia086->unk228.width = ia086->unk228.right - ia086->unk228.left;

    width = ia086->unk228.width;
    ia086->unk228.quarterWidth = width / 4;

    ia086->unk228.me = me;
    ia086->unk228.spriteX = me->x;
    ia086->unk228.spriteY = spriteY;

    {
        u8 i;
        u8 *vram;
        Unk_IA86 *unkPtr;
        for (i = 0; i < ARRAY_COUNT(ia086->unk0); i++) {
            ia086->unk0[i].s = NULL;
        }
        ia086->unk228.vramMem = VramMalloc(4);
        vram = ia086->unk228.vramMem;

        for (i = 0; i < ARRAY_COUNT(ia086->sprites); i++) {
            Sprite *s = &ia086->sprites[i];
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->graphics.dest = vram;
            s->graphics.anim = gUnknown_080E0124[i][0];
            s->variant = gUnknown_080E0124[i][1];
            vram += gUnknown_080E0124[i][2] * TILE_SIZE_4BPP;
        }
    }

    sub_807D1BC(ia086);
    SET_MAP_ENTITY_INITIALIZED(me);
}

#ifdef NON_MATCHING
// (fake-matched) https://decomp.me/scratch/Jl2c3
void sub_807C9C0(Sprite_IA86 *ia086)
{
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_IN_WHIRLWIND;

    ia086->unk182 = 64;
    ia086->unk184 = Q(0.5);
    ia086->unk186 = gPlayer.qSpeedAirY;
    ia086->unk180 = 0;
    ia086->unk188 = Q(ia086->unk228.centerX) - gPlayer.qWorldX;
    ia086->unk18C = Q(ia086->unk228.centerY) - gPlayer.qWorldY;
    ia086->unk190 = 0;
    ia086->unk194 = 0;

    gCurTask->main = Task_807D0C4;
}
#else
void sub_807C9C0(Sprite_IA86 *ia086)
{
    register Player *p1 asm("r2") = &gPlayer;
    register Player *p asm("r4");
    register s32 r0 asm("r0");
    register s32 zero asm("r3");
    register s32 r1 asm("r1");
    s16 *p184;

    p1->moveState |= MOVESTATE_IA_OVERRIDE;
    p1->charState = CHARSTATE_IN_WHIRLWIND;

    // Must be some debug stuff happening here
    r0 = 0x23C;
    r0 = Q(*(s32 *)((void *)ia086 + r0));
    asm("" ::"r"(r0));
    r1 = p1->qWorldX;
    asm("" ::"r"(r1));
    p = p1;
    asm("" ::: "r0");

    ia086->unk182 = 64;

    p184 = &ia086->unk184;
    zero = 0;
    *p184 = Q(0.5);

    ia086->unk186 = p->qSpeedAirY;

    r0 = 0x180;
    (*(s16 *)((void *)ia086 + r0)) = zero;

    ia086->unk188 = p->qWorldX - Q(ia086->unk228.centerX);
    ia086->unk18C = p->qWorldY - Q(ia086->unk228.centerY);
    ia086->unk190 = zero;
    ia086->unk194 = zero;

    gCurTask->main = Task_807D0C4;
}
#endif

bool32 sub_807CA64(Sprite_IA86 *ia086)
{
    u8 returnState = 0;

    s32 someY = Q(ia086->unk228.centerY - 2 * TILE_WIDTH);

    if (ia086->unk186 <= 0) {
        returnState = 1;

        ia086->unk186 -= 64;

        ia086->unk186 = MAX(ia086->unk186, -Q(3.0));
    } else {
        ia086->unk186 = MIN(ia086->unk186, +Q(6.0));
        ia086->unk186 += MIN((-ia086->unk186 >> 4), -Q(0.25));
    }

    gPlayer.qWorldY += ia086->unk186;
    gPlayer.qWorldY = MIN(gPlayer.qWorldY, someY);

    ia086->unk184 += Q(0.25);
    ia086->unk184 = MIN(ia086->unk184, +Q(3.0));

    if (ia086->unk188 > 0) {
        ia086->unk188 -= ia086->unk184;

        if (ia086->unk188 < 0)
            ia086->unk188 = 0;
    } else if (ia086->unk188 < 0) {
        ia086->unk188 += ia086->unk184;

        if (ia086->unk188 > 0)
            ia086->unk188 = 0;
    } else {
        returnState++;
        sub_807CC28(ia086);
    }

    gPlayer.qWorldX = Q(ia086->unk228.centerX) + ia086->unk188 + ia086->unk190;

    return (returnState == 2);
}

bool32 sub_807CB78(Sprite_IA86 *ia086)
{
    bool32 result = FALSE;

    if (gPlayer.qWorldY > Q(ia086->unk228.posY + ia086->unk228.top)) {
        ia086->unk186 -= 0x10;

        ia086->unk186 = MAX(ia086->unk186, -Q(3.0));
        ia086->unk18C += ia086->unk186;

        sub_807CC28(ia086);
    } else {
        result = TRUE;
    }

    {
        Player *p = &gPlayer;
        s32 x, y;

        x = Q(ia086->unk228.centerX);
        x += ia086->unk188;
        x += ia086->unk190;
        p->qWorldX = x;

        y = Q(ia086->unk228.centerY);
        y += ia086->unk18C;
        y += ia086->unk194;
        p->qWorldY = y;
    }

    return result;
}

void sub_807CC28(Sprite_IA86 *ia086)
{
    s32 unk10 = ia086->unk228.quarterWidth;
    s32 r4 = ia086->unk228.width;
    s32 divRes = -ia086->unk18C / ia086->unk228.height;
    s16 procRes = sub_80855C0(unk10, r4, divRes, 8) >> 1;

    s32 *target = &ia086->unk190;

    u32 temp;
    u32 unk180;
    s32 cosVal = (procRes * COS_24_8(ia086->unk182 * 4));

    *target = I(cosVal * 192);

    unk180 = ia086->unk180;
    unk180 += Q(0.5);
    ia086->unk180 = unk180;
    {
#ifdef NON_MATCHING
        u32 r2 = unk180;
#else
        register u32 r2 asm("r2") = unk180;
#endif

        unk180 <<= 16;
        unk180 >>= 16;
        if (unk180 > Q(6.0))
            r2 = Q(6.0);
        ia086->unk180 = r2;

        {
#ifdef NON_MATCHING
            u32 r0 = (r2 << 16);
#else
            register u32 r0 asm("r0") = (r2 << 16);
#endif
            ia086->unk182 += (r0 >> 24);
        }
    }
}

void sub_807CCBC(Sprite_IA86 *ia086)
{
    bool32 bIdk = FALSE;
    u8 i;

    if ((gStageTime & 0xF) == 0)
        bIdk = TRUE;

    for (i = 0; i < ARRAY_COUNT(ia086->sprites); i++) {
        UpdateSpriteAnimation(&ia086->sprites[i]);
    }

    for (i = 0; i < ARRAY_COUNT(ia086->unk0); i++) {
        Unk_IA86 *unk086 = &ia086->unk0[i];
        s16 r0;

        if (unk086->s == NULL) {
            u32 spriteIndex;
            s32 unkC;
            u16 rnd;
            if (!bIdk)
                continue;

            rnd = Random();
            spriteIndex = gUnknown_080E0136[rnd & 0x7];
            unk086->s = &ia086->sprites[spriteIndex];
            unk086->unk4 = Random();
            unk086->unk8 = 0;

            if (ia086->unk228.kind != 0) {
                unkC = Q(-(Random() & 0x7));
            } else {
                unkC = Q(UNKNOWN_WHIRLWIND_THIRYTWO);
            }
            unk086->unkC = unkC;

            unk086->unk10 = 0;
            unk086->unk14 = 0;
            bIdk = FALSE;
        }
        // _0807CD7E
        {
            s16 r2 = ABS(unk086->unkC) >> 4;
            r0 = CLAMP_16(r2, 64, 0x200);
        }

        unk086->unkC -= r0;

        if (unk086->unkC > 0) {
            //_0807CDA2 + 0xC
            s32 r1;
            s32 r2;
            s16 newR1;

            unk086->unk14 = -unk086->unkC;
            r1 = unk086->unkC >> 5;
            r2 = ((ia086->unk228.width * r1) << 8) >> 16;

            r1 = ia086->unk228.quarterWidth;
            if (r1 < r2)
                r1 = r2;

            r1 <<= 16;
            newR1 = r1 >> 17;

            {
                s32 sinIndex;
                s32 addend;
                unk086->unk10 = newR1 * COS_24_8(unk086->unk4 * 4);

                r2 = (u16)((UNKNOWN_WHIRLWIND_THIRYTWO - I(unk086->unkC)) >> 2);

                if ((s16)r2 >= (2)) {
                    r1 = r2;
                    if ((s16)r2 > (8)) {
                        r1 = 8;
                    }
                } else {
                    r1 = (2);
                }
                unk086->unk4 += r1;
            }
        } else {
            // _0807CE12

            if (-I(unk086->unkC) < ia086->unk228.height) {
                s32 r4, r5;
                s32 divRes;
                s16 divRes2;
                s32 temp2;
                unk086->unk14 = SIN_24_8(unk086->unk4 * 4) * 4;

                r5 = ia086->unk228.quarterWidth;
                r4 = ia086->unk228.width;

                temp2 = -unk086->unkC;
                divRes = temp2 / ia086->unk228.height;

                divRes2 = sub_80855C0(r5, r4, divRes, 8) >> 1;
                unk086->unk10 = divRes2 * SIN_24_8(unk086->unk4 * 4);
                unk086->unk4 += 8;
            } else {
                unk086->s = NULL;
            }
        }
    }
}

void sub_807CE94(Sprite_IA86 *ia086)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(ia086->unk0); i++) {
        Unk_IA86 *unk086 = &ia086->unk0[i];

        if (unk086->s != NULL) {
            s32 someX, someY;
            Sprite *s2;
            someX = ia086->unk228.centerX;
            someX += I(unk086->unk8 + unk086->unk10);
            someX -= gCamera.x;
            unk086->s->x = someX;

            s2 = unk086->s;
            someY = ia086->unk228.centerY;
            someY += I(unk086->unkC + unk086->unk14);
            someY -= gCamera.y;
            s2->y = someY;

            if (unk086->unk4 < 124) {
                unk086->s->oamFlags = SPRITE_OAM_ORDER(6);
            } else {
                unk086->s->oamFlags = SPRITE_OAM_ORDER(18);
            }

            if (unk086->unkC > -Q(16))
                unk086->s->frameFlags = SPRITE_FLAG(PRIORITY, 3);
            else
                unk086->s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

            DisplaySprite(unk086->s);
        }
    }
}

bool32 sub_807CF2C(Sprite_IA86 *ia086)
{
    s16 screenX = ia086->unk228.posX - gCamera.x;
    s16 screenY = ia086->unk228.posY - gCamera.y;

    if (((screenX + ia086->unk228.right) < -128) || ((screenX + ia086->unk228.left) > (DISPLAY_WIDTH + 128))
        || ((screenY + ia086->unk228.bottom) < -128) || ((screenY + ia086->unk228.top) > (DISPLAY_HEIGHT + 128))) {

        return TRUE;
    }

    return FALSE;
}

bool32 sub_807CFB4(Sprite_IA86 *ia086)
{
    if (PLAYER_IS_ALIVE) {
        s16 x = ia086->unk228.centerX - gCamera.x;
        s16 y = ia086->unk228.centerY - gCamera.y;
        s16 px = I(gPlayer.qWorldX) - gCamera.x;
        s16 py = I(gPlayer.qWorldY) - gCamera.y;
        s32 r5, r4;
        u16 r3;
        s32 r2 = (y - ia086->unk228.height);

        if ((r2 <= py) && (r2 + ia086->unk228.height >= py)) {
            s32 tempX;
            r5 = ia086->unk228.quarterWidth;
            r4 = ia086->unk228.width;

            r3 = sub_80855C0(r5, r4, (Q(y - py) / ia086->unk228.height), 8);

            tempX = (x - (r3 >> 1));
            if ((tempX <= px) && ((tempX + r3) >= px)) {
                return TRUE;
            }
        }
    }

    return FALSE;
}

void Task_807D06C(void)
{
    Sprite_IA86 *ia086 = TASK_DATA(gCurTask);

    if (sub_807CFB4(ia086)) {
        m4aSongNumStart(SE_WHIRLWIND);
        sub_807C9C0(ia086);
    }

    if (sub_807CF2C(ia086)) {
        sub_807D188(ia086);
    } else {
        sub_807CCBC(ia086);
        sub_807CE94(ia086);
        sub_807D16C(ia086);
    }
}

void Task_807D0C4(void)
{
    Sprite_IA86 *ia086 = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_807D06C;
    } else if (sub_807CA64(ia086)) {
        sub_807D130(ia086);
    }

    sub_807CCBC(ia086);
    sub_807CE94(ia086);
    sub_807D16C(ia086);
}

void TaskDestructor_Interactable086(struct Task *t)
{
    Sprite_IA86 *ia086 = TASK_DATA(t);
    VramFree(ia086->unk228.vramMem);
}

void sub_807D130(Sprite_IA86 *ia086)
{
    ia086->unk188 = 0;
    ia086->unk18C = gPlayer.qWorldY - Q(ia086->unk228.centerY);

    gCurTask->main = Task_807D268;
}

void sub_807D16C(Sprite_IA86 *unused)
{
    if ((gStageTime & 0xFF) == 0) {
        m4aSongNumStartOrContinue(SE_WHIRLWIND);
    }
}

void sub_807D188(Sprite_IA86 *ia086)
{
    m4aSongNumStop(SE_WHIRLWIND);

    SET_MAP_ENTITY_NOT_INITIALIZED(ia086->unk228.me, ia086->unk228.spriteX);

    TaskDestroy(gCurTask);
}

void sub_807D1BC(Sprite_IA86 *ia086)
{
    u8 i;
    for (i = 0; i < 4; i++) {
        Unk_IA86 *unk = &ia086->unk0[i];

        s32 spriteIndex = gUnknown_080E0136[Random() & 0x7];
        unk->s = &ia086->sprites[spriteIndex];
        unk->unk4 = Random();
        unk->unk8 = 0;
        unk->unkC = -Q(Random() & 0x3F);
        unk->unk10 = 0;
        unk->unk14 = 0;
    }

    sub_807CCBC(ia086);
}

void CreateEntity_Whirlwind_A(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Whirlwind(me, spriteRegionX, spriteRegionY, spriteY, 0);
}

void CreateEntity_Whirlwind_B(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Whirlwind(me, spriteRegionX, spriteRegionY, spriteY, 1);
}

void Task_807D268(void)
{
    Sprite_IA86 *sprite = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_807D06C;
    } else if (sub_807CB78(sprite)) {
        sub_807D2BC(sprite);
    }
    sub_807CCBC(sprite);
    sub_807CE94(sprite);
    sub_807D16C(sprite);
}

void sub_807D2BC(Sprite_IA86 *unused)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.transition = PLTRANS_PT7;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = -Q(8.0);

    gCurTask->main = Task_807D06C;
}
