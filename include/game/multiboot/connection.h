#ifndef GUARD_MULTIPLAYER_SINGLEPAK_CONNECTION_H
#define GUARD_MULTIPLAYER_SINGLEPAK_CONNECTION_H

#include "global.h"

#if (GAME == GAME_SA1)
#define COMM_DATA(val) (val)
#define MP_LANGUAGE    LOADED_SAVE->uiLanguage
#define UNK_GFX_SIZE   0x1C0
#elif (GAME == GAME_SA2)
#define COMM_DATA(val) ((val) | 0x4000)
#define MP_LANGUAGE    gMultiplayerLanguage
#define UNK_GFX_SIZE   0x180
#endif

void SA2_LABEL(sub_8081200)(void);
void StartSinglePakConnect(void);
void ShowSinglePakResults(void);

#endif // GUARD_MULTIPLAYER_SINGLEPAK_CONNECTION_H
