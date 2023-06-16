#include "global.h"
#include "game/entity.h"
#include "game/enemies/projectiles.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 x;
    /* 0x34 */ s32 y;
    /* 0x38 */ u16 unk38;
    /* 0x3A */ u16 unk3A;
} ProjectileA; /* size: 0x3C */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Vec2_32 unk30[4];
    /* 0x50 */ u16 unk50[4][2];
    /* 0x60 */ u8 unk60;
    /* 0x61 */ u8 unk61[4];
    /* 0x65 */ u8 filler65[0x2];
} ProjectileB; /* size: 0x68 */

void Task_805102C(void);
void Task_80510B0(void);
void TaskDestructor_80511EC(struct Task *);
void TaskDestructor_8051200(struct Task *);

void CreateProjectile(ProjInit *init)
{
    struct Task *t = TaskCreate(Task_805102C, sizeof(ProjectileA), 0x4000, 0,
                                TaskDestructor_80511EC);
    ProjectileA *proj = TaskGetStructPtr(t);
    s32 someX, someY;

    proj->x = init->x;
    proj->y = init->y;

    someX = (COS(init->unk6) * init->unk8) >> 14;
    proj->unk38 = someX;

    someY = (SIN(init->unk6) * init->unk8) >> 14;
    proj->unk3A = someY;

    proj->s.graphics.dest = VramMalloc(init->numTiles);
    proj->s.graphics.anim = init->anim;
    proj->s.variant = init->variant;
    proj->s.unk1A = 0x200;
    proj->s.graphics.size = 0;
    proj->s.x = 0;
    proj->s.y = 0;
    proj->s.unk14 = 0;
    proj->s.unk1C = 0;
    proj->s.unk21 = 0xFF;
    proj->s.unk22 = 0x10;
    proj->s.palId = 0;
    proj->s.unk28[0].unk0 = -1;
    proj->s.unk10 = SPRITE_FLAG(PRIORITY, 1);
}

void sub_8050ED8(ProjInit *init, u8 p1, s8 p2)
{
    struct Task *t = TaskCreate(Task_80510B0, sizeof(ProjectileB), 0x4000, 0,
                                TaskDestructor_8051200);
    ProjectileB *proj = TaskGetStructPtr(t);
    u8 i;

    if (p1 > 4)
        p1 = 4;

    proj->unk60 = p1;

    for (i = 0; i < p1; i++) {
        s16 temp;
        proj->unk30[i].x = init->x;
        proj->unk30[i].y = init->y;

        proj->unk50[i][0] = temp = ((i * p2) + init->unk6) & 0x3FF;
        proj->unk50[i][0] = (COS(temp) * init->unk8) >> 14;

        proj->unk50[i][1] = (SIN(temp) * init->unk8) >> 14;
        proj->unk61[i] = 1;
    }

    proj->s.graphics.dest = VramMalloc(init->numTiles);
    proj->s.graphics.anim = init->anim;
    proj->s.variant = init->variant;
    proj->s.unk1A = 0x200;
    proj->s.graphics.size = 0;
    proj->s.x = 0;
    proj->s.y = 0;
    proj->s.unk14 = 0;
    proj->s.unk1C = 0;
    proj->s.unk21 = 0xFF;
    proj->s.unk22 = 0x10;
    proj->s.palId = 0;
    proj->s.unk28->unk0 = -1;
    proj->s.unk10 = SPRITE_FLAG(PRIORITY, 1);
}