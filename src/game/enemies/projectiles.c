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

} ProjectileB; /* size: 0x68 */

void Task_805102C(void);
void TaskDestructor_80511EC(struct Task *);

void CreateProjectile(ProjInit *pji)
{
    struct Task *t = TaskCreate(Task_805102C, sizeof(ProjectileA), 0x4000, 0,
                                TaskDestructor_80511EC);
    ProjectileA *proj = TaskGetStructPtr(t);
    s32 someX, someY;

    proj->x = pji->x;
    proj->y = pji->y;

    someX = (COS(pji->unk6) * pji->unk8) >> 14;
    proj->unk38 = someX;

    someY = (SIN(pji->unk6) * pji->unk8) >> 14;
    proj->unk3A = someY;

    proj->s.graphics.dest = VramMalloc(pji->numTiles);
    proj->s.graphics.anim = pji->anim;
    proj->s.variant = pji->variant;
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

#if 0
void sub_8050ED8(ProjInit *pji, u8 p1, s8 p2)
{
    struct Task *t = TaskCreate(Task_805102C, sizeof(ProjectileA), 0x4000, 0,
                                TaskDestructor_80511EC);
    ProjectileA *proj = TaskGetStructPtr(t);
    
}
#endif