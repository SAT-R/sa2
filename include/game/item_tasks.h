#ifndef GUARD_GAME_ITEM_TASKS_H
#define GUARD_GAME_ITEM_TASKS_H

#include "gba/types.h"
#include "task.h"

extern struct Task *CreateItemTask_Shield_Normal(u8);
extern struct Task *CreateItemTask_Invincibility(u8);
extern struct Task *CreateItemTask_Shield_Magnetic(u8);
extern struct Task *CreateItemTask_Confusion(u8);

#endif // GUARD_GAME_ITEM_TASKS_H