#ifndef GUARD_GAME_ITEM_TASKS_H
#define GUARD_GAME_ITEM_TASKS_H

#include "gba/types.h"
#include "task.h"

extern struct Task *CreateItemTask_Shield_Normal(s8);
extern struct Task *CreateItemTask_Invincibility(s8);
extern struct Task *CreateItemTask_Shield_Magnetic(s8);
extern struct Task *CreateItemTask_Confusion(s8);

#endif // GUARD_GAME_ITEM_TASKS_H