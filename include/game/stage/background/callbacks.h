#ifndef GUARD_GAME_STAGE_CALLBACKS_H
#define GUARD_GAME_STAGE_CALLBACKS_H

#include "gba/types.h"

extern void sub_801E3F0(void);
extern void HBlankCB_801E434(int_vcount vcount);
extern void HBlankCB_801E454(int_vcount vcount);
extern void nullsub_801E494(void);
extern void HBlankCB_BgUpdateZone5ActBoss(int_vcount vcount);
extern void HBlankCB_BgUpdateZoneFinalActXX(int_vcount vcount);

#endif // GUARD_GAME_STAGE_CALLBACKS_H