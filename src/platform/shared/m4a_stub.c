/* Function stubs for M4A functions */

#include "global.h"
#include "gba/m4a_internal.h"

struct SoundInfo sSoundInfo = { 0 };
struct SoundInfo *SOUND_INFO_PTR = &sSoundInfo;

u32 umul3232H32(u32 multiplier, u32 multiplicand) { return ((u64)multiplier * (u64)multiplicand) >> 32; }

void TrackStop(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track) { }
void SoundMain(void) { }
void m4aSoundVSync(void) { }
char SoundMainRAM[sizeof(*SoundMain)];
void MPlayMain(void) { }
void MPlayJumpTableCopy(MPlayFunc *mplayJumpTable) { }

// sound command handler functions
void ply_fine(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_goto(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_patt(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_pend(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_rept(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
// void ply_memacc(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) {}
void ply_prio(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_tempo(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_keysh(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_voice(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_vol(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_pan(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_bend(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_bendr(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_lfos(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_lfodl(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_mod(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_modt(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_tune(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_port(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
// void ply_xcmd(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) {}
void ply_endtie(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_note(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }

// extended sound command handler functions
void ply_xcmd_0C(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
void ply_xcmd_0D(struct MusicPlayerInfo *info, struct MusicPlayerTrack *track) { }
