#include "global.h"
#include "core.h"
#include "game/game.h"

#include "constants/move_states.h"

typedef struct {
    Player *player;
} Game3;

// In game_2.s
extern void sub_802B018(s32, s32, s32, s32);

void Task_802B2D8(void)
{
    Game3 *g3 = TaskGetStructPtr(gCurTask);

    Player *p = g3->player;

    if (IS_ALIVE(p)) {
        TaskDestroy(gCurTask);
        return;
    } else if (!(gUnknown_03005590 & (0x2 | 0x1))) {
        if ((PseudoRandom32() & 0x300) == 0) {
            s32 r4 = ((u32)PseudoRandom32() & 0x100) >> 8;

            do {
                // TODO: Maybe these could be converted to PseudoRandBetween?
                u32 r3, r2, r1 = ((u32)PseudoRandom32() & 0x7FF00) >> 8;
                r1 -= 0x400;

                r2 = ((u32)PseudoRandom32() & 0x7FF00) >> 8;
                r2 -= 0x400;

                r3 = ((u32)PseudoRandom32() & 0x100) >> 8;

                sub_802B018(p->x + r1, p->y + r2 - 0xC00, 0, r3);
            } while (r4-- != 0);
        }
    }
}

struct Task *sub_802B3BC(Player *p)
{
    struct Task *t = TaskCreate(Task_802B2D8, sizeof(Game3), 0x4001, 0, NULL);

    Game3 *g3 = TaskGetStructPtr(t);
    g3->player = p;

    return t;
}

void TaskDestructor_802B3EC(struct Task *t) { gUnknown_03005B34--; }