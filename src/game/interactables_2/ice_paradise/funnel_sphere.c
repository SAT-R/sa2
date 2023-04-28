#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/ice_paradise/funnel_sphere.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    s32 x; /* 0x0 */
    s32 y; /* 0x4 */
    s32 unk8; /* 0x8 */
    s32 unkC;
    u16 unk10;
    s32 unk14;
    s32 unk18;
    u16 unk1C;
    MapEntity *me; /* 0x20 */
    s8 spriteX; /* 0x24 */
    s8 spriteY; /* 0x25 */
} Sprite_FunnelSphere;

void sub_80784F4(Sprite_FunnelSphere *);
void sub_80782FC(Sprite_FunnelSphere *);

void sub_8078414(void);

#define MUL_4(val) ({ (val) * 4; })

void sub_8077F7C(void)
{
    u8 r6;
    u16 r7;
    s32 r4;
    Sprite_FunnelSphere *funnelSphere = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_80782FC(funnelSphere);
        return;
    }

    funnelSphere->unk10 -= 0x40;
    r6 = (funnelSphere->unk10 >> 2);
    if (funnelSphere->unk18 == 0 && (r6 < 0x40)) {
        gCamera.unk50 |= 1;
        funnelSphere->unk18 = 1;
    }

#ifndef NON_MATCHING
    r6++;
    r6--;
#endif

    if (funnelSphere->unk1C == 1) {
        r7 = Q_24_8_TO_INT(funnelSphere->unkC) - funnelSphere->y;

        r4 = (0x20 - r7) * 0x40;
        r4 = Q_24_8_TO_INT(r4 * SIN_24_8(MUL_4(r6)));
        gPlayer.y = funnelSphere->unkC + r4;

        r4 = r7 * 2;
        r4 = Q_24_8_TO_INT(COS_24_8(MUL_4(r6)) * 0x20 * COS_24_8(MUL_4(r4 & 0xFF)));
        gPlayer.x = funnelSphere->unk8 + r4;

        r4 = r6;
        if (r4 > 0x80) {
#ifndef NON_MATCHING
            register u32 r0 asm("r0") = 0x100;
            asm("" ::"r"(r0));
            r4 = r0 - r6;
#else
            u32 r0 = 0x100 - r6;
            r4 = r0;
#endif
        }

#ifndef NON_MATCHING
        r7++;
        r7--;
#endif

        gPlayer.rotation
            = Q_24_8_TO_INT((0x40 - r4) * COS_24_8(MUL_4((r7 * 2) & 0xFF))) + 0x40;

        gPlayer.speedAirX = COS_24_8(MUL_4(gPlayer.rotation));
        gPlayer.speedAirY = SIN_24_8(MUL_4(gPlayer.rotation));
        funnelSphere->unkC += 0x40;
    } else {
        r7 = funnelSphere->y - Q_24_8_TO_INT(funnelSphere->unkC);
        r4 = (0x20 - r7) * 0x40;
        r4 = Q_24_8_TO_INT(-(r4 * SIN_24_8(MUL_4(r6))));
        gPlayer.y = funnelSphere->unkC + r4;

        r4 = r7 * 2;
        r4 = Q_24_8_TO_INT(COS_24_8(MUL_4(r6)) * 0x20 * COS_24_8(MUL_4(r4 & 0xFF)));
        gPlayer.x = funnelSphere->unk8 + r4;

        r4 = r6;
        if (r4 < 0x80) {
            u32 r0 = (0x80 - r6) * 2;
            r4 += r0;
        }

#ifndef NON_MATCHING
        r7++;
        r7--;
#endif

        gPlayer.rotation
            = Q_24_8_TO_INT((0xC0 - r4) * COS_24_8(MUL_4((r7 * 2) & 0xFF))) - 0x40;

        gPlayer.speedAirX = COS_24_8(MUL_4(gPlayer.rotation));
        gPlayer.speedAirY = SIN_24_8(MUL_4(gPlayer.rotation));
        funnelSphere->unkC -= 0x40;
    }
    if (r7 > 0x1F) {
        sub_80784F4(funnelSphere);
    }
};

void sub_8078688(void);

// void initSprite_Interactable_IceParadise_FunnelSphere(MapEntity *me, u16
// spriteRegionX,
//                                                       u16 spriteRegionY, u8
//                                                       spriteY)
// {
//     struct Task *t = TaskCreate(sub_8078414, 0x28, 0x2010, 0, sub_8078688);
// }
