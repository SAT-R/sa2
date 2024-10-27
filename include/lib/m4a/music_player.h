#ifndef MUSIC_PLAYER_H
#define MUSIC_PLAYER_H

#include "gba/types.h"
#include "lib/m4a/shared.h"
#if PORTABLE
#include "lib/m4a/sound_mixer.h"
#endif

#define PLAYER_UNLOCKED 0x68736D53
#define PLAYER_LOCKED   PLAYER_UNLOCKED + 1

void clear_modM(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_endtie(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_lfos(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_mod(struct MP2KPlayerState *unused, struct MP2KTrack *track);

#endif
