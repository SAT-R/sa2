#include "global.h"
#include "task.h"
#include "game/entity.h"

typedef struct {
} Sprite_Spinner;

void sub_8057024(void);
void TaskDestructor_80095E8(struct Task *);

#if 0
void initSprite_Enemy_Spinner(Enemy *en, u16 spriteRegionX, u16 spriteRegionY,
                                 u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8057024, sizeof(Sprite_Spinner), 0x4040, 0, TaskDestructor_80095E8);
    Sprite_Spinner* spinner = TaskGetStructPtr(t);
}
#endif